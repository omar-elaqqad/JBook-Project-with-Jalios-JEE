<%-- 
  @Summary: Language chooser
  @Category: Presentation / Popup
  @Deprecated: False
  @Customizable: False
  @Requestable: True
--%>
<%@ include file='/jcore/doInitPage.jspf' %>
<% request.setAttribute("title", glp("ui.work.language-chooser.title")); %>
<%@ include file='/jcore/doEmptyHeader.jspf' %>
<%
final boolean isMultiple = getBooleanParameter("multiple", false);
final boolean allLanguages = getBooleanParameter("all", false);
final boolean shortList = getBooleanParameter("shortList", true);

final HashSet selectedLangSet = new HashSet(Util.splitToList(getStringParameter("selected", "", "^[a-zA-Z, ]*$"), ", "));
final List langList;
if (allLanguages) {
  String isoCodePropKey = shortList ? "iso-639-codes.short-list" : "iso-639-codes";
  langList = Util.splitToList(channel.getProperty(isoCodePropKey), ", ");
} else {
  langList = channel.getLanguageListOrdered();
}
if (isMultiple == false && selectedLangSet.size() > 1) {
  String lang = (String) selectedLangSet.iterator().next();
  selectedLangSet.clear();
  selectedLangSet.add(lang);
}

String jsCallback = getChooserParameter("jsCallback");
String targetInput = getChooserParameter("targetInput");

jcmsContext.addJavaScript("js/jalios/core/jalios-language-chooser.js");
jcmsContext.addCSSHeader("css/jalios/languagechooser.less");
%>
<form name="langChooserForm" style="margin:0; padding:0" onsubmit="return false;">
  <input name="multiple" type="hidden" value="<%= isMultiple %>" />
  <input name="all" type="hidden" value="<%= allLanguages %>" />
  <input name="shortList" type="hidden" value="<%= shortList %>" />
  <input name="jsCallback" type="hidden" value="<%= jsCallback %>" />
  <input name="targetInput" type="hidden" value="<%= targetInput %>" />
  <table class='list'  height="25">
   <thead>
    <tr> 
      <td width="15"><%if (isMultiple) {%><input type="checkbox" name="selectall" /><%}%></td>
      <td class="text-right">
        <%= glp("ui.work.query.txt.search") %>
        <input name="search" type="text" autocomplete="off" class='formTextfield'/>
        <button name="clear"><jalios:icon src="delete" title='<%= glp("ui.com.alt.clear") %>' /></button>
      </td>
    </tr>
   </thead>
  </table>
  <div style='overflow: auto; height:390px;'>
  <table id="languages" class='list table-data table-condensed' >
   <tbody>
   <jalios:foreach collection='<%= langList %>' name='lang' type='String' counter='langCounter'>
    <% int rowNbr = langCounter.intValue(); %>
    <% String rowID = "row_" + lang; %>
    <% boolean isSelected = selectedLangSet.contains(lang); %>
    <tr id='<%= rowID %>' class="<%= isSelected ? "listSelectedRow" : ""%>" data-jalios-rowid="<%= rowID %>" data-jalios-lang="<%= lang %>"> 
     <td><input name="lang" id="<%= lang %>" value='<%= lang %>' type='<%= isMultiple ? "checkbox" : "radio" %>' <%= isSelected ? "checked='checked'" : ""%> class="js-select-lang" /></td>
     <td class="js-select-lang"><jalios:lang lang='<%= lang %>'/></td>
     <td id="lang_<%=lang %>" class="js-select-lang userLangName"><%= glp("lang." + lang) %></td>
     <td class="js-select-lang nativeLangName"><%= channel.getProperty(lang + ".lang", "") %></td>
     <td class="js-select-lang codeLang"><%= lang %></td>
    </tr>
   </jalios:foreach>
    <tr style="visibility: hidden;"> 
      <td width="15"></td> 
      <td width="20"></td> 
      <td colspan="3"></td> 
    </tr>
   </tbody>
  </table>
  </div>
  <table class='list' height="30">
   <tfoot>
    <tr> 
      <td class="text-right">
       <% if (allLanguages) { %>
        <button name="toggleShortList" type="button" class="btn btn-default">
          <%= glp("ui.work.language-chooser." + (shortList ? "full-list" : "short-list")) %>
        </button>
       <% } %>
       <% if (isMultiple) { %>
        <button name="selectLanguage" type="button" class="btn btn-default" style='padding: 0 20px; border: 2px solid;'>
          <%= glp("ui.work.query-ch.btn.select") %>
        </button>
       <% } %>
      </td>
    </tr>
   </tfoot>
  </table>
</form>

<%@ include file='/jcore/doEmptyFooter.jspf' %>