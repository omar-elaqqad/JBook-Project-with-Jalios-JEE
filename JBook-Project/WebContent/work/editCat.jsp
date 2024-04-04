<%--
  @Summary: Category editor
  @Category: Work Area / Categories
  @Author: Oliver Dedieu
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-2.1
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

if (loggedMember == null || !loggedMember.canEditCategories()) {
  sendForbidden(request, response);
  return;
}
%>
<jsp:useBean id="extFormHandler" scope="page" class="generated.EditCategoryExtensionHandler">
  <jsp:setProperty name="extFormHandler" property="request" value="<%= request %>"/>
  <jsp:setProperty name="extFormHandler" property="response" value="<%= response %>"/>
  <jsp:setProperty name="extFormHandler" property="*" />
</jsp:useBean>
<jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.handler.EditCatHandler">
  <jsp:setProperty name="formHandler" property="request" value="<%= request %>"/>
  <jsp:setProperty name="formHandler" property="response" value="<%= response %>"/>
  <jsp:setProperty name="formHandler" property="extFormHandler" value="<%= extFormHandler %>"/>
  <jsp:setProperty name="formHandler" property="*" />
</jsp:useBean>
<%
  request.setAttribute("title", /* Category Editor */glp("ui.work.cat.title"));
  request.setAttribute("editCategoriesWAMenu", "true");
  request.setAttribute("formHandler", formHandler);
  request.setAttribute("extFormHandler", extFormHandler);

  boolean popupEdition = getBooleanParameter("popupEdition",false);
  boolean showCatForm = getBooleanParameter("createCat",false);
  if (formHandler.validate()) {
    return;
  }
  Category category = formHandler.getCategory();
  Category parent = formHandler.getAvailableParent();
  String wsFilterParam = formHandler.isWorkspaceFilter() ? "" : "&amp;workspaceFilter=false&amp;allWorkspaceFilter=true";
  String redirectParam = Util.isEmpty(formHandler.getRedirect()) ? "" : "&amp;redirect=" + formHandler.getRedirect();
  if (parent == null) {
    sendForbidden(request, response);
    return;
  }
  String guiExportCSV = loggedMember.canManageCategory(parent) ? ("admin/exportCSVCategory.jsp?cid=" + parent.getId()) : null;

  request.setAttribute("boHeaderCSS","sticky-display");
%>

