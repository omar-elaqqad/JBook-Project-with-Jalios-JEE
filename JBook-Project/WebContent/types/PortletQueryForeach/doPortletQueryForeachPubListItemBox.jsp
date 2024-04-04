<%@ include file="/jcore/doInitPage.jspf"                     %>
<%@ include file='/jcore/portal/doPortletParams.jspf'         %>
<% PortletQueryForeach box = (PortletQueryForeach) portlet;  %>
<%@ include file='/types/PortletQueryForeach/doQuery.jspf'    %>
<%@ include file='/types/PortletQueryForeach/doSort.jspf'     %>
<% if (hideWhenNoResult && displayNoResult) {
  request.setAttribute("ShowPortalElement",Boolean.FALSE);
} else if (displayNoResult) {
  %><jalios:portletBoxNoResult /><%
} else {
  String orderBy = box.getOrderBy();
  boolean showDate = true;
  String orderDate = orderBy;  
  if (box instanceof PortletQueryForeachDetail) {
    orderDate = ((PortletQueryForeachDetail)box).getShowDate();
    showDate = Util.notEmpty(orderDate);
  }
  %>
  <div class="portlet-query-foreach-dashboard">
  <ul class="item-box">
  <%@ include file='/types/PortletQueryForeach/doForeachHeader.jspf' %>
  <li class="item">
  <%@ include file="/types/PortletQueryForeach/doItemBoxDate.jspf" %>
  <div class="item-icons-large">
  <jalios:edit data="<%= itPub %>" popup="true"/>
  </div>
  <% if (itPub instanceof FileDocument) { %>
  <jalios:link data='<%= itPub %>' params='<%= displayURLparams + "&amp;details=true" %>'><jalios:fileicon doc='<%= (FileDocument)itPub %>' /></jalios:link>
  <% } else { %>
  <jalios:dataicon data="<%= itPub %>" />
  <% }  %>
  <jalios:link data="<%= itPub %>" params="<%= displayURLparams %>"/>
  </li>
  <%@ include file="/types/PortletQueryForeach/doForeachFooter.jspf" %>
  </ul>
  </div>
  
  <%@ include file="/types/PortletQueryForeach/doPager.jspf" %>
<% } %>