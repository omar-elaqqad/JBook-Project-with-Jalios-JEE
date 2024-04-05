<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ page import="com.jalios.jcmsplugin.collaborativespace.*" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file="/jcore/portal/doPortletParams.jspf" %><%

CSManager csMgr = CSManager.getInstance();
if ( ! csMgr.canManageCSMembers(loggedMember, workspace) ) {
  sendForbidden(request, response);
  return;
}
jcmsContext.addCSSHeader("plugins/CollaborativeSpacePlugin/css/cs-members.css");

%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.collaborativespace.CSEditMemberHandler'><%
%>  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
%>  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
%>  <jsp:setProperty name='formHandler' property='*' /><%
%>  <jsp:setProperty name='formHandler' property='noRedirect' value='<%= true %>'/><%
%></jsp:useBean><%
%>
<% if (formHandler.validate()) { %>
  <%@ include file="/jcore/modal/modalRedirect.jspf" %>
<% } %>

<%
// Init variables after validate/init has been called.
Member member = formHandler.getMember();
Collection<Group> availableGroups = formHandler.getAvailableGroups();
Collection<Group> workspaceGroups = formHandler.getWorkspaceGroups();
%>

<jalios:modal title="<%= member.getFullName() %>" 
              url="plugins/CollaborativeSpacePlugin/jsp/editMember.jsp" 
              formHandler="<%= formHandler %>" 
              css="modal-lg edit-member"
              picture="group-medium"
              op="opUpdate"
              button="ui.com.btn.save">

  <jalios:field label="ui.com.lbl.groups">
    <ul class="list-unstyled member-groups">
      <%
      for (Group itGroup : workspaceGroups) {
        boolean disabled = formHandler.isDisabled(itGroup);
        boolean checked = availableGroups.contains(itGroup);
        %>
        <li>
          <label>
            <input type="checkbox" name="gids" 
                    value="<%= itGroup.getId() %>" 
                    <%= checked ? "checked='checked'" : "" %> 
                    <%= disabled ? "disabled='disabled'" : "" %>/>
            <span><%= itGroup.getName(userLang) %></span>
          </label>
        </li>
      <% } %>
    </ul>
  </jalios:field>
  <input type="hidden" name="ws" value="<%= workspace.getId() %>" />
  <input type="hidden" name="id" value="<%= member.getId() %>" />
</jalios:modal>