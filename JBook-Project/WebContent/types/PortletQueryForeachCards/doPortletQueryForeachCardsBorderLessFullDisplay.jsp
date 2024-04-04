<%@page import="com.jalios.jcms.taglib.card.CardsDisplayMode"%>
<%@ include file="/jcore/doInitPage.jspf" %>
<%@ include file="/jcore/portal/doPortletParams.jspf" %>
<% PortletQueryForeachCards box = (PortletQueryForeachCards) portlet;  %>
<%
jcmsContext.addCSSHeader("css/jalios/core/components/card/jalios-card-layout-deck.css");
jcmsContext.addCSSHeader("css/jalios/core/components/card/jalios-card-borderless.css");

%>
<%@ include file="/types/PortletQueryForeach/doQuery.jspf" %>
<%@ include file="/types/PortletQueryForeach/doSort.jspf" %><%
if (box.getHideWhenNoResults() && displayNoResult) {
  request.setAttribute("ShowPortalElement",Boolean.FALSE);
} else if (displayNoResult) { %>
  <jalios:portletBoxNoResult />
<% } else { %>
  <% 
  String cardCss = box.getCardCssClass() + " is-borderless";
  Publication displayedPub = null; 
  %>
  <div class="card-count-<%= box.getFieldValue(jcmsContext, "cardsPerLine") %> card-responsive-layout card-borderless">
  	<%@ include file="/types/PortletQueryForeach/doForeachHeader.jspf" %>
  		<jalios:cardData linkParams="<%= displayUrlParamsMap %>" data="<%= itPub %>" css="<%= cardCss %>" />
  	<%@ include file="/types/PortletQueryForeach/doForeachFooter.jspf" %>
  </div>
  <%
  request.setAttribute("doPortletQueryForeachFulls.publication", displayedPub); 
  %>
  <%@ include file="/types/PortletQueryForeach/doPager.jspf" %>
<% } %>
