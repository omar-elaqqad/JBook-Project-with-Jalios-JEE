<%--  
  @Summary: Member editor / use cat set
  @Category: Admin / Data
  @Author: Sylvain Devaux
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-10.0.6
--%><%@page import="com.jalios.jcms.handler.EditMemberHandler"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

EditMemberHandler formHandler = (EditMemberHandler) request.getAttribute("formHandler");
if (formHandler == null) {
  return;
}
%><%@ include file='/admin/editMemberCatUse.jspf' %>