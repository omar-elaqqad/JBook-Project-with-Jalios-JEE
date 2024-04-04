<%@page import="com.jalios.jcms.taglib.settings.impl.MemberSettings.MemberFilter"%>
<%@page import="com.jalios.jcms.handler.PubChooserHandler"%>
<%@page import="com.jalios.jcms.handler.PubChooserHandler.FilterMode"%>
<%@ include file='/jcore/doInitPage.jspf' %><%
PubChooserHandler formHandler = (PubChooserHandler) request.getAttribute("pubChooserHandler");
if (Util.isEmpty(formHandler)) { %>
<jalios:include jsp="jcore/pubchooser/pubChooserHandlers.jsp" />
<% } %>
<%
formHandler = (PubChooserHandler) request.getAttribute("pubChooserHandler");

Set<Class<?>> types = formHandler.getAddButtonTypes();

%>
<% if (formHandler.showAddButton()) { %>
  <div class="ajax-refresh-div add-button-wrapper" data-jalios-ajax-refresh-url="jcore/pubchooser/pubChooserAddButton.jsp" data-jalios-pubchooser-supertype="<%= formHandler.getFileDocumentSuperClass().getSimpleName() %>" data-jalios-pubchooser-drop-enabled="<%= formHandler.isDropEnabled()  %>"><% 
  %><jalios:edit css="btn btn-primary" typeSet="<%= types %>" popup="true" editWorkspace="<%= formHandler.getAvailableChooserWorkspace() %>" ><jalios:icon src="add" /> <%= glp("ui.com.btn.add") %></jalios:edit><% 
  %></div>
<% } %>