<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

/*
 * Must NOT be a Full display, as redirection will failed in doDisplayBuffer.jspf (due to security checks)
 */

Shortcut obj = (Shortcut) getPublicationParameter("pubId");

if (obj == null || !obj.isExternalShortcut()) {
  sendRedirect("index.jsp");
  return;
}

String url = obj.getUrl(userLocale);
if (Util.isEmpty(url)) {
  logger.warn(JcmsUtil.dataToString(obj) + " has no url to redirect to.");
  sendRedirect("index.jsp");
  return;
}
boolean isHttpUrl = url.startsWith("http://") || url.startsWith("https://");
boolean isRelativeUrl = !url.matches("[a-zA-Z]://");

// If URL is not a web URL (http://, or https://), then sendRedirect(url) will fail.
if (isHttpUrl || isRelativeUrl) {
  jcmsContext.sendRedirect(url, false, request, response);
} else {
  boolean openNewPage = obj.isOpenNewPage();
  boolean openCurrentPage = !openNewPage;
  String loadingMessage = glp("msg.Shortcut.external.processing", url);
  %>
  <%@ include file='/jcore/doEmptyHeader.jspf' %>
  <div class="container" style="margin-top: 20px;">
    <jalios:message dismissable="false" title="" css="process-external-shortcut-message">

      <h3 style="margin: 0;margin-bottom: 20px;"><%= obj.getTitle(userLang) %></h3>

      <p class="br external-shortcut-landing-message">
        <jalios:icon src="waitsmall" alt="<%= loadingMessage %>" title="<%= loadingMessage %>" css="process-external-shortcut-wait"/>
        <%= loadingMessage %>
      </p>
      <div class="external-shortcut-processed-message hide">
        <p>
        <%= glp("msg.Shortcut.external.processed") %>
        <a href="<%= url %>">
          <jalios:truncate length="40" suffix="..."><%= url %></jalios:truncate>
        </a>
        </p>
        <p>
        <%= glp("msg.Shortcut.external.back-intro") %>
        </p>
        <a href="javascript:window.history.back();" class="btn btn-primary">
          <%= glp("msg.Shortcut.external.back-button") %>
        </a>
      </div>
    </jalios:message>
  </div>
  <jalios:javascript>
    <% if (openNewPage) { %>
      jQuery.console.log('open in new page: <%= url %>');

      // Open in new page
      window.open("<%= url %>");

      // After new tab has been opened, go back to previous page
      // as the shortcut is in openMode=new page, the current page should remain
      // where it was
      window.history.back();
    <% } else { %>
      jQuery.console.log('open in current page: <%= url %>');
    <% } %>

    // always update back message
    // Hide landing message
    jQuery('.external-shortcut-landing-message').hide();
    // provide back button
    jQuery('.external-shortcut-processed-message').removeClass('hide');

    <% if (openCurrentPage) { %>
      //console.log('open in current page: <%= url %>');
      window.location = "<%= url %>";
      // If location could not be opened (for eg, a custom protocol link,
      // then, the back button will be usefull
    <% } %>
  </jalios:javascript>
  <%@ include file='/jcore/doEmptyFooter.jspf' %>
<% } %>