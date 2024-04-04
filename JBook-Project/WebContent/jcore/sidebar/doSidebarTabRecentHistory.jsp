<%@ include file='/jcore/doInitPage.jspf' %><% 
%><%@ page import="com.jalios.jcms.recenthistory.*" %>
<div class="sidebar-tab-content-recenthistory">
  <h2 class="sidebar-tab-title"><%= glp("ui.recenthistory.title") %></h2>
  <%  Collection recentMemberPubCollection = RecentHistoryManager.getInstance().getPubRecentHistory(loggedMember,null,20); %> 
  <div class="list-group list-group-bordered">
    <jalios:foreach collection='<%= recentMemberPubCollection %>' type='Publication' name='itPub' skip="0" max='20'>
      <jalios:link data="<%= itPub %>" css="list-group-item sidebar-menu-item-sub"><jalios:dataicon data="<%= itPub %>"/> <%= itPub.getTitle(userLang) %></jalios:link>
    </jalios:foreach>
    <% if (Util.isEmpty(recentMemberPubCollection)) { %>
      <div class="sidebar-no-result">
        <jalios:icon src="sidebar-tab-recent-history"/>
        <p><%= glp("ui.sidebar.recent-history.no-result") %></p>
      </div>
    <% } %>
  </div>
</div>
