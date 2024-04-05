<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ include file="/jcore/portal/doPortletParams.jspf" %><%
%><%@ page import="com.jalios.jcmsplugin.collaborativespace.*" %><%
%><%@ page import="com.jalios.jcmsplugin.collaborativespace.guest.*" %><%
%><%@ page import="com.jalios.jcmsplugin.collaborativespace.guest.handler.*" %><%

if (!workspace.isCollaborativeSpace()) {
  sendRedirect("index.jsp");
  return;
}
CSManager csMgr = CSManager.getInstance();
if (!csMgr.canManageCSMembers(loggedMember, workspace)) {
  sendForbidden(request, response);
  return;
}
String MBR_TEXT_PARAM = "mtext";
jcmsContext.addCSSHeader("plugins/CollaborativeSpacePlugin/css/cs-members.css");
jcmsContext.addCSSHeader("css/jalios/core/components/tabs/jalios-tabs-underlined.css");
%><jsp:useBean id="spaceAllMemberQueryHandler" scope="page" class="com.jalios.jcms.handler.AllMemberQueryHandler"><%
  %><jsp:setProperty name="spaceAllMemberQueryHandler" property="request" value="<%= request %>"/><%
  %><jsp:setProperty name="spaceAllMemberQueryHandler" property="*" /><%
  %><jsp:setProperty name="spaceAllMemberQueryHandler" property="sort" value='name'/><%
  %><jsp:setProperty name="spaceAllMemberQueryHandler" property="usage" value='<%= Member.USAGE_ACCOUNT %>'/><%
  %><jsp:setProperty name="spaceAllMemberQueryHandler" property="enabled" value='true'/><%
  %><jsp:setProperty name="spaceAllMemberQueryHandler" property="ws" value='<%= workspace.getId() %>'/><%
%></jsp:useBean><%
%><jsp:useBean id="allMemberQueryHandler" scope="page" class="com.jalios.jcms.handler.AllMemberQueryHandler"><%
  %><jsp:setProperty name="allMemberQueryHandler" property="request" value="<%= request %>"/><%
  %><jsp:setProperty name="allMemberQueryHandler" property="*" /><%
  %><jsp:setProperty name="allMemberQueryHandler" property="text" value='<%= getUntrustedStringParameter(MBR_TEXT_PARAM, "") %>'/><%
  %><jsp:setProperty name="allMemberQueryHandler" property="sort" value='name'/><%
  %><jsp:setProperty name="allMemberQueryHandler" property="gid" value='<%= getDataIdParameter("csGid") %>'/><%
  %><jsp:setProperty name="allMemberQueryHandler" property="usage" value='<%= Member.USAGE_ACCOUNT %>'/><%
  %><jsp:setProperty name="allMemberQueryHandler" property="groupMode" value='<%= com.jalios.jcms.handler.AllMemberQueryHandler.GROUP_MODE_OR %>'/><%  
  %><jsp:setProperty name="allMemberQueryHandler" property="enabled" value='true'/><%
%></jsp:useBean><%

CollaborativeSpace cs = csMgr.getCollaborativeSpace(workspace);
boolean isClosed = workspace.isClosed();
int spaceMembersCount = spaceAllMemberQueryHandler.getPageResult().getTotalSize();
boolean showInvitations = csMgr.showInvitations(cs);
boolean showSendInvitations = channel.isDataWriteEnabled() && Util.notEmpty(workspace.getGroupSet());
boolean showSignup = !isClosed && CSConstants.SIGNUP_REQUEST.equals(cs.getSignupPolicy());
boolean showAdmins = csMgr.canManageCSAdministrators(loggedMember, workspace);
String menuPrefixUrl = ServletUtil.getUrlWithRemovedParams(request, 
    new String[] {"memberView", "adminListMode"}, 
    true)
+ "&amp;memberView="; 
String memberView = getAlphaNumParameter("memberView", "members");
boolean isMemberList     = "members".equals(memberView);
boolean isInvitationList = showInvitations && "invitations".equals(memberView);
boolean isSignupList     = showSignup && "signups".equals(memberView);
boolean isAdminList      = showAdmins && "admins".equals(memberView);
boolean showAddButtons = channel.isDataWriteEnabled() && !isClosed;
boolean doForm = isInvitationList || isMemberList;

