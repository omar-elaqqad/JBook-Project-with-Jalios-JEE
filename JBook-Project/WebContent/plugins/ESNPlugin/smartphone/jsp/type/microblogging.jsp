<%@ include file='/plugins/SmartPhonePlugin/jsp/common/header.jspf' %>
<%@ page import='com.jalios.jcms.alert.*' %> 
<%
  Publication pub = getPublicationParameter("id");
  MicroBlogging microBlogging = (MicroBlogging) pub;
%>
<%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubCommon.jspf' %>
<div data-role="page" id="pub-microblogging" class="pub-page pub-microblogging">
  <%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubTopbarMenu.jspf' %>
  <div data-role="content" class="pub-content">
    <div class="card card-publication">
      <div class="card-item pub-body">
        <jalios:include target="SMARTPHONE_PUB_BODY_TOP" />
        <div class="pub-title media"><div class="media-left"><jalios:memberphoto member="<%= pub.getAuthor() %>" link="false" size="<%= PhotoSize.TINY %>"/></div> <div class="media-body media-middle"><strong><%= pub.getAuthor() %></strong></div></div>
        <div class="message-content pub-abstract">
          <span class="tail"></span>
          <span class="tail-border"></span>
          <jalios:wiki css="wiki zoomable-images" attributeMap="<%= smartPhoneManager.getWikiAttributeMap() %>"><%= microBlogging.getText() %></jalios:wiki>
        </div>
        <jalios:include target="SMARTPHONE_PUB_BODY_BOTTOM" />
      </div><%-- EOF .pub-body --%>
      <div class="pub-meta card-item">
        <div class="text-info">
          <% if (pub.getPdate() != null) { %><span class="pub-meta-item"><%= JcmsUtil.getFriendlyDate(pub.getPdate(), DateFormat.SHORT, true, userLocale) %> &middot;</span><% } %>
          <span class="pub-meta-item"><%= pub.getWorkspace() %></span>
        </div>
        <% if (Util.notEmpty(pub.getCategories())) { %>
          <div class="pub-category">
            <jalios:icon src="category" title="ui.com.lbl.categories" />
            <% for (Category cat : pub.getCategories()) { %>
              <span class="meta-category" <%= Util.notEmpty(cat.getColor()) ? "style='background-color:"+ cat.getColor() +"'" : "" %>><%= cat.getName(userLang) %></span>
            <% } %>
          </div>
        <% } %>
      </div>
      <jalios:include jsp='/plugins/SmartPhonePlugin/jsp/core/pub/doPubFooter.jsp' />
    </div>
    <jalios:include target="SMARTPHONE_PUB_FOOTER" />
  </div><%-- EOF content --%>
</div><%-- EOF #pub-microblogging --%>
<%@ include file='/plugins/SmartPhonePlugin/jsp/common/footer.jspf' %>