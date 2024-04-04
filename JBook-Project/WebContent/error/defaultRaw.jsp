<%@ include file="/jcore/doInitPage.jspf" %><%
Integer statusCode = (Integer) request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
%><% 
%><%= glp("error.message.title") %><% 
%><%= glp("error.message.msg") %>
<% if (channel.getBooleanProperty("channel.dev-mode.enabled", true)) { %>
<%
String message = (String) request.getAttribute(RequestDispatcher.ERROR_MESSAGE);
String servletName = (String) request.getAttribute(RequestDispatcher.ERROR_SERVLET_NAME);
String requestUri = (String) request.getAttribute(RequestDispatcher.ERROR_REQUEST_URI);
Throwable throwable = (Throwable) request.getAttribute(RequestDispatcher.ERROR_EXCEPTION);
String throwableStr = "";
if (throwable != null) {
  ByteArrayOutputStream baos = new ByteArrayOutputStream();
  throwable.printStackTrace(new PrintStream(baos, true, "UTF-8"));
  throwableStr = baos.toString("UTF-8");
 }
%>
Error #<%= statusCode %>
Servlet Name:<%= servletName %>
Request URI: <%= requestUri %>
<% if (Util.notEmpty(message)) { %>Message: <%= message %><% } %>
<% if (Util.notEmpty(throwableStr)) { %><%= encodeForHTML(throwableStr)%><% } %>
<% } %>