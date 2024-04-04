<%--
  @Summary: Manage publications of the caddy
  @Category: Admin Area / Caddy
  @Author: Oliver Dedieu
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-3.0
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.jcms.tracking.ReaderTrackerManager" %><%
%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.caddy.PublicationCaddyManagerHandler"><%
  %><jsp:setProperty name="formHandler" property="pageContext" value="<%= pageContext %>"/><%
  %><jsp:setProperty name="formHandler" property="*" /><%
%></jsp:useBean> <%

  if (formHandler.validate()) {
    return;
  }
  jcmsContext.addCSSHeader("css/jalios/core/jalios-caddy.css");
  request.setAttribute("caddyWAMenu", "true");
  request.setAttribute("caddyPublicationMenu", "true");
  request.setAttribute("title", glp("ui.work.caddy.title", 0));
  WSTypeEntry wsTypeEntry = (formHandler.getCommonClass() != null ? channel.getWSTypeEntry(formHandler.getCommonClass(), formHandler.getWorkspace()) : null);
%>
<%@ include file='/work/doWorkHeader.jspf' %>
<jalios:pager name='caddyPagerHandler' declare='true' action='init'/>
<%  Comparator<? super Publication> comparator = ComparatorManager.getComparator(Publication.class, caddyPagerHandler.getSort(), caddyPagerHandler.isReverse()); %>
<jalios:query name='resultSet' dataset='<%= new TreeSet(Caddy.getCaddy(request).getPublicationList()) %>'  selector='<%= new Publication.AuthorizedSelector(loggedMember) %>' comparator='<%= comparator %>'/>
<jalios:pager name='caddyPagerHandler' action='compute' size='<%= resultSet.size() %>'/>

