<%@ include file='/plugins/SmartPhonePlugin/jsp/common/header.jspf' %>
<% Publication pub = getPublicationParameter("id"); %>
<%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubCommon.jspf' %>
<div id="pub-default" data-role="page" class="pub-page pub-default">
  <%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubTopbarMenu.jspf' %>
  <div data-role="content" class="pub-content">
    <div class="card card-publication">
      <%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubHeader.jspf' %>
      <%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubMeta.jspf' %>
      <%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubLock.jspf' %>
      <%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubDataImage.jspf' %>
      <% if (Util.notEmpty(pub.getAbstract())) { %>
      <div class="card-item pub-body">
        <jalios:include target="SMARTPHONE_PUB_BODY_TOP" />
        <jalios:wiki css="wiki zoomable-images" attributeMap="<%= smartPhoneManager.getWikiAttributeMap() %>"><%= pub.getAbstract() %></jalios:wiki>
        <jalios:include target="SMARTPHONE_PUB_BODY_BOTTOM" />
      </div><%-- EOF .pub-body --%>
      <% } %>
      <jalios:include jsp='/plugins/SmartPhonePlugin/jsp/core/pub/doPubFooter.jsp' />
    </div><%-- EOF .pub --%>
    <jalios:include target="SMARTPHONE_PUB_FOOTER" />
  </div><%-- EOF .content --%>
</div><%-- EOF #pub-default --%>
<%@ include file='/plugins/SmartPhonePlugin/jsp/common/footer.jspf' %>