<% if (!popupEdition) { %><%@ include file='/work/doWorkHeader.jspf' %>
<% } else { %><% jcmsContext.addBodyAttributes("class", "popupEdition"); %>
<%@ include file='/jcore/doEmptyHeader.jspf' %><% } %>
<% if (popupEdition) { %><div id="popupEdition" class="WorkArea"><% } %>
<% if (!popupEdition) { %>
<table class='layout spliter'>
  <tr>

    <%-- *** NODE TREE COLUMN ********************************** --%>
    <td class="sidebar">
      <div class="overflowing-panel">
        <%
        Set<Category> openedSet = new HashSet<Category>();
        Set<Category> highlightSet = new HashSet<Category>();
        if (category != null) {
          openedSet.add(category);
          highlightSet.add(category);
        } else if (parent != null) {
          openedSet.add(parent);
          highlightSet.add(parent);
        }

        String catLink = Util.notEmpty(wsFilterParam) ? wsFilterParam + "&amp;pid=" : "pid=";

        Set<Category> wsCatSet = formHandler.getWorkspace().getCatSet();
        openedSet.addAll(wsCatSet);

        Category root = channel.getRootCategory();
        if (!formHandler.isWorkspaceFilter() || formHandler.isAllWorkspaceFilter() || wsCatSet.contains(root)) {
          wsCatSet = new TreeSet();
          wsCatSet.addAll(root.getChildrenSet());
        }
        %>
      <jalios:treecatview
          prefix="work"
          link='<%= "work/editCat.jsp?" + catLink + "_NODE_ID_" %>'
          opened="<%= openedSet %>"
          highlighted="<%= highlightSet %>"
          collection="<%= wsCatSet %>"
          dragdrop="true"
          showCtxMenu="true"
          css="autocomplete"

          filter="<%= com.jalios.jcms.taglib.CategoryFilter.MANAGE %>"

          showRights="true"
          showPortal="true"
            showWorkspaceIcon="true"
      />
     </div>
    </td>
    <td class="split"></td>
    <%-- *** MAIN COLUMN ********************************** --%>
    <td>
      <div class="WorkArea">
<% } %><%-- popupEdition --%>

      <div class="page-header">
      <h1 class='boTitle icon iconCategory'>
       <% if (parent != null && parent != channel.getRootCategory()) { %>
        <%= parent.getName(userLang) %>
       <% } else { %>
       <%= glp("ui.work.cat.title") %>
       <% } %>
       <% if (parent.isNode()) { %>
       (<%= Util.getSize(parent.getChildrenSet()) %> / <%= Util.getSize(parent.getDescendantSet()) %>)
       <% } %>
      </h1>
      </div>
      <table class="layout br">

        <% if (!popupEdition) { %>
        <%-- *** CHILDREN LIST ********************************** --%>
        <tr>
          <td>
            <%
              final boolean finalFilterWorkspace =  formHandler.isWorkspaceFilter();
              final Set finalCatSet = formHandler.isWorkspaceFilter() && formHandler.getWorkspace() != null ? formHandler.getWorkspace().getCatSet() : null;

              DataSelector catSelector = new DataSelector() {
                 public boolean isWorkspaceFiltered(Category cat){
                   if (!finalFilterWorkspace)
                     return false;
                   return !isMatchSet(cat);
                 }
                 private boolean isMatchSet(Category cat){
                    if (Util.isEmpty(finalCatSet)) {
                      return false;
                    }
                   if (finalCatSet.contains(cat))
                     return true;
                   for (Iterator it = finalCatSet.iterator(); it.hasNext();) {
                     Category itCat = (Category) it.next();
                     if (cat.containsDescendant(itCat) || itCat.containsDescendant(cat)){
                       return true;
                     }
                   }
                   return false;
                 }
                 public boolean isSelected(Data data) {
                   if (!(data instanceof Category)) {
                     return false;
                   }
                   Category cat = (Category) data;
                   if (!loggedMember.canManageCategory(cat)) {
                    return false;
                   }
                   return !isWorkspaceFiltered(cat);
                 }
              };
            %>
            <jalios:query name="childrenSet" dataset="<%= parent.getChildrenSet() %>"
                          comparator="<%= Category.getOrderComparator(userLang) %>"
                          selector="<%= catSelector%>" />
            <% if (Util.isEmpty(childrenSet)) { %>
               <%
               String tmpWarningMsg = (String)request.getAttribute(JcmsConstants.WARNING_MSG);
               request.removeAttribute(JcmsConstants.WARNING_MSG);
               setInfoMsg(glp("ui.work.cat.lbl.no-children", parent.getName(userLang)), request);
               %>
               <%@ include file='/jcore/doMessageBox.jspf' %>
               <%
               request.removeAttribute(JcmsConstants.INFORMATION_MSG);
               if (tmpWarningMsg != null) {
                 setWarningMsg(tmpWarningMsg, request);
               }
               %>
            <% } else { %>
            <jalios:pager name='ecPagerHandler' declare='true' action='init' size='<%= childrenSet.size() %>'/>
            <%
            // Pager does not provide sorts, nor reverse options.
            String pagerParams = (ecPagerHandler.isPagerAll() ? "&amp;pagerAll=true" : "&amp;pageSize=" + ecPagerHandler.getPageSize()) + (ecPagerHandler.getStart() != 0 ? "&amp;start=" + ecPagerHandler.getStart():"");
            %>
            <table id='pubTable' class="table-data table-condensed">
              <thead>
              <tr>
                <th class="nowrap">
                  <% if (!loggedMember.getCategoryRootSet().contains(parent) && parent.getParent() != null ) { %>
                  <a href='work/editCat.jsp?pid=<%= parent.getParent().getId() %><%= wsFilterParam %>' class="btn btn-rounded"><jalios:icon src='folder-up' /></a>
                  <% } %>
                  <jalios:caddy data="<%= parent %>" action="<%= CaddyPopinHandler.ACTION_ADD_CATEGORYS_CHILDREN_STR %>" css="btn btn-rounded"/>
                  <% if (!Util.isEmpty(guiExportCSV)) { %>
                   <a href="<%= guiExportCSV %>" class="btn btn-rounded"><jalios:icon src="csv" title='ui.com.btn.csv'/></a>
                  <% } %>
                </th>
                <td class="nowrap"></td>
                <th class="nowrap"><%= glp("ui.com.lbl.name") %></th>
                <th class="nowrap"></th>
                <th class="nowrap"><%= glp("ui.work.cat.lbl.sel") %></th>
                <th class="nowrap">&nbsp;<jalios:icon src='key-white' title='ui.com.lbl.rights' />&nbsp;</th>
                <th class="nowrap"><%= glp("ui.com.lbl.child-cnt") %></th>
                <th class="nowrap"><%= glp("ui.com.lbl.desc-cnt") %></th>
                <th class="nowrap"><%= glp("ui.com.lbl.pub-cnt") %> <jalios:tooltip icon="info" property="ui.com.lbl.pub-cnt.info" /></th>
                <th class="nowrap"><%= glp("ui.work.cat.lbl.icon") %></th>
                <th class="nowrap"><%= glp("ui.com.lbl.description") %> / <%= glp("ui.com.lbl.friendly-urls") %></th>
                <th class="nowrap">&nbsp;</th>
              </tr>
              </thead>
              <jalios:foreach collection='<%= childrenSet %>'
                              type='Category'
                              name='itCat'
                              max='<%= ecPagerHandler.getPageSize() %>'
                              skip='<%= ecPagerHandler.getStart() %>'>
              <tr>
                <td class="fit numeric">
                  <%= ecPagerHandler.getStart() + itCounter.intValue() %>.
                  <jalios:edit data='<%= itCat %>' css="btn btn-rounded btn-category-action-edit" />
                </td>
                <td class="fit">
                  <% if (itCat.isNode()) { %>
                    <a href='work/editCat.jsp?pid=<%= itCat.getId() %><%= wsFilterParam %>'><jalios:icon src='openable-folder' /></a>
                  <% } else { %>
                    &nbsp;
                  <% } %>
                </td>
                <td class="auto">
                  <% if (itCat == category ) { %><span class="highlight"><% } %>
                  <b><a href='work/editCat.jsp?pid=<%= itCat.getId() %><%= wsFilterParam %>' style='text-decoration: none;color:#000000;'><%= itCat.getName(userLang) %></a></b>
                  <% if (itCat.getNewTab()) { %><jalios:icon src="new-tab" title="ui.work.cat.lbl.new-tab"/><% } %>
                  <jalios:checkIntegrity data='<%= itCat %>' />
                  <% if (itCat == category ) { %></span><% } %>
               </td>
                <td class="fit">
                  <% if (Util.notEmpty(itCat.getColor())) { %>
                  <span style='background-color: <%= encodeForHTMLAttribute(itCat.getColor()) %>;' title='<%= encodeForHTMLAttribute(itCat.getColor()) %>'><img src="s.gif" width="10" alt="" /></span>
                  <% } %>
                </td>
                <td class="fit text-center"><%= itCat.isSelectable() ? channel.getProperty("list.boolean.on", "X") : channel.getProperty("list.boolean.off", "&nbsp;") %></td>
                <td class="fit text-center">
                  <% if (itCat.hasAnyReadRights() || itCat.hasDeclaredManagers()) { %>
                  <jalios:tooltip icon="key" longdesc='<%= "jcore/tooltip/ttCategoryRights.jsp?id="+itCat.getId() %>' />
                  <% } %>
                </td>
                  
                <td class="fit numeric"><%= Util.getSize(itCat.getChildrenSet()) %></td>
                <td class="fit numeric"><%= Util.getSize(itCat.getDescendantSet()) %></td>
                <% int pubCount = itCat.getAllPublicationSet().size(); %>
                <td class="fit numeric"><a href="work/queryWork.jsp?cids=<%= itCat.getId() %>&amp;types=com.jalios.jcms.Publication&amp;workspaceFilter=false" title="<%= glp("ui.com.lbl.pub-cnt.title",pubCount) %>"><%= pubCount %></a></td>
                <td class="fit">
                  <% if (Util.notEmpty(itCat.getIcon(userLang)) ) { %>
                    <jalios:dataicon data='<%= itCat %>' />
                  <% } %>
                </td>
                <td class="auto">
                  <jalios:truncate length="60" suffix="..."><%= Util.getString(itCat.getDescription(userLang), "") %></jalios:truncate>
                  <% if (Util.notEmpty(itCat.getDescription(userLang)) && Util.notEmpty(itCat.getFriendlyURLSet())) { %><br /><% } %>
                  <% String curBaseURL = ServletUtil.getBaseUrl(request); curBaseURL = curBaseURL.substring(0, curBaseURL.length()-1);%>
                  <jalios:foreach name="friendlyURL" type="String" counter="fURlsCounter"
                                  collection="<%= itCat.getFriendlyURLSet() %>">
                   <% if (fURlsCounter.intValue() > 1) { %><br /><% } %>
                   <jalios:icon src='www' /> <a href="<%= curBaseURL %><%= friendlyURL %>"><%= friendlyURL %></a>
                  </jalios:foreach>
                </td>
                <td class="fit nowrap">
                  <jalios:caddy data="<%= itCat %>" css="btn btn-rounded" />
                  <% if (parent.isCustomOrder() ) { %>
                  <%
                    final String opCatUpDownParams = "&amp;redirect=" + ServletUtil.encodeURL(ServletUtil.getUrl(request, false)) + "&amp;id=" + itCat.getId() + wsFilterParam + pagerParams;
                    final String opCatUpUrl = HttpUtil.getUrlWithCSRFToken("work/editCat.jsp?opCatUp=true" + opCatUpDownParams, request, true);
                    final String opCatDownUrl = HttpUtil.getUrlWithCSRFToken("work/editCat.jsp?opCatDown=true" + opCatUpDownParams, request, true);
                  %>
                  <a href="<%= opCatUpUrl %>" class="btn btn-rounded btn-category-action-move-up"><jalios:icon src="arrowup" title='ui.com.alt.up'/></a>
                  <a href="<%= opCatDownUrl %>" class="btn btn-rounded btn-category-action-move-down"><jalios:icon src="arrowdown" title='ui.com.alt.down'/></a>
                  <% } %>
                  <% if (loggedMember.canManageCategory(parent) ) { %>
                  <% String confirmCopy = encodeForJavaScript(glp("msg.js.confirm-copy", itCat.getName(userLang))); %>
                  <a href='work/editCat.jsp?opDeepCopy=true&amp;id=<%= itCat.getId() %><%= wsFilterParam %>' onclick='confirmAction("<%= confirmCopy %>", this.href); return false;' class="btn btn-rounded btn-category-action-duplicate"><jalios:icon src="duplicate" title='ui.com.alt.duplicate' /></a>
                  <% } %>
                  <% if (channel.getBooleanProperty("category.edit.delete-tag.enabled", true)) { %>
                  <jalios:delete data='<%= itCat %>' css="btn btn-rounded btn-category-action-delete" />
                  <% } %>
                </td>
              </tr>
              </jalios:foreach>
            </table>
            <jalios:pager name='ecPagerHandler'/>
            <% } // if (Util.notEmpty(childrenSet))  %>

          <%-- *** IMPORT - ALPHA/EXPLICITE ORDER **************************** --%>
          <% if (parent != null ) { %>
            <script>
              function popupImport(pid, redirect) {
                var url = '<%= contextPath %>/work/popupImportCatList.jsp?pid=' + pid + '&redirect=' + redirect;
                Popup.popupWindow(url,'opupUploadCatList',610,600,false,true,true,true);
              }
            </script>
            <form action='work/editCat.jsp' method="post" class="br">
              <% if (formHandler.isWorkspaceFilter() ) { %><input type='hidden' name='workspaceFilter' value='false' /><% } %>
              <input type='hidden' name='id' value='<%= parent.getId() %>' />
              <input type='hidden' name='redirect' value='work/editCat.jsp?pid=<%= parent.getId() %><%= wsFilterParam %>'>

              <% if (loggedMember.canManageCategory(parent)) { %>

              <%   if (category == null && formHandler.getWorkingCat() == null) { %>
              <button id="createNewCatButton" class="btn btn-primary btn-create-category" onclick="$('editFormId').show();$(this).hide();document.editForm.elements[0].focus();return false;"><jalios:icon src="add" /> <%= glp("ui.work.cat.lbl.add") %></button>
              <%   } %>

              <input type='button' class='btn btn-default btn-import-category' value='<%= glp("ui.work.cat.btn.import") %>' onclick='popupImport("<%= parent.getId() %>", "<%= ServletUtil.getBaseUrl(request) %>work/editCat.jsp?pid=<%= category != null ? category.getId() : parent.getId() %><%= wsFilterParam %>");' />

              <%-- *** EXPORT - ALPHA/EXPLICITE ORDER **************************** --%>
              <% if (parent != null ) { %>
                <a href="work/exportCat.jsp?pid=<%= parent.getId() %>" class='btn btn-default btn-export-category' target="_blank">
                  <%= glp("ui.work.cat.btn.export") %>
                </a>
               <% } %>

              <%   if (Util.notEmpty(childrenSet)) { %>
              <%     if (parent.isCustomOrder()) { %>
               <input class='btn btn-default btn-change-children-order-alphabet' type='submit' name='opUpdate' value='<%= glp("ui.work.cat.btn.alphabet") %>' />
               <input type='hidden' name='childrenOrder' value='<%= Category.ALPHABETICAL_ORDER %>' />
              <%     } else { %>
               <input class='btn btn-default btn-change-children-order-custom' type='submit' name='opUpdate' value='<%= glp("ui.work.cat.btn.custom") %>' />
               <input type='hidden' name='childrenOrder' value='<%= Category.CUSTOM_ORDER %>' />
              <%     } %>
              <%   } %>

              <% } %>
            </form>
           <% } %>

          </td>
        </tr>
        <% } %><%-- !popupEdition  --%>

        <%-- *** CATEGORY EDITOR ********************************** --%>
        <% if (loggedMember.canManageCategory(parent) || (category != null && loggedMember.canManageCategory(category)) ) { %>
        <tr>
          <td>
            <%@ include file='/jcore/doMessageBox.jspf' %>
            <% if (category != null) { %>
              <h2 class='boTitle'><jalios:icon src='categories' /> <%= glp("ui.work.cat.lbl.update", category.getName(userLang)) %></h2>
            <% } %>
            <% String formStyle = ( !showCatForm && category == null && formHandler.getWorkingCat() == null && !popupEdition) ? "style=\"display:none;\"" : "";%>
            <form action="work/editCat.jsp" method="post" name='editForm' id="editFormId" class="form-horizontal" <%= formStyle %>>
             <% if (category == null) { %>
              <h2 class='boTitle'><jalios:icon src='categories' /> <%= glp("ui.work.cat.lbl.edit-new") %></h2>
             <% } %>
             
             <% boolean showParentTab = category == null || (!loggedMember.getCategoryRootSet().contains(category) && !formHandler.getRootCategories().contains(category)); %>
             
             <ul class="nav nav-tabs nav-tabs-underlined is-left-aligned" role="tablist">
               
               <li role="presentation" class="active">
                 <a href="#general-tab" data-toggle="tab" onclick="return false;" aria-controls="paths" role="tab"><jalios:icon src='edit' /> <%= glp("ui.com.tab.general") %></a>
               </li>
               
               <li role="presentation">
                 <a href="#presentation-tab" data-toggle="tab" onclick="return false;" aria-controls="paths" role="tab"><jalios:icon src='colors' /> <%= glp("ui.work.cat.tab.presentation") %></a>
               </li>
               
               <li role="presentation">
                 <a href="#friendly-url-tab" data-toggle="tab" onclick="return false;" aria-controls="paths" role="tab"><jalios:icon src='www' /> <%= glp("ui.com.lbl.friendly-urls") %></a>
               </li>
               
               <li role="presentation">
                 <a href="#rights-tab" data-toggle="tab" onclick="return false;" aria-controls="paths" role="tab"><jalios:icon src="key" alt="R" title="ui.work.form.lbl.rights" /> <%= glp("ui.work.form.lbl.rights") %></a>
               </li>
               
               <% if (showParentTab) { %>
               <li role="presentation">
                 <a href="#parent-tab" data-toggle="tab" onclick="return false;" aria-controls="paths" role="tab"><jalios:icon src='folder' /> <%= glp("ui.work.cat.tab.parent") %></a>
               </li>
               <% } %>
               
               <li role="presentation">
                 <a href="#advanced-tab" data-toggle="tab" onclick="return false;" aria-controls="paths" role="tab"><jalios:icon src='advanced' /> <%= glp("ui.work.form.tab.adv") %></a>
               </li>
             </ul>
             
             <div class="tab-content">
             
               <%-- *** GENERAL TAB ***************************************** --%>
               <div id='general-tab' class="tab-pane fade active in">
                 <jalios:include target="EDIT_CAT_MAINTAB_HEADER" />

                 <%-- Name ------------------------------------------------------------ --%>
                 <jalios:field name="name" label="ui.com.lbl.name" required='true' ml='<%= channel.isMultilingual() %>' value='<%= formHandler.getAllAvailableNameML() %>'>
                   <jalios:control settings='<%= new TextFieldSettings().showLanguageChooser() %>' />
                 </jalios:field>

                 <%-- Description ------------------------------------------------------------ --%>
                 <jalios:field name="description" label="ui.com.lbl.description" ml='<%= channel.isMultilingual() %>' value='<%= formHandler.getAllAvailableDescriptionML() %>'>
                   <jalios:control settings='<%= new TextAreaSettings().rows(2) %>' />
                 </jalios:field>

                 <%-- Synonym ---------------------------------------- --%>
                 <jalios:field name="synonymList" label="ui.work.cat.lbl.synonyms" description="ui.work.cat.lbl.synonyms.h" value='<%= Util.join(formHandler.getAvailableSynonyms(),", ") %>'>
                   <jalios:control settings='<%= new TextAreaSettings().rows(2) %>' />
                 </jalios:field>

                 <%-- Extension ---------------------------------------- --%>
                 <%@ include file="/types/CategoryExtension/doEditCategoryExtension.jspf" %>

                 <jalios:include target="EDIT_CAT_MAINTAB_FOOTER" />
               </div>
               
               <%-- *** PRESENTATION TAB ***************************************** --%>
               <div id='presentation-tab' class="tab-pane fade in">
                <jalios:include target="EDIT_CAT_PRESENTATIONTAB_HEADER" />

                <%-- Icon ------------------------------------------------------------ --%>
                <jalios:field name="icon" label="ui.work.cat.lbl.icon" description="ui.work.cat.lbl.icon.h" ml='<%= channel.isMultilingual() %>' value='<%= formHandler.getAllAvailableIconML() %>'>
                  <jalios:control type="<%= ControlType.IMAGEPATH %>" />
                </jalios:field>

                <%-- Image ------------------------------------------------------------ --%>
                <jalios:field name="image" label="ui.work.cat.lbl.image" description="ui.work.cat.lbl.image.h" ml='<%= channel.isMultilingual() %>' value='<%= formHandler.getAllAvailableImageML() %>'>
                  <jalios:control type="<%= ControlType.IMAGEPATH %>" />
                </jalios:field>

                <%-- Color ------------------------------------------------------------ --%>
                <jalios:field name="color" label="ui.work.cat.lbl.color" description="ui.work.cat.lbl.color.h" value='<%= formHandler.getAvailableColor() %>'>
                  <jalios:control type="<%= ControlType.COLOR %>" />
                </jalios:field>

                <jalios:include target="EDIT_CAT_PRESENTATIONTAB_FOOTER" />

               </div>
               
               <%-- *** FRIENDLY URL TAB ***************************************** --%>
               <div id='friendly-url-tab' class="tab-pane fade in">
                 <jalios:include target="EDIT_CAT_FRIENDLYURLTAB_HEADER" />
                 <% request.setAttribute("data", category); %>
                 <%@ include file='/work/doEditFriendlyURL.jspf' %>
                 <jalios:include target="EDIT_CAT_FRIENDLYURLTAB_FOOTER" />
               </div>
               

             
               <%-- *** RIGHTS TAB (containging read rights, management rights) ***** --%>
               <div id='rights-tab' class="tab-pane fade in">
                 <jalios:include target="EDIT_CAT_RIGHTSTAB_HEADER" />
               
                 <ul class="nav nav-tabs nav-tabs-underlined is-left-aligned" role="tablist">
                   <li role="presentation" class="active">
                     <a href="#read-rights-tab" data-toggle="tab" onclick="return false;" aria-controls="paths" role="tab"><jalios:icon src='read-right' /> <%= glp("ui.work.form.lbl.read-rights") %></a>
                   </li>
                   <li role="presentation">
                     <a href="#use-rights-tab" data-toggle="tab" onclick="return false;" aria-controls="paths" role="tab"><jalios:icon src='read-right' /> <%= glp("ui.work.cat.tab.use-rights") %></a>
                   </li>
                   <li role="presentation">
                     <a href="#management-rights-tab" data-toggle="tab" onclick="return false;" aria-controls="paths" role="tab"><jalios:icon src='read-right' /> <%= glp("ui.work.cat.tab.manage-rights") %></a>
                   </li>
                 </ul>
                 
                 <div class="tab-content">
                 
               <%-- *** READ RIGHT TAB ***************************************** --%>
               <div id='read-rights-tab' class="tab-pane active fade in">
                <jalios:include target="EDIT_CAT_READRIGHTTAB_HEADER" />

                <jalios:field  name="authorizedGroupIds" label="ui.com.lbl.groups" value='<%= formHandler.getAvailableAuthorizedGroupSet() %>' mv='<%= 1 %>' css='nodnd'>
                  <jalios:control type="<%= ControlType.GROUP %>" />
                </jalios:field>

                <jalios:field  name="authorizedMemberIds" label="ui.com.lbl.members" value='<%= formHandler.getAvailableAuthorizedMemberSet() %>' mv='<%= 1 %>' css='nodnd'>
                  <jalios:control settings="<%= new MemberSettings().filter(MemberSettings.MemberFilter.ACCOUNT) %>" />
                </jalios:field>

                <jalios:include target="EDIT_CAT_READRIGHTTAB_FOOTER" />
               </div>
               
               <%-- *** USE RIGHTS TAB ***************************************** --%>
               <div id='use-rights-tab' class="tab-pane fade in">
                <jalios:include target="EDIT_CAT_USERIGHTTAB_HEADER" />

                <jalios:field  name="useGroupIds" label="ui.com.lbl.groups" value='<%= formHandler.getAvailableUseGroupSet() %>' mv='<%= 1 %>' css='nodnd'>
                  <jalios:control type="<%= ControlType.GROUP %>" />
                </jalios:field>

                <jalios:field  name="useMemberIds" label="ui.com.lbl.members" value='<%= formHandler.getAvailableUseMemberSet() %>' mv='<%= 1 %>' css='nodnd'>
                  <jalios:control settings="<%= new MemberSettings().filter(MemberSettings.MemberFilter.ACCOUNT) %>" />
                </jalios:field>

                <jalios:include target="EDIT_CAT_USERIGHTTAB_FOOTER" />
               </div>
               
               <%-- *** MANAGEMENT RIGHTS TAB ***************************************** --%>
               <div id='management-rights-tab' class="tab-pane fade in">
                <jalios:include target="EDIT_CAT_MANAGERIGHTTAB_HEADER" />

                <jalios:field  name="managerGroupIds" label="ui.com.lbl.groups" value='<%= formHandler.getAvailableManagerGroupSet() %>' mv='<%= 1 %>' css='nodnd'>
                  <jalios:control type="<%= ControlType.GROUP %>" />
                </jalios:field>

                <jalios:field  name="managerMemberIds" label="ui.com.lbl.members" value='<%= formHandler.getAvailableManagerMemberSet() %>' mv='<%= 1 %>' css='nodnd'>
                  <jalios:control settings="<%= new MemberSettings().filter(MemberSettings.MemberFilter.ACCOUNT) %>" />
                </jalios:field>

                <jalios:include target="EDIT_CAT_MANAGERIGHTTAB_FOOTER" />

               </div>
               
                 </div> <%-- End RIGHTS TABS tab-content--%>
                 <jalios:include target="EDIT_CAT_RIGHTSTAB_FOOTER" />
               </div> <%-- End RIGHTS TABS --%>
               
               <%-- *** PARENT TAB ***************************************** --%>
               <% if (showParentTab) { %>
               <div id='parent-tab' class="tab-pane fade in">
                 <jalios:include target="EDIT_CAT_PARENTTAB_HEADER" />
                 <jalios:message msg="ui.work.cat.txt.parent" />
                 <br />
                 <%
                  TreeSet selectedSet = new TreeSet();
                  if (parent != null)
                    selectedSet.add(parent);
                  %>


                <jalios:treecatview
                    prefix="pid"
                    input="pid"
                    type="radio"

                    opened="<%= selectedSet %>"
                    checked="<%= selectedSet %>"
                    highlighted="<%= selectedSet %>"

                    collection="<%= formHandler.getRootCategories() %>"
                    filter="<%= com.jalios.jcms.taglib.CategoryFilter.MANAGE %>"

                    selectable="false"
                    dragdrop="true"
                    showCtxMenu="true"
                    css="autocomplete"

                    memo='<%= Util.getHashMap("required", true) %>' />


                 <jalios:include target="EDIT_CAT_PARENTTAB_FOOTER" />
               </div>
               <% } else { %>
               <input type="hidden" name="pid" value="<%= parent.getId() %>" />
               <% } %>
                
               <%-- *** ADVANCED TAB ***************************************** --%>
               <div id='advanced-tab' class="tab-pane fade in">
                 <jalios:include target="EDIT_CAT_ADVTAB_HEADER" />

                 <jalios:field  name="newTab" label="ui.work.cat.lbl.new-tab" description="ui.work.cat.lbl.new-tab.h" value='<%= ""+formHandler.getAvailableNewTab() %>'>
                   <jalios:control type="<%= ControlType.BOOLEAN %>" />
                 </jalios:field>

                 <jalios:field  name="selectable" label="ui.work.cat.lbl.selectable" description="ui.work.cat.lbl.selectable.h" value='<%= ""+formHandler.getAvailableSelectable() %>'>
                   <jalios:control type="<%= ControlType.BOOLEAN %>" />
                 </jalios:field>

                 <jalios:field  name="childrenOrder" label="ui.work.cat.lbl.child-order" description="ui.work.cat.lbl.child-order.h" required='true' value='<%= ""+formHandler.getAvailableChildrenOrder() %>'>
                   <jalios:control settings='<%= new EnumerateSettings().select()
                                                        .enumValues(String.valueOf(Category.CUSTOM_ORDER), String.valueOf(Category.ALPHABETICAL_ORDER))
                                                        .enumLabels("ui.work.cat.lbl.custom", "ui.work.cat.lbl.alphabet") %>' />
                 </jalios:field>

                 <%-- INDEXING DATE ----------------------------------------------------- --%>
                 <% if (category != null ) { %>
                 <jalios:field name="indexingDate" label="ui.com.lbl.idx-date-long" id="">
                   <p class="form-control-static">
                     <jalios:date date='<%= category.getIndexingDate() %>' format='timeDateOrTime' />
                   </p>
                 </jalios:field>
                 <% } %>

                 <%-- ID ---------------------------------------- --%>
                 <% if (category != null ) { %>
                 <jalios:field name="idInfo" label="ui.com.lbl.id" id="">
                   <p class="form-control-static">
                     <%= category.getId() %>
                   </p>
                 </jalios:field>
                 <% } %>

                 <%-- EXTRA DATA INFO ----------------------------------------- --%>
                 <jalios:include jsp="/jcore/doEditExtraData.jsp" />

                 <jalios:include target="EDIT_CAT_ADVTAB_FOOTER" />
               </div>
             </div>

                <%-- Buttons ---------------------------------------- --%>
                <table class='layout'>
                  <tr>
                    <td class='vTop text-left'>
                      <input type='hidden' name='action' value='true' />
                      <% if (popupEdition) { %>
                      <input type='hidden' name='popupEdition' value='<%= popupEdition %>' />
                      <% } %>
                      <% if (!formHandler.isWorkspaceFilter() ) { %>
                        <input type='hidden' name='workspaceFilter' value='<%= false %>' />
                      <% } %>
                      <% if (Util.notEmpty(formHandler.getRedirect()) ) { %>
                        <input type='hidden' name='redirect' value='<%= formHandler.getRedirect() %>' />
                      <% } %>
                     <% if (category == null) { %>
                        <%= WidgetUtil.printSubmitFormButton(glp("ui.com.btn.save"), "opCreate", "editForm", userLang) %>
                     <% } else { %>
                      <input type='hidden' name='id' value='<%= category.getId() %>' />
                      <%= WidgetUtil.printSubmitFormButton(glp("ui.com.btn.save"), "opUpdate", "editForm", userLang) %>
                      <%= WidgetUtil.printSubmitFormButton(glp("ui.com.btn.cancel"), "opCancel", "editForm", userLang) %>

                      <%   if (category.isLeaf()) { %>
                       <% String confirmDelete = encodeForHTMLAttribute(glp("msg.js.confirm-delete", category.getName(userLang))); %>
                       <a class="btn btn-default modal confirm-danger btn-category-action-edit" href="<%= contextPath %>/work/editCat.jsp?opDelete=true&amp;id=<%= category.getId() %><%= wsFilterParam %><%= redirectParam %>" data-jalios-confirm-message="<%= confirmDelete %>"><%= glp("ui.com.btn.delete") %></a>
                      <%   } else { %>
                       <% String confirmDeepDelete = encodeForHTMLAttribute(glp("msg.js.confirm-deep-delete", category, Util.join(category.getChildrenSet(), ", ", 3, ".."))); %>
                       <a class="btn btn-default modal confirm-danger btn-category-action-delete" href="<%= contextPath %>/work/editCat.jsp?opDelete=true&amp;id=<%= category.getId() %><%= wsFilterParam %><%= redirectParam %>" data-jalios-confirm-message="<%= confirmDeepDelete %>"><%= glp("ui.com.btn.deep-delete") %></a>
                      <%   } %>
                      <a class="modal btn btn-default btn-category-action-merge" href="work/mergeCategory.jsp?srcCat=<%= category.getId() %>&amp;redirect=<%= ServletUtil.encodeURL("work/editCat.jsp?pid=" + parent.getId()) %>"><%= glp("ui.work.cat.lbl.merge") %></a>
                      <% } %>
                      <input type="hidden" name="anchor" />
                    </td>
                  </tr>
                </table>
            </form>
          </td>
        </tr>
        <% } %>
      </table>

<% if (!popupEdition) { %>
     </div>
    </td>
  </tr>
</table>
<% } %>


<% if (formHandler.isTabForced() ) { %>
<jalios:javascript>
  setSelectedTab("mainTab", <%= formHandler.getOpenTab() %>);
  <% if (category == null && formHandler.getWorkingCat() == null) { %>
    if ($('createNewCatButton'))  {
     $('createNewCatButton').focus();
    } else {
      document.editForm.elements[0].focus();
    }
  <% } else { %>
    document.editForm.elements[0].focus();
  <% } %>
</jalios:javascript>
<% } %>


<% if (!popupEdition) { %>
<%@ include file='/work/doWorkFooter.jspf' %>
<% } else { %>
</div><%-- <div id="popupEdition">--%>
<%@ include file='/jcore/doEmptyFooter.jspf' %>
<% } %>
