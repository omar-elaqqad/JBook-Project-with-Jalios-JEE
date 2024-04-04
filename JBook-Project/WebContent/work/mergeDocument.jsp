<%@ include file='/jcore/doInitPage.jspf' %><%

%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.handler.MergeFileDocumentHandler'><%
  %><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
%></jsp:useBean><%
if (formHandler.validate()) { %>
<%
if (Util.notEmpty(formHandler.getRedirect())) {
  request.setAttribute("modal.redirect", formHandler.getRedirect());
}
%>
<%@ include file="/jcore/modal/modalRedirect.jspf" %>
<% } %>


<jalios:modal title="ui.work.doc.merge.title" 
              url="work/mergeDocument.jsp" 
              formHandler="<%= formHandler %>" 
              css="modal-lg merge-document"
              picture=""
              op="opMerge"
              button="ui.work.doc.merge.btn.merge">

  <jalios:message msg='<%= glp("ui.work.doc.merge.intro", formHandler.getAvailableSrcDoc()) %>' title="" />
  
  <jalios:field name="tgtDoc" resource="field-inline">
    <jalios:control settings='<%= new PublicationSettings().superType(FileDocument.class).disableFileInput() %>' />
  </jalios:field>

  <input type="hidden" name="srcDoc" value="<%= formHandler.getAvailableSrcDoc().getId() %>" />
  <input type="hidden" name="redirect" value="<%= formHandler.getRedirect() %>" />
  
  <jalios:buffer name="MODAL_BUTTONS">
   <button type="button" class="btn btn-default" data-dismiss="modal"><%= glp("ui.com.btn.cancel") %></button>
   <button type="submit" class="btn btn-primary ajax-refresh confirm" name='opMerge' value="true"><%= glp("ui.work.doc.merge.btn.merge") %></button>
  </jalios:buffer>  
  
</jalios:modal>
