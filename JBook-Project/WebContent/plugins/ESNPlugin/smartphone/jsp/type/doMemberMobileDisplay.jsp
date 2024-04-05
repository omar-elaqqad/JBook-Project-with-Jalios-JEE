<%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/doInitMemberProfile.jspf' %><%
request.setAttribute("com.jalios.jcmsplugin.smartphone.member", member);

String css = "esn member-profile";
// Member
css += esnProfileDisplayHandler.isAccount() ? " is-account" : "";
css += member.isDBData() ? " is-dbmember" : "";
css += esnProfileDisplayHandler.isContact() ? " is-contact" : "";
css += esnProfileDisplayHandler.isGuest() ? " is-guest" : "";
css += esnProfileDisplayHandler.isConnected() ? " is-connected" : "";
css += member.isDisabled() ? " is-disabled" : "";
%>
<div id="member-profile" data-role="page" class="<%= css %>">

  <jalios:include target="SMARTPHONE_MEMBER_PROFILE_TOP" />

  <%-- ESN Member topbar actions --%>
  <jalios:include resource="esn.profile.full-mobile.topbar-menu" />

  <jalios:include target="SMARTPHONE_MEMBER_PROFILE_AFTER_TOPBARMENU" />

  <div data-role="content" class="member-profile">
    <jalios:include resource="esn.profile.full-mobile.header" />

    <jalios:include target="SMARTPHONE_MEMBER_PROFILE_AFTER_INFO" />
  </div>
  <%@ include file='/plugins/SmartPhonePlugin/jsp/core/member/doMemberContactInformation.jspf' %>
</div><%-- EOF #member-profile --%>