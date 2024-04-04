<%@page import="com.jalios.jcms.JcmsUtil"%><%
%><%@ page import="com.jalios.jcms.upload.UploadManager" %><%
%><%@page import="com.jalios.jcms.taglib.settings.BasicSettings"%><%
%><%@page import="com.jalios.jcms.taglib.settings.ControlSettings"%><%
%><%@page import="com.jalios.jcms.taglib.settings.impl.FileSettings"%><%
%><%@page import="com.jalios.jcms.taglib.settings.impl.FileSettings.FileFilter"%><%
%><%@page import="com.jalios.jcms.taglib.settings.impl.FileSettings.Mode"%><%
%><%@ include file="/jcore/field/control/doInitControl.jspf" %><%
%><%
String prepend = getIncludeString("PREPEND", getOption(BasicSettings.PREPEND, ""));
String append  = getIncludeString("APPEND", getOption(BasicSettings.APPEND, ""));
String required = fieldRequired.booleanValue() ? " aria-required='true'" : "";
String disabled = Util.toBoolean(fieldDisabled, false) || Util.toBoolean(fieldReadOnly, false) ? " disabled=\"disabled\"" : "";
String htmlAttributes = getOption(BasicSettings.HTML_ATTRIBUTES, "");
String dataAttributes = formatDataAttributes(getOption(BasicSettings.DATA_ATTRIBUTES, (Map<String, Object>) null));
Map<String, Object> ariaAttributesMap = getOption(BasicSettings.ARIA_ATTRIBUTES, (Map<String, Object>) null);
ControlUtils.autoFillAriaAttributes(ariaAttributesMap, fieldResource, fieldLabelId);
String ariaAttributes = formatAriaAttributes(ariaAttributesMap);
boolean single = getOption(FileSettings.SINGLE_FILE, false);
String singleFile = single ? " plupload-single" : "";

String multivalued = Util.toBoolean(request.getAttribute(FieldTag.FIELD_MULTIVALUED), false) ? " plupload-multivalued" : "";

String[] selectedFileLabels = getOption(FileSettings.SELECTED_FILE_LABEL, null);

int maxWidth = getOption(FileSettings.MAX_IMAGE_WIDTH, FileSettings.DEFAULT_IMAGE_MAX_WIDTH);
int maxHeight = getOption(FileSettings.MAX_IMAGE_HEIGHT, FileSettings.DEFAULT_IMAGE_MAX_HEIGHT);
int quality = getOption(FileSettings.IMAGE_QUALITY, FileSettings.DEFAULT_IMAGE_QUALITY);
String resize = maxWidth > 0 && maxHeight > 0 ? " plupload-resize-" + maxWidth + "x" + maxHeight + "x" + quality : "";

Mode mode = getOption(FileSettings.MODE, Mode.PLUPLOAD);

String token = getOption(FileSettings.AJAX_TOKEN, null);
String ajaxToken = token != null ? " plupload-token-" + token : "";

FileFilter filter = getOption(FileSettings.FILTER, null);
String fileFilter = filter != null ? " plupload-filter-" + filter.getFilterString() : "";

String css = getOption(BasicSettings.CSS, "");
css = Util.notEmpty(css) ? " " + css : "";
if(Mode.SIMPLE_FILE.equals(mode)) {
  css = "form-control" + css;
} else {
  css = "plupload plupload-light" + (" plupload-field-" + fieldName) + singleFile + multivalued + resize + ajaxToken + fileFilter + css;
}

// Add scripts for plupload
UploadManager.getInstance().addUploadComponentScripts(jcmsContext);
 
if(Mode.PLUPLOAD.equals(mode) && !single) {
  setIncludeString("isMulti", "false"); // Set isMulti to 'false' to prevent the parent tag to display the "add" link for the plupload fields multiple
}

// Boolean to know if the the current control is a multivalued control composed of "simple files"
boolean pluploadMultivaluedWithSingleFile = Util.toBoolean(request.getAttribute(FieldTag.FIELD_MULTIVALUED), false) && Mode.SIMPLE_FILE.equals(mode);
// Append the clear button if it is a multivalued control composed of "simple files" or "single files"
addOption(BasicSettings.CLEAR_BUTTON, getOption(BasicSettings.CLEAR_BUTTON, pluploadMultivaluedWithSingleFile));
%>

<% if (Util.notEmpty(prepend)) { %><span class="input-group-addon"><%= prepend %></span><% } %>

<% if (Util.notEmpty(fieldValues) && Util.notEmpty(selectedFileLabels)) { %>
<div class="input-group jalios-input-group">
  <ul class="selected-file-labels list-group">
  <% for(int i = 0; i < fieldValues.size(); i++) { %>
    <% String value = fieldValues.get(i); %>
    <% String selectedFileLabel = selectedFileLabels != null ? selectedFileLabels[i] : value; %>
    <li class="list-group-item"><span class="selected-file-label"><%= selectedFileLabel %></span></li>
    <input type="text" name="<%= HttpUtil.encodeForHTMLAttribute(fieldName) %>" value="<%= encodeForHTMLAttribute(value) %>" class="form-control hide" />
  <% } %>
  </ul>
</div>
<% } %><%
%><% if(Mode.SIMPLE_FILE.equals(mode)) { %>
<input id="<%= encodeForHTMLAttribute(fieldId) %>"
      name="<%= HttpUtil.encodeForHTMLAttribute(fieldName) %>"
      type="file"
      class="<%= css %>"
      value="<%= encodeForHTMLAttribute(resolveFieldValue(fieldValue)) %>"
      <%= JcmsUtil.getLangAttributes(cptLang) %>
      <%= disabled %>
      <%= required %>
      <%= dataAttributes %>
      <%= ariaAttributes %>
      <%= htmlAttributes %> />
<% } else { %>
<div id="<%= ServletUtil.generateUniqueDOMId(request, HttpUtil.encodeForHTMLAttribute("plupload-" + fieldName)) %>"
     class="<%= css %>"
     <%= disabled %>
     <%= required %>
     <%= dataAttributes %>
     <%= ariaAttributes %>
     <%= htmlAttributes %>>
  <p><%= glp("ui.com.lbl.plupload.error.init") %></p>
</div>
<% } %>

<% if (Util.notEmpty(append)) { %><span class="input-group-addon"><%= append %></span><% } %><%
%><%= getIncludeString("CONTROL_APPEND", "") %>