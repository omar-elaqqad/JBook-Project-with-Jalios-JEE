<%@page import="com.jalios.jcmsplugin.esn.ESNManager"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

Member member = getMemberParameter("mid");
if (member == null) {
  return;
}

ESNManager esnMgr = ESNManager.getInstance();

jcmsContext.addCSSHeader("plugins/ESNPlugin/css/edit-expertises-modal.css");

MemberCategories mcat = esnMgr.getMemberCategories(member);
Set<Category> allCatSet = mcat != null ? mcat.getCategorySet() : null;
Set<Category> rootSet = esnMgr.getMemberCategoriesRootSet();
boolean showRoots = Util.getSize(rootSet) > 1;

// Create the profile if null
MemberProfile profile = esnMgr.getMemberProfile(member, true);

jcmsContext.addCSSHeader("css/lib/toastr/toastr.css");
jcmsContext.addCSSHeader("css/jalios/core/components/toastr/jalios-toastr.css");
jcmsContext.addJavaScript("js/lib/toastr/toastr.js");

%><jsp:useBean id='formHandler' scope='page' class='generated.EditMemberCategoriesHandler'><%
  %><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
  %><jsp:setProperty name='formHandler' property='id' value='<%= JcmsUtil.getId(mcat) %>'/><%
  %><jsp:setProperty name='formHandler' property='noRedirect' value='true'/><%
  %><jsp:setProperty name='formHandler' property='ws' value='<%= JcmsUtil.getId(profile.getWorkspace()) %>'/><%
%></jsp:useBean><%

if (mcat == null) {
  formHandler.setTitle(new String[] {esnMgr.getMemberCategoriesTitle(member, esnMgr.getMemberCategoriesTitle(member, userLang))});
}
formHandler.setAuthorForced(true, member);

if (formHandler.validate()) {
  // Prevent modal redirect: close the modal, and display a toastr
  %>
  <jalios:javascript>
    jQuery.jalios.ui.Modal.close();
    toastr.options = {
      "positionClass": "toast-top-center"
    };
    toastr.info('<%= glp("js.update.success") %>');
  </jalios:javascript>
<% } %>

<jalios:modal css="modal-lg esn esn-edit-expertises" formHandler="<%= formHandler %>" 
        title='<%= glp("jcmsplugin.esn.edit-expertises.title", member.getFullName()) %>' 
        url="plugins/ESNPlugin/jsp/form/editMemberExpertisesModal.jsp"
        op='<%= mcat == null ? "opCreate" : "opUpdate" %>'
        button='ui.com.btn.update'>

  <jalios:include target="PLUGIN_ESN_EDIT_EXPERTISES_START" />

  <jalios:foreach collection="<%= rootSet %>" name="itRoot" type="Category">
    <% if (showRoots) { %>
    <span class="member-categories-root"><%= itRoot.getName(userLang) %></span>
    <% } %>
    <jalios:foreach collection="<%= itRoot.getChildrenSet() %>" name="itSubRoot" type="Category" counter="itCounter2">
      <% if (itSubRoot.canBeReadBy(loggedMember,true,true)) { %>
        <% Set<Category> catSet = Util.interSet(itSubRoot.getDescendantSet(), allCatSet); %>
        <jalios:field name="cids" label="<%= itSubRoot.getName(userLang) %>" keyword="true" mv="1" value="<%= catSet %>">        
          <jalios:control settings='<%= new CategorySettings().root(itSubRoot) %>' />
        </jalios:field>        
      <% } %>
    </jalios:foreach>
  </jalios:foreach>
  
  <input type="hidden" name="mid" value="<%= member.getId() %>" />
  <jalios:include target="PLUGIN_ESN_EDIT_EXPERTISES_END" />
</jalios:modal>