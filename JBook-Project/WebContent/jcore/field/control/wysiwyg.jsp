<%@page import="com.jalios.jcms.unifiedinsert.InsertionContext"%><%
%><%@page import="com.jalios.jcms.wysiwyg.WysiwygRenderer"%><%
%><%@page import="com.jalios.jcms.wysiwyg.JHTMLRenderer"%><%
%><%@page import="com.jalios.jcms.wysiwyg.WysiwygConstants"%><%
%><%@page import="com.jalios.jcms.wysiwyg.WysiwygManager"%><%
%><%@page import="com.jalios.jcms.wysiwyg.PluginConfiguration"%><%
%><%@page import="com.jalios.jcms.wysiwyg.WysiwygConfiguration"%><%
%><%@ include file="/jcore/field/control/doInitControl.jspf" %><%
%><%

// Convert legacy wiki to JHTML if needed  
TypeFieldEntry tfe = (TypeFieldEntry) pageContext.getRequest().getAttribute(FieldTag.FIELD_ENTRY);
if (!com.jalios.jcms.wysiwyg.JHTMLUtils.isJHTML(tfe, fieldValue)) { // voluntarly invoke isJHTML on UNESCAPED value
  com.jalios.jcms.wiki.WikiRenderingHints hints = new com.jalios.jcms.wiki.WikiRenderingHints();
  hints.setAttribute(FieldTag.FIELD_ENTRY, tfe);
  hints.setAttribute(FieldTag.FORM_HANDLER, pageContext.getRequest().getAttribute(FieldTag.FORM_HANDLER));
  final String originalFieldValueForJHTMLConversion = (tfe == null || tfe.escapeHtml()) ? JcmsUtil.escapeHtml(fieldValue) : fieldValue;  // apply reverse operation of FieldTag 
  fieldValue = com.jalios.jcms.wiki.Wiki2JHTMLRenderer.wiki2jhtml(originalFieldValueForJHTMLConversion, userLocale, hints);
  request.setAttribute(FieldTag.FIELD_VALUE, fieldValue);
}

String configId = getOption(WysiwygSettings.CONFIGURATION_ID, WysiwygSettings.DEFAULT_CONFIGURATION_ID);
WysiwygConfiguration wysiwygConfiguration = WysiwygManager.getInstance().getConfiguration(configId);
wysiwygConfiguration = wysiwygConfiguration != null ? wysiwygConfiguration : WysiwygManager.getInstance().getConfiguration(WysiwygSettings.DEFAULT_CONFIGURATION_ID);
Map<String, Object> dataMap = getOption(BasicSettings.DATA_ATTRIBUTES, new HashMap<String, Object>());

//TinyMCE cannot define the resize feature without the statusbar.
//So, we check if the resize option is enabled and statusbar is disabled to add a new CSS class in order to hide just the status bar in CSS
//@see jalios-wysiwyg-init.js (Force statusbar to true when the resize option is enabled and statusbar is disabled)
Object resize = wysiwygConfiguration.getOption("resize");
boolean resizable = !(resize != null && "false".equalsIgnoreCase(resize.toString())); // Check if the resize is not defined and returns !value (possible TinyMCE values: true, false, 'both')
boolean hasStatusbar = Util.toBoolean(wysiwygConfiguration.getOption("statusbar"), Util.toBoolean(dataMap.get("statusbar"), true));

Integer rowCount = getOption(AbstractAreaSettings.ROWS, 0);
// row height = (editor margins) + (single row height * row count)
final String editorVersion = channel.getProperty("wysiwyg.version", "tinymce5");
final int editorMargin = Util.toInt(channel.getProperty("wysiwyg."+editorVersion+".editor.margins", channel.getProperty("wysiwyg.editor.margins", null)), 0);
final int editorLineHeight = Util.toInt(channel.getProperty("wysiwyg."+editorVersion+".editor.line-height", channel.getProperty("wysiwyg.editor.line-height", null)), 0);
int editorHeight = rowCount > 0 ? editorMargin + (editorLineHeight * rowCount) : -1;

// With TinyMCE 4, "height" set the height of the editable area of the editor.
// With TinyMCE 5, "height" sets the overall height of the editor, including the menubar, toolbars, and statusbar.
// --> add toolbar and status bar height to editorHeight computation 
if ("tinymce5".equals(editorVersion)) {
  final int editorToolbarHeight = Util.toInt(channel.getProperty("wysiwyg."+editorVersion+".editor.toolbar-height", channel.getProperty("wysiwyg.editor.toolbar-height", null)), 39);
  final int editorStatusBarHeight = Util.toInt(channel.getProperty("wysiwyg."+editorVersion+".editor.statusbar-height", channel.getProperty("wysiwyg.editor.statusbar-height", null)), 18);
  String editorToolbarSetting = Util.getString(wysiwygConfiguration.getOption("toolbar"), "");
  int numberOfToolbars = editorToolbarSetting.equals("false") ? 0 : 1 + org.apache.commons.lang.StringUtils.countMatches(Util.getString(wysiwygConfiguration.getOption("toolbar"), ""), ",");
  editorHeight = editorHeight > 0 ? editorHeight + (numberOfToolbars*editorToolbarHeight) + (hasStatusbar ? editorStatusBarHeight : 0) : editorHeight;
}

