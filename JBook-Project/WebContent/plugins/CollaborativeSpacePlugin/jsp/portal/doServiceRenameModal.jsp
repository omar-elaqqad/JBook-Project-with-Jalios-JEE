<%@ include file="/jcore/doInitPage.jspf" %><%
if (!isLogged) {
  sendForbidden(request, response);
  return;
}
%>
<jsp:useBean id="formHandler" scope="page" class="com.jalios.jcmsplugin.collaborativespace.portal.CollaborativeSpaceServicesHandler">
  <jsp:setProperty name="formHandler" property="request" value="<%= request %>" />
  <jsp:setProperty name="formHandler" property="response" value="<%= response %>" />
  <jsp:setProperty name="formHandler" property="*" />
  <jsp:setProperty name='formHandler' property='noRedirect' value='true' />
</jsp:useBean>

<% if(formHandler.validate()) { %> 
  <script>
  	jQuery("[data-portlet-id=<%=formHandler.getId()%>] .application-title").text("<%= formHandler.getAvailableDisplayTitle(userLang)%>");
  	jQuery.jalios.ui.Modal.close();
  </script>
<% } %>

<jalios:modal formHandler="<%= formHandler %>" 
              button="ui.com.btn.save"
							title="jcmsplugin.collaboratif.tabs.menu.rename.title"
              url="plugins/CollaborativeSpacePlugin/jsp/portal/doServiceRenameModal.jsp" >

	<input type="hidden" name="id" value="<%= formHandler.getId() %>" />
  <jalios:field  label="jcmsplugin.collaboratif.tabs.rename.title.label" 
                 name="displayTitle" formHandler="<%= formHandler %>" 
                 tooltip=""
                 css="focus" required="false">
    <jalios:control />
  </jalios:field>
</jalios:modal>