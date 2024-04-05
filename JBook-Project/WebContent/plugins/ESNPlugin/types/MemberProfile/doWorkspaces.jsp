<%@page import="com.jalios.jcms.taglib.card.CardsDisplayMode"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/doInitMemberProfile.jspf' %><%

if (logger.isTraceEnabled()) { logger.trace("doWorkspaces.jsp: start render"); }
boolean show = isAccount;
if (!show) {
  if (logger.isTraceEnabled()) { logger.trace("doWorkspaces.jsp: nothing to render"); }
  return;
}
Map<String, Set<Workspace>> wsMap = esnProfileDisplayHandler.getWorkspaceMap();
String title = glp("jcmsplugin.esn.lbl.communities");
String refreshUrl = "plugins/ESNPlugin/types/MemberProfile/doWorkspaces.jsp";
String css = "profile-communities";
css += " ajax-refresh-div";

String roleCss = "profile-body-block profile-card-deck";
%>
<% if (Util.notEmpty(wsMap)) { %>
<div class="<%= css %>" data-jalios-ajax-refresh-url="<%= refreshUrl %>">

  <%-- role loop --%>
  <jalios:foreach collection="<%= wsMap.entrySet() %>" 
                    name="entry" 
                    type="Map.Entry<String, Set<Workspace>>">
    <%
    String roleLabel = entry.getKey();
    String pagerPrefix = "profileWorkspaces_" + Util.buildID(roleLabel);
    Set<Workspace> workspaceSet = entry.getValue();
    
    // Replace default label
    String defaultAdminRoleLabel = glp("jcmsplugin.esn.lbl.ws-role.admin");
    String defaultWorkerRoleLabel = glp("jcmsplugin.esn.lbl.ws-role.worker");
    String defaultReaderRoleLabel = glp("jcmsplugin.esn.lbl.ws-role.reader");
    String rolePrefixProp = "jcmsplugin.esn.profile.lbl.ws-role.";
    if (isMyProfile) {
      rolePrefixProp += "me.";
    }
    if (roleLabel.equals(defaultAdminRoleLabel)) {
      roleLabel = glp(rolePrefixProp + "admin", "<span class='member-name'>"+friendlyName+"</span>");
    } else if (roleLabel.equals(defaultWorkerRoleLabel)) {
      roleLabel = glp(rolePrefixProp + "worker", "<span class='member-name'>"+friendlyName+"</span>");
    } else if (roleLabel.equals(defaultReaderRoleLabel)) {
      roleLabel = glp(rolePrefixProp + "reader", "<span class='member-name'>"+friendlyName+"</span>");
    }
    %>
    <%-- Role block --%>
    <div class="<%= roleCss %>">
	    <%-- Role label --%>
      <div class="section-title communities-role"<%
          %> role="<%= ESNHTMLConstants.HEADING_ROLE %>"<%
          %> aria-level="3"><%
        %><%= roleLabel %><%
      %></div>
	    
	    <%-- workspace loop --%>
	    <jalios:pager name='pagerHandler' declare='true' action='init' pageSize='4' pageSizes="8,16,32" size='<%= workspaceSet.size() %>' paramPrefix='<%= pagerPrefix %>' />
	    <jalios:cards mode="<%= CardsDisplayMode.DECK %>" css="card-count-4">
	      <jalios:foreach collection="<%= workspaceSet %>" counter="itCounter2"
	            type="Workspace" 
	            name="itWorkspace" 
	            max="<%= pagerHandler.getPageSize() %>"
	            skip="<%= pagerHandler.getStart() %>">
	            <% if (itWorkspace.isCollaborativeSpace()) { %>
	              <jalios:cardData data='<%= esnProfileDisplayHandler.getCollaborativeSpace(itWorkspace) %>' />
	            <% } else { %>
	              <jalios:cardData data='<%= itWorkspace %>' template='esn-ws' />
	            <% } %>
	      </jalios:foreach>
	    </jalios:cards>
	    <jalios:pager name='pagerHandler' template='pqf' />
    </div>
  </jalios:foreach>
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>
<% } %>
<%
if (logger.isTraceEnabled()) { logger.trace("doWorkspaces.jsp: end render"); }
%>
