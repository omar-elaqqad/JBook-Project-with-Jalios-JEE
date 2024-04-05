<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
List<BreadcrumbItem> breadcrumbItemList = (List<BreadcrumbItem>) request.getAttribute("blogpost.BreadbcrumbItemlist");
boolean showBreadcrumb = Util.notEmpty(breadcrumbItemList);
if (!showBreadcrumb) {
  return;
}
%><jalios:breadcrumb items="<%= breadcrumbItemList %>" css="blogpost-breadcrumb" /><%
%>