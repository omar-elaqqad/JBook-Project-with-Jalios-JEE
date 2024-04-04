<%@ include file="/jcore/doInitPage.jspf" %><%
  if (!isLogged){ return; }

  Category cat = getCategoryParameter("id");
  
  boolean hasAnyReadRights = cat.hasAnyReadRights();
  boolean hasDeclaredManagers = cat.hasDeclaredManagers();
  
  if (cat == null || (!hasAnyReadRights && !hasDeclaredManagers)) { 
    return; 
  }
  
%>
<div class="ajax-refresh-div"> 

<%-- READ RIGHTS --%>
<% if (hasAnyReadRights)  { %>
<%
Set authGrpSet = cat.getAuthorizedGroupSet();
Set authMrbSet = cat.getAuthorizedMemberSet();
%>

<h5><%= glp("ui.work.form.lbl.read-rights") %></h5>

<%-- READ RIGHTS - GROUPS --%>
<% if (Util.notEmpty(authGrpSet)) { %>
<div>
	<strong><%= glp("ui.com.lbl.groups") %></strong>
	<ul class="list-unstyled">
	<jalios:foreach collection="<%= authGrpSet %>" name="itGroup" type="Group" max="16">
	  <li>
    <jalios:dataicon data="<%= itGroup %>" />
	  <%
	    Workspace ws = itGroup.getWorkspace();
	    if (ws != null && ws.isAdmin(loggedMember)){ %><a href="work/workspace/workspaceGroupList.jsp?gid=<%= itGroup.getId() %>&amp;ws=<%= ws.getId() %>"><%= itGroup.getName(userLang) %></a><% 
	    } else if (isAdmin){                         %><a href="admin/groupList.jsp?gid=<%= itGroup.getId() %>"><%= itGroup.getName(userLang) %></a><%
	    } else {                                     %><%= itGroup.getName(userLang) %><% } 
	  %>
	  </li>
	</jalios:foreach>
	<% if (authGrpSet.size() > 16) {%><li>...</li><% } %>
	</ul>
</div>
<% } %>

<%-- READ RIGHTS - MEMBERS --%>
<% if (Util.notEmpty(authMrbSet)) { %>
<div>
	<strong><%= glp("ui.com.lbl.members") %></strong>
  <ul class="list-unstyled">
	<jalios:foreach collection="<%= authMrbSet %>" name="itMember" type="Member" max="16">
	  <li>
	    <jalios:memberphoto member="<%= itMember %>" size="<%= PhotoSize.ICON %>"/> <jalios:link data="<%= itMember %>" />
	  </li>
	</jalios:foreach>
	<% if (authMrbSet.size() > 16) {%><li>...</li><% } %>
	</ul>
</div>
<% } %>

<% } %>

<%-- MANAGE RIGHTS --%>
<% if (hasDeclaredManagers)  { %>
<%
Set managerGrpSet = cat.getManagerGroupSet();
Set managerMrbSet = cat.getManagerMemberSet();
%>

<%  if (hasAnyReadRights) { %>
<hr>
<% } %>

<h5><%= glp("ui.work.cat.tab.manage-rights") %></h5>

<%-- MANAGE RIGHTS - GROUPS --%>
<% if (Util.notEmpty(managerGrpSet)) { %>
<div>
  <strong><%= glp("ui.com.lbl.groups") %></strong>
  <ul class="list-unstyled">
  <jalios:foreach collection="<%= managerGrpSet %>" name="itGroup" type="Group" max="16">
    <li>
    <jalios:dataicon data="<%= itGroup %>" />
    <%
      Workspace ws = itGroup.getWorkspace();
      if (ws != null && ws.isAdmin(loggedMember)){ %><a href="work/workspace/workspaceGroupList.jsp?gid=<%= itGroup.getId() %>&amp;ws=<%= ws.getId() %>"><%= itGroup.getName(userLang) %></a><% 
      } else if (isAdmin){                         %><a href="admin/groupList.jsp?gid=<%= itGroup.getId() %>"><%= itGroup.getName(userLang) %></a><%
      } else {                                     %><%= itGroup.getName(userLang) %><% } 
    %>
    </li>
  </jalios:foreach>
  <% if (managerGrpSet.size() > 16) {%><li>...</li><% } %>
  </ul>
</div>
<% } %>

<%-- MANAGE RIGHTS - MEMBERS --%>
<% if (Util.notEmpty(managerMrbSet)) { %>
<div>
  <strong><%= glp("ui.com.lbl.members") %></strong>
  <ul class="list-unstyled">
  <jalios:foreach collection="<%= managerMrbSet %>" name="itMember" type="Member" max="16">
    <li>
      <jalios:memberphoto member="<%= itMember %>" size="<%= PhotoSize.ICON %>"/> <jalios:link data="<%= itMember %>" />
    </li>
  </jalios:foreach>
  <% if (managerMrbSet.size() > 16) {%><li>...</li><% } %>
  </ul>
</div>
<% } %>

<% } %>

</div>