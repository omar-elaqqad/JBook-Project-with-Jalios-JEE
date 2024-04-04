<%--
  @Summary: Manage member of the caddy
  @Category: Admin Area / Caddy
  @Author: Oliver Jaquemet
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-5.5.0
--%>
<%@ include file='/jcore/doInitPage.jspf' %>
<jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.caddy.MemberCaddyManagerHandler">
  <jsp:setProperty name="formHandler" property="pageContext" value="<%= pageContext %>"/>
  <jsp:setProperty name="formHandler" property="*" />
</jsp:useBean>
<%
  if (formHandler.validate()) {
    return;
  }
  jcmsContext.addCSSHeader("css/jalios/core/jalios-caddy.css");
  jcmsContext.addCSSHeader("css/jalios/core/admin/jalios-member-edit.css");
  request.setAttribute("caddyWAMenu", "true");
  request.setAttribute("caddyMemberMenu", "true");
  request.setAttribute("title", glp("ui.work.mbr-caddy.title", 0));

  // This JSP can be accessed either by admin, admin through ACL, work admin, or work admin through ACL
  // Use a simple boolean to hide most information to user who are NOT global admins
  boolean isGlobalAdmin = isAdmin || checkAccess("admin/users/member");
%><%@ include file='/admin/doAdminOrWorkHeader.jspf' %>
<div class="page-header">
  <h1 class='boTitle icon iconMember'><% /* %>Caddy Manager<% */ %><%= glp("ui.work.mbr-caddy.title", Caddy.getCaddy(request).getMemberListSize()) %></h1>
