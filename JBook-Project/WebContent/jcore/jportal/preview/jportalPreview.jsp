<%@page import="com.jalios.jcms.jportal.JPortalStructure"%>
<%@page import="com.jalios.jcms.jportal.JPortalManager"%>
<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.jportal.JPortalEditorHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
</jsp:useBean><%

jcmsContext.addCSSHeader("css/jalios/core/jportal/jportal-preview.css");
jcmsContext.addJavaScript("js/lib/toastr/toastr.js"); 
WebAssetsUtils.addScrollbarWebAssets(jcmsContext);
jcmsContext.addJavaScript("js/jalios/jportal/jalios-jportal-sync-preview.js");
JPortal jPortal = (JPortal) formHandler.getAvailableJPortal();

if (jPortal == null) {
  jPortal = (JPortal) jcmsContext.getAjaxRequestAttribute("jPortal");
}

if (jPortal == null) {
  return;
}

JPortalStructure structure = Util.getFirst(JPortalManager.getInstance().getJPortalStructures(jPortal, 0, 1));
String displayUrl = jPortal.getDisplayUrl(userLocale);
%>
<div class="jportal-preview" data-jalios-jportal="<%= jPortal.getId() %>">
  <jalios:include jsp="jcore/jportal/preview/doJPortalPreviewTopbar.jsp" />
  
  <div class="jportal-preview-iframe">
    <iframe id="jportalPreviewIframe" src='<%= displayUrl+"?jportalPreview=true" %>' height="100%" width="100%">
    
    </iframe>
  </div>
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>