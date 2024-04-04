<%@page import="com.jalios.jcms.jportal.JPortalStructure"%>
<%@page import="com.jalios.jcms.jportal.JPortalManager"%>
<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.jportal.JPortalEditorHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
</jsp:useBean><%
jcmsContext.addCSSHeader("css/jalios/core/jportal/jportal-history.css");
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
<div class="jportal-history">
  <% request.setAttribute("jportal-structureId", structure.getId()); %>
  <jalios:include jsp="jcore/jportal/edition/doJPortalHistoryTopbar.jsp" />
  <% request.removeAttribute("jportal-structureId"); %>
  <div class="jportal-history-sidebar">
    <div class="list-group">
		  <jalios:include jsp="jcore/jportal/history/doJPortalHistoryResult.jsp" />
    </div>
  </div>
  <div class="jportal-history-preview">
    <iframe id="jportalHistoryIframe" src='<%= displayUrl+"?structureId="+ structure.getId() %>' height="100%" width="100%" 
            data-jalios-confirm-text='<%= glp("jportal.edition.history.back-to-version.confirm")%>'/>
  </div>
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>