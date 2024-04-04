<%--
  @Summary: Member CSV import
  @since: jcms-8
  @author Sylvain Devaux <sylvain.devaux@jalios.com>
--%><%@ include file="/jcore/doInitPage.jspf" %><%

/* Member CSV import needs Member ACL */
boolean hasMemberAccess = checkAccess(MembersCsvImportHandler.ADMIN_USERS_MEMBER_ACL);
if ( ! isAdmin && ! hasMemberAccess ) {
  sendForbidden(request, response);
  return;
}
%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.handler.MembersCsvImportHandler'> <%
  %><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>                   <%
  %><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>                 <%
  %><jsp:setProperty name='formHandler' property='*' />                                               <%
  %><jsp:setProperty name='formHandler' property="noRedirect" value="true" />                         <%
%></jsp:useBean><% 

if (formHandler.validate()) {
  //----------------------------------------------------------------------
  //  Redirection on success
  //----------------------------------------------------------------------
  request.setAttribute("modal.redirect", formHandler.getRedirect()); 
  %>
  <%@ include file="/jcore/modal/modalRedirect.jspf" %>
  <% 
}

int step = formHandler.getFormStep();
int stepCount = formHandler.getFormStepCount();
boolean isDataWriteEnable = channel.isDataWriteEnabled();
boolean finish = step == stepCount;

boolean isEditoSpaces = formHandler.isWorkspaceStep();
boolean isCollabSpaces = formHandler.isCollaborativeSpaceStep();
boolean hasGlobalGroupsStep = formHandler.hasGlobalGroupsStep();

if (!isDataWriteEnable){
  JcmsUtil.setDataWriteDisabledMsg(request, userLang);
}

jcmsContext.addCSSHeader("css/jalios/member-csv-import.css");
jcmsContext.addJavaScript("js/jalios/ux/jalios-member-import.js");

String stepPrefixProp = "ui.member.csv-import.steps.";
String formName = "csvMemberImportForm";
String importType = formHandler.getImportType();
StringBuilder modalCssBuilder = new StringBuilder();
modalCssBuilder.append("modal-lg member-csv-import-modal ");
if (Util.isEmpty(importType)) {
  modalCssBuilder.append("select-import-type ");
}
long ajaxTimeout = channel.getIntegerProperty("member.csv-import.ajax-timeout", 120000);
String modalHtmlAttributes = "data-jalios-ajax-refresh-timeout='"+ajaxTimeout+"'";
Group gidGroup = formHandler.getGidGroup();
%>

<%--
  JCMS-3061 : set a custom timeout of 360s (6min) to allow 1 000 DB Members import.
  data-jalios-ajax-refresh-timeout='360000'
--%>

<jalios:modal title='<%= formHandler.useDbMembers() ? "ui.member.csv-import.title-dbmbr" : "ui.member.csv-import.title-mbr" %>' 
        url="admin/import/importCSVMember.jsp" 
        htmlAttributes='<%= modalHtmlAttributes %>'
        formHandler="<%= formHandler %>" 
        css='<%= modalCssBuilder.toString() %>'>

    <%-- Custom steps labels --%>
    <%@ include file='/admin/import/importCSVMemberStepLabels.jspf' %>
      
    <div id='checkingInProgress' style='display: none;'>
      <div>
        <%= glp("ui.member.csv-import.checking-in-progress") %>
      </div>
      <jalios:icon src="wait" />
    </div>     
    <div id='importInProgress' style='display: none;'>
      <div>
        <%= glp("ui.member.csv-import.import-in-progress") %>
      </div>
      <jalios:icon src="wait" />
    </div>
    
    <div id='memberCsvImportFormContent'>
      <%@ include file='/admin/import/importCSVMembersStepImportType.jspf' %>
      <%@ include file='/admin/import/importCSVMembersStepFile.jspf' %>
      <%@ include file='/admin/import/importCSVMembersStepCheck.jspf' %>
      
      <%@ include file='/admin/import/doImportCSVMembersWorkspaceList.jspf' %>
      <%@ include file='/admin/import/importCSVMembersStepWorkspaces.jspf' %>
      <%@ include file='/admin/import/importCSVMembersStepColSpaces.jspf' %>
      <%@ include file='/admin/import/importCSVMembersStepGlobalGroups.jspf' %>
    </div>

    <jalios:buffer name="MODAL_BUTTONS">
      <%@ include file='/admin/import/doImportCSVMembersStepButtons.jspf' %>
      <%= formHandler.getFormStepHiddenFields() %>
    </jalios:buffer>
</jalios:modal>
