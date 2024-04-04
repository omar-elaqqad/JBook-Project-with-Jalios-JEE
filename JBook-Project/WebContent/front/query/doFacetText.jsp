<%@ include file='/jcore/doInitPage.jspf' %><%@ page import="com.jalios.jcms.handler.QueryHandler" %><%
  
  QueryHandler qh = (QueryHandler) request.getAttribute("query.facets.handler");
  int boxStatus = Util.toInt(request.getAttribute("query.facets.text"),0);
  if (Util.isEmpty(qh.getText())) {
    boxStatus = 0;
  }

  if (boxStatus == 0){ return; }
  
  String FACET_PREFIX = (String) request.getAttribute("query.facets.prefix");
  boolean options = getBooleanParameter("search_options", false);
  boolean advanced    = channel.getBooleanProperty("query.facets.advanced",false);
  
   String sSearchMode = qh.getMode(); // default is "all" 
   if (!QueryHandler.TEXT_MODE_ALL_WORDS.equals(sSearchMode)){
     options = true;
   }
   
   String searchedFieldsTitleInputId = FACET_PREFIX + "searchedFieldsTitle";
   boolean bSearchedFields = Util.arrayContains(qh.getSearchedFields(), com.jalios.jcms.search.LucenePublicationSearchEngine.TITLE_FIELD); 
 
   String searchedFieldsAbstractInputId = FACET_PREFIX + "searchedFieldsAbstract";
   boolean bSearchedAbstract = Util.arrayContains(qh.getSearchedFields(), com.jalios.jcms.search.LucenePublicationSearchEngine.ABSTRACT_FIELD);
   
   boolean fldChecked = !bSearchedFields && !bSearchedAbstract;
   if (!fldChecked){
     options = true;
   }
   
   boolean foCatName       = channel.getBooleanProperty("query.facets.text.cat", false);
   boolean foSearchInFiles = channel.getBooleanProperty("query.facets.text.file",false);
   if (qh.getCatName() != foCatName || qh.getSearchInFiles() != foSearchInFiles) {
     options = true;
   }     
   String lblPrefix = true ? "ui.fo.refine.lbl." : "ui.work.search.tab.";

   String modeInputIdPrefix = FACET_PREFIX + "mode";
   String sidebarFilterId="filterText";
   boolean collapsed = !options;
