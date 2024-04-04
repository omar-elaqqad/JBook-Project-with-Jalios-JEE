<%@ include file="/jcore/doInitPage.jspf" %>
<%
request.setAttribute("title", glp("ui.adm.type-edit.lbl.cat-ch"));
request.setAttribute("zone", "InternalUI");

Collection<Category> selectedCategories = getDataSetParameterValues("cids", Category.class);
if (Util.isEmpty(selectedCategories)) {
  selectedCategories = getDataListParameter("cids", Category.class);
  if (Util.isEmpty(selectedCategories)) {
    selectedCategories = getDataListParameter("cidList", Category.class);
  }
}

Workspace filterWS = getDataParameter("ws", Workspace.class);
boolean showOtherCategories = false;
Set<Category> wsCategorySet = null;
if (filterWS != null) {
  showOtherCategories = true;
  wsCategorySet = filterWS.getCatSet();
  if (wsCategorySet == null || Util.getFirst(wsCategorySet) == channel.getRootCategory()) {
    wsCategorySet = channel.getRootCategory().getChildrenSet();
    showOtherCategories = false;
  }
}

CategoryTreeSettings categorySettingsWS = new CategoryTreeSettings().required();
CategoryTreeSettings categorySettingsOther = null;

if ("POST".equals(request.getMethod()) && hasParameter("opSelect")) {
  if(Util.notEmpty(selectedCategories)) {
    %><jalios:javascript><%
      List<String> selectedCatIdList = new ArrayList<String>();
      List<String> selectedCatNameList = new ArrayList<String>();
      for (Category category : selectedCategories) {
        selectedCatIdList.add(encodeForJavaScript(category.getId()));
        selectedCatNameList.add(encodeForJavaScript(category.getName(userLang)));
      }
      %>Popup.callback('<%= Util.join(selectedCatIdList, " ") %>', '<%= Util.join(selectedCatNameList, ", ", 3, "...") %>'); window.close();<% // code of label joining is the same as doInitControl.jspf
    %></jalios:javascript><%
  } else {
    jcmsContext.addMsg(new JcmsMessage(JcmsMessage.Level.WARN, "ui.work.category-chooser.select-category"));
  }
}

String[] rootCategoryIds = getStringParameterValues("rootCids", HttpUtil.DATAID_REGEX);
boolean displayRoots = getBooleanParameter("displayRoots", true);

String filterParam = getStringEnumParameter("filter", CategoryFilter.USE.toString(), EnumUtils.toStringArray(CategoryFilter.class));
CategoryFilter categoryFilter = Util.notEmpty(filterParam) ? CategoryFilter.valueOf(filterParam) : null;

boolean isRootCat = Util.isEmpty(rootCategoryIds) || Util.isSameContent(rootCategoryIds, new String[] {channel.getRootCategory().getId()});
if (isRootCat && wsCategorySet != null) {
  categorySettingsWS.root(wsCategorySet).filter(categoryFilter);
} else {
  categorySettingsWS.root(rootCategoryIds).displayRoots(displayRoots).filter(categoryFilter);
  showOtherCategories = false;
}

if (showOtherCategories) {
  categorySettingsOther = new CategoryTreeSettings().required().root(channel.getRootCategory().getChildrenSet()).removed(wsCategorySet).filter(categoryFilter);
}

boolean multiple = getBooleanParameter("multivalue", false);
if(multiple) {
  categorySettingsWS.multiple();
  if (categorySettingsOther != null) {
    categorySettingsOther.multiple();
  }
} else {
  %>
  <jalios:javascript>
  !function ($) {
    // Bind the "change" event on the radio to submit the form when one radio is checked 
    $(document).on("change","INPUT[name='cids']", function(event) {
      $("FORM[name='editForm']").submit();
    });
    // Bind the ajax-refresh event to submit the form when a category is selected from the autocomplete input
    $(document).on("jalios:refresh", function(event) {
      var refresh = $.jalios.Event.match(event,'refresh','after')
      if (!refresh) {
        return;
      }
      if (event.refresh.target.hasClass("treeview-root")) {
        $("FORM[name='editForm']").submit();
      }
    });
  }(window.jQuery);
  </jalios:javascript>
  <%
}

boolean selectable = getBooleanParameter("selectable", true);
if(!selectable) {
  categorySettingsWS.uncheckSelectable();
  if (categorySettingsOther != null) {
    categorySettingsOther.uncheckSelectable();
  }
}
request.setAttribute("jcms.field.category-tree.handle-tree-performance", false);

%>
<%@ include file="/jcore/doEmptyHeader.jspf" %>
<form name="editForm" action="work/categoryChooser.jsp" method="POST">
  <% if(!multiple) { %>
    <input type="hidden" name="opSelect" value="true" />
  <% } %>
  <div class="category-chooser-form">
    <jalios:field name="cids" label='<%= showOtherCategories ? "ui.work.form.lbl.ws-cat" : "" %>' value="<%= selectedCategories %>" resource="field-vertical">
      <%@ include file="/jcore/doMessageBox.jspf" %>
      <jalios:control settings='<%= categorySettingsWS %>' />
    </jalios:field>
    
    <% if (showOtherCategories) { %>
    <jalios:field name="cids" label="ui.work.form.lbl.other-cat" value="<%= selectedCategories %>" resource="field-vertical">
      <jalios:control settings='<%= categorySettingsOther %>' />
    </jalios:field>
    <% } %>
  </div>
  
  <div class="navbar navbar-default navbar-fixed-bottom">
    <div class="container-fluid">
      <div class="pull-right">
        <% if(multiple) { %>
          <button type="submit" name="opSelect" value="true" class="btn btn-primary navbar-btn"><%= glp("ui.work.query-ch.btn.select")%></button>
        <% } else { %>
          <a class="btn btn-default navbar-btn" onclick="window.close();"><%= glp("ui.com.btn.close") %></a>
        <% } %>
      </div>
    </div>
  </div>
  
  <%-- HIDDEN FIELDS --%>
  <% if(rootCategoryIds != null) { %>
    <% for(String rootCatId : rootCategoryIds) { %>
    <input type="hidden" name="rootCids" value="<%= rootCatId %>" />
    <% } %>
  <% } %>
  <input type="hidden" name="filter" value="<%= filterParam %>" />
  <input type="hidden" name="multivalue" value="<%= multiple %>" />
  <input type="hidden" name="selectable" value="<%= selectable %>" />
  <input type="hidden" name="ws" value="<%= getDataIdParameter("ws") %>" />
  <input type="hidden" name="displayRoots" value="<%= displayRoots %>" />
  
</form>
<%@ include file="/jcore/doEmptyFooter.jspf" %>