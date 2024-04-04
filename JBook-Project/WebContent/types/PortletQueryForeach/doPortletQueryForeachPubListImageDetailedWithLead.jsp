<%@ include file="/jcore/doInitPage.jspf" %>
<%@ include file="/jcore/portal/doPortletParams.jspf" %>
<% 
  PortletQueryForeach box = (PortletQueryForeach) portlet; 
  String dateType = null;
  boolean showDate = true;

  if (box instanceof PortletQueryForeachDetail) {
    dateType = ((PortletQueryForeachDetail)box).getShowDate();  
    dateType = Util.notEmpty(dateType) ? dateType : "none";
  }
%>
<%@ include file="/types/PortletQueryForeach/doQuery.jspf" %>
<%@ include file="/types/PortletQueryForeach/doSort.jspf" %>
<% if (hideWhenNoResult && displayNoResult) {
  request.setAttribute("ShowPortalElement",Boolean.FALSE);
} else if (displayNoResult) {
  %><jalios:portletBoxNoResult /><%
} else { %>
  <jalios:buffer name="content">
    <%@ include file="/types/PortletQueryForeach/doForeachHeader.jspf" %>
      <%
        Date itemDate = null;
        if ("none".equalsIgnoreCase(dateType)) {
          showDate = false; 
        }
        else if (Util.notEmpty(dateType) && !"none".equalsIgnoreCase(dateType)) {
          itemDate = itPub.getDate(dateType);
          showDate = Util.isEmpty(itemDate) ? false : true;
        }    
      %>
    <% if (itPublicationCounter == 1) { %>
      <jalios:dataListItem linkParams="<%= displayUrlParamsMap %>" template="dataImageAbstract" data="<%= itPub %>" showDate="<%= showDate %>" dataDate="<%= itemDate %>">
        <jalios:buffer name="LIST_ITEM_IMAGE">
          <span class="itemlist-item-image">
            <% if (Util.notEmpty(itPub.getDataImage())) { %>
                <jalios:thumbnail css="is-object-fit" path="<%= itPub.getDataImage() %>" width="700" height="250" />
              <% } else { %>
                <jalios:thumbnail css="is-object-fit" path="images/jalios/layout/defaultDataListItemImage16x9.png"  width="700" height="250" />
              <% } %>
          </span>
        </jalios:buffer>
      </jalios:dataListItem>
    <% } else { %>
      <jalios:dataListItem linkParams="<%= displayUrlParamsMap %>" template="dataImageAbstract" data="<%= itPub %>" showDate="<%= showDate %>" dataDate="<%= itemDate %>"/>
    <% } %>
    <%@ include file="/types/PortletQueryForeach/doForeachFooter.jspf" %>
    <%@ include file="/types/PortletQueryForeach/doPager.jspf" %>
  </jalios:buffer>  
  <% if (seeMore) { %>
    <%= content %>
  <% } else { %>
    <jalios:list css="is-first-in-lead">
      <%= content %>
    </jalios:list>
  <% } %>
<% } %>