<%@ include file="/jcore/doInitPage.jspf" %><%
%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.handler.EditRemoteDocumentHandler'><%
 %><jsp:setProperty name='formHandler' property='request' value='<%=request%>' /><%
 %><jsp:setProperty name='formHandler' property='response' value='<%=response%>' /><%
 %><jsp:setProperty name='formHandler' property='*' /><%
 %><jsp:setProperty name='formHandler' property='noRedirect' value='<%= true %>' /><%
 %><jsp:setProperty name='formHandler' property='id' value='<%= null %>' /><%
%></jsp:useBean>

<% if (formHandler.validate()) { %>
  <%@ include file="/jcore/modal/modalRedirect.jspf" %>
<% } %>

<%
int step = formHandler.getFormStep();
%>

<jalios:modal title='<%= formHandler.getPublication() == null ? "remotedoc.editor.title.create" : "remotedoc.editor.title.update" %>' 
              url="work/remotedoc/editRemoteDocument.jsp" 
              formHandler="<%= formHandler %>" 
              css="modal-lg remote-document"
              picture="">
  <%@ include file='editRemoteDocument_uri.jspf' %>
  <%@ include file='editRemoteDocument_info.jspf' %>
  <%@ include file='editRemoteDocument_advanced.jspf' %>
</jalios:modal>