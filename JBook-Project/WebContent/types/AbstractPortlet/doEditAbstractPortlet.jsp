<%--
  @Summary: [Abstract] Basic Portlet content editor
  @Customizable: True
  @Requestable: False
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

if (Util.toBoolean(request.getAttribute("bypass-abstract-portlet-form"), false)) {
  return;
}

 EditAbstractPortletHandler formHandler = (EditAbstractPortletHandler)request.getAttribute("formHandler");
 %><%@ include file='/jcore/portal/doEditCommonPortlet.jspf' %>