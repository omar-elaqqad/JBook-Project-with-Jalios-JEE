<%@page import="com.jalios.jcmsplugin.esn.ESNManager"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf'%><%
%><%@ include file='/plugins/DirectoryPlugin/jsp/app/contextmenu/doInitDirectoryContextMenu.jspf'%><%

// Can edit profile?
boolean canEdit = ESNManager.getInstance().canEdit(loggedMember, member, workspace);
if (!canEdit) {
  return;
}

String editUrl = ESNManager.getInstance().getMemberProfileEditor() + "?mid=" + member.getId();
String label = JcmsUtil.isSameId(loggedMember, member) ? glp("jcmsplugin.esn.lbl.edit.me") : glp("ui.com.alt.edit");
%>
<li class="directory-action directory-action-edit-profile" title="<%= encodeForHTMLAttribute(label) %>">
  <a href="<%= editUrl %>" class="directory-action-edit-profile">
    <jalios:icon src="edit" />
    <%= label %>
  </a>
</li>