<%--
  @Summary: Manage group of the caddy
  @Category: Admin Area / Caddy
  @Author: Oliver Jaquemet
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-5.5.0
--%>
<%@ include file='/jcore/doInitPage.jspf' %>
<jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.caddy.GroupCaddyManagerHandler">
  <jsp:setProperty name="formHandler" property="pageContext" value="<%= pageContext %>"/>
  <jsp:setProperty name="formHandler" property="*" />
</jsp:useBean>
<% 
  if (formHandler.validate()) {
    return;
  }
  jcmsContext.addCSSHeader("css/jalios/core/jalios-caddy.css");
  request.setAttribute("caddyWAMenu", "true");
  request.setAttribute("caddyGroupMenu", "true");
  request.setAttribute("title", glp("ui.work.grp-caddy.title", 0));
%><%@ include file='/admin/doAdminOrWorkHeader.jspf' %>
<div class="page-header">
  <h1 class='boTitle icon iconGroup'><% /* %>Caddy Manager<% */ %><%= glp("ui.work.grp-caddy.title", Caddy.getCaddy(request).getGroupListSize()) %></h1>
</div>
<form action='work/caddy/groupCaddyManager.jsp' name='editForm' method='post' class="form-horizontal form-caddy">

    <%@ include file='/jcore/doMessageBox.jspf' %>
    
    <div class="tab-pane" id="mainTab">

      <%-- *** GENERAL TAB ***************************************** --%> 
      <div class="tab-page">
        <h2 class="tab"><% /* %>General<% */ %><%= glp("ui.com.tab.general") %></h2>  
        
        <%-- Workspace --%>
        <% if (isAdmin) { %>
        <div class="col-xs-12">
          <div class="row">
           <jalios:field name='newWSId' label='ui.com.lbl.workspace' required='<%= false %>' value='<%= formHandler.getAvailableWorkspace() %>'>
              <jalios:control type="<%= ControlType.WORKSPACE %>" />
              <jalios:buffer name='WIDGET_APPEND'>
                <label>
                  <input type="checkbox" name="noWorkspace" value="true" />
                  <%= glp("ui.work.grp-caddy.lbl.no-workspace") %>
                </label>
              </jalios:buffer>
            </jalios:field>
          </div>
        </div>
        <% } %>

        <div class="col-xs-12">
          <div class="row">
            <%@ include file='/work/caddy/doCommonCaddyManager.jspf' %>
          </div>
        </div>
      </div>

      <%-- *** PUBLISH RIGHT ************************************** --%>
      <div class="tab-page">
        <h2 class="tab"><% /* %>Publish Rights<% */ %><%= glp("ui.adm.grp-edit.tab.pub-r") %></h2>
        <div class="tab-pane" id="publish-content">
        <% 
          int counter = 0;
          List  typeList = formHandler.getAvailableTypeList();
          Class[] tabClass = channel.getPublicationSuperTypes();
        %>
        <jalios:foreach array='<%= tabClass %>' type='java.lang.Class' name='itSuperClass' counter="c1">
          <% 
            String itSuperClassName = Util.getClassShortName(itSuperClass.getName());
            boolean isPublishRightCommonSuper = formHandler.isPublishRightCommon(itSuperClass);
            boolean canPublishClassSuper      = formHandler.canPublish(itSuperClass);
            boolean isUpdateRightCommonSuper  = formHandler.isUpdateRightCommon(itSuperClass);
            boolean canUpdateClassSuper       = formHandler.canUpdate(itSuperClass);
            boolean isDeleteRightCommonSuper  = formHandler.isDeleteRightCommon(itSuperClass);
            boolean canDeleteClassSuper       = formHandler.canDelete(itSuperClass);
          %>
          <div class="tab-page">
            <h2 class="tab"><% /* %>Content Rights<% */ %><%= channel.getTypeLabel(itSuperClass,formHandler.getWorkspace(),userLang) %></h2>
          <table id='rightTable' class="table-data table-condensed">
            <thead>
              <tr>
                <th nowrap="nowrap"><%= glp("ui.com.lbl.type") %></th>
                <th nowrap="nowrap"><%= glp("ui.adm.grp-edit.pub-r.publish") %></th>
                <th nowrap="nowrap"><%= glp("ui.adm.grp-edit.pub-r.update") %></th>
                <th nowrap="nowrap"><%= glp("ui.adm.grp-edit.pub-r.delete") %></th>
              </tr>
            </thead> 
            
            <tbody>
              <jalios:foreach name="itClass" type="Class" collection="<%= typeList %>" counter="c2">
              <%
                boolean isPublishRightCommon = formHandler.isPublishRightCommon(itClass);
                boolean canPublishClass      = formHandler.canPublish(itClass);
                boolean isUpdateRightCommon  = formHandler.isUpdateRightCommon(itClass);
                boolean canUpdateClass       = formHandler.canUpdate(itClass);
                boolean isDeleteRightCommon  = formHandler.isDeleteRightCommon(itClass);
                boolean canDeleteClass       = formHandler.canDelete(itClass);
                if (itClass != null && itSuperClass.isAssignableFrom(itClass)) {
                  String name = Util.getClassShortName(itClass); 
                  counter++;
                %>
                <tr> 
                  <td><b><%= channel.getTypeLabel(itClass,formHandler.getWorkspace(), userLang) %></b></td>
                  <td class="text-left">
                    <select name='canPublish' id="<%= itSuperClassName + counter %>" class="form-control">
                      <option value='<%= name %>|true' <%= (isPublishRightCommon && canPublishClass) ? "selected" : "" %>> <%= glp("ui.work.grp-caddy.lbl.can-publish") %></option>
                      <option value='<%= name %>|false' <%= (isPublishRightCommon && !canPublishClass) ? "selected" : "" %>> <%= glp("ui.work.grp-caddy.lbl.cannot-publish") %></option>
                      <option value='<%= name %>|<%= GroupCaddyManagerHandler.NOT_COMMON %>'<%= !isPublishRightCommon ? "selected" : "" %>> <%= glp("ui.work.grp-caddy.lbl.not-common") %></option>
                    </select>
                    <% if (counter == 1) { %>
                    <a href='#' onclick='selectAllwithId(document.editForm, "canPublish", "<%= itSuperClassName %>"); return false;'><jalios:icon src='bullet-square-down-arrow' title='ui.com.alt.select-all' /></a>
                    <% } else { %>
                    <img src='s.gif' width="11" height="13" title='' alt=''/>
                    <% } %>
                  </td>
                  <td class="text-left">
                    <select name='canUpdate' id="<%= itSuperClassName + counter %>" class="form-control">
                      <option value='<%= name %>|true' <%= (isUpdateRightCommon && canUpdateClass) ? "selected" : "" %>> <%= glp("ui.work.grp-caddy.lbl.can-update") %></option>
                      <option value='<%= name %>|false' <%= (isUpdateRightCommon && !canUpdateClass) ? "selected" : "" %>> <%= glp("ui.work.grp-caddy.lbl.cannot-update") %></option>
                      <option value='<%= name %>|<%= GroupCaddyManagerHandler.NOT_COMMON %>'<%= !isUpdateRightCommon ? "selected" : "" %>> <%= glp("ui.work.grp-caddy.lbl.not-common") %></option>
                    </select>
                    <% if (counter == 1) { %>
                    <a href='#' onclick='selectAllwithId(document.editForm, "canUpdate", "<%= itSuperClassName %>"); return false;'><jalios:icon src='bullet-square-down-arrow' title='ui.com.alt.select-all' /></a>
                    <% } else { %>
                    <img src='s.gif' width="11" height="13" title='' alt=''/>
                    <% } %>
                  </td>
                  <td class="text-left">
                    <select name='canDelete' id="<%= itSuperClassName + counter %>" class="form-control">
                      <option value='<%= name %>|true' <%= (isDeleteRightCommon && canDeleteClass) ? "selected" : "" %>> <%= glp("ui.work.grp-caddy.lbl.can-delete") %></option>
                      <option value='<%= name %>|false' <%= (isDeleteRightCommon && !canDeleteClass) ? "selected" : "" %>> <%= glp("ui.work.grp-caddy.lbl.cannot-delete") %></option>
                      <option value='<%= name %>|<%= GroupCaddyManagerHandler.NOT_COMMON %>'<%= !isDeleteRightCommon ? "selected" : "" %>> <%= glp("ui.work.grp-caddy.lbl.not-common") %></option>
                    </select>
                    <% if (counter == 1) { %>
                    <a href='#' onclick='selectAllwithId(document.editForm, "canDelete", "<%= itSuperClassName %>"); return false;'><jalios:icon src='bullet-square-down-arrow' title='ui.com.alt.select-all' /></a>
                    <% } else { %>
                    <img src='s.gif' width="11" height="13" title='' alt=''/>
                    <% } %>
                  </td>
                </tr>
              <% } /* end if */ %>
              </jalios:foreach>
              <% counter++; %>
              <tr>
                <td><b><% /* %>Future Types<% */ %><%= glp("ui.adm.grp-edit.pub-r.future", channel.getTypeLabel(itSuperClass,formHandler.getWorkspace(), userLang)) %></b></td>
                <td class="text-left">
                  <select name='canPublish' id="<%= itSuperClassName + counter %>" class="form-control">
                    <option value='<%= itSuperClassName %>|true' <%= (isPublishRightCommonSuper && canPublishClassSuper) ? "selected" : "" %>> <%= glp("ui.work.grp-caddy.lbl.can-publish") %></option>
                    <option value='<%= itSuperClassName %>|false' <%= (isPublishRightCommonSuper && !canPublishClassSuper) ? "selected" : "" %>> <%= glp("ui.work.grp-caddy.lbl.cannot-publish") %></option>
                    <option value='<%= itSuperClassName %>|<%= GroupCaddyManagerHandler.NOT_COMMON %>'<%= !isPublishRightCommonSuper ? "selected" : "" %>> <%= glp("ui.work.grp-caddy.lbl.not-common") %></option>
                  </select>
                  <img src='s.gif' width="11" height="13" title='' alt=''/>
                </td>
                <td class="text-left">
                  <select name='canUpdate' id="<%= itSuperClassName + counter %>" class="form-control">
                    <option value='<%= itSuperClassName %>|true' <%= (isUpdateRightCommonSuper && canUpdateClassSuper) ? "selected" : "" %>> <%= glp("ui.work.grp-caddy.lbl.can-update") %></option>
                    <option value='<%= itSuperClassName %>|false' <%= (isUpdateRightCommonSuper && !canUpdateClassSuper) ? "selected" : "" %>> <%= glp("ui.work.grp-caddy.lbl.cannot-update") %></option>
                    <option value='<%= itSuperClassName %>|<%= GroupCaddyManagerHandler.NOT_COMMON %>'<%= !isUpdateRightCommonSuper ? "selected" : "" %>> <%= glp("ui.work.grp-caddy.lbl.not-common") %></option>
                  </select>
                  <img src='s.gif' width="11" height="13" title='' alt=''/>
                </td>
                <td class="text-left">
                  <select name='canDelete' id="<%= itSuperClassName + counter %>" class="form-control">
                    <option value='<%= itSuperClassName %>|true' <%= (isDeleteRightCommonSuper && canDeleteClassSuper) ? "selected" : "" %>> <%= glp("ui.work.grp-caddy.lbl.can-delete") %></option>
                    <option value='<%= itSuperClassName %>|false' <%= (isDeleteRightCommonSuper && !canDeleteClassSuper) ? "selected" : "" %>> <%= glp("ui.work.grp-caddy.lbl.cannot-delete") %></option>
                    <option value='<%= itSuperClassName %>|<%= GroupCaddyManagerHandler.NOT_COMMON %>'<%= !isDeleteRightCommonSuper ? "selected" : "" %>> <%= glp("ui.work.grp-caddy.lbl.not-common") %></option>
                  </select>
                  <img src='s.gif' width="11" height="13" title='' alt=''/>
                </td>
              </tr>
            </tbody>
          </table>
          </div>
        </jalios:foreach>
        </div>
        <ul>
          <li><%= glp("ui.adm.grp-edit.pub-r.txt.publish") %></li>
          <li><%= glp("ui.adm.grp-edit.pub-r.txt.update") %></li>
          <li><%= glp("ui.adm.grp-edit.pub-r.txt.delete") %></li>
        </ul>
      </div>
      
      <%-- *** CATEGORY USAGE RIGHT ************************************** --%>
      <div class="tab-page">
        <h2 class="tab"><% /* %>Category Usage Rights<% */ %><%= glp("ui.adm.grp-edit.tab.cat-use-r") %></h2>
        
        <jalios:field name='<%= "useCids" %>'
                      label='<%= "ui.work.form.lbl.categories" %>'
                      value='<%= formHandler.getUseCategorySet() %>'>
          <% if (loggedMember.canEditCategories()) { %>
            <div>          
              <label>
                <input type="checkbox" name="noCommonUseCategory" value="true" />
                <% /* %>Remove common categories<% */ %><%= glp("ui.work.caddy.lbl.no-common-cat") %>
              </label>
            </div>          
            <div>          
              <label>
                <input type="checkbox" name="noUseCategory" value="true" />
                <% /* %>Remove all categories<% */ %><%= glp("ui.work.caddy.lbl.no-cat") %>
              </label>
            </div>
          <% } %>
          
          <p><%= glp("ui.adm.grp-edit.cat-use-r.title") %></p>
          <jalios:control settings='<%= new CategorySettings().tree().multiple().root(channel.getRootCategoryAsSet()).filter(CategoryFilter.READ) %>' />
        </jalios:field>
        
      </div>
    
      <%-- *** CATEGORY EDITOR RIGHT ************************************** --%>
      <div class="tab-page">
        <h2 class="tab"><% /* %>Category Editor Rights<% */ %><%= glp("ui.adm.grp-edit.tab.cat-ed-r") %></h2>
        
        <jalios:field name='<%= "editCids" %>'
                      label='<%= "ui.work.form.lbl.categories" %>'
                      value='<%= formHandler.getEditCategorySet() %>'>
          <% if (loggedMember.canEditCategories()) { %>
            <div>          
              <label>
                <input type="checkbox" name="noCommonEditCategory" value="true" />
                <% /* %>Remove common categories<% */ %><%= glp("ui.work.caddy.lbl.no-common-cat") %>
              </label>
            </div>          
            <div>          
              <label>
                <input type="checkbox" name="noEditCategory" value="true" />
                <% /* %>Remove all categories<% */ %><%= glp("ui.work.caddy.lbl.no-cat") %>
              </label>
            </div>
          <% } %>
          
          <p><%= glp("ui.adm.grp-edit.cat-ed-r.title") %></p>
          <jalios:control settings='<%= new CategorySettings().tree().multiple().root(channel.getRootCategoryAsSet()).filter(CategoryFilter.READ) %>' />
        </jalios:field>
        
      </div>
      
      <%-- *** Advanced ************************************** --%>
      <div class="tab-page">
        <h2 class="tab"><% /* %>Advanced<% */ %><%= glp("ui.work.form.tab.adv") %></h2>
      
        <%-- Group Order --%>
        <jalios:field name="order" label="ui.adm.grp-list.lbl.order">
          <jalios:control settings='<%= new EnumerateSettings().enumValues("ResetOrder", "CaddyOrder").enumLabels("ui.work.grp-caddy.lbl.order-reset", "ui.work.grp-caddy.lbl.order-caddy") %>' />
        </jalios:field>
        
        <%-- Group Visibility --%>
        <jalios:field name='visibility' label='<%= glp("ui.adm.grp-list.lbl.visibility") %>' description='<%= glp("ui.adm.grp-edit.txt.visibility") %>' value='<%= "" + formHandler.getAvailableVisibility() %>'>
          <jalios:control settings='<%= new EnumerateSettings().select().enumValues(formHandler.getVisibilityValues() ).enumLabels(formHandler.getVisibilityLabels()) %>' />
        </jalios:field>
        
        <%-- Cookie Max Age --%>
        <jalios:field  name='<%= "cookieMaxAge" %>' label='<%= glp("ui.adm.grp-list.lbl.max-age") %>' description='<%= glp("ui.adm.grp-edit.txt.max-age") %>'
                        value='<%= formHandler.getAvailableCookieMaxAge() != 0 ? String.valueOf(formHandler.getAvailableCookieMaxAge()) : null %>'>
           <jalios:control type="<%= ControlType.DURATION %>" />
           <jalios:buffer name="WIDGET_APPEND">
              <label>
                <input type="checkbox" name="cookieMaxAgeUseDefaultValue" value="true" /> 
                <%= glp("ui.work.grp-caddy.lbl.cookie-default") %> (<jalios:duration time='<%= 1000L * channel.getIntegerProperty("cookie.max-age", JcmsConstants.COOKIE_MAX_AGE) %>' locale="<%= userLocale %>"/>)</span>
              </label>
           </jalios:buffer>
        </jalios:field>
        
        <%-- ParentSet --%>
        <jalios:field  name="parentIds" label="ui.com.lbl.parent-grp" required='<%= false %>' value='<%= formHandler.getAvailableParentSet() %>' mv='<%= 3 %>'>
          <jalios:control type="<%= ControlType.GROUP %>" />
          <jalios:buffer name="WIDGET_APPEND">
            <label>
              <input type="checkbox" name="noParentSet" value="true" /> 
              <%= glp("ui.work.grp-caddy.lbl.no-parent") %>
            </label>
           </jalios:buffer>
        </jalios:field>

        <%-- LDAP DN --%>
        <jalios:field  name="parentIds" label="ui.com.lbl.ldap-dn">
           <label>
             <input type="checkbox" name="noLdapDN" value="true" /> 
             <%= glp("ui.work.grp-caddy.lbl.no-ldap-dn") %>
           </label>
        </jalios:field>

        <%-- LDAP Sync --%>
        <jalios:field name="ldapSync" label="ui.com.lbl.ldap-sync" 
                      value='<%= formHandler.isComputedLdapSyncAvailable() ? formHandler.getComputedLdapSync() : "" %>'>
          <jalios:control type="<%= ControlType.BOOLEAN %>" />
        </jalios:field>
       
      </div>

    </div>

  <% ArrayList<Group> groupList = Caddy.getCaddy(request).getGroupList(); %>
  <jalios:pager name='caddyPagerHandler' declare='true' action='init' size='<%= groupList.size() %>'/>

  <p>
  <%
   boolean showExportCSV = true;
   Collection<Group> caddyDataSet = groupList;
  %>
  <%@ include file='/work/caddy/doCommonCaddyManagerButton.jspf' %>
  </p>
  
  <%-- GROUP CADDY CONTENT --------------------------------------------------------------- --%>
  <% if (caddyPagerHandler.getItemsNbr() != 0) { %>
    <div style="margin-top:15px;" class="table-responsive">
    
      <table id='groupTable' class="table-data table-condensed">
        <thead>
          <tr>
            <td colspan="2"></td>
            <th class="caddy-item-title"><% /* %>Name<% */ %><%= glp("ui.com.lbl.name") %></th>
            <th nowrap="nowrap"><%= glp("ui.com.lbl.parent-grp") %></th>
            <th nowrap="nowrap"><% /* %>Workspace<% */ %><%= glp("ui.com.lbl.workspace") %></th>
            <th nowrap="nowrap"><% /* %>Order<% */ %><%= glp("ui.adm.grp-list.lbl.order") %></th>
            <th nowrap="nowrap"><% /* %>Cookie Max-Age<% */ %><%= glp("ui.adm.grp-list.lbl.max-age") %></th>
            <th nowrap="nowrap"><% /* %>#Members<% */ %><%= glp("ui.adm.grp-list.lbl.mbr-cnt") %></th>
            <th nowrap="nowrap"><% /* %>Created<% */ %><%= glp("ui.com.lbl.cdate") %></th>
            <th nowrap="nowrap"><% /* %>Ext.<% */ %><%= glp("ui.adm.grp-list.lbl.ext") %></th>
            <th nowrap="nowrap"><% /* %>Last Sync.<% */ %><%= glp("ui.com.lbl.ldap-sync") %></th>
            <th nowrap="nowrap"><% /* %>ID<% */ %><%= glp("ui.com.lbl.id") %></th>
            <td></td>
          </tr>
        </thead>
      
        <tbody>
          <jalios:foreach name="itGroup" 
                          type="Group"
                          collection="<%= groupList %>"
                          max="<%= caddyPagerHandler.getPageSize() %>"
                          skip="<%= caddyPagerHandler.getStart() %>"> 
          <tr> 
            <%-- --- GRP / COUNTER --------------------------- --%>
            <td class="text-right" nowrap="nowrap">
              <%= caddyPagerHandler.getStart() + itCounter.intValue() %>.
            </td>
            <%-- --- GRP / EDIT --------------------------- --%>
            <td nowrap='nowrap'><jalios:edit id="<%= itGroup.getId() %>" css="btn btn-rounded"/></td>
            <%-- --- GRP / NAME --------------------------- --%>
            <td class="caddy-item-title">
              <jalios:icon src='group'  /> <a href="admin/memberList.jsp?gid=<%= itGroup.getId() %>" class="ID_<%= itGroup.getId() %> ctxTooltipCard"><%= itGroup.getName(userLang) %></a>
              <%= itGroup == channel.getDefaultGroup() ? " (" + glp("ui.adm.prop.mbr.def-grp") + ")" : "" %>
              <% 
                if (formHandler.isPreviewing()) {
                  String previewedString = formHandler.previewSearchAndReplace(itGroup.getName(userLang), null);
                  boolean previewedStringDiffers = !previewedString.equals(itGroup.getName(userLang));
              %>
                <% if (previewedStringDiffers) { %><span style="color: red;"><% } %>
                <br /> ==> <%= previewedString %>
                <% if (previewedStringDiffers) { %></span><% } %>
              <% } %>   
            </td>
            <%-- --- GRP / PARENT --------------------------- --%>
            <td nowrap="nowrap">
              <ul>
              <jalios:foreach collection='<%= itGroup.getParentSet() %>' name='itParent' type='Group' counter='itCounter2'>
                <li><a href="admin/memberList.jsp?gid=<%= itParent.getId() %>" class="ID_<%= itParent.getId() %> ctxTooltipCard"><%= itParent.getIcon(userLang, true) %> <%= itParent %></a></li>
               </jalios:foreach>
            </td>
            <%-- --- GRP / WORKSPACE --------------------------- --%>
            <td nowrap="nowrap"><jalios:if predicate='<%= itGroup.getWorkspace() != null %>'><a href='<%= ServletUtil.getResourcePath(request) %>?groupFilter=<%= itGroup.getWorkspace().getId() %>'><%= itGroup.getWorkspace().getTitle(userLang) %></a></jalios:if></td>
            <%-- --- GRP / ORDER --------------------------- --%>
            <td class="text-right"><%= itGroup.getOrder() %></td>
            <%-- --- GRP / COOKIE MAX AGE --------------------------- --%>
            <td class="text-right" nowrap="nowrap">
              <% if (itGroup.getCookieMaxAge() == 0) { %>
                <% /* %>Default Value<% */ %><%= glp("ui.adm.grp-edit.lbl.max-age.def") %> (<jalios:duration time='<%= 1000L * channel.getIntegerProperty("cookie.max-age", JcmsConstants.COOKIE_MAX_AGE) %>'/>)
              <% } else { %>
                <jalios:duration time='<%= 1000L * itGroup.getCookieMaxAge() %>'/>
              <% } %>
            </td>
            <%-- --- GRP / #MEMBERS --------------------------- --%>
            <td class="text-right">
              <% if (itGroup.getMemberSet().size() > 0) { %>
              <a href="admin/memberList.jsp?gid=<%= itGroup.getId() %>"><%= itGroup.getMemberSet().size() %></a>
              <% } else { %>
              <%= itGroup.getMemberSet().size() %>
              <% } %>
            </td>
            <%-- --- GRP / CDATE --------------------------- --%>
            <td class="text-right"><jalios:date date='<%= itGroup.getCdate() %>' format='<%= "short" %>'/></td>
            <%-- --- GRP / EXTENSION --------------------------- --%>
            <td class="text-center"><%= itGroup.getExtension() != null ? channel.getProperty("list.boolean.on", "X") : channel.getProperty("list.boolean.off", "&nbsp;") %></td>
            <%-- --- MBR / LDAP --------------------------- --%>
            <td class="text-right"><jalios:date date='<%= itGroup.getLastLdapSynchro() %>' format='<%= "short" %>'/></td>
            <%-- --- GRP / ID --------------------------- --%>
            <td><%= itGroup.getId() %></td>
            <%-- --- GRP / CADDY OUT --------------------------- --%>
            <td class="text-left" nowrap="nowrap">
              <a href="<%= ServletUtil.getUrlWithUpdatedParams(request, new String[] { "opRemoveCaddy", "removeIds"}, new String[] {"true", itGroup.getId()}) %>" onclick="this.href=JCMS.Security.getUrlWithCSRFToken(this.href); return true;" class="btn btn-rounded"><jalios:icon src="caddy-out" title='ui.com.alt.out-caddy'  /></a>
            </td>
          </tr>
        </jalios:foreach>
        </tbody>
      </table>

      <jalios:pager name='caddyPagerHandler'/>
    </div>
  <% } /* end if */ %>

  <% if (getBooleanParameter("adminArea", false)) { %>
    <input type="hidden" name="adminArea" value="true" />
  <% } %>
</form>
<%@ include file='/admin/doAdminOrWorkFooter.jspf' %>