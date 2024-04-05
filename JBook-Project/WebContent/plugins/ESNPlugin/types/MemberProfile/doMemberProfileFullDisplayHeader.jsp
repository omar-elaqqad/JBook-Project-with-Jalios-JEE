<%@page import="com.jalios.jcms.calendar.CalendarEventInterface"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/doInitMemberProfile.jspf' %><%

if (logger.isTraceEnabled()) { logger.trace("doMemberProfileFullDisplayHeader.jsp: start render"); }

boolean isDisabled = member.isDisabled();
String memberTypeLabel = "";
if (isContact) {
  memberTypeLabel = glp("ui.com.lbl.contact");
} else if (member.isGuest()) {
  if (isDisabled) {
    memberTypeLabel = glp("jcmsplugin.esn.profile.lbl.disabled-guest-account");
  } else {
    memberTypeLabel = glp("ui.com.lbl.guest");
  }
} else if (isDisabled) {
  memberTypeLabel = glp("jcmsplugin.esn.profile.lbl.disabled-account");
}
boolean canUpdatePhoto = esnMgr.canUpdatePhoto(loggedMember, member, workspace);
boolean validateShowStatus = channel.getBooleanProperty("jcmsplugin.esn.profile.status.enabled", true);
boolean hasStatus = validateShowStatus && !isDisabled && esnProfileDisplayHandler.hasStatus();
%>

