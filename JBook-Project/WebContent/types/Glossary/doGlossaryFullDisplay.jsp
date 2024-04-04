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

Glossary obj = (Glossary)request.getAttribute("publication");
boolean printView = (request.getAttribute("printView") != null) || (hasParameter("printView")); 
boolean canEdit = !printView && channel.isDataWriteEnabled() && jcmsContext.isEditIcon() && loggedMember.canPublish(GlossaryEntry.class, workspace);

%><jsp:useBean id="formHandler" scope="page" class="generated.EditGlossaryEntryHandler"><%
 %><jsp:setProperty name="formHandler" property="request" value="<%= request %>"/><%
 %><jsp:setProperty name="formHandler" property="response" value="<%= response %>"/><%
 %><jsp:setProperty name="formHandler" property="*" /><%
 %><jsp:setProperty name="formHandler" property="id" value="<%= null %>" /><%
 %><jsp:setProperty name="formHandler" property="glossary" value="<%= obj.getId() %>" /><%
%></jsp:useBean><% 

boolean isActionForThisGlossary = Util.getString(obj.getId(), "").equals(getDataIdParameter("glossaryId"));
if (canEdit && isActionForThisGlossary && formHandler.validate()) {
  request.setAttribute("redirect", obj.getDisplayUrl(userLocale)); // TODO OD generalize
  return;
}

boolean isPreview = getBooleanParameter("preview", false);
DataSelector authorizedSelector = new Publication.AuthorizedSelector(loggedMember);
DataSelector selector = isPreview ? authorizedSelector : new AndDataSelector(authorizedSelector, new Publication.VisibleStateSelector());
%><%! 
%>
<jalios:query name="entrySet" 
              dataset="<%= obj.getLinkIndexedDataSet(GlossaryEntry.class) %>" 
              comparator="<%= Publication.getTitleComparator(userLang) %>" 
              selector="<%= selector %>"/> 

