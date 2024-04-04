<%--
  @Summary: Work Access Audit page (no header/footer)
  @Since: jcms-10.0.6 
--%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ include file="/work/acl/audit/doInitWorkAccessAudit.jspf" %><%

jcmsContext.addJavaScript("js/jalios/table.js");
jcmsContext.addCSSHeader("css/jalios/acl.css");
// JCMS-9186 - Indicate Links on ACL can be safely provided
jcmsContext.setAjaxRequestAttribute("acl-list-acl-link-enabled", true);
%>
<div class="ajax-refresh-div" data-jalios-ajax-refresh-url="<%= refreshUrl %>">
  <div class="tab-pane work-access-audit" id="aclManagerTab">
  <%
  if (Util.toBoolean(request.getAttribute("jcms.bo.workspace.isMultipleWorkspace"), false)) {
    setWarningMsg(glp("ui.work.multiple-ws-warning"), request);
    %><%@ include file='/jcore/doMessageBox.jspf' %><%
  } else { %>
    <%@ include file='/jcore/doMessageBox.jspf' %>

    <%-- *** ACL List ************************************************ --%>
    <%@ include file='/admin/doAccessManagerAclList.jspf' %>
    <%-- *** Resources Audit ***************************************** --%>
    <%@ include file='/admin/doAccessManagerRsrcsAudit.jspf' %>
    <%-- *** Member Audit  ******************************************* --%>
    <%@ include file='/admin/doAccessManagerMbrAudit.jspf' %>
    <%-- *** ACL Audit  ********************************************** --%>
    <%@ include file='/admin/doAccessManagerAclAudit.jspf' %>
  <% } %>  
  </div>
  <%@ include file="/jcore/doAjaxFooter.jspf" %>
</div>