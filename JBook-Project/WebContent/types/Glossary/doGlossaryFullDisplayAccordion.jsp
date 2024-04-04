<%--
  @Summary: Glossary display template
  @Category: Core Type / Glossary
  @Deprecated: False
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ page import="com.jalios.jcms.recommendation.RecommendationManager" %><%!

/**
 *  Returns the unaccentuated, upperCase, first character of given title.
 **/
public static int getFirstCodePoint(String title) {
  if (Util.isEmpty(title)) {
    return -1;
  }
  int firstCodePoint = Util.unaccentuate(title).codePointAt(0);
  int upperFirstCodePoint = Character.toUpperCase(firstCodePoint);
  return upperFirstCodePoint;
}
/**
 * Check if the specified codePoint is valid for the alpha index.
 */
public static boolean isValidForAlphaIndex(int codePoint) {
  return codePoint >= 'A' && codePoint <= 'Z';
}
%><%
jcmsContext.addCSSHeader("css/jalios/core/jalios-glossary-fulldisplay.css");
Glossary obj = (Glossary)request.getAttribute("publication");
boolean printView = (request.getAttribute("printView") != null) || (hasParameter("printView")); 
boolean canEdit = !printView && channel.isDataWriteEnabled() && jcmsContext.isEditIcon() && loggedMember.canPublish(GlossaryEntry.class, workspace);
String glossaryEntryAnchor = getStringParameter("glossaryEntryId","", "[a-zA-Z0-9-_]*");

boolean isActionForThisGlossary = Util.getString(obj.getId(), "").equals(getDataIdParameter("glossaryId"));
if (canEdit && isActionForThisGlossary) {
  request.setAttribute("redirect", obj.getDisplayUrl(userLocale)); // TODO OD generalize
  return;
}

boolean isPreview = getBooleanParameter("preview", false);
DataSelector authorizedSelector = new Publication.AuthorizedSelector(loggedMember);
DataSelector selector = isPreview ? authorizedSelector : new AndDataSelector(authorizedSelector, new Publication.VisibleStateSelector());
boolean entriesFirstLetterEnabled = channel.getBooleanProperty("jcms.glossary-entries.first-letter.enabled", true) && obj.getDisplayFirstLetter();
%><%! 
%>
<jalios:query name="entrySet" 
              dataset="<%= obj.getLinkIndexedDataSet(GlossaryEntry.class) %>" 
              comparator="<%= Publication.getTitleComparator(userLang) %>" 
              selector="<%= selector %>"/> 

