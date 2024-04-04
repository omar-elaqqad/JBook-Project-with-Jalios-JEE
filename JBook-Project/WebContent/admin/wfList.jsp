<%--
  @Summary: List all custom types
  @Category: Admin / Types
  @Author: Oliver Dedieu
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-2.0
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

  if (!checkAccess("admin/work/workflow")) {
    sendForbidden(request, response);
    return;
  }

%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.handler.WFEditorHandler"><%
  %><jsp:setProperty name="formHandler" property="pageContext" value="<%= pageContext %>"/><%
  %><jsp:setProperty name="formHandler" property="*" /><%
%></jsp:useBean><%

  if (formHandler.validate()) {
    return;
  }

request.setAttribute("title", glp("ui.adm.wf-list.title")); 
request.setAttribute("breadcrumbTitle", glp("ui.adm.wf-list.title")); 
request.setAttribute("workflowListSubAdminMenu", "true"); 
boolean canEdit = !channel.isJSyncEnabled() || channel.isDataWriteEnabled();
boolean displayAddWfForm = getBooleanParameter("opAddWorkflow", false);
%><%@ include file='/admin/doAdminHeader.jspf' %>
<% if (!displayAddWfForm) { %>
  <%@ include file='/jcore/doMessageBox.jspf' %>
<% } %>

<div class='navbar navbar-default navbar-table-header wf-list-navbar<%= displayAddWfForm ? " hide" : "" %>'>
  <div class="container-fluid">
    <a href="#" class="btn btn-primary" data-jalios-target=".wf-list-navbar, .add-wf-form" data-jalios-action="toggle:hide" onclick="return false;">
      <jalios:icon src="add" /> <%= glp("ui.adm.wf-list.lbl.add") %>
    </a>
  </div>
</div>
<jalios:panel title="ui.adm.wf-list.lbl.add" css='<%= "panel-default add-wf-form" + (displayAddWfForm ? "" : " hide") %>'>
  <form method="post" action="admin/wfList.jsp" name="editForm" style="display:inline;">
    <%@ include file='/jcore/doMessageBox.jspf' %>

    <jalios:field label="ui.com.lbl.label" name="label" required='true' ml='<%= channel.isMultilingual() %>' resource="field-vertical">
      <jalios:control type="<%= ControlType.TEXTFIELD %>" />
    </jalios:field>

    <% String type = formHandler.getAvailableType(); %>
    <jalios:field label="ui.adm.wf-list.lbl.type" name="type" required='true' value='<%= type %>'  resource="field-vertical">
      <jalios:control settings='<%= new EnumerateSettings()
                                          .select()
                                          .enumValues(WorkflowManager.WFTYPE_PUBLISH, WorkflowManager.WFTYPE_PROCESS)
                                          .enumLabels("ui.adm.wf-list.lbl.type.publish", "ui.adm.wf-list.lbl.type.process") %>' />
    </jalios:field>

    <%
      List values = new ArrayList();
      List labels   = new ArrayList();
      values.add("empty"); labels.add("");
      for (Workflow itWorkflow : formHandler.getWorkflowSet()){
        if (itWorkflow != WorkflowManager.DEFAULT_WORKFLOW){
          values.add(itWorkflow.getId());
          labels.add(itWorkflow.getLabel(userLang));
        }
      }
    %>
    <jalios:field label="ui.adm.wf-list.lbl.copy" name="wfFrom" required='false' value='<%= type %>' resource="field-vertical">
       <jalios:control settings='<%= new EnumerateSettings().select().enumValues(values).enumLabels(labels) %>' />
    </jalios:field>

      <button class='btn <%= canEdit ?"btn-primary" : "btn-default" %>' type="submit" name="opAddWorkflow" <%= !canEdit ? "disabled='disabled'": "" %>  value="true"><%= glp("ui.com.btn.add") %></button>
      <a href="#" class="btn btn-default btn-cancel" data-jalios-target=".wf-list-navbar, .add-wf-form" data-jalios-action="toggle:hide" onclick="return false;">
        <%= glp("ui.com.btn.cancel") %>
      </a>
  </form>
