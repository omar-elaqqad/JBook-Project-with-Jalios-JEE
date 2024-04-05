<%@ include file='/plugins/SmartPhonePlugin/jsp/common/header.jspf' %>
<%
  Article pub = (Article) getPublicationParameter("id");
%>
<%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubCommon.jspf' %>
<div id="pub-default" data-role="page" class="pub-page pub-default">
  <%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubTopbarMenu.jspf' %>
  <div data-role="content" class="pub-content">
    <div class="card card-publication">
      <%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubHeader.jspf' %>
      <%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubMeta.jspf' %>
      <%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubLock.jspf' %>
      <% String content = pub.getContent(userLang); %>
      <% String intro = pub.getIntro(userLang); %>

      <% if (Util.notEmpty(content)) { %>
      <div class="card-item pub-body">
        <jalios:include target="SMARTPHONE_PUB_BODY_TOP" />  
        <div class="intro">
            <jalios:wysiwyg><%= intro %></jalios:wysiwyg>
        </div>
        <div class="zoomable-images">
          <jalios:wysiwyg><%= content %></jalios:wysiwyg>
        </div>
        <jalios:include target="SMARTPHONE_PUB_BODY_BOTTOM" />
      </div><%-- EOF .pub-body --%>
      <% } %>
      <jalios:include jsp='/plugins/SmartPhonePlugin/jsp/core/pub/doPubFooter.jsp' />
    </div><%-- EOF .pub --%>
    <jalios:include target="SMARTPHONE_PUB_FOOTER" />
  </div><%-- EOF .content --%>
</div><%-- EOF #pub-default --%>
<%@ include file='/plugins/SmartPhonePlugin/jsp/common/footer.jspf' %>