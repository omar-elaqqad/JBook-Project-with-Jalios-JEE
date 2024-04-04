<%--
  @Summary: Cache manager
  @Category: Admin / Cache
  @Author: Oliver Dedieu
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-2.0
--%>
<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file="/admin/cacheManager/doInitCacheManager.jspf" %><%
request.setAttribute("title", glp("ui.adm.mn.op.cache-mgr")); 
request.setAttribute("cacheSubAdminMenu", "true"); 
if (formHandler.validate()) {
  return;
}
if (!channel.getBooleanProperty("cache-mgr.enabled", true)) {
  setWarningMsg(glp("msg.cache-mgr.disabled"), request);
}
String guiTitle = MessageFormat.format("{0} ({1})",
    glp("ui.adm.mn.op.cache-mgr"),
    cacheManager.getSize());
%><%@ include file="/admin/doAdminHeader.jspf" %><%
%><div class="page-header"><%
  %><h1><%= guiTitle %></h1><%
%></div><%
%><jalios:include jsp="/admin/cacheManager/cacheManager.jsp" /><%
%><%@ include file="/admin/doAdminFooter.jspf" %><%
%>