String text = allMemberQueryHandler.getText();
Group selectedGroup = Util.getFirst(allMemberQueryHandler.getGroupSet());
if (selectedGroup == null) {
  allMemberQueryHandler.setWrkspc(workspace.getId());
}
int status = getIntParameter("status", CSInvitation.UNKNOWN_STATUS);
request.setAttribute("jcmsplugin.collaborativespace.portal.fullscreen", Boolean.TRUE);

boolean tooManyResults = false; // indicate that the search was not performed because too many results were found
boolean missingCriteria = allMemberQueryHandler.isMissingCriteria();
PageResult<Member> pageResult = allMemberQueryHandler.getPageResult();

tooManyResults = allMemberQueryHandler.getAttribute(com.jalios.jcms.search.LuceneMemberSearchEngine.MAXIMUM_RESULTS_NUMBER_REACHED) != null;
if (pageResult == null) {
  pageResult = new PageResult<Member>();
}

int mbrTotalSize = pageResult.getTotalSize();
%>

<%@ include file='/jcore/doMessageBox.jspf' %>

<ul class="nav nav-tabs nav-tabs-underlined is-left-aligned cs-members-nav">
  <li class='menu <%= isMemberList ? "active" : "" %>'><a href="<%= menuPrefixUrl + "members" %>"> <%= glp("ui.com.lbl.members") %></a></li>
  <% if (showAdmins) { %>
  <li class='menu <%= isAdminList ? "active" : "" %>'><a href="<%= menuPrefixUrl + "admins" %>"> <%= glp("jcmsplugin.collaborativespace.lbl.administrators") %></a></li>
  <% } %>
  <% if (showInvitations) { %>
  <li class='menu <%= isInvitationList ? "active" : "" %>'><a href="<%= menuPrefixUrl + "invitations" %>"> <%= glp("jcmsplugin.collaborativespace.invitations.lbl.invitations") %></a></li>
  <% } %>
  <% if (showSignup) { %>
  <li class='menu <%= isSignupList ? "active" : "" %>'><a href="<%= menuPrefixUrl + "signups" %>"> <%= glp("jcmsplugin.collaborativespace.signup.lbl.signups") %></a></li>
  <% } %>
</ul>

