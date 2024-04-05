<%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneManager"%>
<%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneMemberMenuManager.MemberMenuItem"%>
<%@page import="com.jalios.jcmsplugin.smartphone.application.SmartPhoneApplicationManager"%>
<%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneMemberMenuManager"%>
<%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%
if (!isLogged) {
  return;
}
%>
<div class="topbar" data-theme="b" data-role="header" data-position="fixed" data-tap-toggle="false">
  <div class="ui-bar">
    <div class="topbar-left" data-role="none">
      <a class="ui-toolbar-back-btn topbar-item" data-rel="back" href="#"><jalios:icon src="smartphone-topbar-back" /></a>
      <a class="topbar-item topbar-item-mbr js-toggle-member-menu" >
        <div class="member-menu-wrapper-top js-toggle-member-menu hamburger hamburger--arrow close-menu" type="button">
          <span class="hamburger-box">
            <span class="hamburger-inner"></span>
          </span>
        </div>
      </a>
    </div>
    <a data-enhance="false" class="topbar-logo-link" href="plugins/SmartPhonePlugin/jsp/index.jsp"><jalios:icon src='<%= SmartPhoneManager.getInstance().getTopbarLogo() %>' css="topbar-logo" /></a>
    <div class="topbar-right" data-role="none">
    </div>
  </div>
</div>
<div class="member-menu-wrapper">
  <div class="member-menu-topbar-placeholder js-toggle-member-menu"></div>
  <jalios:include jsp="plugins/SmartPhonePlugin/jsp/common/memberMenu.jsp"/>  
</div>