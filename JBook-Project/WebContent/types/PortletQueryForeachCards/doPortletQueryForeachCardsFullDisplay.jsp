<%@page import="com.jalios.jcms.taglib.card.CardsDisplayMode"%>
<%@ include file="/jcore/doInitPage.jspf" %>
<%@ include file="/jcore/portal/doPortletParams.jspf" %>
<% PortletQueryForeachCards box = (PortletQueryForeachCards) portlet;  %>
<%
jcmsContext.addCSSHeader("css/jalios/core/components/card/jalios-card-layout-deck.css");
jcmsContext.addJavaScript("js/jalios/core/jalios-lightbox.js");
jcmsContext.addJavaScript("js/lib/simple-lightbox/simple-lightbox.js");
jcmsContext.addCSSHeader("css/lib/simple-lightbox/simplelightbox.css");
%>
<%@ include file="/types/PortletQueryForeach/doQuery.jspf" %>
<%@ include file="/types/PortletQueryForeach/doSort.jspf" %><%
if (box.getHideWhenNoResults() && displayNoResult) {
  request.setAttribute("ShowPortalElement",Boolean.FALSE);
} else if (displayNoResult) { %>
  <jalios:portletBoxNoResult />
<% } else { %>
  <% Publication displayedPub = null; %>
  <div class="card-count-<%= box.getFieldValue(jcmsContext, "cardsPerLine") %> card-responsive-layout">
  	<%@ include file="/types/PortletQueryForeach/doForeachHeader.jspf" %>
      <jalios:cardData linkParams="<%= displayUrlParamsMap %>" data="<%= itPub %>" css="<%= box.getCardCssClass() %>"/>
  	<%@ include file="/types/PortletQueryForeach/doForeachFooter.jspf" %>
  </div>
  <%
  request.setAttribute("doPortletQueryForeachFulls.publication", displayedPub); 
  %>
  <%@ include file="/types/PortletQueryForeach/doPager.jspf" %>
<% } %>
