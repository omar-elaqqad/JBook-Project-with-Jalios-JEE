<%@page import="com.jalios.jcms.taglib.card.CardsDisplayMode"%>
<%@ include file="/jcore/doInitPage.jspf" %>
<%@ include file="/jcore/portal/doPortletParams.jspf" %>

<% PortletQueryForeachDetail box = (PortletQueryForeachDetail) portlet;  %>
<% 
jcmsContext.addCSSHeader("css/jalios/ux/jalios-pqf.css"); 
WebAssetsUtils.addWebAssets(jcmsContext, "jalios-lightbox");
%>
<%@ include file="../PortletQueryForeach/doQuery.jspf" %>
<%@ include file="../PortletQueryForeach/doSort.jspf" %>
<% if (hideWhenNoResult && displayNoResult) {
  request.setAttribute("ShowPortalElement",Boolean.FALSE);
} else if (displayNoResult) {
  %><jalios:portletBoxNoResult /><%
} else { %>
  <jalios:cards mode="<%= CardsDisplayMode.DECK %>" css="lightbox-img-gallery card-count-5">
   <%@ include file="../PortletQueryForeach/doForeachHeader.jspf" %>
    <a href="<%= itPub.getDataImage() %>" class="lightbox-img card-link" onclick="return false;">
    	<jalios:card css="is-same-image-height">
    		  <jalios:cardImage src='<%= itPub.getDataImage() %>' alt="<%= itPub.getTitle() %>" />
         <% if (box.getShowAbstract() && (Util.notEmpty(itPub.getAbstractAsText(userLocale)))) { %>
    		  <jalios:cardBlock css="jalios-card-body">
            <% if (box.getShowTitle()) { %>
    		      <div class="card-title jportal-component-label"><%= itPub.getTitle() %></div>
    		    <% } %>
    		    <div class="card-description"><%= encodeForHTML(itPub.getAbstractAsText(userLocale)) %></div>
    		  </jalios:cardBlock>
    	  <% } else if (box.getShowTitle() && Util.notEmpty(box.getShowTitle())){ %>
           <jalios:cardBlock css="jalios-card-body">
    	       <div class="card-title jportal-component-label"><%= itPub.getTitle() %></div>
           </jalios:cardBlock>		  
    	  <% } %>
    	</jalios:card>
    </a>
    
    <%@ include file="../PortletQueryForeach/doForeachFooter.jspf" %>
    <% if (!"ShowMore".equals(box.getShowPager())) { %>
  	  <%@ include file="../PortletQueryForeach/doPager.jspf" %>
  	<% } %>
  </jalios:cards>
<% } %>
