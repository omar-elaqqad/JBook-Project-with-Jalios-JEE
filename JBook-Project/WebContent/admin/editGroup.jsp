<%--  
  @Summary: Group editor
  @Category: Admin / Data
  @Author: Oliver Dedieu
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-2.0
--%><%@ include file='/jcore/doInitPage.jspf' %><%
if (JcmsUtil.checkDataWriteDisabled(request, response, "admin/doAdminMsg.jsp", userLang)) {
  return;
}

%><jsp:useBean id="extFormHandler" scope="page" class="generated.EditGroupExtensionHandler"><%
  %><jsp:setProperty name="extFormHandler" property="request" value="<%= request %>"/><%
  %><jsp:setProperty name="extFormHandler" property="response" value="<%= response %>"/><%
  %><jsp:setProperty name="extFormHandler" property="*" /><%
%></jsp:useBean><%

%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.handler.EditGroupHandler"><%
  %><jsp:setProperty name="formHandler" property="request" value="<%= request %>"/><%
  %><jsp:setProperty name="formHandler" property="response" value="<%= response %>"/><%
  %><jsp:setProperty name="formHandler" property="extFormHandler" value="<%= extFormHandler %>"/><%
  %><jsp:setProperty name="formHandler" property="*" /><%
%></jsp:useBean><%

if (formHandler.validate()) {
  return;
}

Group group = formHandler.getGroup();
String title = group == null ? glp("ui.adm.grp-edit.title-add") : glp("ui.adm.grp-edit.title-update", group.getName(userLang));

Workspace availableGroupWS = formHandler.getAvailableGroupWorkspace();

request.setAttribute("title", title);

request.setAttribute("formHandler", formHandler);
request.setAttribute("extFormHandler", extFormHandler);

if (formHandler.isAdminArea()) {
  request.setAttribute("groupSubAdminMenu", "true");
  %><%@ include file='/admin/doAdminHeader.jspf' %><%
} else {
  request.setAttribute("adminGroupMenu", "true");
  %><%@ include file='/work/doWorkHeader.jspf' %><%
}
BasicSettings nameControlSettings = new TextFieldSettings().showLanguageChooser();
if (group == null) {
  nameControlSettings.autofocus();
}
%>
<div class="page-header">
  <h1><% /* %>Group Editor<% */ %><%= title %></h1>
</div>

<%@ include file='/jcore/doMessageBox.jspf' %>
<form class="form-horizontal" action="admin/editGroup.jsp" method="post" name="editForm">

