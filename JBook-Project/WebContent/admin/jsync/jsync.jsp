<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.jstore.jsync.*" %><%

  if (!checkAccess("admin/operation/jsync")) {
    sendForbidden(request, response);
    return;
  }

%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.handler.JSyncManagerHandler"><%
  %><jsp:setProperty name="formHandler" property="pageContext" value="<%= pageContext %>"/><%
  %><jsp:setProperty name="formHandler" property="*" /><%
%></jsp:useBean><%

if (!channel.isJSyncEnabled()) {
  sendForbidden(request, response);
  return;
}

request.setAttribute("title", glp("ui.adm.mn.op.jsync")); 
request.setAttribute("jsyncSubAdminMenu", "true");
if (formHandler.validate()) {
  return;
}
JSyncReplica replica = formHandler.getReplica();

%>
<%@ include file='/admin/doAdminHeader.jspf' %>

<%-- ********************************************************************** --%>
<div class="page-header"><h1><%= glp("ui.adm.mn.op.jsync") %></h1></div>

<div class="tab-pane" id="jsyncTab">
<%@ include file="/admin/jsync/jsync_status.jspf" %>
<%@ include file="/admin/jsync/jsync_replica.jspf" %>
<%@ include file="/admin/jsync/jsync_logs.jspf" %>
<%@ include file="/admin/jsync/jsync_config.jspf" %>
<%@ include file="/admin/jsync/jsync_stats.jspf" %>
<jalios:include target="ADMIN_JSYNC_TAB" targetContext="div" />
</div>

<jalios:javascript>
  setSelectedTab("jsyncTab", <%= formHandler.getOpenTab() %>);
</jalios:javascript>

<p>&nbsp;</p>
<%@ include file='/admin/doAdminFooter.jspf' %>

