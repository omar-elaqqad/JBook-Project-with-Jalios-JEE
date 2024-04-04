<%@page import="com.jalios.jcms.wysiwyg.WysiwygUtils"%><%
%><%@page import="com.jalios.jcms.taglib.settings.impl.WikiAreaSettings"%><%
%><%@ include file="/jcore/field/control/doInitControl.jspf" %><%

final TypeFieldEntry tfe = (TypeFieldEntry) pageContext.getRequest().getAttribute(FieldTag.FIELD_ENTRY);
final boolean autoConvertWiki2Wysiwyg = WysiwygUtils.isAutoConvertWiki2Wysiwyg(request);
final boolean wikiSection = Util.toBoolean(request.getAttribute("wiki-section"), false);
// If wiki fieldValue was already converted to JHTML (but is not empt), use wysiwyg editor as it now required for re-edition,
// otherwise use global configuration (that maybe be overriden with request param) to determine if wysiwyg should be used
// (Wiki 2 JHTML conversion is performed inside control-wysiwyg resource, see wysiwyg.jsp)
if (!wikiSection && ((Util.notEmpty(fieldValue) && com.jalios.jcms.wysiwyg.JHTMLUtils.isJHTML(tfe, fieldValue)) || 
    autoConvertWiki2Wysiwyg)) { 
  %><jsp:include page='<%= "/"+channel.getProperty("jcms.resource.include.control-wysiwyg", "jcore/field/control/wysiwyg.jsp") %>'/><%
  return;
}


%><%!
String printWikiToolbar(JcmsJspContext ctxt) {
  
  if (Util.toBoolean(ctxt.getAjaxRequestAttribute(WikiToolbar.ENABLED), false)) {
    return "";
  }
  ctxt.setAjaxRequestAttribute(WikiToolbar.ENABLED, "true");
  
  if (!ctxt.isAjaxRequest() || Util.toBoolean(ctxt.getRequest().getAttribute(WikiToolbar.PRINTWIKITB), false)) {
    return "";
  }
  ctxt.getRequest().setAttribute(WikiToolbar.PRINTWIKITB, "true");
  
  WikiToolbar wt = new WikiToolbar(ctxt);
  return wt.printWikiToolbar();
}
%><%

String disabledMentionCss = Util.toBoolean(getOption(WikiAreaSettings.MENTION, false), false) ? "mention-disabled " : "";
addOption(BasicSettings.CSS, disabledMentionCss + "wikiarea " + getOption(BasicSettings.CSS, ""));
includeLocalObject("TEXTAREA_APPEND", !fieldDisabled ? printWikiToolbar(jcmsContext) : null);

%><%@ include file="/jcore/field/control/doTextArea.jspf" %>