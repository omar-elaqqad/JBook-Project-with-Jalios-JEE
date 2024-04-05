<%@ include file='/plugins/SmartPhonePlugin/jsp/common/header.jspf' %>
<%@ page import='com.jalios.jcms.alert.*' %> 
<%
    Publication pub = getPublicationParameter("id");
    WebPage webPage = (WebPage) getPublicationParameter("id");
    String webPageHost = null;
    try {
      webPageHost = new URL(webPage.getUrl()).getHost(); 
    } catch (MalformedURLException ex) {
      webPageHost = encodeForHTML(webPage.getUrl());
    }
%>
<%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubCommon.jspf' %>
<div id="pub-webpage" data-role="page" class="pub-page pub-webpage">
  <%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubTopbarMenu.jspf' %>
  <div data-role="content" class="pub-content">
    <jalios:if predicate='<%= Util.notEmpty(webPage.getDataImage()) %>'>
      <div class="pub-dataimage">
         <a href="<%= webPage.getUrl() %>" rel="external" target="_blank">
           <jalios:thumbnail css="thumbnail center-block" data="<%= webPage %>" width='300' height='300'><jalios:icon src="image" /></jalios:thumbnail>
         </a>
      </div>
    </jalios:if>  
    <div class="card card-publication">
      <%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubHeader.jspf' %>
      <%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubMeta.jspf' %>
      <%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubLock.jspf' %>
      <div class="card-item pub-body">
        <jalios:include target="SMARTPHONE_PUB_BODY_TOP" />
        <jalios:wiki css="wiki zoomable-images" attributeMap="<%= smartPhoneManager.getWikiAttributeMap() %>"><%= webPage.getDescription(userLang) %></jalios:wiki>
        <jalios:include target="SMARTPHONE_PUB_BODY_BOTTOM" />
      </div><%-- EOF .pub-body --%>
      
      <div class="card-item card-item-webpage-url">
        <a data-ajax="false" target="_blank" rel="external" href="<%= encodeForHTMLAttribute(webPage.getUrl()) %>"><%= webPage.getDataIconHtml(userLang) %> <%= webPageHost %></a>
      </div>
      
      <div class="card-item">
        <a class="ui-btn btn btn-default" target="_blank" href="<%= webPage.getUrl() %>" rel="external"><%= glp("ui.webpage.dpl.read-more") %></a>
      </div>
      
      <jalios:include target="SMARTPHONE_RELATED_WEBPAGES" />
      
      <jalios:include jsp='/plugins/SmartPhonePlugin/jsp/core/pub/doPubFooter.jsp' />
    </div><%-- EOF .pub --%>
    <jalios:include target="SMARTPHONE_PUB_FOOTER" />
  </div><%-- EOF .content --%>
</div><%-- EOF #pub --%>
<%@ include file='/plugins/SmartPhonePlugin/jsp/common/footer.jspf' %>