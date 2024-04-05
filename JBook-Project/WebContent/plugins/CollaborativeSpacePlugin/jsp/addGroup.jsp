<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ page import="com.jalios.jcmsplugin.collaborativespace.*" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file="/jcore/portal/doPortletParams.jspf" %><%

if ( ! CSManager.getInstance().canManageCSGroups(loggedMember, workspace) ) {
  sendForbidden(request, response);
  return;
}

%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.handler.EditGroupHandler'><%
%>  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
%>  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
%>  <jsp:setProperty name='formHandler' property='*' /><%
%>  <jsp:setProperty name='formHandler' property='noRedirect' value='<%= true %>'/><%
%></jsp:useBean><%

if (formHandler.validate()) { 
  request.setAttribute("modal.redirect", portalCategory.getDisplayUrl(userLocale) + "?jsp=plugins/CollaborativeSpacePlugin/jsp/members.jsp&csGid="+ formHandler.getGroup().getId()); 
  %><%@ include file="/jcore/modal/modalRedirect.jspf" %><%
}
%>

<jalios:modal title="jcmsplugin.collaborativespace.members.lbl.add-group"
              url="plugins/CollaborativeSpacePlugin/jsp/addGroup.jsp" 
              formHandler="<%= formHandler %>" 
              css="modal-lg add-group"
              picture="group-medium"
              op="opCreate"
              button="ui.com.btn.save">

  <jalios:field name="name" label="ui.com.lbl.name" value='<%= Util.getString(formHandler.getAvailableName(), workspace.getTitle() + " - ") %>'>
    <jalios:control type="<%= ControlType.TEXTFIELD %>" />
  </jalios:field>
  
  <input type="hidden" name="groupWorkspace" value="<%= workspace.getId() %>" />
</jalios:modal>