<%
SortedSet<Character> alphaIndex = new TreeSet<Character>();
for (GlossaryEntry entry : ((Set<GlossaryEntry>) entrySet)) {
  int firstCodePoint = getFirstCodePoint(entry.getTitle(userLang));
  if (Character.isValidCodePoint(firstCodePoint) && isValidForAlphaIndex(firstCodePoint)) {
    alphaIndex.add(Character.toChars(firstCodePoint)[0]);
  }
}
%>
<div  id="glossary-fulldisplay-<%= obj.getId() %>" class="fullDisplay glossary" itemscope="itemscope">
  <div class="publication-header">
    <h1 class="publication-title" itemprop="name"><%= obj.getTitle(userLang) %></h1>
    <% Publication pub = obj;%>
  </div>
  
  <% if (Util.notEmpty(obj.getDescription())) { %>
    <div class="description abstract">
      <jalios:wiki data="<%= obj %>" field="description"><%= obj.getDescription(userLang) %></jalios:wiki>
    </div>
  <% } %>
  
  <%-- *** ENTRIES ******************************************************** --%>
  <% 
  int prevCodePoint = ' ';
  boolean isNewChar = false;
  boolean isBeforeLatinSequence = false;
  boolean isPastLatinSequence = false;
  boolean isBufferEmpty = true;
  String entriesContent = "";
  String newCharTitle = "";
  boolean activeAccordionParent = false;
  boolean activeAccordion = false;
  %> 
  <jalios:foreach name="itEntry" type="GlossaryEntry" collection="<%= entrySet %>">
    <%
    int currCodePoint = getFirstCodePoint(itEntry.getTitle(userLang));
    char[] currChar = Character.toChars(currCodePoint);
    if (currCodePoint != prevCodePoint) {
      isNewChar = true;
      prevCodePoint = currCodePoint;
    } else {
      isNewChar = false;
    }
    if (currCodePoint < 'A') {
      isNewChar = !isBeforeLatinSequence;
      isBeforeLatinSequence = true;
    } else {
      isBeforeLatinSequence = false;
    }
    if (currCodePoint > 'Z') {
      isNewChar = !isPastLatinSequence;
      isPastLatinSequence = true;
    } else {
      isPastLatinSequence = false;      
    }
    %>
    <% if (isNewChar) { %> 
      <% if (!isBufferEmpty) { %>
        <% if (entriesFirstLetterEnabled) { %>
          <jalios:accordion css="entry-section">
            <% 
              String panelId = ServletUtil.generateUniqueDOMId(request, null);
            %>
            <jalios:accordion-panel active='<%= activeAccordionParent %>'>
              <jalios:buffer name="PANEL_HEADING">
                <div class='panel-actions collapse-action<%= activeAccordionParent ? " dropup" : "" %>'><jalios:icon css="accordion-collapse" src="chevron-up" /><jalios:icon css="accordion-expand" src="chevron-down" /></div>
                <div class="panel-title">
                  <a href="#<%= panelId %>" onclick="return false;">
                    <%= newCharTitle %>
                  </a>
                </div>
              </jalios:buffer>
              <%= entriesContent %>
            </jalios:accordion-panel>
          </jalios:accordion>
        <% } else { %>
          <div class="entry-no-section">
            <%= entriesContent %>
          </div>
        <% } %>
        <%
          entriesContent = "";
          isBufferEmpty = true;
          newCharTitle = "";
          activeAccordionParent = false;
        %>
      <% } %>
      <% if (isValidForAlphaIndex(currCodePoint)) { %><%-- Do not print character such as '#' for example --%> 
        <a id="<%= currChar %>" class="anchor"></a>
      <% } %>
      <% if (isBeforeLatinSequence) { %>
        <a id="glossary-section-symbols" class="anchor"></a>
        <% newCharTitle = glp("ui.glossary.section.symbols"); %>
      <% } else if (isPastLatinSequence) { %>
        <a id="glossary-section-others" class="anchor"></a>
        <% newCharTitle = glp("ui.glossary.section.others"); %>
      <% } else { %>
        <% newCharTitle = new String(currChar); %>
      <% } %>
    <% } %>
    
    <jalios:buffer name="entryContent">
      <%
        activeAccordionParent = activeAccordionParent || itEntry.getId().equals(glossaryEntryAnchor) ? true : false;
        activeAccordion = itEntry.getId().equals(glossaryEntryAnchor) ? true : false;
      %>
      <jalios:accordion>
        <jalios:accordion-panel css="entry-panel" active='<%= activeAccordion %>'>
          <jalios:buffer name="PANEL_HEADING">
            <div class='panel-actions collapse-action<%= activeAccordion ? " dropup" : "" %>'><jalios:icon css="accordion-collapse" src="chevron-up" /><jalios:icon css="accordion-expand" src="chevron-down" /></div>
            <div class="panel-title glossary-entry-title">
              <a href="<%= itEntry.getDisplayUrl(userLocale) %>" onclick="return false;">
                <%= itEntry.getTitle(userLang) %>
              </a>
            </div>
            <% request.setAttribute("glossary-entry", itEntry); %>
            <jalios:include jsp="front/publication/doGlossaryEntryActions.jsp" />
            <% request.removeAttribute("glossary-entry"); %>
          </jalios:buffer>
          <div class='entry glossary-entry <%= itEntry.isInVisibleState() ? "pub-state" : "work-state" %>'>
            <a class="anchor" id="<%= itEntry.getId() %>"></a>
            <%-- DEFINITION ------------------------------------------------------------ --%> 
            <div class="definition">
              <jalios:wiki data="<%= itEntry %>" field="definition"><%= itEntry.getDefinition(userLang) %></jalios:wiki>
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
                <% int translateCount = 0; %>
                <jalios:foreach counter="c2" collection="<%= channel.getLanguageList() %>" name="itLang" type="String">
                  <% if (!itLang.equals(userLang) && Util.notEmpty(itEntry.getTitle(itLang, false))) { %>
                    <% translateCount++; %>
                    <%= translateCount > 1 ? "&middot; " : "" %> <jalios:lang lang="<%= itLang %>"/> <%= itEntry.getTitle(itLang, false) %> 
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
        </jalios:accordion-panel>
      </jalios:accordion>
      <% isBufferEmpty = false; %>
    </jalios:buffer>
    <% entriesContent += entryContent; %>  
  </jalios:foreach>
  <% if (!isBufferEmpty) { %>
    <% if (entriesFirstLetterEnabled) { %>
      <jalios:accordion css="entry-section">
        <% 
          String panelId = ServletUtil.generateUniqueDOMId(request, null);
        %>
        <jalios:accordion-panel active='<%= activeAccordionParent %>'>
          <jalios:buffer name="PANEL_HEADING">
            <div class='panel-actions collapse-action<%= activeAccordionParent ? " dropup" : "" %>'><jalios:icon css="accordion-collapse" src="chevron-up" /><jalios:icon css="accordion-expand" src="chevron-down" /></div>
            <div class="panel-title">
              <a href="#<%= panelId %>" onclick="return false;">
                <%= newCharTitle %>
              </a>
            </div>
          </jalios:buffer>
          <%= entriesContent %>
        </jalios:accordion-panel>
      </jalios:accordion>
    <% } else { %>
      <div class="entry-no-section">
        <%= entriesContent %>
      </div>
    <% } %>
    <%
      entriesContent = "";
      isBufferEmpty = true;
      newCharTitle = "";
      activeAccordionParent = false;
    %>
  <% } %>
  <% if (canEdit) { %>
    <div class='newEntry editArea <%= jcmsContext.showEditIcon() ? "" : "hidden" %>'>
      <a class="modal btn btn-default" onclick="return false" href="types/GlossaryEntry/editGlossaryEntryModal.jsp?glossary=<%= obj.getId() %>" title='<%= encodeForHTMLAttribute(glp("ui.com.alt.edit")) %>'>
        <jalios:icon src="add" alt="+" /> <%= glp("ui.glossary.lbl.add-entry") %>
      </a>
    </div>
  <% } %>
</div>