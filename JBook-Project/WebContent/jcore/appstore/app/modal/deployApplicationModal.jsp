<%@page import="com.jalios.jcms.application.ApplicationManager"%>
<%@ include file="/jcore/doInitPage.jspf" %><%
%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.application.ApplicationDeployHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name="formHandler" property="pageContext" value="<%= pageContext %>"/>
  <jsp:setProperty name='formHandler' property='*' />
  <jsp:setProperty name="formHandler" property="noRedirect" value="true" />
</jsp:useBean>
<% if (formHandler.validate()) { %>
  <script>jQuery.jalios.ui.Modal.close(false);</script>
<% } %>
<% if (ApplicationManager.getInstance().isDeployApplicationToLauncherRunning()) { %>
<jalios:modal url="jcore/appstore/app/modal/deployApplicationModal.jsp" title='<%= glp("application-launcher.deploy-modal-title") %>'>
  <jalios:message msg="appstore.admin.deploy.running" />
</jalios:modal>
<% } else { %>
  <jalios:modal op="opDeploy" button='<%= glp("appstore.btn.deploy") %>' url="jcore/appstore/app/modal/deployApplicationModal.jsp" formHandler="<%= formHandler %>" title='<%= glp("application-launcher.deploy-modal-title") %>'>
  
    <jalios:message msg="application-launcher.deploy-modal-message" title=""/>
    
    <jalios:field name="members" value="<%= formHandler.getAvailableMembers() %>" label="ui.com.lbl.members" keyword="true" >
      <jalios:control settings="<%= new MemberSettings().filter(MemberSettings.MemberFilter.ACCOUNT) %>" /> 
    </jalios:field>
    
    <jalios:field  name="groups" value="<%= formHandler.getAvailableGroups() %>" label="ui.com.lbl.groups" keyword="true">
      <jalios:control settings="<%= new GroupSettings() %>" /> 
    </jalios:field>
    
    <jalios:field  name="tabName" value="<%= formHandler.getTabName() %>" description="application-launcher.deploy-modal.tabName-field.desc" label="application-launcher.deploy-modal.tabName-field.label">
      <jalios:control settings="<%= new TextFieldSettings() %>" /> 
    </jalios:field>
      
    <jalios:control settings='<%= new HiddenSettings().name("application").value(formHandler.getAvailableApplication().getId()) %>' />
  </jalios:modal>
<% } %>
