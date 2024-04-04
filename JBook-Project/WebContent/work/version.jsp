<%@ include file='/jcore/doInitPage.jspf' %>
<%
String qs = ServletUtil.getQueryString(request, false);
sendRedirect("work/version/version.jsp" + (Util.notEmpty(qs) ? "?" + qs : ""));
%>

