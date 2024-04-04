<%@ include file="/jcore/doInitPage.jspf" %><%
%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.handler.DuplicateModalHandler'><%
 %><jsp:setProperty name='formHandler' property='request' value='<%=request%>' /><%
 %><jsp:setProperty name='formHandler' property='response' value='<%=response%>' /><%
 %><jsp:setProperty name='formHandler' property='*' /><%
 %><jsp:setProperty name='formHandler' property='noRedirect' value='<%= true %>' /><%
%></jsp:useBean>

<% if(formHandler.validate()) { %>
  <%@ include file="/jcore/modal/modalRedirect.jspf" %>
<% } %>

<jalios:modal title="<%= formHandler.getModalTitle() %>" 
              url="work/duplicateModal.jsp"
              op="opDuplicate"
              formHandler="<%= formHandler %>" 
              css="modal-lg duplicate"
              button="ui.com.btn.duplicate">

<jalios:message title="" dismissable="false"><%= glp("ui.work.duplicate.intro", formHandler.getPublication().getTitle(userLang)) %></jalios:message>

<jalios:field label="ui.com.lbl.workspace" required="true">
  <jalios:control settings="<%= formHandler.getWorkspaceSettings() %>" />
</jalios:field>

<jalios:field name="id" value="<%= formHandler.getId() %>">
  <jalios:control type="<%= ControlType.HIDDEN %>" />
</jalios:field>

</jalios:modal>