<%
// Collection of valid and used characters for this glossary index
boolean hasSymbols = false;
SortedSet<Character> alphaIndex = new TreeSet<Character>();
boolean hasOthers = false;
for (GlossaryEntry entry : ((Set<GlossaryEntry>) entrySet)) {
  int firstCodePoint = getFirstCodePoint(entry.getTitle(userLang));
  if (firstCodePoint < 'A') {
    hasSymbols = true;
  }
  if (Character.isValidCodePoint(firstCodePoint) && isValidForAlphaIndex(firstCodePoint)) {
    alphaIndex.add(Character.toChars(firstCodePoint)[0]);
  }
  if (firstCodePoint > 'Z') {
    hasOthers = true;
  }
}
%>
<div  id="glossary-fulldisplay-<%= obj.getId() %>" class="fullDisplay glossary" itemscope="itemscope">
  <%@ include file="/front/publication/doPublicationHeader.jspf" %>  
  <% Publication pub = obj;%>
  
  <% if (Util.notEmpty(obj.getDescription())) { %>
    <div class="description abstract">
      <jalios:wiki data="<%= obj %>" field="description"><%= obj.getDescription(userLang) %></jalios:wiki>
    </div>
  <% } %>
  
  <%-- *** FORM ************************************************** --%>
  <% if (canEdit) { %>
  
    <div class='newEntry editArea <%= jcmsContext.showEditIcon() ? "" : "hidden" %>'>
      <a href="#add" data-jalios-action="toggle:hide" data-jalios-target="#glossary-fulldisplay-<%= obj.getId() %> .glossary-add" class="btn btn-default"><jalios:icon src="add"  alt="+" /> <%= glp("ui.glossary.lbl.add-entry") %></a>
    </div>
    
    <form class="glossary-add<%= hasParameter("opCreate") ? "" : " hide" %>" action="<%= JcmsUtil.getDisplayUrl() %>" method="post" name="editForm">
      <br>
      <%@ include file="/jcore/doMessageBox.jspf" %>
      
      <jalios:field name="title" label="ui.glossary.lbl.term" required="true" ml="<%= channel.isMultilingual() %>" value="<%= formHandler.getAllAvailableTitleML() %>" resource="field-vertical">
        <jalios:control settings='<%= new TextFieldSettings().showLanguageChooser() %>' />
      </jalios:field>
      
      <jalios:field name="definition" label="ui.glossary.lbl.definition" ml="<%= channel.isMultilingual() %>" value="<%= formHandler.getAllAvailableDefinitionML() %>" resource="field-vertical">
        <jalios:control settings='<%= new WikiAreaSettings().rows(10) %>' />
      </jalios:field>

      <button class="btn btn-primary" type="submit" name="opCreate" value="true"><%= glp("ui.com.btn.save") %></button>
      <input type="hidden" name="redirect" value="<%= ServletUtil.getUrl(request) %>" />
      <input type="hidden" name="ws" value="<%= workspace.getId() %>" />
      <input type="hidden" name="glossaryId" value="<%= obj.getId() %>" />
      <% 
      ArrayList paramList = new ArrayList(); 
      paramList.add("title");
      paramList.add("definition");
      paramList.add("glossary");
      paramList.add("opCreate");
      paramList.add("ws");
      paramList.add("redirect");
      %><%= printDisabledHiddenParams(request, paramList) %>
      <hr>
    </form>
  <% } %>

  <%-- *** INDEX ************************************************** --%>
  <div class="index">
    <ul class="pagination pagination-lg nobr">
    <% if (hasSymbols) { %>
      <li><a href="<%= ServletUtil.getUrl(request) %>#glossary-section-symbols"><%= glp("ui.glossary.section.symbols") %></a></li>
    <% } %>
    <%-- letters only --%>
    <% for(char letter = 'A'; letter <= 'Z'; letter++) { %>
      <li class="<%= alphaIndex.contains(letter) ? "" : "disabled" %>">
        <a href="<%= ServletUtil.getUrl(request) %>#<%= letter %>"><%= letter %></a>
      </li>
    <% } %>
    <% if (hasOthers) { %>
      <li><a href="<%= ServletUtil.getUrl(request) %>#glossary-section-others"><%= glp("ui.glossary.section.others") %></a></li>
    <% } %>
    </ul>
  </div>
  
  
  <%-- *** ENTRIES ******************************************************** --%>
  <% 
  int prevCodePoint = ' ';
  boolean isNewChar = false;
  boolean isBeforeLatinSequence = false;
  boolean isPastLatinSequence = false;
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
      <% if (isValidForAlphaIndex(currCodePoint)) { %><%-- Do not print character such as '#' for example --%> 
        <a id="<%= currChar %>" class="anchor"></a>
      <% } %>
      <% if (isBeforeLatinSequence) { %>
        <a id="glossary-section-symbols" class="anchor"></a>
        <h2 class="well well-sm"><%= glp("ui.glossary.section.symbols") %></h2>
      <% } else if (isPastLatinSequence) { %>
        <a id="glossary-section-others" class="anchor"></a>
        <h2 class="well well-sm"><%= glp("ui.glossary.section.others") %></h2>
      <% } else { %>
        <h2 class="well well-sm"><%= currChar %></h2>
      <% } %>
    <% } %>
    
      <div class='entry <%= itEntry.isInVisibleState() ? "pub-state" : "work-state" %>'>
      <a id="<%= itEntry.getId() %>"></a>
      <%-- TERM ------------------------------------------------------------ --%> 
      <div class="term">
        <h3>
          <%= itEntry.getTitle(userLang) %>
          <jalios:edit id="<%= itEntry.getId() %>" fields="title,definition,seeAlso" />
          <jalios:recommendation data="<%= itEntry %>"><jalios:icon title='<%= glp("ui.recommendation") %>' src="recommendation" alt='<%= glp("ui.recommendation") %>'  /></jalios:recommendation>
        </h3>
      </div>
      
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
  </jalios:foreach>
</div>