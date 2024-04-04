<%@ include file="/jcore/doInitPage.jspf" %><%
%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.application.ResetApplicationLauncherModal'>
	<jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
	<jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
	<jsp:setProperty name="formHandler" property="pageContext" value="<%= pageContext %>"/>
  <jsp:setProperty name="formHandler" property="noRedirect" value="true" />
	<jsp:setProperty name='formHandler' property='*' />
</jsp:useBean>
<% if (formHandler.validate()) { %>
  <% request.setAttribute("modal.redirect", "jcore/appstore/app/appStoreApp.jsp?adminPage=launcher"); %>
	<%@ include file="/jcore/modal/modalRedirect.jspf" %>
<% } %>
<jalios:modal url="jcore/appstore/app/modal/resetLauncherModal.jsp" formHandler="<%= formHandler %>" title='<%= glp("application-launcher.reset-modal-title") %>'>
  <jalios:message msg="application-launcher.reset-modal-message"/>
  <jalios:field name="members" value="<%= formHandler.getAvailableMembers() %>" label="ui.com.lbl.members" mv="2" >
    <jalios:control settings="<%= new MemberSettings().filter(MemberSettings.MemberFilter.ACCOUNT) %>" /> 
  </jalios:field>
  
  <jalios:field  name="groups" value="<%= formHandler.getAvailableGroups() %>" label="ui.com.lbl.groups" mv="2">
    <jalios:control settings="<%= new GroupSettings() %>" /> 
  </jalios:field>
  
  <jalios:buffer name="MODAL_BUTTONS">
    <button type="button" class="btn btn-default" data-dismiss="modal"><%= glp("ui.com.btn.cancel") %></button>
    <button type="submit" name="opResetLauncher" value="true" class="btn btn-danger confirm" data-jalios-action="ajax-refresh"><%= glp("application-launcher.reset-modal-btn-label") %></button>
	</jalios:buffer>  
  
</jalios:modal>