</div>
<form action='work/caddy/memberCaddyManager.jsp' name='editForm' method='post' class="form-horizontal form-caddy">

    <%@ include file='/jcore/doMessageBox.jspf' %>

    <div class="tab-pane" id="mainTab">

      <%-- *** GENERAL TAB ***************************************** --%>
      <div class="tab-page">
        <h2 class="tab"><%= glp("ui.com.tab.general") %></h2>

        <%-- USAGE -------------------------------------------------------- --%>
        <% if (isGlobalAdmin) { %>
        <jalios:field name='usage' label='ui.adm.mbr-edit.lbl.usage' description='ui.adm.mbr-edit.lbl.usage.h'>
          <jalios:control settings='<%= new EnumerateSettings().select()
                                              .enumValues("0", "1")
                                              .enumLabels("ui.adm.mbr-edit.usage.0", "ui.adm.mbr-edit.usage.1")
                                              .dataAttribute("jalios-action", "sync:value")
                                              .dataAttribute("jalios-target", ".account")
                                              .dataAttribute("jalios-target-attribute", "data-jalios-usage") %>' />
        </jalios:field>
        <% } %>
        <%-- PASSWORD ------------------------------------------------------------ --%>
        <% if (isGlobalAdmin) { %>

          <% String accountClass = "account"; %>
          <% String localPasswordsClass = accountClass  + " local-passwords " + Util.getString(formHandler.getAvailableAuthType(), ""); %>
          <jalios:field label='ui.adm.mbr-edit.lbl.auth-type' required="false" name='authType' css='<%= accountClass %>' tooltip="ui.adm.mbr-edit.lbl.auth-type.h" value="<%= formHandler.getAvailableAuthType() %>">
            <jalios:control settings='<%= new EnumerateSettings()
                                                .select()
                                                .enumValues("ALL", "EXTERNAL", "DISABLED")
                                                .enumLabels("ui.adm.mbr-edit.lbl.auth-type.ALL", "ui.adm.mbr-edit.lbl.auth-type.EXTERNAL", "ui.adm.mbr-edit.lbl.auth-type.DISABLED")
                                                .dataAttribute("jalios-action", "sync:value")
                                                .dataAttribute("jalios-target", ".local-passwords")
                                                .dataAttribute("jalios-target-attribute", "class") %>'/>
            <jalios:buffer name="WIDGET_APPEND">
              <div class="<%= localPasswordsClass %>">
                <p class="help-block ALL"><%= glp("ui.adm.mbr-edit.lbl.auth-type.ALL.h") %></p>
                <p class="help-block EXTERNAL"><%= glp("ui.adm.mbr-edit.lbl.auth-type.EXTERNAL.h") %></p>
                <p class="help-block DISABLED"><%= glp("ui.adm.mbr-edit.lbl.auth-type.DISABLED.h") %></p>        
              </div>
            </jalios:buffer>
          </jalios:field>
      
          <div class="<%= localPasswordsClass %>" data-jalios-usage="">
          
            <% String passDesc = "ui.adm.mbr-edit.txt.pwd2"; %>
            <% String passwordFieldCss = accountClass + " password-double-input"; %>
            <jalios:field label="ui.adm.mbr-edit.lbl.pwd" name='password1' description="<%= passDesc %>" css='<%= passwordFieldCss %>' required="false">
              <div class="input-group">
                <jalios:control settings='<%= new PasswordSettings().autocomplete("new-password").placeholder("ui.adm.mbr-edit.lbl.pwd") %>' />
              </div>
              <div class="input-group">
                <jalios:control settings='<%= new PasswordSettings().autocomplete("new-password").name("password2").placeholder("ui.adm.mbr-edit.lbl.pwd-confirm") %>' />
              </div>
            </jalios:field>
            
          </div>
        <% } %>


        <%-- E-MAIL VISIBLE -------------------------------------------------------- --%>
        <jalios:field name="emailVisible" label="ui.adm.mbr-edit.lbl.mail-vis"
                      value='<%= formHandler.isComputedEmailVisibleAvailable() ? formHandler.getComputedEmailVisible() : "" %>'>
          <jalios:control type="<%= ControlType.BOOLEAN %>" />
        </jalios:field>

        <%-- WEBDAV -------------------------------------------------------- --%>
        <jalios:field name="webdavAccess" label="ui.com.lbl.webdav-access"
                      value='<%= formHandler.isComputedWebdavAccessAvailable() ? formHandler.getComputedWebdavAccess() : "" %>'>
          <jalios:control type="<%= ControlType.BOOLEAN %>" />
        </jalios:field>

        <%-- LDAP Sync -------------------------------------------------------- --%>
        <% if (channel.isLdapEnabled()) { %>
        <jalios:field name="ldapSync" label="ui.com.lbl.ldap-sync"
                      value='<%= formHandler.isComputedLdapSyncAvailable() ? formHandler.getComputedLdapSync() : "" %>'>
          <jalios:control type="<%= ControlType.BOOLEAN %>" />
        </jalios:field>
        <% } %>

        <%-- LANGUAGE ------------------------------------------------------------ --%>
        <% if (channel.isMultilingual()) { %>
        <jalios:field name="language" label="ui.com.lbl.language"
                      value="<%= formHandler.getComputedLanguage() %>">
          <jalios:control settings='<%= new LanguageSettings().radio().inline().enumValues(channel.getLanguageList()) %>' />
        </jalios:field>
        <% } %>

        <%-- NO RIGHTS -------------------------------------------------------- --%>
        <% if (isGlobalAdmin) { %>
        <jalios:field name="noRights" label="ui.work.mbr-caddy.txt.rights" description='ui.work.mbr-caddy.txt.no-rights.h'
                      value='<%= formHandler.getNoRights() %>'>
          <jalios:control settings='<%= new EnumerateSettings().multiple().enumValues("true").enumLabels("ui.work.mbr-caddy.txt.no-rights") %>' />
        </jalios:field>
        <% } %>

        <%-- NO PHOTO -------------------------------------------------------- --%>
        <% if (isGlobalAdmin) { %>
        <jalios:field name="noPhoto" label="ui.adm.mbr-edit.lbl.photo"
                      value='<%= formHandler.getNoPhoto() %>'>
          <jalios:control settings='<%= new EnumerateSettings().multiple().enumValues("true").enumLabels("ui.adm.mbr-edit.lbl.no-photo") %>' />
        </jalios:field>
        <% } %>

        <%-- Data Extension -------------------------------------------------------- --%>
        <% if (isAdmin || isWSAdmin)  { %>
        <jalios:field name="deleteDataExtension" label="ui.work.caddy.lbl.delete-data-extension"
                      value='<%= getBooleanParameter("deleteDataExtension", false) %>'>
          <jalios:control type="<%= ControlType.BOOLEAN %>" />
        </jalios:field>
        <jalios:field name="noDelegates" label="ui.work.mbr-caddy.txt.no-delegates"
                      value='<%= getBooleanParameter("noDelegates", false) %>'>
          <jalios:control type="<%= ControlType.BOOLEAN %>" />
        </jalios:field>
        <% } %>

      </div>

      <%-- *** Groups TAB ************************************** --%>
      <div class="tab-page">
        <h2 class="tab"><% /* %>Groups<% */ %><%= glp("ui.adm.mbr-edit.tab.group") %></h2>
          <%
          Workspace wkspc = null;
          Set<Group> filteredCommonGroupSet = new TreeSet<Group>(Group.getWorkspaceComparator());
          for (Group itGroup : formHandler.getCommonGroups()) {
            // Display groups from other workspace only for global admin
            if (!isGlobalAdmin && (itGroup.getWorkspace() != null && itGroup.getWorkspace() != workspace)) {
              continue;
            }
            // Display global groups to global admin only
            if (!isGlobalAdmin && (itGroup.getWorkspace() == null)) {
              continue;
            }
            // Do not display ACL groups unless REAL admin
            if (!isAdmin && (itGroup.getAccessControlList() != null)) {
              continue;
            }
            filteredCommonGroupSet.add(itGroup);
          }
          if (Util.notEmpty(filteredCommonGroupSet)) {
          %>
          <jalios:field label="ui.work.mbr-caddy.lbl.grp-common" resource="field-vertical">
           <table id='commonGroupsTable' class="table-data table-condensed">
            <% // Common groups are displayed to global admin only %>
            <% if (isGlobalAdmin && Util.getFirst(filteredCommonGroupSet).getWorkspace() == null) { %>
             <tr>
              <th><%= glp("ui.adm.grp-list.lbl.grpglobal") %></th>
             </tr>
            <% } %>
            <%
            for (Group itGroup : filteredCommonGroupSet) {
             // Print new header when workspace changes
             if ((itGroup.getWorkspace() != null) && (itGroup.getWorkspace() != wkspc)) {
               wkspc = itGroup.getWorkspace(); %>
              <tr><th><%= wkspc.getTitle(userLang) %></th></tr><%
             }
            %>
             <tr>
               <td style="padding-left: 2em;">
                 <jalios:dataicon data="<%= itGroup %>"/>
                 <%= itGroup.getDataName(userLang) %>
                 <jalios:edit data="<%= itGroup %>"/>
               </td>
             </tr>
            <%
             }
            %>
           </table>
         </jalios:field>
        <% } %>
        
        <jalios:field label="ui.work.mbr-caddy.lbl.grp-to-add" tooltip="ui.work.mbr-caddy.lbl.grp-to-add.hlp"
                      name="gidsToAdd" value="<%= formHandler.getAvailableGroupsToAdd() %>" mv="1" resource="field-vertical" css="nodnd">
          <jalios:control type="<%= ControlType.GROUP %>" />
        </jalios:field>
        
        <jalios:field label="ui.work.mbr-caddy.lbl.grp-to-remove" tooltip="ui.work.mbr-caddy.lbl.grp-to-remove.hlp"
                      name="gidsToRemove" value="<%= formHandler.getAvailableGroupsToRemove() %>" mv="1" resource="field-vertical" css="nodnd">
          <jalios:control type="<%= ControlType.GROUP %>" />
        </jalios:field>
        
      </div>

      <%-- *** PUBLICATION READ RIGHT (Audiencement) ************************************** --%>
      <% if (isGlobalAdmin) { %>
      <div class="tab-page">
        <h2 class="tab"><% /* %>Publication Read Rights<% */ %><%= glp("ui.adm.mbr-edit.pub-read-r.title") %></h2>
        <p><% /* %>Help/Intro Text<% */ %><%= glp("ui.adm.mbr-edit.pub-read-r.intro") %></p>
        <jalios:foreach name='itAxeCat' type='com.jalios.jcms.Category' counter='itAxeCatCounter'
                        collection='<%= AudienceRights.getInstance().getCategoriesAxesList() %>'>
          <jalios:field name='<%= "readcids" %>'
                    label='<%= glp("ui.adm.mbr-edit.pub-read-r.axe", itAxeCat.getName(userLang)) %>'
                    value='<%= formHandler.getReadCategorySet() %>'>
            <jalios:control settings='<%= new CategorySettings().tree().multiple().root(itAxeCat.getChildrenSet()).filter(CategoryFilter.READ) %>' />
          </jalios:field>
        </jalios:foreach>

        <jalios:field>
          <label>
            <input type="checkbox" name="noCommonReadCategory" value="true" />
            <% /* %>Remove common categories<% */ %><%= glp("ui.work.caddy.lbl.no-common-cat") %>
          </label>
        </jalios:field>
        <jalios:field>
          <label>
            <input type="checkbox" name="noReadCategory" value="true" />
            <% /* %>Remove all categories<% */ %><%= glp("ui.work.caddy.lbl.no-cat") %>
          </label>
        </jalios:field>
      </div>
      <% } %>

      <%-- *** Activation Mail TAB ************************************** --%>
      <% if (isGlobalAdmin) { %>
      <div class="tab-page">
        <h2 class="tab"><% /* %>Activation Mail<% */ %><%= glp("ui.work.mbr-caddy.tab.activation-mail") %></h2>


          <% String activationMailSubjectLabel = glp("ui.adm.mail.lbl.subject"); %>
         <jalios:field name='<%= "activationMailSubject" %>' label='<%= activationMailSubjectLabel %>' required='<%= true %>' ml='<%= channel.isMultilingual() %>' value='<%= formHandler.getActivationMailSubjectML() %>' >
           <jalios:control settings="<%= new TextFieldSettings().showLanguageChooser() %>" />
         </jalios:field>

          <% String activationMailContentLabel = glp("ui.adm.mail.lbl.content"); %>
         <jalios:field name='<%= "activationMailContent" %>' label='<%= activationMailContentLabel %>' required='<%= true %>' ml='<%= channel.isMultilingual() %>' value='<%= formHandler.getActivationMailContentML() %>'>
           <jalios:control settings='<%= new TextAreaSettings().rows(13) %>' />
           <jalios:buffer name="WIDGET_APPEND">
           <%= glp("ui.work.mbr-caddy.txt.activation-mail.h", "{0}","{1}","{2}","{3}","{4}","{5}", DateUtil.formatDuration(com.jalios.jcms.handler.ResetPasswordHandler.getExpirationDuration(), userLocale)) %>
           </jalios:buffer>
         </jalios:field>

        <jalios:field name="sendActivateMailToEnabled" label="ui.work.mbr-caddy.tab.activation-mail.send-to-enabled"
                      tooltip="ui.work.mbr-caddy.tab.activation-mail.send-to-enabled.h"
                      value='<%= formHandler.getSendActivateMailToEnabled() %>'>
          <jalios:control type="<%= ControlType.BOOLEAN %>" />
        </jalios:field>

      </div>
      <% } %>

      <%-- *** Mail TAB ************************************** --%>
      <div class="tab-page">
        <h2 class="tab"><% /* %>Mail<% */ %><%= glp("ui.com.lbl.email") %></h2>

          <% String mailSubjectLabel = glp("ui.adm.mail.lbl.subject"); %>
         <jalios:field name='<%= "mailSubject" %>' label='<%= mailSubjectLabel %>' required='<%= true %>' ml='<%= channel.isMultilingual() %>' value='<%= formHandler.getMailSubjectML() %>'>
           <jalios:control type="<%= ControlType.TEXTFIELD %>" />
         </jalios:field>

          <% String mailContentLabel = glp("ui.adm.mail.lbl.content"); %>
         <jalios:field name='<%= "mailContent" %>' label='<%= mailContentLabel %>' required='<%= true %>' ml='<%= channel.isMultilingual() %>' value='<%= formHandler.getMailContentML() %>'>
           <jalios:control settings='<%= new TextAreaSettings().rows(13) %>' />
           <jalios:buffer name="WIDGET_APPEND">
           <%= glp("ui.work.mbr-caddy.txt.mail.h", "{0}","{1}","{2}","{3}","{4}","{5}") %>
           </jalios:buffer>
         </jalios:field>

      </div>
    </div>

  <% ArrayList<Member> memberList = Caddy.getCaddy(request).getMemberList(); %>
  <jalios:pager name='caddyPagerHandler' declare='true' action='init' size='<%= memberList.size() %>'/>

  <%
   boolean showExportCSV = true;
   Collection<Member> caddyDataSet = memberList;
  %>
  <%@ include file='/work/caddy/doCommonCaddyManagerButton.jspf' %>

  <div style="margin-top:10px;">
      <% String ldapDisabled = (isWorkOnActionsDisabled || !channel.isLdapEnabled()) ? "disabled=\"disabled\"": ""; %>

      <button type="button" class="btn btn-default" onclick="confirmSubmitFormLightBox(window,document.editForm,'opSyncLDAP', this.title)" title="<%= confirm %>" <%= ldapDisabled %>>
        <jalios:icon src="refresh"  /> <%= glp("ui.work.mbr-caddy.btn.ldap") %>
      </button>
      <jalios:tooltip property="ui.work.mbr-caddy.btn.ldap.h" />

      <button type="button" class="btn btn-default" onclick="confirmSubmitFormLightBox(window,document.editForm,'opDetachFromLDAP', this.title)" title="<%= confirm %>" <%= ldapDisabled %>>
        <jalios:icon src="unlink"  /> <%= glp("ui.work.mbr-caddy.btn.ldap-detach") %>
      </button>
      <jalios:tooltip property="ui.work.mbr-caddy.btn.ldap-detach.h" />

      &nbsp;

      <% if (isGlobalAdmin) { %>
      <button type="button" class="btn btn-default" onclick="confirmSubmitFormLightBox(window,document.editForm,'opDisable', this.title)" title="<%= confirm %>" <%= workOnActionsDisabled %>>
        <jalios:icon src="disable-account"  /> <%= glp("ui.work.mbr-caddy.btn.disable") %>
      </button>
      <jalios:tooltip property="ui.work.mbr-caddy.btn.disable.h" />

      <button type="button" class="btn btn-default" onclick="confirmSubmitFormLightBox(window,document.editForm,'opActivate', this.title)" title="<%= confirm %>" <%= workOnActionsDisabled %>>
        <jalios:icon src="sign"  /> <%= glp("ui.work.mbr-caddy.btn.activate") %>
      </button>
      <jalios:tooltip property="ui.work.mbr-caddy.btn.activate.h" />
      <% } %>

      &nbsp;

      <% String mailDisabled = (isWorkOnActionsDisabled || !channel.isMailEnabled()) ? "disabled=\"disabled\"": ""; %>
      <button type="button" class="btn btn-default" onclick="confirmSubmitForm(window,document.editForm,'opSendMail', this.title)" title="<%= confirm %>" <%= mailDisabled %>>
        <jalios:icon src="mail"  /> <%= glp("ui.work.mbr-caddy.btn.sendmail") %>
      </button>
      <jalios:tooltip property="ui.work.mbr-caddy.btn.sendmail.h" />

  </div>


  <%-- MEMBER CADDY CONTENT --------------------------------------------------------------- --%>
  <jalios:if predicate='<%= caddyPagerHandler.getItemsNbr() != 0 %>'>
    <div style="margin-top:15px;" class="table-responsive">

        <table id='mbrTable' class="table-data table-condensed">
          <thead>
            <tr>
              <td colspan="2"></td>
              <th class="caddy-item-title"><% /* %>Name<% */ %><%= glp("ui.com.lbl.name") %></th>
              <th nowrap="nowrap"><% /* %>#Pub.<% */ %><%= glp("ui.com.lbl.pub-cnt") %></th>
              <th nowrap="nowrap"><% /* %>Group<% */ %><%= glp("ui.com.lbl.groups") %></th>
              <th nowrap="nowrap"><% /* %>Workspace<% */ %><%= glp("ui.com.lbl.workspaces") %></th>
              <th nowrap="nowrap"><% /* %>Rights<% */ %><%= glp("ui.com.lbl.rights") %></th>
              <th nowrap="nowrap"><% /* %>Webdav<% */ %><%= glp("ui.com.lbl.webdav") %></th>
              <th nowrap="nowrap"><% /* %>Email<% */ %><%= glp("ui.adm.mbr-edit.lbl.mail") %></th>
              <th nowrap="nowrap"><% /* %>Lang<% */ %><%= glp("ui.adm.mbr-list.lbl.lang") %></th>
              <th nowrap="nowrap"><% /* %>Ext.<% */ %><%= glp("ui.com.lbl.ext") %></th>
              <th nowrap="nowrap"><% /* %>Last Sync.<% */ %><%= glp("ui.com.lbl.ldap-sync") %></th>
              <td></td>
            </tr>
          </thead>
          
          <tbody>
            <jalios:foreach collection='<%= memberList %>'
                            type='Member'
                            name='itMember'
                            max='<%= caddyPagerHandler.getPageSize() %>'
                            skip='<%= caddyPagerHandler.getStart() %>'>
            <tr>
              <%-- --- MBR / COUNTER --------------------------- --%>
              <td class="text-right" nowrap="nowrap">
                <%= caddyPagerHandler.getStart() + itCounter.intValue() %>.
              </td>
              <%-- --- MBR / EDIT --------------------------- --%>
              <td nowrap='nowrap'><jalios:edit id="<%= itMember.getId() %>" css="btn btn-rounded"/></td>
              <%-- --- MBR / NAME --------------------------- --%>
              <td class="caddy-item-title">
                <jalios:memberphoto size="<%= PhotoSize.TINY %>" member="<%= itMember %>" />
                <%= itMember.getHtmlIcon(workspace,userLang) %>
                <a href='front/memberProfile.jsp?id=<%= itMember.getId() %>'>
                  <%= itMember.getFullName() %>
                </a>
                <% if (itMember.isDisabled()) { %>
                   <% if (!itMember.isLdapAccount()) { %>
                    <jalios:tooltip icon='disable-account' property='<%= "ui.adm.mbr-list.disabled.hlp" %>'/>
                   <% } else {  %>
                    <jalios:tooltip icon='disable-account-ldap' property='<%= "ui.adm.mbr-list.disabled-ldap.hlp" %>'/>
                   <% } %>
                <% } %>
              </td>
              <%-- --- MBR / #PUB --------------------------- --%>
              <td class="text-right">
                <%= Util.isEmpty(itMember.getPublicationSet()) ? ""+itMember.getPublicationSet().size() : ("<a href='work/queryWork.jsp?mids="+ itMember.getId() +"&amp;types=com.jalios.jcms.Publication'>"+ itMember.getPublicationSet().size() +"</a>") %>
              </td>
              <%-- --- MBR / GROUPS --------------------------- --%>
              <td class='vTop' nowrap="nowrap">
                <ul>
                <jalios:foreach collection="<%= itMember.getDeclaredGroupSet() %>" name="itGroup" type="Group" counter="gCounter">
                  <li><%= itGroup.getIcon(userLang,true) %> <%= itGroup.getName(userLang) %></li>
                  <% if (itGroup.isSubGroup()) { %>
                  <%
                  Set<Group> ancestorSet = ancestorSet = new TreeSet(ComparatorManager.getComparator(Group.class, "name"));
                  if (Util.notEmpty(itGroup.getAncestorSet(false))) {
                    ancestorSet.addAll(itGroup.getAncestorSet(false));
                  }
                  %>
                  <ul>
                  <jalios:foreach collection='<%= ancestorSet %>' name='itAncestor' type='Group' counter='ancestorCounter'>
                  <li><%= itAncestor.getIcon(userLang,true) %> <%= itAncestor %></li>
                  </jalios:foreach>
                  </ul>
                  <% } %>
                  </li>
                </jalios:foreach>
                </ul>
              </td>
              <%-- --- MBR / WORKSPACE --------------------------- --%>
              <td class='vTop' nowrap="nowrap">
                <ul>
                 <jalios:foreach collection="<%= Workspace.getAllWorkspaceSet(itMember) %>" name="itWorkspace" type="Workspace" counter="wCounter">
                  <li><%= itWorkspace.getTitle(userLang) %></li>
                 </jalios:foreach>
                </ul>
              </td>
              <%-- --- MBR / RIGHTS --------------------------- --%>
              <td class="text-center">
                <% String rights = itMember.isAdmin() ? "A" : (itMember.getRightFromClassMap() != null && !itMember.getRightFromClassMap().isEmpty()  ? channel.getProperty("list.boolean.on", "X") : channel.getProperty("list.boolean.off", "&nbsp;")); %>
                <%= rights %>
              </td>
              <%-- --- MBR / WEBDAV --------------------------- --%>
              <td class="text-center"><%= itMember.hasWebdavAccess() ? channel.getProperty("list.boolean.on", "X") : channel.getProperty("list.boolean.off", "&nbsp;") %></td>
              <%-- --- MBR / EMAIL --------------------------- --%>
              <td><%= itMember.getEmail() == null || itMember.getEmail().equals("") ? "&nbsp;" : itMember.getEmail() %></td>
              <%-- --- MBR / LANG --------------------------- --%>
              <td align='center'><jalios:lang lang='<%= itMember.getLanguage() %>' /></td>
              <%-- --- MBR / EXTENSION --------------------------- --%>
              <td class="text-center"><%= itMember.getExtension() != null ? channel.getProperty("list.boolean.on", "X") : channel.getProperty("list.boolean.off", "&nbsp;") %></td>
              <%-- --- MBR / LDAP --------------------------- --%>
              <td class="text-right"><jalios:date date='<%= itMember.getLastLdapSynchro() %>' format='<%= "short" %>'/></td>
              <%-- --- MBR / CADDY OUT --------------------------- --%>
              <td class="text-left" nowrap="nowrap">
                <a href="<%= ServletUtil.getUrlWithUpdatedParams(request, new String[] { "opRemoveCaddy", "removeIds"}, new String[] {"true", itMember.getId()}) %>" onclick="this.href=JCMS.Security.getUrlWithCSRFToken(this.href); return true;" class="btn btn-rounded"><jalios:icon src="caddy-out" title='<%= glp("ui.com.alt.out-caddy") %>'  /></a>
              </td>
            </tr>
            </jalios:foreach>
          </tbody>
        </table>

        <jalios:pager name='caddyPagerHandler'/>
    </div>
  </jalios:if>

  <% if (getBooleanParameter("adminArea", false)) { %>
    <input type="hidden" name="adminArea" value="true" />
  <% } %>
</form>
<%@ include file='/admin/doAdminOrWorkFooter.jspf' %>