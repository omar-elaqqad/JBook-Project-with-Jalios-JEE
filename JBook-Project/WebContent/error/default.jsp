<%@ include file="/jcore/doInitPage.jspf" %><%
Integer statusCode = (Integer) request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
%>
<div class='<%= "container error error-" + statusCode %>'>

  <div class="row">
    <div class="error-msg col-xs-10 col-md-6 col-xs-offset-1 col-md-offset-3">
      <div class="br"></div>
      <jalios:message
        title="error.message.title"
        msg="error.message.msg"
        level='<%= MessageLevel.valueOf(Util.getString(channel.getProperty("error.message.level", null), MessageLevel.ERROR.toString())) %>'
        css='<%= Util.getString(channel.getProperty("error.message.css", null), "") %>'
        dismissable='<%= channel.getBooleanProperty("error.message.dismissable", false) %>'
        resource='<%= channel.getProperty("error.message.resource", null) %>'></jalios:message>
    </div>
  </div>

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
  <div class="row">
    <div class="error-ex col-md-12">
      <h1>Error #<%= statusCode %></h1>
      <p><strong>Servlet Name:</strong> <%= servletName %></p>
      <p><strong>Request URI:</strong> <%= requestUri %></p>
      <% if (Util.notEmpty(message)) { %><p><strong>Message:</strong> <%= message %></p><% } %>
      <% if (Util.notEmpty(throwableStr)) { %><pre><%= encodeForHTML(throwableStr)%></pre><% } %>
    </div>
  </div>
  <% } %>

</div><%-- EOF .error --%>