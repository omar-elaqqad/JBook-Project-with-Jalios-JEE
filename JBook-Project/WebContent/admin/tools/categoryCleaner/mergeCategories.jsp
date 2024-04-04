<%@ include file='/jcore/doInitPage.jspf' %><%
%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.categorycleaner.CategoryCleanerHandler"><%
  %><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
%></jsp:useBean><%
if (formHandler.validate()) { %>
<%
request.setAttribute("modal.redirect", formHandler.getRedirect());
%>
<%@ include file="/jcore/modal/modalRedirect.jspf" %>
<% } %>

<jalios:modal title="ui.work.cat.merge.title" 
              url="admin/tools/categoryCleaner/mergeCategories.jsp" 
              formHandler="<%= formHandler %>" 
              css="modal-lg merge-categories"
              picture=""
              op="opMerge"
              button="ui.work.cat.merge.btn.merge">

  <jalios:field name="newName" label="ui.com.lbl.name" value="<%= formHandler.getProposedName() %>">
    <jalios:control type="<%= ControlType.TEXTFIELD %>" />
  </jalios:field>
  
  <jalios:field name="cids" label="ui.adm.category-cleaner.lbl.cat-to-merge" value="<%= formHandler.getCatList() %>">
    <jalios:control settings="<%= new EnumerateSettings().checkbox().enumValues(formHandler.getCatList()).enumLabels(formHandler.getCatNameList()) %>" />
  </jalios:field>  
  
  <jalios:buffer name="MODAL_BUTTONS">
   <button type="button" class="btn btn-default" data-dismiss="modal"><%= glp("ui.com.btn.cancel") %></button>
   <button type="submit" class="btn btn-primary ajax-refresh confirm" name='opMerge' value="true"><%= glp("ui.work.cat.merge.btn.merge") %></button>
   <input type="hidden" name="categoryRootId" value="<%= JcmsUtil.getId(formHandler.getCategoryRoot()) %>" />
   <input type="hidden" name="similarity" value="<%= formHandler.getAvailableSimilarity() %>" />
   <input type="hidden" name="similarityAlgorithm" value="<%= formHandler.getAvailableSimilarityAlgorithm() %>" />
  </jalios:buffer>  
  
</jalios:modal>
