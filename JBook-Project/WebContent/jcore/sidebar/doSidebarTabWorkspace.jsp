<%@ include file='/jcore/doInitPage.jspf' %><%
jcmsContext.addCSSHeader("css/jalios/core/components/loading/jalios-loading-circle.css");
jcmsContext.addJavaScript("js/jalios/core/components/jalios-loading-circle.js");
jcmsContext.addJavaScript("js/jalios/core/jalios-field-autocomplete.js");

Map<String, Object> textFieldSettingsDataAttributes = new HashMap<String, Object>();
textFieldSettingsDataAttributes.put("jalios-field-autocomplete", "jcore/sidebar/doSidebarTabWorkspace_autocomplete.jsp");
textFieldSettingsDataAttributes.put("jalios-target",".sidebar-tab-content-workspace .workspace-autocomplete-results");

Map<String, Object> htmlAttributesMap = new HashMap<String, Object>();
htmlAttributesMap.put("autocomplete", "off");
%>
<div class="ajax-refresh-div" data-jalios-ajax-refresh-url="jcore/sidebar/doSidebarTabWorkspace.jsp">
  <div class="sidebar-tab-content-workspace">
    <h2 class="sidebar-tab-title"><%= glp("ui.topbar.myworkspaces") %></h2>
    <jalios:field css="sidebar-tab-search" name='workspaceQuery' value="" resource="field-vertical">
      <jalios:control settings='<%= new TextFieldSettings().aria("label", glp("ui.workspace.workspace-search-placeholder")).placeholder("ui.workspace.workspace-search-placeholder").htmlAttributes(htmlAttributesMap).aria("label", encodeForHTMLAttribute(glp("ui.topbar.workspace.placeholder"))).dataAttributes(textFieldSettingsDataAttributes) %>' />
    </jalios:field>
    <jalios:include jsp="jcore/sidebar/doSidebarTabWorkspace_autocomplete.jsp" />
  </div>
  <jalios:include target="SIDEBAR_WORKSPACES" />
  
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>