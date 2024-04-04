<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file="/front/app/doAppCommon.jspf" %><%
%><%@ page import="com.jalios.jcms.trash.*" %><%
%><jsp:useBean id="appHandler" scope="page" class="com.jalios.jcms.trash.TrashAppHandler"><%
  %><jsp:setProperty name="appHandler" property="request"   value="<%= request %>"/><%
  %><jsp:setProperty name="appHandler" property="response"  value="<%= response %>"/><%
  %><jsp:setProperty name="appHandler" property="*" /><%
%></jsp:useBean><%
if (appHandler.validate()) {
  return;
}

jcmsContext.setPageTitle(glp("jcms.trashapp.title"));
appHandler.addFrontEndDependencies();

QueryResultSet queryResultSet = appHandler.getResultSet();

%><%@ include file='/jcore/doHeader.jspf' %>
<form action="<%= ServletUtil.getResourcePath(request) %>" class="ajax-refresh">
<div class="ajax-refresh-div" data-jalios-ajax-refresh-url="front/trash/trashApp.jsp">
<jalios:javascript>
  <% String trashAppUrl = "front/trash/trashApp.jsp?" + appHandler.getQueryString(); %>
  window.history.replaceState(history.state, "<%= encodeForJavaScript(glp("jcms.trashapp.title")) %>", "<%= trashAppUrl %>");
</jalios:javascript>
  <jalios:app name="trash">
    <%-- SIDEBAR --%>
    <%@ include file='/front/trash/doTrashAppSidebar.jspf' %>
    <%-- HEADER --%>
    <jalios:appMain headerTitle="jcms.trashapp.title">
      <%@ include file='/front/trash/doTrashAppBody.jspf' %>
    </jalios:appMain>
  </jalios:app>
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>
</form>
<%@ include file='/jcore/doFooter.jspf' %>