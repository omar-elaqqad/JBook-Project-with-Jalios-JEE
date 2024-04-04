<%@page import="com.jalios.jcms.publicationfollower.PublicationFollowerHandler"%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
String customFollowIcon = (String) request.getAttribute("PUBLICATION_ACTIONS_FOLLOW_ITEM");
if(Util.notEmpty(customFollowIcon)){
  %><%= customFollowIcon %><%
  return;
}
%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.publicationfollower.PublicationFollowerHandler'><%
  %><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
%></jsp:useBean><%
formHandler.validate();
if (!formHandler.showFollow()) {
  return;
}
String action = formHandler.getAvailableFollowedPublication().isFollowedBy(loggedMember) ? "unfollow" : "follow";
%>
<div class="ajax-refresh-div" data-jalios-ajax-refresh-url="front/follow.jsp">
  <jalios:button dataAttribute="<%= formHandler.getFollowLinkDataAttributes() %>" css='<%= "list-group-item pub-action-wf-merge pub-action-main pub-action-duplicate pub-action-" + action %>'>
    <jalios:icon src="<%= action %>" /> <span class="publication-action-label"><%= glp("ui.com.alt." + action) %></span>
  </jalios:button>
  <%@ include file='/jcore/doAjaxFooter.jspf'%>
</div>