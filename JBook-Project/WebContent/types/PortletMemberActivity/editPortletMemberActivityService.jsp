<%--
 @Summary : Inline edition of Portlet Directory service
 @Requires : Virtual Desktop plugin
--%><%
%><%@ include file='/plugins/VirtualDesktopPlugin/jsp/doServiceEditInit.jspf' %><%

%><jsp:useBean id='formHandler' scope='page' class='generated.EditPortletMemberActivityHandler'><%
  %><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
  %><jsp:setProperty name='formHandler' property='id' value='<%= portlet.getId() %>' /><%
  %><jsp:setProperty name='formHandler' property='loggedMember' value='<%= serviceEditMember %>' /><%
%></jsp:useBean><%

  if (formHandler.validate()) {
    return;
  }
  
%><%@ include file='/plugins/VirtualDesktopPlugin/jsp/doServiceEditHeader.jspf' %>
  
		<%-- ShowAbstract ------------------------------------------------------------ --%>
		<jalios:field name="showAbstract" formHandler="<%= formHandler %>" value='<%= portlet.getBooleanFieldValue(jcmsContext, "showAbstract") %>' resource="field-vertical">
      <input value="showAbstract" name="virtualdesktop.serviceFields" type="hidden"/>
		  <jalios:control />
		</jalios:field>

		<%-- ShowMedia ------------------------------------------------------------ --%>
		<jalios:field name="showMedia" formHandler="<%= formHandler %>" value='<%= portlet.getBooleanFieldValue(jcmsContext, "showMedia") %>' resource="field-vertical">
      <input value="showMedia" name="virtualdesktop.serviceFields" type="hidden"/>
		  <jalios:control />
		</jalios:field>    
		
		<%-- ShowComments ------------------------------------------------------------ --%>
		<jalios:field name="showComments" formHandler="<%= formHandler %>" value='<%= portlet.getBooleanFieldValue(jcmsContext, "showComments") %>' resource="field-vertical">
      <input value="showComments" name="virtualdesktop.serviceFields" type="hidden"/>
		  <jalios:control />
		</jalios:field>   

  <%-- filters --%>
    <% { %>
    <% 
    String filters = (String)portlet.getFieldValue(jcmsContext, "filters");
    String filterFormId = service.getId() + "ServiceEditForm";
    String filterModalURL = "types/PortletMemberActivity/editMemberActivityFilter.jsp?filtersFormId=" + filterFormId + "&amp;filters="; 
    %>
		<jalios:field name="filters" resource="field-vertical" label="jcmsplugin.esn.activity.filter.editor">
	    <a href="#" onclick='var url = "<%= filterModalURL %>" + encodeURIComponent($("<%= filterFormId %>").filters.value); JCMS.window.Modal.showJSP(url); return false;'>
        <jalios:icon src="jcmsplugin-esn-filter" />
		    <%= glp("jcmsplugin.esn.activity.filter.editor.link") %>
	    </a>
	    <input value="<%= filters %>" name="filters" type="hidden"/>
	    <input value="filters" name="virtualdesktop.serviceFields" type="hidden"/>
		</jalios:field>
    <% } %>    
  
  <%-- defaultPageSize --%>
    <% { %>
    <% 
	    String pageSizeLabel = channel.getTypeFieldEntry(PortletMemberActivity.class, "defaultPageSize", true).getLabel(userLang); 
	    int pageSizeValue = portlet.getIntFieldValue(jcmsContext, "defaultPageSize"); 
    %>
		<jalios:field name="defaultPageSize" resource="field-vertical" label="<%= pageSizeLabel %>" value="<%= pageSizeValue %>">
     <input value="defaultPageSize" name="virtualdesktop.serviceFields" type="hidden"/>
			<jalios:control type="<%= ControlType.NUMBER %>"/>
		</jalios:field>
    <% } %>
  
<%@ include file='/plugins/VirtualDesktopPlugin/jsp/doServiceEditFooter.jspf' %>