<div class="tab-pane" id="editGroup-tab">

  <%-- *** GENERAL ******************************************* --%>
  <div class="tab-page">
  <h2 class="tab"><% /* %>General<% */ %><%= glp("ui.com.tab.general") %></h2>
    <jalios:include target="EDIT_GRP_MAINTAB_HEADER" />
    <div class="container-fluid">
    <div class="row Group">
      <%-- NAME ------------------------------------------------------- --%> 
      <jalios:field name='name' label='ui.com.lbl.name' required='<%= true %>' ml='<%= channel.isMultilingual() %>' value='<%= formHandler.getAllAvailableNameML() %>'>
        <jalios:control settings='<%= nameControlSettings %>' />
      </jalios:field>
      
      <%-- Description ------------------------------------------------------- --%> 
      <jalios:field name='description' label='ui.com.lbl.description' value='<%= formHandler.getAvailableDescription() %>'>
        <jalios:control type='<%= ControlType.WIKIAREA %>' />
      </jalios:field>

      <%-- ORDER ---------------------------------------------------------------- --%> 
      <jalios:field name='order' label='ui.adm.grp-list.lbl.order' description='ui.adm.grp-edit.txt.order' required='<%= false %>' value='<%= ""+formHandler.getAvailableOrder() %>'>
        <jalios:control type="<%= ControlType.NUMBER %>" />
      </jalios:field>

      <%-- VISIBILITY ---------------------------------------------------------------- --%> 
      <jalios:field name='visibility' label='ui.adm.grp-list.lbl.visibility' description='ui.adm.grp-edit.txt.visibility' value='<%= "" + formHandler.getAvailableVisibility() %>'>
        <jalios:control settings='<%= new EnumerateSettings().select().enumValues(formHandler.getVisibilityValues() ).enumLabels(formHandler.getVisibilityLabels()) %>' />
      </jalios:field>

      <%-- WEBDAV ACCESS ------------------------------------------------------------ --%> 
      <jalios:if predicate='<%= channel.isWebdavEnabled() %>'>
        <jalios:field name='webdavAccess' label='ui.com.lbl.webdav-access' value='<%= "" + formHandler.getAvailableWebdavAccess() %>'>
          <jalios:control type="<%= ControlType.BOOLEAN %>" />
        </jalios:field>        
      </jalios:if>

      <%-- COOKIE ---------------------------------------------------------------- --%> 
      <% int durationValue = formHandler.getAvailableCookieMaxAge() == 0 
                          ? channel.getIntegerProperty("cookie.max-age", JcmsConstants.COOKIE_MAX_AGE) 
                          : formHandler.getAvailableCookieMaxAge();
      String cookieDescription = "";
      if (formHandler.getAvailableCookieMaxAge() == 0) { cookieDescription += glp("ui.adm.grp-edit.lbl.max-age.def") + "<br />"; }
      cookieDescription += glp("ui.adm.grp-edit.txt.max-age");
      %>
      <jalios:field name='cookieMaxAge' label='ui.adm.grp-list.lbl.max-age' description='<%= cookieDescription %>' value='<%= ""+durationValue %>'>
        <jalios:control type="<%= ControlType.DURATION %>" />
      </jalios:field>

      <%-- ParentSet ------------------------------------------------------------ --%> 
      <jalios:field name='parentIds' label='ui.com.lbl.parent-grp' required='<%= false %>' value='<%= formHandler.getAvailableParentSet() %>' mv='<%= 2 %>'>
        <jalios:control settings='<%= new GroupSettings().workspace(formHandler.getAvailableGroupWorkspace()) %>' />
      </jalios:field>

      <%-- WORKSPACE --------------------------------------------------------------- --%>
      <% if (checkAccess("admin/users/group")) { %>
        <jalios:field name='groupWorkspace' label='ui.com.lbl.workspace' value='<%= formHandler.getAvailableGroupWorkspace() %>'>
          <jalios:control type="<%= ControlType.WORKSPACE %>" />
        </jalios:field>
      <% } else { %>  
        <% if (availableGroupWS != null) { %>
        <jalios:field name='groupWorkspace' label='ui.com.lbl.workspace'>
          <p class='form-control-static'>
            <%= availableGroupWS.getTitle(userLang) %>
          </p>
          <input type='hidden' name='groupWorkspace' value='<%= availableGroupWS.getId() %>' />          
        </jalios:field>
        <% } %>
      <% } %>
      
      <% if (formHandler.showDeclaredManager()) { %>
      <%-- DeclaredManager ------------------------------------------------------------ --%>
      <jalios:field name='declaredManager' label='ui.com.lbl.manager' required='<%= false %>' value='<%= formHandler.getAvailableDeclaredManager() %>'>
        <jalios:control settings='<%= new MemberSettings().filter(MemberSettings.MemberFilter.ACCOUNT) %>' />
      </jalios:field>

      <% if (formHandler.showAssistant()) { %>
      <%-- Assistants ------------------------------------------------------------ --%>
      <jalios:field name='assistants' label='ui.com.lbl.assistants' required='<%= false %>' value='<%= formHandler.getAvailableAssistantSet() %>' mv='<%= 1 %>'>
        <jalios:control settings='<%= new MemberSettings().filter(MemberSettings.MemberFilter.ACCOUNT).multiple() %>' />
      </jalios:field>
      <% } %>

      <%-- Portal ------------------------------------------------------------ --%>
      <jalios:field name='teamPortal' label='ui.adm.grp-edit.lbl.team-portal' description='ui.adm.grp-edit.lbl.team-portal.h' required='<%= false %>' value='<%= formHandler.getAvailableTeamPortal() %>'>
        <jalios:control settings='<%= new PublicationSettings().superType(PortalInterface.class) %>' />
      </jalios:field>
      <% } %>

      <%-- ACL ------------------------------------------------------------ --%>
      <%-- IMPORTANT : ACL modification requires TRUE ADMIN or WSADMIN ACCESS --%>
      <%
      boolean showEditAcl = (availableGroupWS == null && isAdmin) || (availableGroupWS != null && availableGroupWS.isAdmin(loggedMember));
      boolean hasAcl = Util.notEmpty(formHandler.getAvailableAccessControlList());
      %>
      <% if (hasAcl || showEditAcl) { %>
        <jalios:field name='aclId' label='ui.adm.mbr-edit.lbl.acl' description='ui.adm.mbr-edit.txt.acl' value='<%= formHandler.getAvailableAccessControlList() %>' css='<%= isAdmin && formHandler.getAvailableGroupWorkspace() == null ? "" : "wsAcl"  %>'>
        <%
        if (showEditAcl) { %> 
          <jalios:control type="<%= ControlType.ACL %>" />
        <% } else { %>
          <%-- Make sure the acl id is sent in the form, and display the ACL currently selected --%>
          <input type="hidden" name="aclId" value="<%= hasAcl ? formHandler.getAvailableAccessControlList().getId() : "" %>"/>
           <p class='form-control-static'>
            <jalios:icon src="acl" alt="acl" htmlAttributes='style="float:left; margin-right:5px"'/>
            <%= formHandler.getAvailableAccessControlList().getName() %>
           </p>
        <% } %>
        </jalios:field>
      <% } %>

      <%-- LDAP DN ------------------------------------------------------- --%> 
      <jalios:if predicate='<%= channel.isLdapEnabled() %>'>
        <jalios:field name='ldapDN' label='ui.com.lbl.ldap-dn' value='<%= Util.getString(formHandler.getAvailableLdapDN(), "") %>'>
          <jalios:control type="<%= ControlType.TEXTFIELD %>" /> 
        </jalios:field>
        
        <jalios:field name='ldapSync' label='ui.com.lbl.ldap-sync' value='<%= formHandler.getAvailableLdapSync() %>'>
          <jalios:control type="<%= ControlType.BOOLEAN %>" />
        </jalios:field>
      </jalios:if>
      
      <%-- EXTRA DATA INFO ----------------------------------------- --%>
      <jalios:include jsp="/jcore/doEditExtraData.jsp" />
  
      <%-- EXTENSION ------------------------------------------------------------ --%> 
      <%@ include file="/types/GroupExtension/doEditGroupExtension.jspf" %>

      <jalios:include target="EDIT_GRP_MAINTAB_FOOTER" />
    </div><%-- End of .row --%>
    </div><%-- End of .container-fluid --%>
  </div>

  <%-- *** PUBLISH RIGHT ************************************** --%>
  <div class="tab-page">
    <h2 class="tab"><% /* %>Publish Rights<% */ %><%= glp("ui.adm.grp-edit.tab.pub-r") %></h2>
    <jalios:include target="EDIT_GRP_PUBLISHRIGHTTAB_HEADER" />
    <div class="tab-pane" id="publish-content">
    <% 
      int counter = 0;
      List  typeList = formHandler.getAvailableTypeList();
      Class[] tabClass = channel.getPublicationSuperTypes();
    %>
    <jalios:foreach array='<%= tabClass %>' type='java.lang.Class' name='itSuperClass'>
      <% 
      String itSuperClassName = channel.getTypeLabel(itSuperClass, userLang); 
      boolean displayCanPublishRights = !itSuperClass.equals(UserContent.class) && 
                                        !itSuperClass.equals(Form.class); 
      %>
      <div class="tab-page">
      <h2 class="tab"><% /* %>Content Rights<% */ %><%= channel.getTypeLabel(itSuperClass, userLang) %></h2>
      <table id='rightTable' class='table-data'>
        <thead>
          <tr>
            <th nowrap="nowrap"><%= glp("ui.com.lbl.type") %></th>
            <% if (displayCanPublishRights) { %>
            <th nowrap="nowrap"><input type='checkbox' title="<%= encodeForHTMLAttribute(glp("ui.com.alt.check-all")) %>" onclick='javascript:checkAllwithId(document.editForm, "canPublish", this, "<%= itSuperClassName %>")' /> <%= glp("ui.adm.grp-edit.pub-r.publish") %></th>
            <% } %>
            <th nowrap="nowrap"><input type='checkbox' title="<%= encodeForHTMLAttribute(glp("ui.com.alt.check-all")) %>" onclick='javascript:checkAllwithId(document.editForm, "canUpdate",  this, "<%= itSuperClassName %>")' /> <%= glp("ui.adm.grp-edit.pub-r.update") %></th>
            <th nowrap="nowrap"><input type='checkbox' title="<%= encodeForHTMLAttribute(glp("ui.com.alt.check-all")) %>" onclick='javascript:checkAllwithId(document.editForm, "canDelete",  this, "<%= itSuperClassName %>")' /> <%= glp("ui.adm.grp-edit.pub-r.delete") %></th>
          </tr> 
        </thead>
        
        <tbody>
          <jalios:foreach name="itClass" type="Class" collection="<%= typeList %>" counter="c2">
          <jalios:if predicate='<%= itClass != null && itSuperClass.isAssignableFrom(itClass) %>'>
          <% String name = Util.getClassShortName(itClass); 
             counter++;
          %>
          <tr> 
            <td><jalios:dataicon class="<%= itClass %>" /> <b><%= channel.getTypeLabel(itClass, userLang) %></b></td>
            <% if (displayCanPublishRights) { %>
            <td><input type="checkbox" name="canPublish" id="<%= itSuperClassName + counter %>" value="<%= name %>" <%= formHandler.canPublish(itClass) ? "checked" : "" %>></td>
            <% } %>
            <td><input type="checkbox" name="canUpdate"  id="<%= itSuperClassName + counter %>" value="<%= name %>" <%= formHandler.canUpdate(itClass) ? "checked" : "" %>></td>
            <td><input type="checkbox" name="canDelete"  id="<%= itSuperClassName + counter %>" value="<%= name %>" <%= formHandler.canDelete(itClass) ? "checked" : "" %>></td>
          </tr>
          </jalios:if>
          </jalios:foreach>
        </tbody>
      </table>
      </div>
    </jalios:foreach>
    <input type="hidden" name="canPublish" value="" /></td>
    <input type="hidden" name="canUpdate"  value="" /></td>
    <input type="hidden" name="canDelete"  value="" /></td>
    </div>
    <p>
    <ul>
      <li><%= glp("ui.adm.grp-edit.pub-r.txt.publish") %>
      <li><%= glp("ui.adm.grp-edit.pub-r.txt.update") %> 
      <li><%= glp("ui.adm.grp-edit.pub-r.txt.delete") %> 
    </ul>
    </p>
    <jalios:include target="EDIT_GRP_PUBLISHRIGHTTAB_FOOTER" />
  </div>

  <%-- *** CATEGORY USAGE RIGHT ************************************** --%>
  <div class="tab-page">
    <h2 class="tab"><% /* %>Category Usage Rights<% */ %><%= glp("ui.adm.grp-edit.tab.cat-use-r") %></h2>
    <jalios:include target="EDIT_GRP_CATUSEHRIGHTTAB_HEADER" />
    
    <% /* %>Select the category roots the group can use to publish content<% */ %>
    <jalios:message msg="ui.adm.grp-edit.cat-use-r.title" title="" dismissable="false" />
  
    <%
      boolean wsfilter = formHandler.getAvailableGroupWorkspace() != null;
      Set wCatSet = formHandler.getAvailableRootUseCatSet();
      if (!wsfilter){
        wCatSet = new TreeSet();
        wCatSet.add(channel.getRootCategory());
      }
      Set useCatSet = formHandler.getAvailableUseCategorySet();
      
      // Display other categories if the current useCategorySet has a category outside root
      boolean showOtherUseCategories = false;
      if (Util.notEmpty(useCatSet)) {
        boolean hasUseCatOutsideRoot = Category.getFirstNotRelatives(useCatSet, wCatSet) != null;
        showOtherUseCategories = hasUseCatOutsideRoot;
      }
    %>
    <jalios:field name="usecids" value="<%= useCatSet %>" resource="field-vertical">
      <jalios:control settings='<%= new CategoryTreeSettings().filter(CategoryFilter.USE).root(wCatSet).level(1).multiple().uncheckSelectable() %>' />
    </jalios:field>
    
    <% if (showOtherUseCategories) {%>
    <jalios:field name="usecids" label="ui.work.form.lbl.other-cat" value="<%= useCatSet %>" resource="field-vertical">
      <jalios:control settings='<%= new CategoryTreeSettings().filter(CategoryFilter.USE).root(channel.getRootCategory()).level(1).multiple().removed(wCatSet).uncheckSelectable() %>' />
    </jalios:field>      
    <% } %>    

    <jalios:include target="EDIT_GRP_CATUSEHRIGHTTAB_FOOTER" />
  </div>

  <%-- *** CATEGORY EDITOR RIGHT ************************************** --%>
  <div class="tab-page">
    <h2 class="tab"><% /* %>Category Editor Rights<% */ %><%= glp("ui.adm.grp-edit.tab.cat-ed-r") %></h2>
    <jalios:include target="EDIT_GRP_CATEDITHRIGHTTAB_HEADER" />
    
    <% /* %>Select the category roots the group can manage<% */ %>
    <jalios:message msg="ui.adm.grp-edit.cat-ed-r.title" title="" dismissable="false" />

    <%
      wCatSet = formHandler.getAvailableRootEditCatSet();
      if (!wsfilter){
        wCatSet = new TreeSet();
        wCatSet.add(channel.getRootCategory());
      }
      Set editCatSet = formHandler.getAvailableEditCategorySet();
      
      // Display other categories if the current editCategorySet has a category outside root
      boolean showOtherEditCategories = false;
      if (Util.notEmpty(editCatSet)) {
        boolean hasEditCatOutsideRoot = Category.getFirstNotRelatives(editCatSet, wCatSet) != null;
        showOtherEditCategories = hasEditCatOutsideRoot;
      }
    %>
    
    <jalios:field name="cids" value="<%= editCatSet %>" resource="field-vertical">
      <jalios:control settings='<%= new CategoryTreeSettings().filter(CategoryFilter.MANAGE).root(wCatSet).level(1).multiple().uncheckSelectable() %>' />
    </jalios:field>
    
    <% if (showOtherEditCategories) {%>
    <jalios:field name="cids" label="ui.work.form.lbl.other-cat" value="<%= editCatSet %>" resource="field-vertical">
      <jalios:control settings='<%= new CategoryTreeSettings().filter(CategoryFilter.MANAGE).root(channel.getRootCategory()).level(1).multiple().removed(wCatSet).uncheckSelectable() %>' />
    </jalios:field>      
    <% } %>      

    <jalios:include target="EDIT_GRP_CATEDITHRIGHTTAB_FOOTER" />
  </div>

   <%-- *** NOTIFICATION ********************************************* --%>
   <jalios:if predicate='<%= channel.isNotificationEnabled() %>'>
   <div class="tab-page">    
     <h2 class="tab"><% /* %> Notification <% */ %><%= glp("ui.fo.notification.notification") %></h2>
     <%@ include file="/jcore/notification/doGroupNotificationList.jspf" %>     
   </div>
   </jalios:if>
   
   
  <%-- *** ADVANCED ********************************************* --%>
  <% if (group != null) { %> 
    <div class="tab-page">
    <h2 class="tab"><% /* %>Advanced<% */ %><%= glp("ui.work.form.tab.adv") %></h2>
    <jalios:include target="EDIT_GRP_ADVTAB_HEADER" />
    <table class="layout">    
    
      <tbody>
    
        <%-- LINK REFERRER ------------------------------------------------------------ --%> 
        <% if (group.getLinkCount() > 0) { %> 
        <tr> 
          <td colspan='2'>
            <% request.setAttribute("data", group); %>
            <%@ include file="/admin/doLinkReferrer.jspf" %>
          </td>
        </tr>
        <% } %>
        
        <%-- ID / CDATE / MDATE -------------------------------------------------------- --%> 
        <tr> 
          <td>
            <table class="table-data auto">
              <tr>
                <th scope="row"><%= glp("ui.com.lbl.id") %></th>
                <td><%= group.getId() %></th>
              </tr>
              <tr>
                <th scope="row"><%= glp("ui.com.lbl.cdate") %></th>
                <td><jalios:date date='<%= group.getCdate() %>' format='timeDateOrTime' /></th>
              </tr>
              <tr>
                <th scope="row"><%= glp("ui.com.lbl.mdate") %></th>
                <td><jalios:date date='<%= group.getMdate() %>' format='timeDateOrTime' /></th>
              </tr>
            </table>
          </td>
        </tr> 
      </tbody>
    </table>
    <jalios:include target="EDIT_GRP_ADVTAB_FOOTER" />
    </div> 
  <% } %>
  
  <%-- *** PLUGIN ********************************************* --%>
  <jalios:include target="EDIT_GROUP" targetContext="tab-page" />
  
