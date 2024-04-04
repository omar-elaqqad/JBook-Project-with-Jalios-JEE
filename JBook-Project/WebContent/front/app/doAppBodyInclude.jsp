<%@page import="com.jalios.jcms.a11y.A11YConstants"%>
<%@page import="com.jalios.jcms.tracking.ReaderTrackerManager"%>
<%@page import="com.jalios.jcms.uicomponent.app.AppConstants"%>
<%@ include file="/jcore/doInitPage.jspf" %><%

Publication pub = (Publication) request.getAttribute(AppConstants.BODY_INCLUDE_PUB_REQUEST_ATTR);
String path = (String) request.getAttribute(AppConstants.BODY_INCLUDE_PATH_REQUEST_ATTR);
boolean removeActions = Util.toBoolean(request.getAttribute(AppConstants.BODY_INCLUDE_REMOVE_ACTIONS_ATTR), false);
jcmsContext.addAvoidanceLink(A11YConstants.AVOIDANCE_LINK_CONTENT_DOM_ID, glp("a11y.avoidance-link.content"));
if (pub != null && path != null) {
  
%>
 <% request.setAttribute("publication", pub); %>
 <article class="app-pub-wrapper<%= !removeActions ? " app-pub-wrapper-actions" : "" %> pub-action-toggler-<%= pub.getId() %>" id="<%= A11YConstants.AVOIDANCE_LINK_CONTENT_DOM_ID %>">
   <%= Util.getString(request.getAttribute(AppConstants.BODY_INCLUDE_HEADER_REQUEST_ATTR), "") %>
   <% if (!removeActions) { %>
    <aside>
      <jalios:include jsp="<%= ResourceHelper.getPublicationAction() %>" />
    </aside>
   <% } %>
   <jalios:include jsp="<%= path %>" />
   <%= Util.getString(request.getAttribute(AppConstants.BODY_INCLUDE_FOOTER_REQUEST_ATTR), "") %>
   <% if(!Util.toBoolean(request.getAttribute(AppConstants.BODY_INCLUDE_REMOVE_FOOTER_ATTR), false)) { %>
    <%@ include file='/jcore/doDisplayFooter.jspf' %>
    <% } %>            
 </article><%
	 if (Util.isEmpty(request.getAttribute("redirect")) && ReaderTrackerManager.getInstance().isPerformTrack(jcmsContext.getBrowser())) {
	   pub.trackReader(loggedMember);
	 }
   request.setAttribute("appBodyIncludePublication", true);
 %>

<% } else if (path != null) { %>
 <div class="app-pub-wrapper pub-action-toggler">
   <jalios:include jsp="<%= path %>" />
 </div>
<% } %>