<%@ page contentType="text/html; charset=UTF-8" %><%-- 
--%><%@ include file='/jcore/doInitPage.jspf' %><%--
--%><%@ include file='/jcore/doHeader.jspf' %><%--
--%><%@ page import="com.jalios.jcmsplugin.esn.*" %><%--
--%>
<%
ESNManager esnMgr = ESNManager.getInstance();
MemberProfile profile = (MemberProfile)request.getAttribute(PortalManager.PORTAL_PUBLICATION); 

Member member = null;

if (profile == null) {
  profile = esnMgr.getMemberProfile(loggedMember,true);
}

if (profile == null) {
  sendForbidden(request, response);
  return;
}

member = profile.getAuthor();
boolean isMyProfile = member == loggedMember;

if (member == null) {
  sendForbidden(request, response);
  return;
}

if (!esnMgr.checkAgreement(loggedMember)) {
  sendRedirect("plugins/ESNPlugin/jsp/agreement.jsp");
  return;  
}

boolean hasPhoto = member.hasPhoto();
boolean isContact = member.isContact();
boolean isAccount = !isContact;
boolean isConnected  = esnMgr.isConnected(member, loggedMember);
boolean canEdit = esnMgr.canEdit(loggedMember, member, workspace);
boolean isFollowing = !isMyProfile && esnMgr.isFollowing(loggedMember, member);

String editLabel = "[ " + glp("jcmsplugin.esn.lbl.editLabel") + " ]";

String friendlyName = member.getFriendlyName();

jcmsContext.setAjaxRequestAttribute("jcmsplugin.esn.member.id", member.getId());
jcmsContext.setAjaxRequestAttribute("jcmsplugin.esn.member.friendlyName", member.getFriendlyName());
jcmsContext.setAjaxRequestAttribute("jcmsplugin.esn.member.canEdit", canEdit);
jcmsContext.setAjaxRequestAttribute("jcmsplugin.esn.member.editLabel", editLabel);

request.setAttribute("jcmsplugin.esn.member", member);
request.setAttribute("jcmsplugin.esn.profile", profile);
request.setAttribute("jcmsplugin.esn.member.isConnected", isConnected);

request.setAttribute("skipFooter",true);


boolean isEditProfile = Util.toBoolean(session.getAttribute("jcmsplugin.esn.edit." + member.getId()), false);

String esnProfileTab = getAlphaNumParameter("esnProfileTab", "");

boolean showActivity = "activity".equals(esnProfileTab);
boolean showInfo     = "info".equals(esnProfileTab);
boolean showContact  = "contact".equals(esnProfileTab);
boolean showResume   = "resume".equals(esnProfileTab);


if (Util.isEmpty(esnProfileTab)) {
  if (isAccount && (isMyProfile || isConnected || isFollowing)) {
    showActivity = true;
  } else {
    showInfo = true;
  }  
}

request.setAttribute("esn.showActivity", showActivity);
request.setAttribute("esn.showContact", showContact);
request.setAttribute("esn.showResume", showResume);
request.setAttribute("esn.showInfo", showInfo);

jcmsContext.addCSSHeader("plugins/ESNPlugin/css/esn.css");
jcmsContext.addCSSHeader("plugins/ESNPlugin/css/activity.css");
jcmsContext.addCSSHeader("css/fff-sprite.css");%>

<jalios:include target="PLUGIN_ESN_PROFILE_TOP" />   
   
<div id="member-profile" class="esn <%= isEditProfile ? "editMemberProfile" : "viewMemberProfile" %>" itemscope itemtype="http://schema.org/Person"> 

<div class="row">
  <div class="col-md-8">
      <jalios:include id="$id.jcmsplugin.esn.portlet.header" />  
