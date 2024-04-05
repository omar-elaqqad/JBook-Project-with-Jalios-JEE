<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.jcmsplugin.esn.*" %><%
%><%@ page import="com.jalios.jcmsplugin.esn.activity.*" %><%
%><%@page import="com.jalios.jcmsplugin.virtualdesktop.*"%><%
%><%
if (!isLogged) {
  sendForbidden(request, response);
  return;
}
%>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.esn.activity.EditMemberActivityFilterHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
</jsp:useBean>
<% if (formHandler.validate()) { %>
<div class="waitWindow">
  <%= glp("msg.js.process-in-progress") %>
</div>
<script>
$("<%= formHandler.getAvailableFiltersFormId() %>").filters.value = '<%= encodeForJavaScript(formHandler.getAvailableFilters()) %>';
JCMS.window.Modal.close(false);
</script>
<% if (true) { return; } %>
<% } %>
<%

int step = formHandler.getFormStep();
int stepCount = formHandler.getFormStepCount();
boolean isDataWriteEnable = channel.isDataWriteEnabled();

if (!isDataWriteEnable){
  JcmsUtil.setDataWriteDisabledMsg(request, userLang);
}

jcmsContext.addCSSHeader("css/jalios/table.css");
%>
<jalios:modal formHandler="<%= formHandler %>" title="jcmsplugin.esn.activity.filter.editor" url="types/PortletMemberActivity/editMemberActivityFilter.jsp" picture="jcmsplugin-esn-filter32">
	<% if (isDataWriteEnable){ %>     
		<%@ include file='/types/PortletMemberActivity/editMemberActivityFilterStep_0.jspf' %>
		<%@ include file='/types/PortletMemberActivity/editMemberActivityFilterStep_1.jspf' %>	     
		<input type="hidden" name="filtersFormId" value="<%= formHandler.getAvailableFiltersFormId() %>" />
	<% } %>
</jalios:modal>