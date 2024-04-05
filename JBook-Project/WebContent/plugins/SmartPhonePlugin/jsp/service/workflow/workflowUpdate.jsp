<%@ include file='/plugins/SmartPhonePlugin/jsp/common/header.jspf' %><%  
  Publication pub = getPublicationParameter("id");
%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.handler.ValidateStateChangePublicationHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='internalClass' value='<%=pub.getClass() %>' />
  <jsp:setProperty name='formHandler' property='ws' value='<%= JcmsUtil.getId(pub.getWorkspace()) %>'/>
  <jsp:setProperty name='formHandler' property='*' />
  <jsp:setProperty name='formHandler' property="noRedirect" value="true" />
</jsp:useBean><% 

if (formHandler.validate()) {
  sendRedirect("plugins/SmartPhonePlugin/jsp/service/workflow/workflow.jsp");
  return;
}

Set stateSet = pub.getNextWFStateSet(loggedMember);
if (stateSet == null) {
  stateSet = new HashSet();
}
WFState pubWFState = pub.getWFState();
if (pubWFState != null) {
  stateSet.add(pubWFState);
}
int pstatus = pub.getPstatus();

Workflow internalWf = formHandler.getAvailableInternalWorkflow(); 
Workflow wf = formHandler.getWorkflow(); 
%>
<div id="service-workflow-update" class="service-workflow-page" data-role="page" data-jalios-csrf-token="<%= csrfToken %>">
  <smartphone:breadcrumb service='<%= new DefaultSmartPhoneService("jcmsplugin.smartphone.service.workflow") %>' />
  <div class="service-workflow-update-content" data-role="content">
    <form action="plugins/SmartPhonePlugin/jsp/service/workflow/workflowUpdate.jsp" method="post" enctype="multipart/form-data">
      <%@ include file='/plugins/SmartPhonePlugin/jsp/core/doMessageBox.jspf' %>
      <jalios:field resource="<%= SmartPhoneConstants.FIELD_PROP %>" label="ui.com.lbl.publication">
        <a data-role="button" href="<%= smartPhoneManager.getDataUrl(pub) %>"><%= pub.getTitle(userLang)%></a>
      </jalios:field>
      <jalios:field resource="<%= SmartPhoneConstants.FIELD_PROP %>" label="ui.com.lbl.status">
        <select name="pstatus">
          <jalios:foreach collection="<%= stateSet %>" name="itTarget" type="WFState">
            <option value="<%= itTarget.getPstatus() %>" <%= itTarget.getPstatus() == pub.getPstatus() ? "selected=\"selected\"" : "" %>><%= itTarget.getLabel(userLang) %></option>
          </jalios:foreach>
        </select>
      </jalios:field>
      <jalios:field css="wf-update-smartphone-pdate wf-update-smartphone-pdate-hidden" name="pdate" resource="<%= SmartPhoneConstants.FIELD_PROP %>" label="ui.work.form.lbl.pdate" value='<%= formHandler.getAvailablePdate() %>'>
        <jalios:control resource="<%= SmartPhoneControlType.DATE.getResource() %>" settings='<%= new DateSettings().displayTime() %>' />
      </jalios:field>
      <fieldset>
        <jalios:field resource="<%= SmartPhoneConstants.FIELD_PROP %>" label="ui.work.dpl.foot.wfn.note" name="wfNote">
          <jalios:control resource="<%= SmartPhoneControlType.TEXTAREA.getResource() %>" settings='<%= new WikiAreaSettings().rows(2) %>' />
        </jalios:field>
      </fieldset>
      <% if (formHandler.showWFRole()) { %>
        <fieldset>
          <jalios:foreach collection="<%= wf.getRoleSet() %>" name='wfRole' type='WFRole'>
            <% WKRole wkRole = pub != null ? pub.getWorkspace().getRole(wfRole) : workspace.getRole(wfRole); %>
            <% if (!WKRole.isOpen(wkRole)) { %>
              <jalios:field resource="<%= SmartPhoneConstants.FIELD_PROP %>" label="<%= wfRole.getName(userLang) %>">
                <p class='form-control-static'><%= glp("ui.work.form.lbl.wf.role-closed") %></p>
              </jalios:field>
              
              <%-- OPEN ROLE --%>
            <% } else { %>
              <% 
              Set allWorkerSet = JcmsUtil.select(wkRole.getWorkerSet(pub, true, formHandler.getPublicationClass()), null, new Member.NameComparator());
              String openRoleDescription = null;
              int groupWeight = wkRole.getWeightForGroup(0);
              if (Util.getSize(wkRole.getGroupList()) == 1 && !wkRole.isPercentageForGroup(0)) {
                if (wkRole.isOpenAndRequired(wkRole)) {
                  openRoleDescription = glp("ui.publication-edit.open-role.min-weight-required", groupWeight);
                } else {
                  openRoleDescription = glp("ui.publication-edit.open-role.min-weight", groupWeight);          
                }
              }
              %>
              <input type="hidden" name="roleId" value="<%= wfRole.getId() %>" />
              
              <jalios:field resource="<%= SmartPhoneConstants.FIELD_PROP %>" name='<%= "roleMbr_" + wfRole.getId() %>' label="<%= wfRole.getName(userLang) %>" mv="<%= groupWeight > 1 ? 1 : -1 %>" required="<%= WKRole.OPEN_MODE_REQUIRED.equals(wkRole.getOpenMode()) %>" description='<%= openRoleDescription %>' value="<%= formHandler.getMemberSetAssignedToRole(wfRole.getId()) %>">
                <jalios:control settings='<%= new EnumerateSettings().select().enumValues(allWorkerSet) %>' />
              </jalios:field>
            <% } %>        
          </jalios:foreach>
        </fieldset>
      <% } %>
      <input type="hidden" name="opUpdate" value="true"/>
      <input type="hidden" name="id" value="<%= pub.getId() %>"/>      
      <button type="submit" data-role="button" class="btn-primary" name="opUpdate"><%= glp("ui.com.btn.save") %></button>
    </form>
  </div>
</div>
<%@ include file='/plugins/SmartPhonePlugin/jsp/common/footer.jspf' %>