<%--  ACCOUNT --%>
      <% if (isAccount) { %>
      
      <%   if (showActivity && Util.toBoolean(request.getAttribute("esn.showActivityTab"), true)) { %>
      <jalios:include id="$id.jcmsplugin.esn.portlet.activities" />
      <jalios:include id="$id.jcmsplugin.esn.portlet.calendar" />
      <jalios:include id="$id.jcmsplugin.esn.portlet.publications" />
      <%   } else if (showInfo && Util.toBoolean(request.getAttribute("esn.showInfoTab"), true)) { %>
      <jalios:include id="$id.jcmsplugin.esn.portlet.presentation" />      
      <jalios:include id="$id.jcmsplugin.esn.portlet.workspaces" />
      <jalios:include id="$id.jcmsplugin.esn.portlet.expertise" />
      <%   } else if (showContact && Util.toBoolean(request.getAttribute("esn.showContactTab"), true)){ %>
      <jalios:include id="$id.jcmsplugin.esn.portlet.contacts" />
      <%   } else if (showResume && Util.toBoolean(request.getAttribute("esn.showResumeTab"), true)) {  %>
      <jalios:include id="$id.jcmsplugin.esn.portlet.jobs" />
      <jalios:include id="$id.jcmsplugin.esn.portlet.educations" />
      <%   } %>
      <%--  CONTACT --%>
      <% } else { %>
      <%   if (showInfo && Util.toBoolean(request.getAttribute("esn.showInfoTab"), true)) { %>
      <jalios:include id="$id.jcmsplugin.esn.portlet.presentation" />      
      <jalios:include id="$id.jcmsplugin.esn.portlet.expertise" />
      <jalios:include id="$id.jcmsplugin.esn.portlet.contact-calendar" />      
      <jalios:include id="$id.jcmsplugin.esn.portlet.contact-referrers" />      
      <jalios:include id="$id.jcmsplugin.esn.portlet.contact-notes" />      
      <%   } else if (showContact && Util.toBoolean(request.getAttribute("esn.showContactTab"), true)) { %>
      <jalios:include id="$id.jcmsplugin.esn.portlet.contacts" />
      <%   } %>
      <% } %>
      <jalios:include target="PLUGIN_ESN_PROFILE_MAIN" />      
  </div>
  <% if (Util.toBoolean(request.getAttribute("esn.showSideColumn"), true)) { %>
  <div class="col-md-4">
    <% if (Util.toBoolean(request.getAttribute("esn.showSideColumn.actions"), true)) { %>
        <jalios:include id="$id.jcmsplugin.esn.portlet.actions" />      
    <% } %>
    <% if (Util.toBoolean(request.getAttribute("esn.showSideColumn.targetTop"), true)) { %>
    <jalios:include target="PLUGIN_ESN_PROFILE_RIGHT_TOP" />
    <% } %>
    <% if (isLogged) { %>
		  <% if (Util.toBoolean(request.getAttribute("esn.showSideColumn.requests"), true)) { %>
		    <jalios:include id="$id.jcmsplugin.esn.portlet.connection-requests" />
		  <% } %>
		  <% if (Util.toBoolean(request.getAttribute("esn.showSideColumn.suggestions"), true)) { %>
		    <jalios:include id="$id.jcmsplugin.esn.portlet.suggestions" />
		  <% } %>
		  <% if (Util.toBoolean(request.getAttribute("esn.showSideColumn.common-connections"), true)) { %>
		    <jalios:include id="$id.jcmsplugin.esn.portlet.common-connections" />
		  <% } %>
		  <% if (Util.toBoolean(request.getAttribute("esn.showSideColumn.connections"), true)) { %>
		    <jalios:include id="$id.jcmsplugin.esn.portlet.connections" />
		  <% } %>
		  <% if (Util.toBoolean(request.getAttribute("esn.showSideColumn.links"), true)) { %>
		    <jalios:include id="$id.jcmsplugin.esn.portlet.links" />
		  <% } %>
    <% } %>
    <% if (Util.toBoolean(request.getAttribute("esn.showSideColumn.targetBottom"), true)) { %>
    <jalios:include target="PLUGIN_ESN_PROFILE_RIGHT_BOTTOM" />      
    <% } %>
  </div>
  <% } %>
</div>
</div>