<%-- FILTER ***************************** --%>
<% if (doForm) { %>
<div class="navbar navbar-default navbar-table-header">
  <form class="navbar-form" id="filter-form" action="<%= ServletUtil.getResourcePath(request) %>" method="get">
<% } %>
<% if (isInvitationList) { %>
    <select class="form-control" name="status" onchange='jQuery($("filter-form")).submit();' aria-label='<%= encodeForHTMLAttribute(glp("jcmsplugin.collaborativespace.lbl.filter")) %>'>
      <option value=""><%= glp("jcmsplugin.collaborativespace.invitations.lbl.all-status") %></option>
      <% for(int itStatus: new int[] {CSInvitation.PENDING, CSInvitation.ACCEPTED, CSInvitation.DECLINED}) { %>
        <option value="<%= itStatus %>" <%= status == itStatus ? "selected='selected'" : "" %>><%= glp("jcmsplugin.collaborativespace.invitations.status.long." + itStatus) %></option>
      <% } %>
    </select>
    <% if (showSendInvitations) { %>
    <jalios:buttonModal css="btn btn-default" label="jcmsplugin.collaborativespace.invitations.btn.send-invitation" url="plugins/CollaborativeSpacePlugin/jsp/sendInvitation.jsp" />
    <% } %>
    <jalios:include target="PLUGIN_CSP_RIBBON_INVITATIONS_FILTER_FORM" targetContext="div" />
    <input type="hidden" name="jsp" value="plugins/CollaborativeSpacePlugin/jsp/members.jsp" />
    <input type="hidden" name="memberView" value="<%= memberView %>" />
<% } else if (isMemberList) { %>
    <select name="csGid" class="form-control" onchange='jQuery($("filter-form")).submit();'>
      <option value=""><%= glp("ui.work.pub.lbl.all-member") %><%= " (" + spaceMembersCount + ")" %></option>
      <% if (Util.notEmpty(workspace.getGroupSet())) { %>
        <jalios:foreach collection="<%= JcmsUtil.applyDataSelector(new TreeSet<Group>(workspace.getGroupSet()), new Group.MemberSelector(loggedMember)) %>" name="itGroup" type="Group"><% 
          boolean selectedOption = itGroup == selectedGroup; 
          %><option value="<%= itGroup.getId() %>"<%= selectedOption ? " selected='selected'" : "" %>><%= itGroup.getName(userLang) %><%= selectedOption ? " ("+mbrTotalSize+")" : "" %></option>
        </jalios:foreach>
      <% } %>
    </select>

    <%-- Search --%>
    <div class="navbar-right"> 
      <jalios:field name="<%= MBR_TEXT_PARAM %>" value="<%= text %>" resource="field-light">
        <jalios:control settings='<%= new TextFieldSettings().placeholder("ui.com.placeholder.search") %>' />
        <span class="input-group-btn">
          <button class="btn btn-default" name="opSearch" type="submit"><jalios:icon src="search"/></button>
        </span>               
      </jalios:field>      
    </div>
    
    <% if (showAddButtons) { %>
      <% if (selectedGroup != null || csMgr.getEnrollmentGroup(workspace) != null) { %>
      <a class="modal btn btn-default" href="plugins/CollaborativeSpacePlugin/jsp/enrollMembers.jsp<%= selectedGroup != null ? "?targetGroup=" + selectedGroup.getId() : "" %>" onclick="return false;"><%= glp("jcmsplugin.collaborativespace.members.btn.enroll-members") %></a>
      <% } %>
      <% if (selectedGroup != null) { %>
      <a href='edit.jsp?id=<%= selectedGroup.getId() %>&redirect=<%= ServletUtil.encodeURL(ServletUtil.getUrl(request)) %>' class='ID_<%= selectedGroup.getId() %> btn btn-default'><%= glp("jcmsplugin.collaborativespace.members.btn.edit-group") %></a>
      <% } else if (csMgr.canManageCSGroups(loggedMember, workspace)) { %>
      <jalios:buttonModal css="btn btn-default" label="jcmsplugin.collaborativespace.members.btn.add-group" url="plugins/CollaborativeSpacePlugin/jsp/addGroup.jsp" />
      <% } %>
    <% } %>
    <%
    if (GuestAccountManager.getInstance().canSubmitGuestCreation(loggedMember, workspace)) {
      String customUrlDoEdit = "plugins/CollaborativeSpacePlugin/jsp/guestAccount/createGuestModal.jsp?"+AbstractGuestHandler.SRC_WORKSPACE_ID_PARAM+"=" + workspace.getId();
      String linkLabel = glp(GuestAccountsConstants.PROPERTY_PREFIX + ".account-creation.label");

      //---------------------------------------------------------------
      //  Modal Form including generated doEditFormXXX.jsp
      //---------------------------------------------------------------
      %><jalios:buttonModal css="btn btn-default" label="<%= linkLabel %>" url="<%= customUrlDoEdit %>" /><%
    }
    %>
    <jalios:include target="PLUGIN_CSP_RIBBON_MEMBERS_FILTER_FORM" targetContext="li" />  
    <input type="hidden" name="jsp" value="plugins/CollaborativeSpacePlugin/jsp/members.jsp" />
<% } %>
<% if (doForm) { %>
  </form>
</div>
<% } %>

<% if (isAdminList) { %>
  <jalios:include jsp="/plugins/CollaborativeSpacePlugin/jsp/adminList.jsp" />
<%--   <%@ include file="/plugins/CollaborativeSpacePlugin/jsp/adminList.jspf" %> --%>
<% } else if (isInvitationList) { %>
  <%@ include file="/plugins/CollaborativeSpacePlugin/jsp/invitationList.jspf" %>
<% } else if (isSignupList) { %>
  <%@ include file="/plugins/CollaborativeSpacePlugin/jsp/signupList.jspf" %>
<% } else { %>
  <%@ include file="/plugins/CollaborativeSpacePlugin/jsp/memberList.jspf" %>
<% } %>
