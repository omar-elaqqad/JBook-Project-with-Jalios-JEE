<%@page import="com.jalios.jcmsplugin.esn.ESNManager"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf'%><%
if (!ESNManager.getInstance().canAccessExpertDirectory(loggedMember)) {
  return;
}
String nav = "competencies";
boolean isNavActive = Util.getString(getStringParameter("directoryApp_nav", null, /*regexp*/nav), "").equalsIgnoreCase(nav);
String directoryAppUrl = channel.getProperty("jcms.resource.include.directory.app", ServletUtil.getUrl(request));
String url = URLUtils.buildUrl(directoryAppUrl,
    Util.getHashMap("directoryApp_nav", new String[] { nav } ));
String linkCss = isNavActive ? "active is-checked" : "";
%><li class="<%= linkCss %>" onclick="return false;"><%
  %><a href="<%= url %>" data-jalios-action="ajax-refresh" role="button" onclick="return false;"><%
      %><%= glp("jcmsplugin.esn.directory.app.nav-competencies") %><%
    %></a><%
%></li><%
%>