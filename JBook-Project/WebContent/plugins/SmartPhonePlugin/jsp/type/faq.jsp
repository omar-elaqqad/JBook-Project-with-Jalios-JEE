<%@ include file='/plugins/SmartPhonePlugin/jsp/common/header.jspf' %>
<%@ page import='com.jalios.jcms.alert.*' %> 
<%
  Publication pub = getPublicationParameter("id");
  Faq faq = (Faq) getDataParameter("id");
  
  DataSelector authorizedSelector = new Publication.AuthorizedSelector(loggedMember);
  DataSelector selector = new AndDataSelector(authorizedSelector, new Publication.VisibleStateSelector());
  request.setAttribute("jcms.plugin.smartphone.allow-deletion", false);
%>
<%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubCommon.jspf' %>
<jalios:query name="entrySet"
              dataset="<%= faq.getLinkIndexedDataSet(FaqEntry.class) %>"
              comparator="<%=  new custom.CustomEditFaqEntryHandler.OrderComparator() %>"
              selector="<%= selector %>"/>
<div id="pub-faq" data-role="page" class="pub-page pub-faq">
  <%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubTopbarMenu.jspf' %>
  <div data-role="content" class="pub-content">
    <div class="card card-publication">
      <%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubHeader.jspf' %>
      <%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubLock.jspf' %>
      <div class="card-item pub-body">
        <jalios:include target="SMARTPHONE_PUB_BODY_TOP" />
    <% if (Util.notEmpty(entrySet)) { %>
      <ol>
      <jalios:foreach name="itEntry" type="FaqEntry" collection="<%= entrySet %>">
        <li>
          <a data-ajax="false" href="<%= ServletUtil.getUrl(request) %>#<%= itEntry.getId() %>"><% /* %>Question<% */ %><%= itEntry.getTitle(userLang) %></a>
        </li>
      </jalios:foreach>
      </ol>
    <% } %>        
      <%-- *** QUESTION / ANSWSER LIST ************************************* --%>
      <jalios:foreach name="itEntry" type="FaqEntry" collection="<%= entrySet %>">
        <a class="anchor" id="<%= itEntry.getId() %>"></a>
        <div class="entry">
          <div class="well well-sm">
            <b><%= itCounter %>. <%= itEntry.getTitle(userLang) %></b>
          </div>
          <div class="answer">
            <jalios:wiki css="wiki zoomable-images" attributeMap="<%= smartPhoneManager.getWikiAttributeMap() %>" data="<%= itEntry %>" field="answer"><%= itEntry.getAnswer(userLang) %></jalios:wiki>
          </div>
        </div>
      </jalios:foreach>
        <jalios:include target="SMARTPHONE_PUB_BODY_BOTTOM" />
      </div><%-- EOF .pub-body --%>
      <%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubMeta.jspf' %>
      <jalios:include jsp='/plugins/SmartPhonePlugin/jsp/core/pub/doPubFooter.jsp' />
    </div><%-- EOF .pub --%>
    <jalios:include target="SMARTPHONE_PUB_FOOTER" />
  </div><%-- EOF .content --%>
</div><%-- EOF #pub-default --%>
<%@ include file='/plugins/SmartPhonePlugin/jsp/common/footer.jspf' %>