<div class="profile-header">
  <div class="profile-header-top">
    <div class="profile-header-left">
      <%-- account type --%>
      <% if (Util.notEmpty(memberTypeLabel)) { %>
      <span class="profile-member-type profile-header-left-info">
        <%= memberTypeLabel %>
      </span>
      <% } %>
      
      <%-- presence status --%>
      <% if (hasStatus) { %>
      <div class="profile-status profile-header-left-info">
        <%
        int mbrStatus = esnProfileDisplayHandler.getMember().getStatus();
        String mbrStatusCss = "mbr-status-" + mbrStatus;
        String mbrStatusIcon = "mbr-status-" + mbrStatus;
        String mbrStatusLabel = glp("ui.com.alt.mbr.status." + mbrStatus);
        %>
        <%-- empty span -> bullet/icon --%>
        <span class="mbr-status <%= mbrStatusCss %>" title='<%= encodeForHTMLAttribute(mbrStatusLabel) %>'></span>
        <%-- then, label (has text-overflow) --%>
        <p class="mbr-status-label"><%= mbrStatusLabel %></p> 
      </div>
      <% } %>
    </div>

    <%-- Photo --%>
    <%
    if (logger.isTraceEnabled()) { logger.trace("doMemberProfileFullDisplayHeader.jsp: start render of resource 'esn.profile.full.photo'"); }
    %>
    <jalios:include resource="esn.profile.full.photo" />
    <%
    if (logger.isTraceEnabled()) { logger.trace("doMemberProfileFullDisplayHeader.jsp: end render of resource 'esn.profile.full.photo'"); }
    %>
    
    <%-- Actions --%>
    <div class="profile-header-right">
      <%
      if (logger.isTraceEnabled()) { logger.trace("doMemberProfileFullDisplayHeader.jsp: start render of resource 'esn.profile.full.actions'"); }
      %>
      <jalios:include resource="esn.profile.full.actions" />
      <%
      if (logger.isTraceEnabled()) { logger.trace("doMemberProfileFullDisplayHeader.jsp: end render of resource 'esn.profile.full.actions'"); }
      %>
    </div>
  </div><%-- EOF .profile-header-top-inner --%>

  <div class="profile-header-details">
    <% if (Util.toBoolean(request.getAttribute("esn.member-profile.target.header-top"), true)) { %>
      <%
      if (logger.isTraceEnabled()) { logger.trace("doMemberProfileFullDisplayHeader.jsp: calling Target PLUGIN_ESN_MEMBER_PROFILE_HEADER_TOP"); }
      %>
      <jalios:include target="PLUGIN_ESN_MEMBER_PROFILE_HEADER_TOP" />
      <%
      if (logger.isTraceEnabled()) { logger.trace("doMemberProfileFullDisplayHeader.jsp: end of calling Target PLUGIN_ESN_MEMBER_PROFILE_HEADER_TOP"); }
      %>
    <% } %>

    <%@ include file='/jcore/doMessageBox.jspf' %>

    <%-- Profile title --%>
    <div class="profile-header-item profile-header-title">
      <%-- Full name --%>
      <h1 class="profile-name" itemprop="name"><%= member.getFullName() %></h1>
      <%-- Organization --%>
      <%@ include file='/plugins/ESNPlugin/jsp/common/doESNMemberOrganization.jspf' %>
    </div>

    <% if (isEdit) { %>
      <div class="profile-completeness profile-body-inline-block">
        <%
        int completeness = esnProfileDisplayHandler.getProfileCompleteness();
        String completenessHtmlLabel = glp("jcmsplugin.esn.lbl.editProfile.progress", completeness);
        %>
        <span class="progress-bar-desc"><%= completenessHtmlLabel %></span>
        <div class="progress">
          <div class="progress-bar progress-bar-success"<%
            %> role="progressbar"<%
            %> aria-valuenow="<%= completeness %>"<%
            %> aria-valuemin="0"<%
            %> aria-valuemax="100"<%
            %> style="width: <%= completeness %>%;"<%
            %> aria-label='<%= encodeForHTMLAttribute(HtmlUtil.html2text(completenessHtmlLabel)) %>'>
            <span class="progress-bar-percent"><%= completeness %>%</span>
          </div>
        </div>
      </div>
    
    <% } else { %>
  
      <%-- Coordonnees --%>
      <jalios:buffer name="profileCoordonneesBuffer">
        <% request.setAttribute("esn.phone.icon", channel.getProperty("icon.jcmsplugin-esn-profile-phone", "phone")); %>
        <%@ include file='/plugins/ESNPlugin/jsp/common/doESNMemberCoordonnees.jspf' %>
      </jalios:buffer>
      <% if (Util.notEmpty(profileCoordonneesBuffer.toString())) { %>
      <div class="profile-header-item profile-coordonnees-item">
        <%= profileCoordonneesBuffer.toString() %>
      </div>
      <% } %>  

      <%-- Event --%>
      <% if (Util.notEmpty(channel.getProperty("jcms.resource.include.esn.profile.full.header.event", ""))) { %>
      <%
      if (logger.isTraceEnabled()) { logger.trace("doMemberProfileFullDisplayHeader.jsp: start render of resource 'esn.profile.full.header.event'"); }
      %>
      <jalios:include resource="esn.profile.full.header.event" />
      <%
      if (logger.isTraceEnabled()) { logger.trace("doMemberProfileFullDisplayHeader.jsp: end render of resource 'esn.profile.full.header.event'"); }
      %>
      <% } %>
      
      <%-- Contact channels --%>
      <%
      if (logger.isTraceEnabled()) { logger.trace("doMemberProfileFullDisplayHeader.jsp: start render of resource 'esn.profile.full.contact-channels'"); }
      %>
      <jalios:include resource="esn.profile.full.contact-channels" />
      <%
      if (logger.isTraceEnabled()) { logger.trace("doMemberProfileFullDisplayHeader.jsp: end render of resource 'esn.profile.full.contact-channels'"); }
      %>
    <% } %>

    <% if (Util.toBoolean(request.getAttribute("esn.member-profile.target.header-bottom"), true)) { %>
      <%
      if (logger.isTraceEnabled()) { logger.trace("doMemberProfileFullDisplayHeader.jsp: calling Target PLUGIN_ESN_MEMBER_PROFILE_HEADER_BOTTOM"); }
      %>
      <jalios:include target="PLUGIN_ESN_MEMBER_PROFILE_HEADER_BOTTOM" />
      <%
      if (logger.isTraceEnabled()) { logger.trace("doMemberProfileFullDisplayHeader.jsp: end of calling Target PLUGIN_ESN_MEMBER_PROFILE_HEADER_BOTTOM"); }
      %>
    <% } %>
  </div><%-- EOF .profile-header-details --%>
</div><%-- EOF .profile-header.profil-details --%>
<%
if (logger.isTraceEnabled()) { logger.trace("doMemberProfileFullDisplayHeader.jsp: end render"); }
%>