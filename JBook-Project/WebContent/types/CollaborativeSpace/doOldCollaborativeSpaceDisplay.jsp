<%@ page contentType="text/html; charset=UTF-8" %><% 
%><%@page import="com.jalios.jcmsplugin.collaborativespace.ui.model.CsHeaderSettings"%><%
%><%@ page import="com.jalios.jcmsplugin.collaborativespace.*" %><%  
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/front/doOpenModal.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%
%><jalios:include jsp="plugins/CollaborativeSpacePlugin/jsp/doCSDisplayHandler.jsp" /><%
CSDisplayHandler csHandler = (CSDisplayHandler) request.getAttribute("csDisplayHandler");

CSManager csMgr = CSManager.getInstance();
CollaborativeSpace cs = (CollaborativeSpace) portlet;

if (cs == null) {
  return;
}

if (portalCategory == channel.getRootCategory()) {
  portalCategory = Util.getFirst(cs.getCategories());
}
if (portalCategory == null) {
  // Prevent NPE
  logger.warn("Invalid setup of CollaborativeSpace \"" + cs.getTitle() + "\" ("+cs.getId()+"). It should have at least one category.");
  sendRedirect(channel.getUrl());
  return;
}

boolean isFullAccess = isAdmin || !CSHelper.isPrivate(cs) || loggedMember.belongsToWorkspace(cs.getWorkspace());

jcmsContext.addJavaScript("plugins/CollaborativeSpacePlugin/js/cs-space-fulldisplay.js");
jcmsContext.addJavaScript("plugins/CollaborativeSpacePlugin/js/cs-header-mirorring.js");

String sidebar = null;
String content = null;
if (isFullAccess) {
  // Retrieve children list
  List<PortalElement> childList = Util.getArrayList(cs.getChildren(new String[]{"sidebar","fulldisplay", "feed", "subscribe", "search"}));
  // Add a fake entry to prevent CSP-536
  // In such case, bufferList will at least contain a "<div></div>" HTML, which will prevent all CS dashboard to be hidden
  childList.add(null);
  
  // CSP-474 - CS Template : setAttribute "children" should be close to include doIncludePortletCollection.jspf
  ServletUtil.backupAttribute(pageContext, "children");
  request.setAttribute("children", childList.toArray(new PortalElement[]{}));

  // Only execute CS's portlets when member has access (CSP-296)
  ServletUtil.backupAttribute(pageContext, "ShowChildPortalElement");
  %><%@ include file='/types/AbstractCollection/doIncludePortletCollection.jspf'%><%
  ServletUtil.restoreAttribute(pageContext, "ShowChildPortalElement");
  // CSP-474 - Restore children
  ServletUtil.restoreAttribute(pageContext, "children");
  sidebar = getPortlets(bufferMap, "sidebar", "");
  content = getPortlet(bufferMap, "fulldisplay");
}

jcmsContext.addCSSHeader("css/resultdisplay.css"); 
jcmsContext.addCSSHeader("css/fulldisplay.css");
jcmsContext.addCSSHeader("plugins/CollaborativeSpacePlugin/css/collaborativeSpace.css");
String themeClass = "";
if (Util.notEmpty(cs.getTheme())) {
  String themeFile = channel.getProperty("jcmsplugin.collaborativespace.look.theme." + cs.getTheme() + ".file", "");
  if (Util.notEmpty(themeFile)) {
    // Before CSP-7.0
    jcmsContext.addCSSHeader("plugins/CollaborativeSpacePlugin/css/theme/" + themeFile);
    themeClass = " " + channel.getProperty("jcmsplugin.collaborativespace.look.theme." + cs.getTheme() + ".name");
  } else {
    // Since CSP-7.0
    jcmsContext.addCSSHeader("plugins/CollaborativeSpacePlugin/css/theme/" + cs.getTheme() + ".css");
    themeClass = " cs-theme-" + cs.getTheme();
  }
}
CsHeaderSettings headerSettings = csMgr.getHeaderSettings(cs);
boolean isCondensedMode = headerSettings != null && headerSettings.getCondensed();

