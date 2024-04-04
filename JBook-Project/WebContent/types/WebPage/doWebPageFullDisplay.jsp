<%@ page import="com.jalios.jcms.handler.QueryHandler" %><%
%><%@ include file="/jcore/doInitPage.jspf" %>
<%@ include file="/front/doFullDisplay.jspf" %><%
  WebPage webpage = (WebPage)request.getAttribute(PortalManager.PORTAL_PUBLICATION);
  String linkAttr = webpage.getUrl().startsWith(channel.getUrl()) ? "":" rel='noreferrer' target='_blank'";
  
  QueryHandler qh = new QueryHandler();
  qh.setTypes(new String[] { "generated.WebPage", "generated.DBWebPage" });
  qh.setSearchInDB(true);
  qh.setSort("pdate");
  qh.setLoggedMember(loggedMember);
  Collection pubRelatedCollection = QueryManager.getInstance().getRelatedPublicationSet(webpage, loggedMember, WebPage.class);
  int pubRelatedMax = 4;
%>
<div class="fullDisplay WebPage" itemscope="itemscope">
  <div class="publication-header">
    <h1 class="publication-title" <%= gfla(webpage, "title") %>><%= webpage.getTitle(userLang) %></h1>
  </div>

  <% Publication pub = webpage; boolean displayCategory = true;%>

  <div class="media-flex wrap">
    <% if (Util.notEmpty(webpage.getDataImage())) { %>
     <div class="abstract-webpage-img media-left">
       <a href="<%= webpage.getUrl() %>" title="<%= encodeForHTMLAttribute(webpage.getTitle(userLang)) %>" <%= linkAttr %>>
         <jalios:thumbnail path="<%= webpage.getDataImage() %>" width="400" height="300" css="webpage-thumbnail" />
       </a>
     </div>
    <% } %>
    <div class="webpage-body">
    
      <div class="webpage-url">
        <a href="<%= webpage.getUrl() %>" title="<%= encodeForHTMLAttribute(webpage.getTitle(userLang)) %>" <%= linkAttr %>>
          <jalios:dataicon data="<%= webpage %>" />
          <%
           try {
             URL webpageURL = new URL(webpage.getUrl());
             %><%= webpageURL.getHost() %><% 
           } catch (MalformedURLException ex) {
             %><%= encodeForHTML(webpage.getUrl()) %><%
           }
          %>
        </a>
      </div>
      
      <%@ include file="/front/publication/doPublicationMeta.jspf" %>
      
      <% if (Util.notEmpty(webpage.getDescription(userLang))) { %>
      <div class="webpage-description">
        <jalios:wiki data="<%= webpage %>" field="description"><%= webpage.getDescription(userLang) %></jalios:wiki>
      </div>
      <% } %>
      <div class="webpage-link">
        <a class="btn btn-default hidden-print" href="<%= webpage.getUrl() %>" <%= linkAttr %>><%= glp("ui.webpage.dpl.read-more") %></a>
        <jalios:include target="WEBPAGE_FULLDISPLAY_MAIN_ACTIONS" />
      </div>
    </div>
  </div><%-- EOF .media --%>
  
  <%@ include file="/front/publication/doPublicationRelated.jspf" %>
</div><%-- EOF .WebPage --%>