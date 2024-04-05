<%@ include file='/plugins/SmartPhonePlugin/jsp/common/header.jspf' %><%
%><%@ page import='com.jalios.jcms.recommendation.*' %><%
%><%
Recommendation reco = (Recommendation) channel.getData(getDataIdParameter("id"));
if (!RecommendationManager.getInstance().canBeReadBy(reco, loggedMember)) {
  sendRedirect("plugins/SmartPhonePlugin/jsp/core/forbidden.jsp");
  return;
}
%>
<div data-role="page" id="recommendation-detail">
  <div data-role="content">
  <div class="alert-full level-<%= reco.getLevel() %>">
    <div class="alert-header media">
      <div class="clickable pull-left" data-jalios-link="<%= "plugins/SmartPhonePlugin/jsp/core/data.jsp?id=" + reco.getData().getId() %>">
        <jalios:memberphoto css="img-polaroid member-header-photo" resource="memberphoto-phone" member="<%= reco.getAuthor() %>" size="<%= PhotoSize.SMALL %>" />
      </div>
      <div class="alert-meta media-body br">
        <div>
          <div><%= reco.getAuthor() %></div>
          <div class="text-info"><%= JcmsUtil.getFriendlyDate(reco.getCdate(), DateFormat.SHORT, true, userLocale) %></div>
        </div>
      </div>
    </div>
    <% if (Util.notEmpty(reco.getMessage())){ %>
      <div class="alert-description"><jalios:wiki attributeMap="<%= smartPhoneManager.getWikiAttributeMap() %>"><%= reco.getMessage() %></jalios:wiki></div>
    <% } %>
    <div class="well nobr well-sm">
        <h2><%= ((Publication)reco.getData()).getTitle(userLang,true) %></h2>
        <% if (Util.notEmpty(((Publication)reco.getData()).getAbstract())) { %>
        <jalios:wiki attributeMap="<%= smartPhoneManager.getWikiAttributeMap() %>" truncateLength="400" truncateSuffix=" ..."><%= ((Publication)reco.getData()).getAbstract() %></jalios:wiki>
        <% } %>
    </div>    
    </div>
      <% if (reco.getData() != null && (reco.getData() instanceof Publication)) { %>
      <a data-role="button" data-theme="f" href="<%= smartPhoneManager.getDataUrl(reco.getData())%>"><%= glp("jcmsplugin.smartphone.lbl.recommendation.see-publication") %></a>
      <% } %>    
  </div><%-- EOF .reco  --%>
</div><!-- /page -->
<%@ include file='/plugins/SmartPhonePlugin/jsp/common/footer.jspf' %>