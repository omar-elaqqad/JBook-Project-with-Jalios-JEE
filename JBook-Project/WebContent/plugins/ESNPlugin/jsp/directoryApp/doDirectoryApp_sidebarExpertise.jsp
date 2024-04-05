<%--
Deprecated since directoty-8.1
--%><%
%><%@page import="com.jalios.jcmsplugin.esn.ESNManager"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf'%><%

if (!ESNManager.getInstance().canAccessExpertDirectory(loggedMember)) {
  return;
}

DirectoryAppHandler formHandler = (DirectoryAppHandler) request.getAttribute(DirectoryAppHandler.HANDLER_REQUEST_ATTR);
String nav = "competencies";
boolean isNavActive = Util.getString(getStringParameter("directoryApp_nav", null, /*regexp*/nav), "").equalsIgnoreCase(nav);
String directoryAppUrl = channel.getProperty("jcms.resource.include.directory.app", ServletUtil.getUrl(request));
String url = URLUtils.buildUrl(directoryAppUrl, Util.getHashMap("directoryApp_nav", new String[] { nav } ));
%>
<div class="app-sidebar-section app-directory-section-competencies">

  <div class="app-sidebar-section-title<%= isNavActive ? " active":"" %>">
    <a href="<%= url %>"<%= (!getBooleanParameter("printView", false) ? " data-jalios-action='ajax-refresh'" : "")%>>
      <jalios:icon src="jcmsplugin-directory-app-competencies" /> <%= glp("jcmsplugin.esn.directory.app.nav-competencies") %>
    </a>
  </div>
    
  <% if (isNavActive) { %> 
    <%@ include file='/plugins/DirectoryPlugin/jsp/app/doDirectoryApp_sidebarFilters.jspf' %>
  <% } %>
    
  <jalios:include target="DIRECTORY_APP_SIDEBAR_COMPETENCIES_FILTER" />

</div>
