<%@page import="com.jalios.jcmsplugin.esn.ESNManager"%>
<%@ page contentType="text/html; charset=UTF-8" %><%----%>
<%----%><%@ include file='/jcore/doInitPage.jspf' %><%----%>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.esn.directory.CompetenceDirectoryHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
  <jsp:setProperty name='formHandler' property='noRedirect' value='true' />
</jsp:useBean>
<% if (formHandler.validate()) { %>
  <script>
    jQuery.jalios.ui.Modal.close(false);
    jQuery('FORM.app-directory-form').refresh({isform:true});
  </script>
<% } %>
<jalios:modal css="modal-lg competence-move" op="opCompetenceMove" 
   title="jcmsplugin.esn.directory.app.competence-action.modal.move-to.title" 
   button="jcmsplugin.esn.directory.app.competence-action.modal.move-to.op-action" 
   formHandler="<%= formHandler %>" 
   url="plugins/ESNPlugin/jsp/directoryApp/categories/moveToModal.jsp">
  <input type="hidden" name="competenceId" value="<%= getDataIdParameter("competenceId") %>">
   
  <%@ include file='/jcore/doMessageBox.jspf' %>    
  
  <% Set<Category> rootCategories = ESNManager.getInstance().getMemberCategoriesRootSet(); %>
  <jalios:field name="competenceParentId">
    <jalios:control settings='<%= new CategoryTreeSettings().level(1).root(rootCategories).name("competenceParentId") %>'/>
  </jalios:field>
</jalios:modal>