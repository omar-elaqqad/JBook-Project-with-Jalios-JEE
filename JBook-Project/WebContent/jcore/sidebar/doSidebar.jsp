<%@page import="com.jalios.jcms.uicomponent.Button.ButtonType"%>
<%@ include file='/jcore/doInitPage.jspf' %><% 
  if (!channel.getBooleanProperty("channel.sidebar.enabled",true)) {
    return;
  }
  
  if (!isLogged) {
    return;
  }

  jcmsContext.addCSSHeader("css/jalios/core/components/sidebar/jalios-sidebar.css");
  jcmsContext.addCSSHeader("css/jalios/core/components/sidebar/jalios-site-sidebar.css");
  jcmsContext.addCSSHeader("css/jalios/core/components/sidebar/jalios-sidebar-tabbed.css");
  jcmsContext.addJavaScript("js/jalios/core/components/jalios-sidebar.js"); 
  jcmsContext.addJavaScript("js/jalios/core/components/jalios-site-sidebar.js"); 
  
  jcmsContext.addJavaScript("js/jalios/core/components/jalios-loading-waves.js");
  jcmsContext.addCSSHeader("css/jalios/core/components/loading/jalios-loading-waves.css");
  
  Member delegateMember = channel.getCurrentDelegateMember();
  String memberPhotoTitleHtmlAttributes = "title=\"" + encodeForHTMLAttribute(glp("ui.sidebar.member-menu.photo-title", JcmsUtil.unescapeHtml(loggedMember.getFullName()))) + "\"";
%>
<section role="dialog" aria-modal="true" class="site-sidebar sidebar-right is-closed sidebar-tabbed sidebar-component hide" aria-labelledby="main-sidebar-opener" data-jalios-sidebar-direction="right">
  <div class='noTooltipCard sidebar-header<%= delegateMember != null ? " is-delegated" : "" %><%= loggedMember.isGuest() ? " is-guest" : "" %>'>
    <jalios:button buttonType="<%= ButtonType.A %>" css="btn sidebar-close sidebar-closer" title="ui.sidebar.member-menu.close" dataAttribute='<%= new DataAttribute().addData("jalios-sidebar-action","close").addData("jalios-sidebar-target", ".site-sidebar") %>' >
      <jalios:icon src="close-sidebar" alt="ui.sidebar.member-menu.close"/>
    </jalios:button>     
    <!-- Link to profile, edit profile, and log-out -->
    <div class="sidebar-header-buttons btn-group">
      <jalios:include target="SIDEBAR_MEMBER_BTN" />
      <% if (delegateMember == null) { %>
        <jalios:login css="btn btn-logout" displayLogin="false" displaySuLogin="false" displaySuLogout="false"  logoutIcon="sidebar-logout"/>
      <% } else { %>
        <jalios:login css="btn btn-logout" displayLogout="false" displaySuLogin="false" displaySuLogout="true" logoutIcon="sidebar-logout" />
      <% } %>
      <!-- Language -->
      <% if (channel.isMultilingual() && channel.getBooleanProperty("ui.sidebar.navigation.language.enabled",true)) { %>
        <jalios:lang ctxMenuCss="flag-dropdown-menu" display='menu' css="flag-dropdown" useLocalizedLanguageList='<%= !jcmsContext.isInFrontOffice() %>'/>
      <% } %> 
    </div>
	  <!-- Avatar -->
    <jalios:memberphoto showStatus="false" member="<%= loggedMember %>" size="<%= PhotoSize.SMALL %>" alt='<%= glp("ui.sidebar.member-menu.photo-title", loggedMember.getFullName()) %>' htmlAttributes='<%= memberPhotoTitleHtmlAttributes %>' />
    
    <% if (delegateMember != null) { %>
      <span class="delegate-text">
        <%= glp("ui.com.msg.delegate-warning-simple", loggedMember.getFullName()) %>
      </span>
    <% } %>
  </div>
  <jalios:include jsp="jcore/sidebar/doSidebarBody.jsp" />
</section>