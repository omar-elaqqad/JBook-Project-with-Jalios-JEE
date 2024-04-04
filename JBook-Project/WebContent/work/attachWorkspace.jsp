<%@ page contentType="text/html; charset=UTF-8" %><%--
--%><%@ include file='/jcore/doInitPage.jspf' %><%--
--%><%
if (!isLogged) {
  sendForbidden(request, response);
  return;
}
%><%--
--%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.handler.AttachWorkspaceHandler'><%--
--%>  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%--
--%>  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%--
--%>  <jsp:setProperty name='formHandler' property='*' /><%--
--%></jsp:useBean><%--
--%>
<% if (formHandler.validate()) { %>
<% request.setAttribute("modal.redirect", formHandler.getRedirect()); %>
<%@ include file="/jcore/modal/modalRedirect.jspf" %>
<% } %>
<jalios:modal title="ui.work.attach-ws.modal.title" 
              url="work/attachWorkspace.jsp" 
              formHandler="<%= formHandler %>" 
              css="modal-lg attach-ws"
              op="opAttach"
              button="ui.work.attach-ws.modal.btn.attach"
              >
              
  <jalios:message msg="ui.work.attach-ws.modal.info" title="" />

  <%-- WS --%>
  <jalios:field name="attachWorkspace" label="ui.com.lbl.workspace">
    <jalios:control settings="<%= formHandler.getWorkspaceSettings() %>" />
  </jalios:field>
   
  <%-- CATEGORY --%>
  <% if (formHandler.showCategories()) { %>
  <jalios:field name="cids" label="ui.com.lbl.categories">
    <jalios:control settings='<%= formHandler.getCategorySettings() %>' />
  </jalios:field>
  <% } %>
    
</jalios:modal>