%>
<jalios:appSidebarSection icon="search-text" title='<%= glp(lblPrefix + "text") %>' name="text" collapsable="true" collapsed='<%= collapsed %>'>
  <p class="app-sidebar-block"><%= glp("ui.work.search.text.s-with") %></p>
  <ul class="app-sidebar-menu app-sidebar-menu-formitems" >
     <% boolean checked = QueryHandler.TEXT_MODE_ALL_WORDS.equals(sSearchMode); %>
     <li <%=  checked ? "class='active'" : "" %>>
       <% if (checked) { %><jalios:icon src="app-list-check" css="app-list-right-icon"/><% } %>
       <label for="<%= modeInputIdPrefix %>all" role="button" tabindex="0">
         <input id="<%= modeInputIdPrefix %>all"      type="radio" name="mode" value="<%= QueryHandler.TEXT_MODE_ALL_WORDS %>" <%=  checked ? "checked='checked'" : "" %>  />
         <%= glp("ui.work.search.text.mode.all") %>
       </label>
     </li>
     <% checked = QueryHandler.TEXT_MODE_ANY_WORD.equals(sSearchMode); %>
     <li <%=  checked ? "class='active'" : "" %>>
       <% if (checked) { %><jalios:icon src="app-list-check" css="app-list-right-icon"/><% } %>
       <label for="<%= modeInputIdPrefix %>any" role="button" tabindex="0">
         <input id="<%= modeInputIdPrefix %>any"      type="radio" name="mode" value="<%= QueryHandler.TEXT_MODE_ANY_WORD %>"  <%=  checked ? "checked='checked'" : "" %>  />
         <%= glp("ui.work.search.text.mode.any") %>
       </label>
     </li>
     <% checked = QueryHandler.TEXT_MODE_EXACT.equals(sSearchMode); %>
     <li <%=  checked ? "class='active'" : "" %>>
       <% if (checked) { %><jalios:icon src="app-list-check" css="app-list-right-icon"/><% } %>
       <label for="<%= modeInputIdPrefix %>exact" role="button" tabindex="0">
         <input id="<%= modeInputIdPrefix %>exact"    type="radio" name="mode" value="<%= QueryHandler.TEXT_MODE_EXACT %>"     <%=  checked ? "checked='checked'" : "" %>  />
         <%= glp("ui.work.search.text.mode.exact") %>
       </label>
     </li>
     <% checked = QueryHandler.TEXT_MODE_ADVANCED.equals(sSearchMode); %>
     <li <%=  checked ? "class='active'" : "" %>>
       <% if (checked) { %><jalios:icon src="app-list-check" css="app-list-right-icon"/><% } %>
       <label for="<%= modeInputIdPrefix %>advanced" role="button" tabindex="0" role="button" tabindex="0">
         <input id="<%= modeInputIdPrefix %>advanced" type="radio" name="mode" value="<%= QueryHandler.TEXT_MODE_ADVANCED %>"  <%=  checked ? "checked='checked'" : "" %>  />
         <%= glp("ui.work.search.text.mode.adv") %>
       </label>
     </li>
  </ul>
  <p class="app-sidebar-block"><%= glp("ui.work.search.text.s-in") %></p>
   <ul class="app-sidebar-menu app-sidebar-menu-formitems  ">
     <% checked = fldChecked;  %>
     <li class='exclusive <%= checked ? "active":"" %>'>
       <% if (checked) { %><jalios:icon src="app-list-check" css="app-list-right-icon"/><% } %>
       <% String searchedAllFieldsInputId = FACET_PREFIX + "searchedAllFields"; %>
       <label for="<%= searchedAllFieldsInputId %>" role="button" tabindex="0">
         <input id="<%= searchedAllFieldsInputId %>" type="checkbox" name="searchedAllFields" value="true" <%= checked ? "checked='checked'" : "" %> />
         <%= glp("ui.work.search.text.all-fields") %>
       </label>
     </li>
     <% checked = bSearchedFields;  %>
     <li <%= checked ? "class='active'" : "" %>>
       <% if (checked) { %><jalios:icon src="app-list-check" css="app-list-right-icon"/><% } %>
       <label for="<%= searchedFieldsTitleInputId %>" role="button" tabindex="0">
         <input id="<%= searchedFieldsTitleInputId %>" type="checkbox" name="searchedFields" value="<%= com.jalios.jcms.search.LucenePublicationSearchEngine.TITLE_FIELD %>" <%= checked ? "checked='checked'" : "" %>  />
         <% /* %>Titre<% */ %><%= glp("ui.work.search.text.title") %>
       </label>
     </li>
     <% checked = bSearchedAbstract;  %>
     <li <%= checked ? "class='active'" : "" %>>
       <% if (checked) { %><jalios:icon src="app-list-check" css="app-list-right-icon"/><% } %>
       <label for="<%= searchedFieldsAbstractInputId %>" role="button" tabindex="0">
         <input id="<%= searchedFieldsAbstractInputId %>" type="checkbox" name="searchedFields" value="<%= com.jalios.jcms.search.LucenePublicationSearchEngine.ABSTRACT_FIELD %>" <%= checked ? "checked='checked'" : "" %>  />
         <%= glp("ui.work.search.text.abstract") %>
       </label>
     </li>
   </ul>
   <ul class="app-sidebar-menu app-sidebar-menu-formitems  ">
     <% 
       String searchedFieldsCatInputId = FACET_PREFIX + "searchedFieldsCat";
       boolean bCatName = qh.getCatName();
     %>
     <% checked = bCatName;  %>
     <li <%= checked ? "class='active'" : "" %>>
       <% if (checked) { %><jalios:icon src="app-list-check" css="app-list-right-icon"/><% } %>
       <label for="<%= searchedFieldsCatInputId %>">
         <% if (advanced) { %>
         <input id="<%= searchedFieldsCatInputId %>" type="checkbox" name="catNameUI" <% if (checked) { %>checked="checked"<% } %>
                data-jalios-action="toggle:disabled toggle:disabled" data-jalios-target="#<%= searchedFieldsCatInputId %>HiddenTrue | #<%= searchedFieldsCatInputId %>HiddenFalse" />
         <% } else { %>
           <input id="<%= searchedFieldsCatInputId %>" type="checkbox" name="catName" value="<%= bCatName %>" checked="checked" class="boolean" />
         <% } %>
         <%= glp("ui.work.search.text.cat") %>
       </label>
       <%
         if (advanced) {
           %><input id="<%= searchedFieldsCatInputId %>HiddenTrue" type="hidden" name="catName" value="true" <% if (!bCatName) { %>disabled="disabled"<% } %> /><%
           %><input id="<%= searchedFieldsCatInputId %>HiddenFalse" type="hidden" name="catName" value="false" <% if (bCatName) { %>disabled="disabled"<% } %> /><%
         }
       %>
     </li>
     <% 
       String searchedFieldsFilesInputId = FACET_PREFIX + "searchedFieldsFiles";
       boolean bSearchInFiles = qh.getSearchInFiles(); 
     %>
     <% checked = bSearchInFiles;  %>
     <li <%= bSearchInFiles ? "class='active'" : "" %>>
       <% if (checked) { %><jalios:icon src="app-list-check" css="app-list-right-icon"/><% } %>
       <label for="<%= searchedFieldsFilesInputId %>">
         <input id="<%= searchedFieldsFilesInputId %>" type="checkbox" name="searchInFiles" value="<%= bSearchInFiles %>" checked="checked" class="boolean" />
         <%= glp("ui.work.search.text.file") %>
       </label>
     </li>
   </ul>
</jalios:appSidebarSection>