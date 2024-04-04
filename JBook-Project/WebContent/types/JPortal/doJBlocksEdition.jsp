<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="com.jalios.jcms.jportal.json.JBlockMapping"%>
<%@ include file="/jcore/doInitPage.jspf" %><%
JBlockMapping jBlock = (JBlockMapping) request.getAttribute("jcms.jportal.jblock-mapping");
if (Util.isEmpty(jBlock)) {
  return;
}
%>
<div 
    <% if(Util.notEmpty(jBlock.getId())){ %> 
        data-id='<%= jBlock.getId() %>' <% } 
    %>
    <%  ObjectMapper mapper = new ObjectMapper(); %>
      <% if (Util.notEmpty(jBlock.getJportlet())){ %>
        data-jalios-jportlet = '<%= encodeForHTMLAttribute(mapper.writeValueAsString(jBlock.getJportlet())) %>'  
      <% } %>
        data-jalios-ui = '<%= mapper.writeValueAsString(jBlock.getUi()) %>'
        data-jalios-options = '<%= mapper.writeValueAsString(jBlock.getOptions()) %>'
        class="jportal-block col-md-<%= jBlock.getUi().getGridSizeMd() %>">
  <% if (Util.notEmpty(jBlock.getJBlocks())) { %>
    <% for (JBlockMapping itJBlock : jBlock.getJBlocks()) { %>
			<% request.setAttribute("jcms.jportal.jblock-mapping",itJBlock); %>
      <jalios:include jsp="types/JPortal/doJBlocksEdition.jsp" />
			<% request.removeAttribute("jcms.jportal.jblock-mapping"); %>
	  <% } %>
  <% } %>
</div>