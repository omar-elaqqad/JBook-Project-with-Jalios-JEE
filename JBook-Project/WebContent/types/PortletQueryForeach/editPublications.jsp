<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><jsp:useBean id='formHandler' scope='page' class='generated.EditPortletQueryForeachHandler'><%
%><jsp:setProperty name='formHandler' property='request' value='<%=request%>' /><%
%><jsp:setProperty name='formHandler' property='response' value='<%=response%>' /><%
%><jsp:setProperty name='formHandler' property='*' /><%
%><jsp:setProperty name='formHandler' property='noRedirect' value='<%= true %>' /><%
%></jsp:useBean>

<% if(formHandler.validate()) { %>
<script>
jQuery.jalios.AjaxRefresh.refreshPortlet("<%= formHandler.getPublication().getId() %>");
jQuery.jalios.ui.Modal.close(false);
</script>
<% } %>

<jalios:modal title="types.PortletQueryForeach.fields.publications.label"
              url="types/PortletQueryForeach/editPublications.jsp"
              css="modal-lg edit-first-publications"
              op="opUpdate"
              button="ui.com.btn.save">

  <jalios:field name="publications" formHandler="<%= formHandler %>">
    <jalios:control />
  </jalios:field>

  <jalios:control settings='<%= new HiddenSettings().name("id").value(formHandler.getId()) %>' />
  
</jalios:modal>




