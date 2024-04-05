<%@ include file='/plugins/SmartPhonePlugin/jsp/common/header.jspf' %><%
  Publication pub = getPublicationParameter("id");
  Glossary glossary = (Glossary) getDataParameter("id");
  
  DataSelector authorizedSelector = new Publication.AuthorizedSelector(loggedMember);
  DataSelector selector = new AndDataSelector(authorizedSelector, new Publication.VisibleStateSelector());
  SortedSet alphaIndex = new TreeSet();
  int letterIndex = 0;
  
  request.setAttribute("jcms.plugin.smartphone.allow-deletion", false);
%>
<%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubCommon.jspf' %>
<jalios:query name="entrySet" 
              dataset="<%= glossary.getLinkIndexedDataSet(GlossaryEntry.class) %>" 
              comparator="<%= Publication.getTitleComparator(userLang) %>" 
              selector="<%= selector %>"/> 
<% 
for(Iterator it = entrySet.iterator(); it.hasNext();) {
  GlossaryEntry entry = (GlossaryEntry)it.next();
  alphaIndex.add(Util.unaccentuate(entry.getTitle(userLang)).substring(0,1).toUpperCase());
}
%>
<div id="pub-glossary" data-role="page" class="pub-page pub-glossary">
  <smartphone:breadcrumb data='<%= glossary %>' />
  <%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubTopbarMenu.jspf' %>
  <div data-role="content" class="pub-content">
    <%-- *** ENTRIES ******************************************************** --%>
    <% 
    char prevLetter = ' '; 
    boolean isNewLetter = false;
    %> 
    <jalios:foreach name="itEntry" type="GlossaryEntry" collection="<%= entrySet %>">
      <% 
      char currLetter = Character.toUpperCase(Util.unaccentuate(itEntry.getTitle(userLang)).charAt(0));
      if (currLetter != prevLetter) {
        isNewLetter = true;
        prevLetter = currLetter;
      } else {
        isNewLetter = false;
      }
      %>
      <% if (isNewLetter) { %> 
        <a id="<%= currLetter %>" class="anchor"></a>
        <div class="well well-sm"><%= currLetter %></div>
      <% }   %> 
      
        <div class="br entry <%= itEntry.isInVisibleState() ? "pub-state" : "work-state" %>">
        <a id="<%= itEntry.getId() %>"></a>
        <%-- TERM ------------------------------------------------------------ --%> 
        <div class="term">
          <h3>
            <%= itEntry.getTitle(userLang) %>
          </h3>
        </div>
        
        <%-- DEFINITION ------------------------------------------------------------ --%> 
        <div class="definition">
          <jalios:wiki css="wiki zoomable-images" attributeMap="<%= smartPhoneManager.getWikiAttributeMap() %>" data="<%= itEntry %>" field="definition"><%= itEntry.getDefinition(userLang) %></jalios:wiki>
        </div>
        
        <%-- SEE ALSO ------------------------------------------------------------ --%> 
        <% if (Util.notEmpty(itEntry.getSeeAlso())) { %>
          <div class="seealso">
            <span class="glossary-label"><%= glp("ui.glossary.txt.see-also") %></span>
            <jalios:foreach counter="c2" array="<%= itEntry.getSeeAlso() %>" name="itRelated" type="GlossaryEntry">
              <span class="glossary-value"><%= c2.intValue() > 1 ? "&middot; " : "" %><jalios:link data="<%= itRelated %>" /></span>
            </jalios:foreach>
          </div>
        <% } %>
        
        <%-- MULTILINGUAL TERM ------------------------------------------------------------ --%> 
        <% if (channel.isMultilingual()) { %>
          <jalios:buffer name="translationLine">
            <jalios:foreach counter="c2" collection="<%= channel.getLanguageList() %>" name="itLang" type="String">
              <% if (!itLang.equals(userLang) && Util.notEmpty(itEntry.getTitle(itLang, false))) { %>
                <jalios:lang lang="<%= itLang %>"/> <%= itEntry.getTitle(itLang, false) %> &middot; 
              <% } %>
            </jalios:foreach>
          </jalios:buffer>
          
          <% if (Util.notEmpty(translationLine)) { %>
            <div class="translation">
              <span class="glossary-label"><%= glp("ui.glossary.txt.trans") %></span>
              <span class="glossary-value"><%= translationLine %></span>
            </div>
          <% } %>
        <% } %>
      </div>
    </jalios:foreach>
  <jalios:include target="SMARTPHONE_PUB_FOOTER" />
  </div><%-- EOF .pub-content --%>
</div><%-- EOF #pub-glossary --%>
<%@ include file='/plugins/SmartPhonePlugin/jsp/common/footer.jspf' %>