if (getOption(WysiwygSettings.POPUP_EDITION, false)) {
  editorHeight = editorHeight > 0 ? editorHeight : editorMargin + (editorLineHeight * 4); // default rows is 4 for textarea (cf. doTextArea.jspf)
  addOption(BasicSettings.CSS, "hide source " + getOption(BasicSettings.CSS,""));
  %>
  <div class="btn-group">
      
      <a href="work/wysiwygPopupEdit.jsp?targetInputId=<%= encodeForURL(fieldId) %>&amp;configId=<%= configId %>&amp;lang=<%= cptLang %>"
         class='btn btn-primary btn-xs popup popup-lg<%= fieldDisabled ? " disabled" : "" %>'>
         <%= glp("js.wysiwyg.popupedit.ui.edit-link") %> 
         <jalios:icon src="images/jalios/icons/external.gif" />
      </a>
      
      <a href="#" class="btn btn-default btn-xs" id="<%= fieldId %>_preview_link"
         onclick="jQuery('#<%= fieldId %>_preview_iframe').attr('src', jQuery('#<%= fieldId %>_preview_iframe').attr('data-src')); return false;" 
         data-jalios-action="add:hide remove:hide" 
         data-jalios-target="#<%= fieldId %>|#<%= fieldId %>_preview_iframe">
         <%= glp("js.wysiwyg.popupedit.ui.preview-link") %>
      </a>
      
      <a href="#" class="btn btn-default btn-xs" id="<%= fieldId %>_source_link" 
         data-jalios-action="remove:hide add:hide" 
         data-jalios-target="#<%= fieldId %>|#<%= fieldId %>_preview_iframe">
         <%= glp("js.wysiwyg.popupedit.ui.source-link") %>
      </a>
      
  </div>
  <iframe id="<%= fieldId %>_preview_iframe" class="form-control hide"
          style='width: 100%; height: <%= editorHeight + "px" %>; border: 1px solid gray;'
          src="" data-src="<%= HttpUtil.getUrlWithCSRFToken("work/wysiwygPreview.jsp?targetInputId="+encodeForURL(fieldId), request, true) %>">
  </iframe>
  <%@ include file="/jcore/field/control/doTextArea.jspf" %><%
  return;
}

addOption(BasicSettings.CSS, "js-wysiwyg " + getOption(BasicSettings.CSS, ""));

addOption(BasicSettings.DATA_ATTRIBUTES, dataMap); // Needed when the DATA_ATTRIBUTES option did not exist and has been initialized with a new HashMap()

if(configId != null) {
  dataMap.put("data-configuration-id", configId);
}
if(editorHeight > 0) {
  dataMap.put("data-min_height", editorHeight);
  dataMap.put("data-height", editorHeight);
}

// If a data attribute for the workspace already exists, we use it and we don't resolve the workspace from the Settings
if(!dataMap.containsKey("data-workspace") && !dataMap.containsKey("workspace")) {
  // Retrieve the workspace defined on the Settings. If not found, use the current workspace
  String workspaceId = getOption(WysiwygSettings.WORKSPACE, workspace != null ? workspace.getId() : null);
  if(workspaceId != null) {
    dataMap.put("data-workspace", workspaceId);
  }
}

if(loggedMember != null) {
  dataMap.put("data-member", loggedMember.getId());
}

// Append the global options that are not defined specifically on the current control
Map<String, Object> globalOptions = WysiwygSettings.getGlobalOptions();
if(globalOptions != null && !globalOptions.isEmpty()) {
  for(Map.Entry<String, Object> entry : globalOptions.entrySet()) {
    String optionKey = entry.getKey();
    if(!dataMap.containsKey(optionKey)) {
      dataMap.put(optionKey, entry.getValue());
    }
  }
}

WysiwygSettings.addFrontEndDependencies(jcmsContext, configId);

final boolean isInline = Util.toBoolean(dataMap.get("inline"), false);

String wysiwygCss = "wysiwyg-editor" + (resizable  && !hasStatusbar ? " wysiwyg-editor-resize-without-statusbar" : "");
%>
<div class="<%= wysiwygCss %>">
  <% if (isInline) { %>
    <%@ include file="/jcore/field/control/doWysiwygInline.jspf" %>
  <% } else { %>
    <% addOption(BasicSettings.CSS, "invisible " + getOption(BasicSettings.CSS, "")); %>
    <%@ include file="/jcore/field/control/doTextArea.jspf" %>
  <% } %>
  <% String dataInfosValue = WysiwygRenderer.getWysiwygEditorInfosAsJson(resolveFieldValue(fieldValue), new InsertionContext(configId, jcmsContext)); %>
  <jalios:control settings='<%= new TextAreaSettings().name(fieldName + "DataInfos").value(dataInfosValue).disable().css("wysiwyg-editor-infos hide") %>' />
</div>