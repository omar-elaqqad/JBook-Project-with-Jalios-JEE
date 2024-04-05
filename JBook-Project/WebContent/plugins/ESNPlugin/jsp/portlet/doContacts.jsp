<%@page import="com.jalios.jcms.taglib.card.CardsDisplayMode"%>
<%@ include file='/plugins/ESNPlugin/jsp/common/doCommonParams.jspf' %>

<%
String connectionType = getStringEnumParameter("connectionType", "all", new String[] {"all", "account", "contact", "following", "follower"});
boolean showAll       = "all".equals(connectionType) || Util.isEmpty(connectionType);
boolean showAccount   = "account".equals(connectionType);
boolean showContact   = "contact".equals(connectionType);
boolean showFollowing = "following".equals(connectionType);
boolean showFollower  = "follower".equals(connectionType);

SortedSet<Member> allSet     = esnMgr.getSortedConnectionSet(member, true, true);
SortedSet<Member> accountSet = esnMgr.getSortedConnectionSet(member, true, false);
SortedSet<Member> contactSet = esnMgr.getSortedConnectionSet(member, false, true);
SortedSet<Member> followingSet = esnMgr.getSortedFollowingSet(member);
SortedSet<Member> followerSet = esnMgr.getSortedFollowerSet(member);

Set<Member> memberSet = null;
String contactTitle = "";
if (showFollowing) {
  memberSet = followingSet;
  contactTitle = glp("jcmsplugin.esn.lbl.followings") + "(" + Util.getSize(followingSet) + ")";
}
else if (showFollower) {
  memberSet = followerSet;
  contactTitle = glp("jcmsplugin.esn.lbl.followers") + "(" + Util.getSize(followerSet) + ")";
}
else if (showAccount) {
  memberSet = accountSet;
  contactTitle = glp("jcmsplugin.esn.lbl.connections.internal") + "(" + Util.getSize(accountSet) + ")";
}
else if (showContact) {
  memberSet = contactSet;
  contactTitle = glp("jcmsplugin.esn.lbl.connections.external") + "(" + Util.getSize(contactSet) + ")";
}
else {
  memberSet = allSet;
  contactTitle = glp("jcmsplugin.esn.lbl.connections.all-contacts") + "(" + Util.getSize(allSet) + ")";
}

String connectionView = getStringEnumParameter("connectionView", "card", new String[] {"card", "list", "cloud", "map"});
boolean cardView  = "card".equals(connectionView);
boolean listView  = "list".equals(connectionView);
boolean cloudView = "cloud".equals(connectionView);
boolean mapView   = "map".equals(connectionView);

%>

<div id="connection-navigator">
  <div class="clear connection-navigator-header">
  <h4 class="pull-left"><%= contactTitle %></h4>
  <ul class="pull-right nobr nav nav-pills connection-view-menu br">
    <% if (isMyProfile && esnMgr.canCreateExternalContacts(member) && dataWriteEnabled) { %>
    <li><a class='modal add-link contact-creation-link' onclick='return false;' href='plugins/ESNPlugin/jsp/form/addContact.jsp' title='<%= glp("jcmsplugin.esn.lbl.connections.new-contact") %>'><jalios:icon src="add" /></a></li>
    <% } %>
    <li <%= cardView  ? " class=\"active\"" : "" %>><a class="ajax-refresh" href="<%= ServletUtil.getUrlWithUpdatedParam(request, "connectionView", "card") %>"><jalios:icon src="card-view" /> <%= glp("jcmsplugin.esn.lbl.connections.card") %></a></li>
    <li <%= listView  ? " class=\"active\"" : "" %>><a class="ajax-refresh" href="<%= ServletUtil.getUrlWithUpdatedParam(request, "connectionView", "list") %>"><jalios:icon src="list-view" /> <%= glp("jcmsplugin.esn.lbl.connections.list") %></a></li>
    <% if (showAll || showAccount || showContact) { %>
    <li <%= cloudView  ? " class=\"active\"" : "" %>><a class="ajax-refresh" href="<%= ServletUtil.getUrlWithUpdatedParam(request, "connectionView", "cloud") %>"><jalios:icon src="jcmsplugin-esn-cloud-view" /> <%= glp("jcmsplugin.esn.lbl.connections.cloud") %></a></li>
    <%   if (esnMgr.isConnectionMapEnabled()) { %>
    <li <%= mapView  ? " class=\"active\"" : "" %>><a class="ajax-refresh" href="<%= ServletUtil.getUrlWithUpdatedParam(request, "connectionView", "map") %>"><jalios:icon src="jcmsplugin-esn-connection" /> <%= glp("jcmsplugin.esn.lbl.connections.map") %></a></li>
    <%   } %>
    <%   if (isMyProfile || isAdmin) { %>
    <li><a href="plugins/ESNPlugin/jsp/exportCSVContacts.jsp?mid=<%= member.getId() %>&amp;connectionType=<%= connectionType %>" title="<%= glp("ui.com.btn.csv") %>"><jalios:icon src="csv" /> <%= glp("jcmsplugin.esn.lbl.connections.csv") %></a></li>
    <%   } %>
    <% } %>
  </ul>
	</div>
	<hr class="br"/>
  <div class="connection-view">
    <% if (cardView) { %>
  	<jalios:pager name='pagerHandler' declare='true' action='init' size='<%= memberSet.size() %>' pageSize="12" />
      <jalios:cards mode="<%= CardsDisplayMode.INLINE %>">
        <jalios:foreach name="itMember" type="Member" collection="<%= memberSet %>" max="<%= pagerHandler.getPageSize() %>" skip="<%= pagerHandler.getStart() %>">
          <jalios:cardData link="<%= itMember.getDisplayUrl(userLocale) %>"  data="<%= itMember %>" template="small"/>
        </jalios:foreach>
      </jalios:cards>        
	<jalios:pager name='pagerHandler' />      
    <% } else if (listView) { %>
    <%
    int memberPageSize = 20; 
    %>
    <%@ include file="/front/doMemberList.jspf" %>
    <% } else if (cloudView) { %>
    <%@ include file="/plugins/ESNPlugin/jsp/portlet/doConnectionCloudView.jspf" %>
    <% } else if (mapView) { %>
    <%@ include file="/plugins/ESNPlugin/jsp/portlet/doConnectionMapView.jspf" %>
    <% } %>
  </div>

</div>