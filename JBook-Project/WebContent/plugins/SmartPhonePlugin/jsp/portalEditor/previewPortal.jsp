<%@page import="com.jalios.jcmsplugin.smartphone.json.SmartPhonePortletMapping"%>
<%@page import="com.jalios.jcmsplugin.smartphone.json.SmartPhonePortalMapping"%>
<%@page import="com.jalios.jcmsplugin.smartphone.portal.SmartPhonePortalManager"%>
<%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneManager"%>
<%@ taglib uri="/jcmsplugin/SmartPhonePlugin/tld/smartphone.tld" prefix="smartphone" %>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.smartphone.portal.SmartPhonePortalDisplayHandler'><%--
--%><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%--
--%><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%--
--%><jsp:setProperty name='formHandler' property='*' /><%--
--%></jsp:useBean><%--
--%>
<% 
formHandler.validate();
request.setAttribute("customHeaderStyleContent", formHandler.getSmartPhonePortalCss());%>
<%@ include file="/plugins/SmartPhonePlugin/jsp/common/header.jspf" %><%
session.removeAttribute(SmartPhonePortalPolicyFilter.FORCE_SMARTPHONE_SESSION_ATTR);

String portalJS = formHandler.getSmartPhonePortalJs();
if (Util.notEmpty(portalJS)) { %>
<script>
  try{
    <%= portalJS %>
  }catch(e){
    //TODO log error
  }
</script>
<% } %>

<script>
	jQuery(document).on("vclick",function(event){
		event.preventDefault();
	});
	jQuery(".js-toggle-member-menu ").each(function(index, element){
		jQuery(element).removeClass("js-toggle-member-menu");
	});
</script>

<div id="index-portal-<%= formHandler.getPortal().getId() %>" class="index-portal" data-role="page" data-jalios-force-hide-back-btn="true">
  <jalios:buffer name="menuItems" trim="true">
    <% if(!SmartPhoneManager.getInstance().isMobileApp(request)) { %>
      <li><a data-ajax="false" href="<%= smartPhoneManager.getDesktopUrl(userLocale) %>"><%= glp("jcmsplugin.smartphone.lbl.index-default.desktop-link") %></a></li>  
      <jalios:include target="SMARTPHONE_TOPBAR_INDEX_ACTIONS" targetContext="LI" />
      <li><a data-ajax="false" class="confirm logout-link" href="plugins/SmartPhonePlugin/jsp/core/logout.jsp"><%= glp("ui.com.alt.logout") %></a></li>
    <% } %>
  </jalios:buffer>
  
  <% if(SmartPhoneManager.getInstance().isMobileApp(request)) { %>
    <%-- Index topbar menu --%>
    <% String uniqueId = ServletUtil.generateUniqueDOMId(request, "topbarPublicationMenu"); %>
    <div class="topbar-actions topbar-item topbar-right" data-role="none">
      <div class="topbar-item open-panel topbar-settings">
        <a href="#<%= uniqueId %>" data-rel="popup" data-transition="slideup">
          <jalios:icon src="smartphone-topbar-action-menu" />
        </a>
      </div>
    </div>
  <% } else if(Util.notEmpty(menuItems)) { %>
    <%-- Index topbar menu --%>
    <% String uniqueId = ServletUtil.generateUniqueDOMId(request, "topbarPublicationMenu"); %>
    <div class="topbar-actions">
      <a class="topbar-actions topbar-item" href="#<%= uniqueId %>" data-rel="popup" data-transition="slideup">
        <jalios:icon src="glyph: icomoon-more2" />
      </a>
    </div>
    <div data-role="popup" id="<%= uniqueId %>" data-theme="a">
      <ul data-role="listview" data-inset="true" style="min-width:210px;">
        <%= menuItems %>
      </ul>
    </div>
  <% } %>

	<% SmartPhonePortalMapping mapping = formHandler.getMobilePortalMapping(); %>
	<% if(mapping != null &&  mapping.getPortlets() != null){ %>
	  <% for (SmartPhonePortletMapping itPortlet : mapping.getPortlets()) { %>
	    <% 
	      PortalElement portlet = (PortalElement) channel.getPublication(itPortlet.getId());
	      if (portlet != null) {
	    %>
	    <smartphone:includePortlet portlet="<%= portlet %>" />
	    <% } %>
	  <% } %>
  <% } %>
</div>

<%@ include file="/plugins/SmartPhonePlugin/jsp/common/footer.jspf" %>