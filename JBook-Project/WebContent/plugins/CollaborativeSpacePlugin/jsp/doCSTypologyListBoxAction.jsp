<%@ page contentType="text/html; charset=UTF-8" %><%--
 @Summary: Show Open Space in skin after title TARGET.
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

final String addLabelAttribute = "skinAddLabelCreateCSpace";
if (Util.notEmpty(request.getAttribute(addLabelAttribute))) {
  %><%= request.getAttribute(addLabelAttribute) %><%
  request.removeAttribute(addLabelAttribute) ;
}
%>