</jalios:panel>

      <%-- *** WORKFLOW LIST ******************************************* --%>
      <div class="table-responsive">
      <table id='typeTable' class='table-data'>
        <thead>
        <tr>
          <th>&nbsp;</th>
          <th><%= glp("ui.com.lbl.label") %></th>
          <th><%= glp("ui.adm.wf-list.lbl.type") %></th>
          <th><%= glp("ui.com.lbl.plugin") %></th>
          <th><%= glp("ui.com.lbl.wspc-cnt") %></th>
          <th><%= glp("ui.com.lbl.pub-cnt") %></th>
          <th>&nbsp;</th>
        </tr>
        </thead>
        <% int cpt = 0; %>
        <jalios:foreach collection="<%= formHandler.getWorkflowSet() %>" name="itWorkflow" type="Workflow">
        <% if (itWorkflow != WorkflowManager.DEFAULT_WORKFLOW && !"filedocument".equals(itWorkflow.getId())) { %>
	        <% 
          Set     workspaceSet = channel.getWorkspaceSet(itWorkflow);
	        String confirmDelete = encodeForJavaScript(glp("msg.js.confirm-delete", itWorkflow.getLabel(userLang)));
          String labelClass = itWorkflow.isNew() ? "wfLabelNew" : (itWorkflow.isUpdated() ? "wfLabelUpdated" : "wfLabelNormal");
          Plugin plugin = itWorkflow.getPlugin();
          %>
	        <tr> 
	          <td class="text-right text-overflow"><%= ++cpt %>. <a href="admin/wfEditor.jsp?id=<%= itWorkflow.getId() %>" class="btn btn-rounded"><jalios:icon src="edit" alt='<%= glp("ui.com.alt.edit") %>' /></a></td>
	          <td class="text-overflow" width='100%'><jalios:icon src='wf'  /> <a href="admin/wfEditor.jsp?id=<%= itWorkflow.getId() %>"><span class='<%= labelClass %>'><%= encodeForHTML(itWorkflow.getLabel(userLang)) %></span></a></td>
	          <td class="text-overflow" width='100%'><%= glp("ui.adm.wf-list.lbl.type." + itWorkflow.getType()) %></td>
            <td class="fit nowrap">
            <% if (plugin != null) { %> 
            <jalios:icon src="<%= plugin.getIcon() %>"   /> <a href="admin/displayPlugin.jsp?name=<%= plugin.getName() %>"><%= plugin.getLabel(userLang) %></a>
            <% } %>
            </td>
	          <td class="numeric"><%= workspaceSet.size() %></td>
	          <td class="numeric"><%= channel.getPublicationSet(channel.getDataSet(Publication.class) , itWorkflow).size() %></td>
	          <td class="text-overflow">
	            <jalios:if predicate='<%= Util.isEmpty(workspaceSet) %>'>
	            <a href='admin/wfList.jsp?opDeleteWorkflow=true&amp;id=<%= itWorkflow.getId() %>&amp;confirm=true' onclick='confirmAction("<%= confirmDelete %>", this.href); return false;' class="btn btn-rounded"><jalios:icon src="trash-empty" alt='<%= glp("ui.com.alt.remove") %>' /></a>
	            </jalios:if>
	          </td>
	        </tr>
        <% } %>
        </jalios:foreach>
      </table>
      </div>
      
      <form method="post" action="admin/wfList.jsp" name="editSave">
        <% boolean isDisabled = !WorkflowManager.getInstance().isUpdated(); %>
        <% String confirm = encodeForJavaScript(glp("msg.js.confirm")); %>
        <input class='btn btn-default <%= isDisabled ? "" : "btn-primary" %>' type="button" name="opSave" value='<%= glp("ui.com.btn.save-apply") %>' onclick='confirmAction("<%= confirm %>", "<%= contextPath %>/admin/wfList.jsp?opSave=true")' <%= isDisabled ? "disabled='disabled'" : "" %> />&nbsp;&nbsp;
        <input class='btn btn-default' type="button" name="opRevert" value='<%= glp("ui.adm.wf-list.btn.revert") %>' onclick='confirmAction("<%= confirm %>", "<%= contextPath %>/admin/wfList.jsp?opRevert=true")' <%= isDisabled ? "disabled='disabled'" : "" %> />&nbsp;&nbsp;
      </form>
<%@ include file='/admin/doAdminFooter.jspf' %>



