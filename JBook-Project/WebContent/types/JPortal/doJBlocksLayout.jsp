<%@page import="com.jalios.jcms.jportal.JPortalUtils"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="com.jalios.jcms.jportal.json.JBlockMapping"%>
<%@ include file="/jcore/doInitPage.jspf" %><%
JBlockMapping jBlock = (JBlockMapping) request.getAttribute("jcms.jportal.jblock-mapping");
if (Util.isEmpty(jBlock)) {
  return;
}
%>
<div class="jportal-block col-md-<%= jBlock.getUi().getGridSizeMd() %> <%= Util.notEmpty(jBlock.getJportlet())?"jportlet-layout":"" %>">
  <% if(Util.notEmpty(jBlock.getJportlet())){ %>
    <span class="jportlet-layout-title"><%= JPortalUtils.getPortletTitle(jBlock.getJportlet(), userLang) %></span>
  <% }else if (Util.notEmpty(jBlock.getJBlocks())) { %>
    <% for (JBlockMapping itJBlock : jBlock.getJBlocks()) { %>
			<% request.setAttribute("jcms.jportal.jblock-mapping",itJBlock); %>
      <jalios:include jsp="types/JPortal/doJBlocksLayout.jsp" />
			<% request.removeAttribute("jcms.jportal.jblock-mapping"); %>
	  <% } %>
  <% } %>
</div>