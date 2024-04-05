<%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneCtxMenuManager.CtxMenuItem"%><% 
%><%@page import="com.jalios.jcmsplugin.smartphone.json.SmartPhonePortletMapping"%><% 
%><%@page import="com.jalios.jcmsplugin.smartphone.json.SmartPhonePortalMapping"%><% 
%><%@page import="com.jalios.jcmsplugin.smartphone.portal.SmartPhonePortalManager"%><% 
%><%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneManager"%><% 
%><%@ taglib uri="/jcmsplugin/SmartPhonePlugin/tld/smartphone.tld" prefix="smartphone" %><%
%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.smartphone.portal.SmartPhonePortalDisplayHandler'><%--
--%><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%--
--%><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%--
--%><jsp:setProperty name='formHandler' property='*' /><%--
--%></jsp:useBean><%--
--%><%
formHandler.validate();

if (!formHandler.canReadPortal()) {
  sendRedirect("plugins/SmartPhonePlugin/jsp/core/forbidden.jsp");
  return;
}

request.setAttribute("customHeaderStyleContent", formHandler.getSmartPhonePortalCss());
request.setAttribute("jcms.plugin.smartphone.current-portal", formHandler.getAvailableMobilePortal());


%><%@ include file="/plugins/SmartPhonePlugin/jsp/common/header.jspf" %><%

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
<div id="index-portal-<%= formHandler.getPortal().getId() %>" class="index-portal" data-role="page" data-jalios-force-hide-back-btn="true"<% if (smartPhoneManager.getHomepageDomCache()) { %> data-dom-cache="true" dom-cache-expiration="<%= smartPhoneManager.getHomepageDomCacheExpiration() %>"<% } %>>
  <jalios:buffer name="menuItems" trim="true">
    <jalios:include target="SMARTPHONE_TOPBAR_INDEX_ACTIONS" targetContext="LI" />
    <% for (CtxMenuItem ctxMenuItem : formHandler.getCtxMenuItems()) { %>
      <jalios:include jsp="<%= ctxMenuItem.getUrl() %>" />
    <% } %>
    <jalios:include target="SMARTPHONE_TOPBAR_INDEX_ACTIONS_BOTTOM" targetContext="LI" />
  </jalios:buffer>
  
  <% if(Util.notEmpty(menuItems)) { %>
    <%-- Index topbar menu --%>
    <% String uniqueId = ServletUtil.generateUniqueDOMId(request, "topbarPublicationMenu"); %>
    <div class="topbar-actions">
      <a class="topbar-actions topbar-item" href="#<%= uniqueId %>" data-rel="popup" data-transition="slideup">
        <jalios:icon src="smartphone-topbar-action-menu" />
      </a>
    </div>
    <div data-role="popup" id="<%= uniqueId %>" data-theme="a" class="topbar-menu-dropdown">
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
        if (portlet != null && portlet.canBeReadBy(loggedMember) && portlet.isPublic()) {
      %>
      <smartphone:includePortlet portlet="<%= portlet %>" />
      <% } %>
    <% } %>
  <% } %>
</div>
<%@ include file="/plugins/SmartPhonePlugin/jsp/common/footer.jspf" %>