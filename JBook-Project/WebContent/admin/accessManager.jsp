<%--
  @Summary: Access Control Manager page (with admin header/footer)
  @Since: jcms-7.0 
--%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ include file="/admin/accessManager/doInitAccessManager.jspf" %><%

request.setAttribute("title", glp("accesscontrol.manager"));
request.setAttribute("aclManagerSubAdminMenu", "true");
%><%@ include file="/admin/doAdminHeader.jspf" %>
<div class="page-header">
  <h1><jalios:icon src="acl-big"/> <%= glp("accesscontrol.manager") %></h1>
</div>
<jalios:include jsp="/admin/accessManager/accessManager.jsp" />
<%@ include file="/admin/doAdminFooter.jspf" %>