<%-- Expose a collection of data on which the member can work, used by doCommonCaddyManagerButton.jspf --%>
<jalios:query name='caddyDataSet' dataset='<%= new TreeSet(Caddy.getCaddy(request).getPublicationList()) %>' selector='<%= new Publication.CanWorkOnSelector(loggedMember) %>' comparator='<%= comparator %>'/>
  <div class="page-header">
    <h1 class='boTitle icon iconContent'><% /* %>Caddy Manager<% */ %><%= glp("ui.work.caddy.title", resultSet.size()) %></h1>
  </div>
  <% if (hasParameter("cadDebug")) { %>
  <div>
   <p>
     <strong>Common class:</strong> <code><%= formHandler.getCommonClass() %></code><br>
     <strong>Common super class:</strong> <code><%= formHandler.getCommonSuperClass() %></code>
   </p>
  </div>
  <% } %>
  <form action='work/caddy/publicationCaddyManager.jsp' name='editForm' method='post' class="form-horizontal form-caddy">

    <%@ include file='/jcore/doMessageBox.jspf' %>

    <% if (Util.notEmpty(caddyDataSet)) { %>
    <div class="tab-pane" id="mainTab">

    <%-- *** GENERAL TAB ***************************************** --%>
    <div class="tab-page">
      <h2 class="tab"><jalios:icon src='edit' alt='P' /> <% /* %>General<% */ %><%= glp("ui.com.tab.general") %></h2>
      <%@ include file='/work/caddy/doCommonCaddyManager.jspf' %>
    </div>

    <%-- *** PORTLET TAB ***************************************** --%>
    <% if (formHandler.isPortal() || formHandler.isPortletSkinable() || formHandler.isPortlet() || formHandler.isPortalElement()) { %>
    <div class="tab-page">
      <h2 class="tab"><jalios:icon src='portlet' alt='P' /> <% /* %>Portlet<% */ %><%= glp("ui.com.lbl.portalelements") %></h2>
      <% request.setAttribute("formHandler", formHandler); %>
      <jsp:include page="/work/caddy/doPortletCaddyManager.jsp"/>
    </div>
    <% } %>
    
    <%-- CATEGORIES TAB ------------------------------------------------------------ --%>
    <div class="tab-page">
      <h2 class="tab"><jalios:icon src='categories' alt='C' title='ui.work.form.lbl.categories' /> <% /* %>Edit Common Categories<% */ %><%= glp("ui.work.caddy.tab.cat")%></h2>
      <jalios:field name='<%= "cids" %>'
                    label='<%= "ui.work.form.lbl.categories" %>'
                    value='<%= formHandler.getCategorySet() %>'>
        <% if (loggedMember.canEditCategories()) { %>
          <div>
            <label>
              <input type="checkbox" name="noCommonCategory" value="true" />
              <% /* %>Remove common categories<% */ %><%= glp("ui.work.caddy.lbl.no-common-cat") %>
            </label>
          </div>
          <div>
            <label>
              <input type="checkbox" name="noCategory" value="true" />
              <% /* %>Remove all categories<% */ %><%= glp("ui.work.caddy.lbl.no-cat") %>
            </label>
          </div>
        <% } %>

        <p><%= glp("ui.work.caddy.lbl.cat") %></p>
        <jalios:control settings='<%= new CategorySettings().tree().multiple() %>' />
      </jalios:field>
    </div>


    <%-- TEMPLATE TAB ------------------------------------------------------------ --%>
    <jalios:if predicate='<%= wsTypeEntry != null %>'>
    <% String classShortName = Util.getClassShortName(formHandler.getCommonClass()); %>

    <div class="tab-page">
      <h2 class="tab"><jalios:icon src='template' alt='T' title='ui.work.form.lbl.templates' />&nbsp;<%= glp("ui.work.form.lbl.templates") %></h2>

        <jalios:field name="updateTemplates" label="ui.com.btn.update" 
                      value='<%= getBooleanParameter("updateTemplates", false) %>'>
          <jalios:control type="<%= ControlType.BOOLEAN %>" />
        </jalios:field>

        <%
          Set<String> commonTemplateSet = new HashSet<String>();
          if (Util.notEmpty(formHandler.getAvailableTemplates())){
            commonTemplateSet.addAll(Arrays.asList(formHandler.getAvailableTemplates()));
          }

          Map<String, Set<TypeTemplateEntry>> usageMap = wsTypeEntry.getTemplateUsageMap();
          for (Map.Entry<String, Set<TypeTemplateEntry>> itEntry : usageMap.entrySet()) {
            String usage = itEntry.getKey();

            // No items
            if (Util.isEmpty(itEntry.getValue())){ continue; }

            // Only one item
            if (itEntry.getValue().size() <= 1){
              TypeTemplateEntry tte = itEntry.getValue().iterator().next();
              out.println("<input type='hidden' name='templates' value='"+tte.getName()+"' />");
              continue;
            }

            Set<TypeTemplateEntry> tteSet = new TreeSet<TypeTemplateEntry>(new TypeTemplateEntry.LabelComparator(userLang));
            tteSet.addAll(itEntry.getValue());
          %>

          <jalios:field name='templates' label='<%= "ui.editportlet.usage."+usage %>'>
            <select id="Id_templates" class='form-control' name="templates" size="1">
              <% if (Util.isEmpty(commonTemplateSet)) { %>
                <option value="" selected="selected"></option>
              <% } %>
              <jalios:foreach collection="<%= tteSet %>" name="tte" type="TypeTemplateEntry">
                <% String selected = commonTemplateSet.contains(tte.getName()) ? "selected" : ""; %>
                <option value="<%= tte.getName() %>" <%= selected %> class="<%= tte.getPath() %>"><%= itCounter.intValue() %>. <%= tte.getLabel(userLang) %></option>
              </jalios:foreach>
            </select>
          </jalios:field>
        <% } %>
    </div>
    </jalios:if>

    <%-- READ RIGHTS TAB ------------------------------------------------------------ --%>
    <div class="tab-page">
      <h2 class="tab"><jalios:icon src='read-right' alt='R' title='ui.work.form.lbl.read-rights' /> <% /* %>Read Rights<% */ %><%= glp("ui.work.form.lbl.read-rights") %></h2>

        <jalios:field name="noReadRight" label="ui.work.caddy.lbl.no-rr" 
                      value='<%= getBooleanParameter("noReadRight", false) %>'>
          <jalios:control type="<%= ControlType.BOOLEAN %>" />
        </jalios:field>

        <%-- AuthorizedGroupSet ------------------------------------------------------------ --%>
        <% Group[] authorizedGroupsValues = formHandler.getAvailableAuthorizedGroups(); %>
        <jalios:field name='<%= "authorizedGroups" %>' required='<%= false %>' value='<%= authorizedGroupsValues %>' mv='<%= 2 %>'
                       label="ui.work.caddy.lbl.grp-rr">
          <jalios:control type="<%= ControlType.GROUP %>" />
        </jalios:field>

        <%-- AuthorizedMemberSet ------------------------------------------------------------ --%>
        <% Set authorizedMemberValues = formHandler.getAvailableAuthorizedMemberSet(); %>
        <jalios:field name='<%= "authorizedMemberIds" %>' required='<%= false %>' value='<%= authorizedMemberValues %>' mv='<%= 2 %>'
                       label="ui.work.caddy.lbl.mbr-rr">
          <jalios:control settings="<%= new MemberSettings().filter(MemberSettings.MemberFilter.ACCOUNT) %>" />
        </jalios:field>

    </div>

    <%-- UPDATE RIGHTS TAB ------------------------------------------------------------ --%>
    <div class="tab-page">
      <h2 class="tab"><jalios:icon src='update-right' alt='U' title='ui.work.form.lbl.update-rights' /> <% /* %>Update Rights<% */ %><%= glp("ui.work.form.lbl.update-rights") %></h2>

        <jalios:field name="noUpdateRight" label="ui.work.caddy.lbl.no-ur" 
                      value='<%= getBooleanParameter("noUpdateRight", false) %>'>
          <jalios:control type="<%= ControlType.BOOLEAN %>" />
        </jalios:field>
        
        <%-- restrictUpdateRights ------------------------------------------------------------ --%>
        <jalios:field label="" name="restrictUpdateRights" value="<%= formHandler.getAvailableRestrictUpdateRights() %>">
          <jalios:control settings='<%= new EnumerateSettings().select().enumValues(true,false).enumLabels("ui.work.form.lbl.update-rights-mode.restricted", "ui.work.form.lbl.update-rights-mode.extended") %>' />
        </jalios:field>

        <%-- UpdateGroupSet ------------------------------------------------------------ --%>
        <% Group[] updateGroupsValues = formHandler.getAvailableUpdateGroups(); %>
        <jalios:field name='<%= "updateGroups" %>' required='<%= false %>' value='<%= updateGroupsValues %>' mv='<%= 2 %>'
                       label="ui.work.caddy.lbl.grp-ur">
          <jalios:control type="<%= ControlType.GROUP %>" />
        </jalios:field>

        <%-- UpdateMemberSet ------------------------------------------------------------ --%>
        <% Set updateMemberValues = formHandler.getAvailableUpdateMemberSet(); %>
        <jalios:field name='<%= "updateMemberIds" %>' required='<%= false %>' value='<%= updateMemberValues %>' mv='<%= 2 %>'
                       label="ui.work.caddy.lbl.mbr-ur">
          <jalios:control settings="<%= new MemberSettings().filter(MemberSettings.MemberFilter.ACCOUNT) %>" />
        </jalios:field>

    </div>

    <%-- WORKFLOW TAB ------------------------------------------------------------ --%>
    <div class="tab-page">
      <h2 class="tab"><jalios:icon src='wf' alt='W' title='ui.work.form.lbl.wf' /> <% /* %>Workflow<% */ %><%= glp("ui.work.form.lbl.wf") %></h2>

      <%-- wf / pstatus ------------------------------------------------------------ --%>
      <jalios:field name="pstatus" label="ui.com.lbl.status">
        <select name="pstatus" id="Id_pstatus" class='form-control' size="1">
          <option value="" selected></option>
         <% if (formHandler.getCommonWorkflow() != null) { %>
           <% WFState commonWFState = formHandler.getCommonWFState(); %>
            <jalios:foreach collection="<%= formHandler.getCommonWorkflow().getStateSet() %>" name="itTarget" type="WFState">
             <% if (itTarget.getPstatus() != WorkflowManager.TRASHED_PSTATUS) { %>
              <option value="<%= itTarget.getPstatus() %>" <%= commonWFState != null && (itTarget.getPstatus() == commonWFState.getPstatus()) ? "selected" : "" %>><%= encodeForHTML(itTarget.getLabel(userLang)) %></option>
             <% } %>
            </jalios:foreach>
         <% } else { %>
           <option value="<%= WorkflowManager.SCHEDULED_PSTATUS %>"> <%= glp("ui.com.lbl.scheduled") %></option>
           <option value="<%= WorkflowManager.PUBLISHED_PSTATUS %>"> <%= glp("ui.com.lbl.published") %></option>
           <option value="<%= WorkflowManager.EXPIRED_PSTATUS %>"> <%= glp("ui.com.lbl.expired") %></option>
           <option value="<%= WorkflowManager.ARCHIVED_PSTATUS %>"> <%= glp("ui.com.lbl.archived") %></option>
         <% } %>
        </select>
      </jalios:field>

      <%-- WF / PDATE ------------------------------------------------------------ --%>
      <jalios:field name="pdate" label="ui.work.form.lbl.pdate" value='<%= formHandler.getAvailablePdate() %>'>
        <jalios:control settings='<%= new DateSettings().displayTime() %>' />
        <jalios:buffer name='WIDGET_APPEND'>
          <label>
              <input type="checkbox" name="noPdate" value="true" />
              <%= glp("ui.work.caddy.lbl.no-pdate") %>
          </label>
        </jalios:buffer>
      </jalios:field>

      <%-- WF / EDATE ------------------------------------------------------------ --%>
      <jalios:field name="edate" label="ui.work.form.lbl.edate" value='<%= formHandler.getAvailableEdate() %>'>
        <jalios:control settings='<%= new DateSettings().displayTime() %>' />
        <jalios:buffer name='WIDGET_APPEND'>
          <label>
              <input type="checkbox" name="noEdate" value="true" />
              <%= glp("ui.work.caddy.lbl.no-edate") %>
          </label>
        </jalios:buffer>
      </jalios:field>

      <%-- WF / ADATE ------------------------------------------------------------ --%>
      <jalios:field name="adate" label="ui.work.form.lbl.adate" value='<%= formHandler.getAvailableAdate() %>'>
        <jalios:control settings='<%= new DateSettings().displayTime() %>' />
        <jalios:buffer name='WIDGET_APPEND'>
          <label>
              <input type="checkbox" name="noAdate" value="true" />
              <%= glp("ui.work.caddy.lbl.no-adate") %>
          </label>
        </jalios:buffer>
      </jalios:field>

    </div>

    <%-- ADVANCED TAB ------------------------------------------------------------ --%>
    <div class="tab-page">
      <h2 class="tab"><jalios:icon src='advanced' alt='A' title='ui.work.form.tab.adv' /> <% /* %>Advanced<% */ %><%= glp("ui.work.form.tab.adv") %></h2>

      <%-- AUTHOR --------------------------------------------------------------- --%>
      <% if (isAdmin || (isLogged && loggedMember.isWorkAdmin())) { %>
       <jalios:field name='<%= "authorId" %>' label='<%= glp("ui.com.lbl.author") %>' required='<%= true %>' value='<%= formHandler.getAvailableAuthor() %>'>
         <jalios:control settings="<%= new MemberSettings().filter(MemberSettings.MemberFilter.ACCOUNT) %>" />
       </jalios:field>
      <% } %>

      <%-- workspace------------------------------------------------------------ --%>
     <% if (isAdmin) { %>
        <jalios:field name='<%= "newWSId" %>' label='<%= glp("ui.com.lbl.workspace") %>' required='<%= true %>' value='<%= formHandler.getAvailableNewWS() %>'>
          <jalios:control type="<%= ControlType.WORKSPACE %>" />
        </jalios:field>
     <% } else { %>
     <%
     // Compute a set of workspace in which member can publish at least one type/class from the set of publication in the caddy
     Set<Workspace> mbrWsSet = loggedMember.getWorkspaceSet();
     Set<Workspace> mbrWsCanPublishSet = new TreeSet<Workspace>(Workspace.getNameComparator(userLang));
     Set<Class> classSet = new HashSet<>();
     for (Object pub : resultSet) {
       classSet.add(pub.getClass());
     }
     for (Workspace itWs : mbrWsSet) {
       for (Class<?> clazz : classSet) {
         if (loggedMember.canPublish(clazz, itWs)) {
           mbrWsCanPublishSet.add(itWs);
           break;
         }
       }
     }
     // If the user can publish same data in other workspace, display a select of those workspace
     if (mbrWsCanPublishSet.size() > 1) { %>
       <jalios:field name="newWSId" label="ui.com.lbl.workspace">
         <select name="newWSId" class="form-control form-control-inline">
           <option value=""></option>
           <% for (Workspace itWs : mbrWsCanPublishSet) { %>
             <option value="<%= itWs.getId() %>" <% if (formHandler.getAvailableNewWS() == itWs) { %>selected="selected"<% } %>><%= encodeForHTML(itWs.getTitle(userLang)) %></option>
           <% } %>
         </select>
       </jalios:field>
     <% } %>
     <% } %>

      <%-- track reader ---------------------------------------------------------- --%>
      <jalios:field name="tracked" label="ui.work.form.lbl.track" 
                    value='<%= !formHandler.isCommonTrackedAvailable() ? "" : formHandler.getCommonTracked() %>'>
        <jalios:control type="<%= ControlType.BOOLEAN %>" />
      </jalios:field>

      <%-- main language ---------------------------------------------------------- --%>
      <jalios:field name="mainLanguage" label="ui.work.form.lbl.main-language" 
                    value="<%= formHandler.getCommonMainLanguage() %>">
        <jalios:control settings='<%= new LanguageSettings().radio().inline().enumValues(channel.getLanguageList()) %>' />
      </jalios:field>

      <%-- Friendly URLs ---------------------------------------------------------- --%>
      <jalios:field name="removeFriendlyURLs" label="ui.work.caddy.lbl.remove-friendly-url" 
                    value='<%= formHandler.getRemoveFriendlyURLs() %>'>
        <jalios:control type="<%= ControlType.BOOLEAN %>" />
      </jalios:field>
      <jalios:field name="generateFriendlyURLs" label="ui.work.caddy.lbl.generate-friendly-url" 
                    value='<%= formHandler.getRemoveFriendlyURLs() %>'>
        <jalios:control type="<%= ControlType.BOOLEAN %>" />
      </jalios:field>
      
      <%-- Silent Update ---------------------------------------------------------- --%>
      <% if (isAdmin && channel.getBooleanProperty("channel.silent-update.enabled.boolean", false)) { %>
      <jalios:field name="silentUpdate" label="ui.work.form.lbl.silentUpdate" tooltip="ui.work.form.lbl.silentUpdate.h" value='false'>
        <jalios:control type="<%= ControlType.BOOLEAN %>" />
      </jalios:field>
      <% } %>
      
    </div>

    </div>
    <% } %>

  <p>
    <%
    boolean showExportCSV = false;
    // Always display both trash and final delete 
    // - for admin
    // - if final delete is enabled in configuration
    // - if caddy does not contains *exclusively* (publication which are trashable) or (publication which are untrashable)
    request.setAttribute("caddy.propose-final-delete", isAdmin
                         || com.jalios.jcms.trash.TrashManager.getInstance().isFinalDeleteEnabled()
                         || !((PublicationCaddyManagerHandler) formHandler).containsOnlyTrashablePublication());
    request.setAttribute("caddy.propose-trash", isAdmin
                         || !((PublicationCaddyManagerHandler) formHandler).containsOnlyUntrashablePublication());
    %>
    <%@ include file='/work/caddy/doCommonCaddyManagerButton.jspf' %>
   <label>
     <input type='checkbox' name='majorUpdate' class='majorUpdate' value='true' />
     <%= glp("ui.work.form.lbl.major-update") %>
   </label>
  </p>

  <%-- CADDY CONTENT --------------------------------------------------------------- --%>
  <jalios:if predicate='<%= caddyPagerHandler.getItemsNbr() != 0 %>'>
    <div class="table-responsive">
      <table id='pubTable' class="table-data table-condensed">
        <thead>
          <tr>
            <td colspan="2"></td>
            <th nowrap="nowrap">
              <%= glp("ui.com.lbl.status") %>
              <jalios:pager name='caddyPagerHandler' action='showSort' sort='pstatus'/>
            </th>
            <th>
              <jalios:icon src='key-white' title='ui.com.lbl.rights' />
              <jalios:pager name='caddyPagerHandler' action='showSort' sort='right'/>
            </td>
            <% if (AudienceRights.getInstance().isEnabled()) { %>
            <th>
              <jalios:icon src='target-white' title='ui.adm.prop.mbr.pub-read-r.title' />
              <jalios:pager name='caddyPagerHandler' action='showSort' sort='audienceRight'/>
            </td>
            <% } %>
            <th class="caddy-item-title">
              <%= glp("ui.com.lbl.title") %>
              <jalios:pager name='caddyPagerHandler' action='showSort' sort='title'/>
            </th>
            <th nowrap="nowrap">
              <%= glp("ui.com.lbl.author") %>
              <jalios:pager name='caddyPagerHandler' action='showSort' sort='author'/>
            </th>
            <th nowrap="nowrap">
              <%= glp("ui.com.lbl.workspace") %>
              <jalios:pager name='caddyPagerHandler' action='showSort' sort='workspace'/>
            </th>
            <th nowrap="nowrap"><%= glp("ui.com.lbl.categories") %></th>
            <th nowrap="nowrap">
              <%= glp("ui.com.lbl.type") %>
              <jalios:pager name='caddyPagerHandler' action='showSort' sort='type'/>
            </th>
            <th nowrap="nowrap">
              <%= glp("ui.com.lbl.mdate") %>
              <jalios:pager name='caddyPagerHandler' action='showSort' sort='mdate'/>
            </th>
            <th nowrap="nowrap">
              <%= glp("ui.com.lbl.cdate") %>
              <jalios:pager name='caddyPagerHandler' action='showSort' sort='date'/>
            </th>
            <th nowrap="nowrap">
              <%= glp("ui.com.lbl.pdate") %>
              <jalios:pager name='caddyPagerHandler' action='showSort' sort='pdate'/>
            </th>
            <th nowrap="nowrap">
              <%= glp("ui.com.lbl.edate") %>
              <jalios:pager name='caddyPagerHandler' action='showSort' sort='edate'/>
            </th>
            <th nowrap="nowrap">
              <%= glp("ui.com.lbl.adate") %>
              <jalios:pager name='caddyPagerHandler' action='showSort' sort='adate'/>
            </th>
            <th nowrap="nowrap">
              <%= glp("ui.com.lbl.id") %>
              <jalios:pager name='caddyPagerHandler' action='showSort' sort='id'/>
            </th>
            <td></td>

          </tr>
        </thead>

        <tbody>
          <jalios:foreach name='itPub' type='Publication' collection='<%= resultSet %>'
                          max='<%= caddyPagerHandler.getPageSize() %>'
                          skip='<%= caddyPagerHandler.getStart() %>'>
          <%
            boolean canWorkOn = loggedMember.canWorkOn(itPub);
          %>
          <tr <% if (!canWorkOn) { %>class="disabled"<% } %>>
            <td align='right'><%= caddyPagerHandler.getStart() + itCounter.intValue() %>.</td>
            <td nowrap='nowrap'><jalios:edit pub="<%= itPub %>" css="btn btn-rounded"/></td>
            <td align='left' nowrap="nowrap">
              <%= itPub.getWFStateLabelHtml(userLang) %>
              <jalios:checkIntegrity data='<%= itPub %>'/>
              <%
              ReaderTrackerManager rtMgr = ReaderTrackerManager.getInstance();
              if (rtMgr.canAccessReaderTracker(itPub, loggedMember)) {
                int readerCount = itPub.getReaderCount();
                String readerIcon = rtMgr.hasBeenRead(itPub) ? "reader-tracking" : "reader-tracking-gray";
                String readerTrackingTitle = itPub instanceof FileDocument ? glp("ui.com.alt.tracked", readerCount) + " - " + glp("ui.com.alt.downloaded", rtMgr.getDownloadCount(itPub)) : glp("ui.com.alt.tracked", readerCount);
                %>
                <a href='front/readerTracking/readerTrackingModal.jsp?trackedPubId=<%= itPub.getId() %>' title='<%= readerTrackingTitle %>' class="modal btn btn-rounded"><%
                  %><jalios:icon src='<%= readerIcon %>' /><%
                %></a><%
              }
              %>
            </td>
            <td align='center'>
              <% if (itPub.hasAnyReadRights()) { %>
              <jalios:icon src='key' title='<%= glp("ui.com.alt.restricted", itPub.getReadRightsString(5)) %>' />
              <% } %>
            </td>
            <% if (AudienceRights.getInstance().isEnabled()) { %>
            <td align='center'>
              <jalios:if predicate='<%= itPub.isAudienced() %>'><jalios:icon src='target' title='<%= encodeForHTMLAttribute(itPub.getAudiencedRightsString(userLang, 5)) %>' /></jalios:if>
            </td>
            <% } %>
            <td class="caddy-item-title">
              <% if (itPub.isInDatabase()) { %>
              <jalios:tooltip icon="db" property="ui.com.lbl.dbdata" />
              <% } %>
              <jalios:if predicate='<%= itPub instanceof FileDocument %>'>
                <jalios:link data='<%= itPub %>' params='<%= "&amp;details=true" %>'><jalios:fileicon doc='<%= ((FileDocument)itPub) %>' /></jalios:link>
              </jalios:if>
              <%-- Display link using the title (and not <jalios:link> which uses displayTitle for portlet) --%>
              <a href="<jalios:url data='<%= itPub %>'/>"><%= itPub.getTitle(userLang) %></a>
              <%
                if (formHandler.isPreviewing() && canWorkOn) {
                  String previewedString = formHandler.previewSearchAndReplace(itPub.getTitle(userLang), userLang);
                  boolean previewedStringDiffers = !previewedString.equals(itPub.getTitle(userLang));
              %>
                <% if (previewedStringDiffers) { %><span style="color: red;"><% } %>
                <br /> ==> <%= previewedString %>
                <% if (previewedStringDiffers) { %></span><% } %>
              <% } %>
              <% if (itPub.isWorkCopy()) { %><jalios:icon src='workcopy' title='<%= glp("ui.com.lbl.workcopyof", itPub.getMainInstance().getTitle(userLang)) %>' /><% } %>
            </td>
            <td align='left' nowrap="nowrap">
              <% if (JcmsUtil.isSameId(itPub.getAuthor(), loggedMember)) { %><b><% } %>
              <jalios:link data='<%= itPub.getAuthor() %>'/>
              <% if (JcmsUtil.isSameId(itPub.getAuthor(), loggedMember)) { %></b><% } %>
            </td>
            <td align='left' nowrap="nowrap"><%= itPub.getWorkspace() %></td>
            <td align='left' nowrap="nowrap">
              <ul>
              <jalios:foreach array="<%= itPub.getCategories() %>" type="Category" name="itCat" counter="itCounter2">
                <jalios:if predicate='<%= itCat != null %>'>
                  <% String confirmRefineCids = encodeForJavaScript(glp("msg.work.caddy.refine-cids")); %>
                  <li><a onclick='return confirm("<%= confirmRefineCids %>")' href='<%=HttpUtil.getUrlWithCSRFToken("work/caddy/publicationCaddyManager.jsp?opRefine=true&amp;refineCids="+ itCat.getId(), request, true) %>'><%= itCat.getName(userLang) %></a></li>
                </jalios:if>
              </jalios:foreach>
              </ul>
            </td>
            <td align='left'>
              <% String confirmRefineTypes = encodeForJavaScript(glp("msg.work.caddy.refine-types")); %>
              <a onclick='return confirm("<%= confirmRefineTypes %>")' href='<%=HttpUtil.getUrlWithCSRFToken("work/caddy/publicationCaddyManager.jsp?opRefine=true&amp;refineTypes="+Util.getClassShortName(itPub.getClass()), request, true) %>'><%= channel.getTypeLabel(itPub.getClass(),formHandler.getWorkspace(), userLang) %></a>
            </td>
            <td align='right'><jalios:date date='<%= itPub.getMdate() %>' format='<%= "short" %>'/></td>
            <td align='right'><jalios:date date='<%= itPub.getCdate() %>' format='<%= "short" %>'/></td>
            <td align='right'><jalios:date date='<%= itPub.getPdate() %>' format='<%= "short" %>'/></td>
            <td align='right'><jalios:date date='<%= itPub.getEdate() %>' format='<%= "short" %>'/></td>
            <td align='right'><jalios:date date='<%= itPub.getAdate() %>' format='<%= "short" %>'/></td>
            <td align='right'><%= itPub.getId() %></td>
            <td class="text-left" nowrap="nowrap">
              <a href="<%= ServletUtil.getUrlWithUpdatedParams(request, new String[] { "opRemoveCaddy", "removeIds"}, new String[] {"true", itPub.getId()}) %>" onclick="this.href=JCMS.Security.getUrlWithCSRFToken(this.href); return true;" title="<%= glp("ui.com.alt.out-caddy") %>" class="btn btn-rounded"><jalios:icon src="caddy-out"/></a>
            </td>
          </tr>
          </jalios:foreach>
        </tbody>
      </table>

      <jalios:pager name='caddyPagerHandler'/>
    </div>
  </jalios:if>

  <input type='hidden' name='redirect' value='<%= formHandler.getRedirect() %>' />
  <input type="hidden" name="opItem" />
  <input type="hidden" name="itemPos" />
  <input type='hidden' name='cid' />
</form>

<%@ include file='/work/doWorkFooter.jspf' %>