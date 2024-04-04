<%@page import="com.jalios.jcms.taglib.application.AppBodyIncludeTag"%><%
%><%@page import="com.jalios.jcms.a11y.A11YConstants"%><%
%><%@page import="com.jalios.jcms.tracking.ReaderTrackerManager"%><%
%><%@page import="com.jalios.jcms.uicomponent.app.AppConstants"%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%

String css = getIncludeString("css", "");
Publication pub = (Publication) getIncludeObject("pub", null);
String jsp = getIncludeString("jsp", "");

if (pub == null && jsp == null) {
  return;
}

boolean displayHeader = (boolean) getIncludeObject("displayHeader", true);
boolean displayFooter = (boolean) getIncludeObject("displayFooter", true);
boolean displayActions = (boolean) getIncludeObject("displayActions", true);
request.setAttribute("publication", pub);
jcmsContext.addAvoidanceLink(A11YConstants.AVOIDANCE_LINK_CONTENT_DOM_ID, glp("a11y.avoidance-link.content"));
%>
<% if (Util.notEmpty(jsp)) { %>
  <jalios:include jsp="<%= jsp %>" />
<% } else if (pub != null) { %>
  <% String template = AppBodyIncludeTag.getPubTemplate(pub, getIncludeString("template",null)); %>
   
  <% if (displayHeader) { %>
		<% Publication publication = pub; // Required for doDisplayHeader.jspf %>
		<%@ include file="/jcore/doDisplayHeader.jspf" %>
  <% } %>
  <article class="app-pub-wrapper selection-wrapper app-pub-wrapper-actions <% if (pub != null) { %>pub-action-toggler-<%= pub.getId() %><% } %> <%= css %>" id="<%= A11YConstants.AVOIDANCE_LINK_CONTENT_DOM_ID %>">
    <% if (displayActions && pub != null) { %>
      <aside>
        <jalios:include jsp="<%= ResourceHelper.getPublicationAction() %>" />
      </aside>
    <% } %>
    <div class="fulldisplay-content">
      <jalios:include pub="<%= pub %>" usage="<%= template %>"/>
    </div>
    <% if (displayFooter) { %>
    <%@ include file='/jcore/doDisplayFooter.jspf' %>
    <% } %>
  </article>
  <%
  if (Util.isEmpty(request.getAttribute("redirect")) && ReaderTrackerManager.getInstance().isPerformTrack(jcmsContext.getBrowser())) {
    pub.trackReader(loggedMember);
  }
  request.setAttribute("appBodyIncludePublication", true);
  %>
<% } %>
