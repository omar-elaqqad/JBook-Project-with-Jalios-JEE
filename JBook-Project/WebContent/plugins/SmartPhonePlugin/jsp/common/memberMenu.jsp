<%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneMemberMenuManager.MemberMenuItem"%><% 
%><%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %>
<jsp:useBean id='memberMenuHandler' scope='page' class='com.jalios.jcmsplugin.smartphone.SmartPhoneMemberMenuDisplayHandler'>
  <jsp:setProperty name='memberMenuHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='memberMenuHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='memberMenuHandler' property='*' />
</jsp:useBean>
<% request.setAttribute("smartphone.membermenu.handler", memberMenuHandler); %>

<div class="member-menu-wrapper-tabs ajax-refresh-wrapper" data-jalios-ajax-action="plugins/SmartPhonePlugin/jsp/common/memberMenu.jsp">
  <div class="member-menu-tabs-wrapper">
    <ul class="nav nav-tabs nav-tabs-underlined" role="tablist">
        <% for (MemberMenuItem mbrMenuItem : memberMenuHandler.getMenuItems()) { %>
          <% request.setAttribute("smartphone.mbrmenuitem.item", mbrMenuItem); %>
          <% if (Util.notEmpty(mbrMenuItem.getTabUrl())) { %>
	          <jalios:include jsp="<%= mbrMenuItem.getTabUrl() %>" />
          <% } else { %>
            <li role="presentation" class="<%= memberMenuHandler.isActiveTab(mbrMenuItem) ? "active" : "" %>">
              <a href="#<%= mbrMenuItem.getName() %>" aria-controls="<%= mbrMenuItem.getName() %>" role="tab" data-toggle="tab">
                <jalios:icon src="<%= mbrMenuItem.getIcon() %>" />
                <span><%= mbrMenuItem.getLabel(userLang) %></span>
              </a>
            </li>
          <% } %>
        <% } %>
      </ul>
    </div>
	 <div class="member-menu-tabs-content" >
	  <div class="tab-content">
	    <% for (MemberMenuItem mbrMenuItem : memberMenuHandler.getMenuItems()) { %>
	    <div role="tabpanel" class="tab-pane <%= memberMenuHandler.isActiveTab(mbrMenuItem)  ? "active" : "" %>" id="<%= mbrMenuItem.getName() %>">
	      <jalios:include jsp="<%= mbrMenuItem.getUrl() %>" />
	    </div>
	    <% } %>
	  </div>
	</div>
</div>