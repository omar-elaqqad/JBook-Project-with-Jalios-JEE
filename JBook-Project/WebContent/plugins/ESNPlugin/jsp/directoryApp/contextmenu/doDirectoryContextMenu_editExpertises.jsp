<%@page import="com.jalios.jcmsplugin.esn.ESNManager"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf'%><%
%><%@ include file='/plugins/DirectoryPlugin/jsp/app/contextmenu/doInitDirectoryContextMenu.jspf'%><%

// Can edit expertises?
boolean canEdit = ESNManager.getInstance().canEdit(loggedMember, member, workspace);
if (!canEdit) {
  return;
}

String editUrl = MessageFormat.format("{0}?mid={1}",
  "plugins/ESNPlugin/jsp/form/editMemberExpertisesModal.jsp", 
  member.getId()
);

String label = glp("jcmsplugin.esn.expert-dir.lbl.edit-expertises");
%>
<li class="modal directory-action directory-action-edit-expertises" title="<%= encodeForHTMLAttribute(label) %>">
  <a href="<%= editUrl %>" class="modal directory-action-edit-expertises">
    <jalios:icon src="jcmsplugin-esn-directory-edit-expertises" />
    <%= label %>
  </a>
</li>