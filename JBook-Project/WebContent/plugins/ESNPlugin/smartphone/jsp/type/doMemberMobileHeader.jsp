<%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneManager"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/doInitMemberProfile.jspf' %><%

SmartPhoneManager smartPhoneManager = SmartPhoneManager.getInstance();

boolean isGuest = member.isGuest();
String salutation = member.getLangSalutation(userLang);

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
      <span class="profile-status profile-header-left-info">
        <%
        int mbrStatus = esnProfileDisplayHandler.getMember().getStatus();
        String mbrStatusCss = "mbr-status-" + mbrStatus;
        String mbrStatusIcon = "mbr-status-" + mbrStatus;
        String mbrStatusLabel = glp("ui.com.alt.mbr.status." + mbrStatus);
        %>
        <%-- empty span -> bullet/icon --%>
        <span class="mbr-status <%= mbrStatusCss %>" title='<%= encodeForHTMLAttribute(mbrStatusLabel) %>'></span>
        <%-- then, label (has text-overflow) --%>
        <%= mbrStatusLabel %>
      </span>
      <% } %>
    </div>

    <%-- Photo --%>
    <jalios:include resource="esn.profile.full-mobile.header.photo" />
  </div><%-- EOF .profile-header-top-inner --%>

  <div class="profile-header-details">
    <% if (Util.toBoolean(request.getAttribute("esn.member-profile.target.header-top"), true)) { %>
      <jalios:include target="PLUGIN_ESN_MEMBER_PROFILE_HEADER_TOP" />
    <% } %>

    <%-- Profile title --%>
    <div class="profile-header-item profile-header-title">
      <%-- Full name --%>
      <h1 class="profile-name">
        <%= Util.notEmpty(salutation) ? salutation + " " : "" %><%= member.getFullName() %>
      </h1>
      <%-- Organization --%>
      <%@ include file='/plugins/ESNPlugin/jsp/common/doESNMemberOrganization.jspf' %>
    </div>

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
    <% if (Util.notEmpty(channel.getProperty("jcms.resource.include.esn.profile.full-mobile.header.event", ""))) { %>
    <jalios:include resource="esn.profile.full-mobile.header.event" />
    <% } %>
    
    <%-- Contact channels --%>
    <% if (Util.notEmpty(channel.getProperty("jcms.resource.include.esn.profile.full-mobile.contact-channels", ""))) { %>
    <jalios:include resource="esn.profile.full-mobile.contact-channels" />
    <% } %>

    <jalios:include target="SMARTPHONE_MEMBER_PROFILE_AFTER_HEADERINFO" />

  </div><%-- EOF .profile-header-details --%>
</div><%-- EOF .profile-header.profil-details --%>
<div class="content-divider-contrasted-default"></div>
<jalios:include target="SMARTPHONE_MEMBER_PROFILE_AFTER_MEMBERHEADER" />