</div>

<%-- BUTTONS -------------------------------------------------------------------- --%> 
<p> 
  <input type='hidden' name='redirect' value='<%= formHandler.getRedirect() %>' />
  <% if (group == null) { %> 
    <button class='btn btn-primary' name="opCreate" type="submit"  value="true"><%= glp("ui.com.btn.save") %></button>
    <button class='btn btn-default' name='opCancel' type='submit'  value="true"><%= glp("ui.com.btn.cancel") %></button>
  <% } else { %> 
    <button class='btn btn-primary' name="opUpdate" type="submit"  value="true"><%= glp("ui.com.btn.save") %></button>
    <input name="id" type="hidden" value="<%= group.getId() %>" />
    <button class='btn btn-default' name='opCancel' type='submit'  value="true"/><%= glp("ui.com.btn.cancel") %></button>

    <% String confirmDelete = encodeForHTMLAttribute(glp("msg.js.confirm-delete", group.getName(userLang))); %>
    <button class="btn btn-default modal confirm-danger" name="opDelete" value="true" type="submit" data-jalios-confirm-message="<%= confirmDelete %>"><%= glp("ui.com.btn.delete") %></button>

    <% if (group.checkDelete(loggedMember).hasFailed()) { %>
      <label><input type="checkbox" name="forceDelete" value="true" />&nbsp;<%= glp("ui.com.lbl.force-del") %></label>
    <% } %>
  <% } %> 
</p>

<input type='hidden' name='action' value='true' />
<input type='hidden' name='loaded' value='false' />
<input type='hidden' name="anchor" />
<input type='hidden' name="opItem" />
<input type='hidden' name="itemPos" />

</form>

<% if (formHandler.isAdminArea() ) { %>
  <%@ include file='/admin/doAdminFooter.jspf' %>
<% } else { %>
  <%@ include file='/work/doWorkFooter.jspf' %>
<% } %>