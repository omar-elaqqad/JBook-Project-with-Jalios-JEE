<%@page import="com.jalios.jcms.slick.SlickManager"%><% 
%><%@page import="com.jalios.jcms.slick.SlickConfiguration"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%

PortletQueryForeach box = (PortletQueryForeach) portlet;
if (box instanceof PortletQueryForeachDetail) {
  request.setAttribute("showTitle", request.getAttribute("pqf-carousel-show-title"));
  request.setAttribute("showAuthor", request.getAttribute("pqf-carousel-show-author"));
  request.setAttribute("showDate", request.getAttribute("pqf-carousel-show-date"));
}
%>
<%@ include file='doQuery.jspf' %>
<%@ include file='doSort.jspf' %>
<% 
  List<Publication> publications = new ArrayList<Publication>();
  List<Map<String, String[]>> displayUrlParamsMapList = new ArrayList<Map<String, String[]>>();
%>
<%@ include file="/types/PortletQueryForeach/doForeachHeader.jspf" %><% 
  publications.add(itPub);
  displayUrlParamsMapList.add(displayUrlParamsMap);
%><%@ include file="/types/PortletQueryForeach/doForeachFooter.jspf" %>
<%
  request.setAttribute("displayUrlParamsMapList", displayUrlParamsMapList);  
%>
<jalios:dataCarousel collection="<%= publications %>"/>
<% request.removeAttribute("displayUrlParamsMapList"); %>
<% if ("Link".equals(box.getShowPager())) { %>
  <%-- Only show pager in "Link" mode --%>
  <%@ include file="/types/PortletQueryForeach/doPager.jspf" %>
<% } %><%
if (box instanceof PortletQueryForeachDetail) {
  request.removeAttribute("showTitle");
  request.removeAttribute("showAuthor");
  request.removeAttribute("showDate");
}
%>