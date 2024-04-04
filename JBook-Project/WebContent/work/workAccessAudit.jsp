<%--
  @Summary: Access Control Manager
  @Since: jcms-7.0 
--%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ include file="/work/acl/audit/doInitWorkAccessAudit.jspf" %><%

request.setAttribute("title", glp("accesscontrol.audit"));
request.setAttribute("adminAccessAuditMenu", "true");
request.setAttribute("adminWAMenu", "true");
request.setAttribute("allowWkspFilter", "false");
%><%@ include file="/work/doWorkHeader.jspf" %>

<div class="page-header">
  <h1><%= glp("accesscontrol.audit") %></h1>
</div>
<jalios:include jsp="/work/acl/audit/workAccessAudit.jsp" />
<%@ include file="/work/doWorkFooter.jspf" %>