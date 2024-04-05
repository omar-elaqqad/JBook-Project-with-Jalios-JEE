<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<%@ include file='/jcore/doHeader.jspf' %>
<%@ include file='/jcore/portal/doPortletParams.jspf' %>
<%@ page import="com.jalios.jcmsplugin.esn.*" %>
<%@ include file='/plugins/ESNPlugin/jsp/doExpertDirectoryQuery.jspf' %>
<%

if (!ESNManager.getInstance().canAccessExpertDirectory(loggedMember)) {
  sendForbidden(request,response);
  return;
}

jcmsContext.addCSSHeader("plugins/ESNPlugin/css/expert-directory.css");

String csvUrl = "plugins/ESNPlugin/jsp/exportCSVExpertDirectory.jsp?" + ServletUtil.getQueryString(request, true);
request.setAttribute("doMemberList.csv-url", csvUrl);

// Title of the page
request.setAttribute("title", glp("jcmsplugin.esn.expert-dir.title"));  
%>
<div class="esn esn-directory-container ajax-refresh-div" data-jalios-ajax-refresh-url="plugins/ESNPlugin/jsp/expertDirectory.jsp">
  
  <h1><a href='<%= ServletUtil.getContextPath(request) %>/plugins/ESNPlugin/jsp/expertDirectory.jsp'><%= glp("jcmsplugin.esn.expert-dir.title") %></a></h1>

  <div id="expert-directory">

    <div class="expert-directory-header">
      <%@ include file='/plugins/ESNPlugin/jsp/doExpertDirectoryNavbar.jspf' %>
    </div>

    <div class="row clearfix">
      <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3 esn-column">
        <%-- Navigation --%>
        <div class="navigation">
          <%@ include file='/plugins/ESNPlugin/jsp/doExpertDirectoryNavigation.jspf' %>
        </div>
      </div>
      <div class="col-xs-12 col-sm-6 col-md-8 col-lg-9 esn-column">
        <%-- Content --%>
        <div class="content">
          <%@ include file='/plugins/ESNPlugin/jsp/doExpertDirectoryResults.jspf' %>
        </div>
      </div>
    </div>
  </div>

  <div id="expert-directory-suggestions" class="autocomplete"></div>
</div>