String csPortalCss = "";
if (isCondensedMode) {
  jcmsContext.addCSSHeader("plugins/CollaborativeSpacePlugin/css/cs-layout-condensed.css");
  csPortalCss = " cs-is-condensed";
}
boolean isFullScreen = !isFullAccess || Util.toBoolean(request.getAttribute("jcmsplugin.collaborativespace.portal.fullscreen"), false);

boolean isLeftSidebar = isFullAccess && "sidebar-left".equals(cs.getLayout());
boolean isRightSidebar = isFullAccess && !isLeftSidebar && "sidebar-right".equals(cs.getLayout());
boolean displaySidebarLeft = isLeftSidebar && !isFullScreen;
boolean displaySidebarRight = isRightSidebar && !isFullScreen;

// Compute Bootstrap's cols breakpoints:
String contentCss;
String sidebarCss = (isLogged && loggedMember.canWorkOn(cs)) ? "ID_"+cs.getId()+" dnd-container" : "";
if (displaySidebarLeft || displaySidebarRight) {
  sidebarCss += " col-xs-12 col-sm-4 col-md-3 col-lg-3";
  contentCss =   "col-xs-12 col-sm-8 col-md-9 col-lg-9";
} else {
  contentCss = "col-xs-12";
}
boolean isDashboard = Util.toBoolean(request.getAttribute("isCollaborativeSpaceDashboard"), false);
boolean displayMetas = isDashboard || !isFullAccess;
String csLayout = cs.getLayout();
if (Util.notEmpty(csLayout) && csLayout.startsWith("sidebar")) {
  csLayout = "cs-" + csLayout;
}
%>
<jalios:include jsp="plugins/CollaborativeSpacePlugin/front/doHeaderSettingsStyle.jsp" />

<jalios:include target="PLUGIN_COLLABORATIVESPACE_PORTAL_TOP" />

<div class="cs-portal<%= themeClass %><%= csPortalCss %><%= workspace.isModel() ? " cs-portal-model" : "" %>">

  <%-- HEADER --%>
  <%@ include file="/types/CollaborativeSpace/doCollaborativeSpaceHeader.jspf" %>

  <div id="cs-body" class="cs-body <%= isDashboard ? "cs-body-dashboard " : "" %><%= isFullScreen ? "cs-body-fullscreen" : csLayout %>">

    <div class="row">
  
      <%-- Informations --%>
      <% if (displayMetas) { %>
        <div class="col-xs-12">
          <%@ include file="/plugins/CollaborativeSpacePlugin/jsp/metas/doMetas.jspf" %>
        </div>
      <% } %>

      <% if (isFullAccess) { %>
        <%-- LEFT SIDEBAR --%>
        <% if (displaySidebarLeft) { %>
          <div id="sidebar" class="<%= sidebarCss %>"><%= sidebar %></div>
        <% } %>
  
        <%-- CONTENT --%>
        <div id="cs-content-wrapper" class="<%= contentCss %>">
          <div id="cs-content">
            <%= content %>
          </div>
        </div>
  
        <%-- RIGHT SIDEBAR --%>
        <% if (displaySidebarRight) { %>
          <div id="sidebar" class="<%= sidebarCss %>"><%= sidebar %></div>
        <% } %>
      <% } %>
    </div>
  </div>
  
  <%-- FOOTER --%>
  <div id="cs-footer"></div>

</div>

<jalios:include target="PLUGIN_COLLABORATIVESPACE_PORTAL_BOTTOM" />

<%-- WELCOME MODAL --%>
<% if (csMgr.showWelcome(workspace)) { %>
<jalios:javascript>JCMS.window.Modal.showJSP("plugins/CollaborativeSpacePlugin/jsp/welcome.jsp");</jalios:javascript>
<% } %>
<% if (csMgr.showInvitationModal(loggedMember, workspace)) { %>
<jalios:javascript>JCMS.window.Modal.showJSP("plugins/CollaborativeSpacePlugin/jsp/processInvitationModal.jsp");</jalios:javascript>
<% } %>
<%
request.removeAttribute("isCollaborativeSpaceDashboard");
%>