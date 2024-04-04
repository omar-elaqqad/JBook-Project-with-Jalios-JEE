<%--
  @Summary: Access Control Manager page (no header/footer)
  @Since: jcms-10.0.6 
--%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ include file="/admin/accessManager/doInitAccessManager.jspf" %><%

jcmsContext.addCSSHeader("css/jalios/acl.css");
// JCMS-9186 - Indicate Links on ACL can be safely provided
jcmsContext.setAjaxRequestAttribute("acl-list-acl-link-enabled", true);
%>
<div class="ajax-refresh-div" data-jalios-ajax-refresh-url="<%= refreshUrl %>">
  <div class="tab-pane admin-access-manager" id="aclManagerTab">
    <%@ include file='/jcore/doMessageBox.jspf' %>

    <%-- *** ACL List ************************************************ --%>
    <%@ include file='/admin/doAccessManagerAclList.jspf' %>
    <%-- *** Resources Audit ***************************************** --%>
    <%@ include file='/admin/doAccessManagerRsrcsAudit.jspf' %>
    <%-- *** Member Audit  ******************************************* --%>
    <%@ include file='/admin/doAccessManagerMbrAudit.jspf' %>
    <%-- *** ACL Audit  ********************************************** --%>
    <%@ include file='/admin/doAccessManagerAclAudit.jspf' %>
  </div>
  <%@ include file="/jcore/doAjaxFooter.jspf" %>
</div>