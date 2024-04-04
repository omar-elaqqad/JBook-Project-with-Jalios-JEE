<%@page import="com.jalios.jcms.application.ApplicationAppHandler"%>
<%@page import="com.jalios.jcms.application.json.ApplicationLauncherTab"%>
<%@page import="com.jalios.jcms.application.json.ApplicationLauncher"%>
<%@page import="com.jalios.jcms.application.ApplicationManager"%>
<%@ include file="/jcore/doInitPage.jspf" %>
<%
ApplicationAppHandler formHandler = (ApplicationAppHandler) request.getAttribute("appStoreAppHandler");

if (formHandler == null) {%>
  <jalios:include jsp="jcore/appstore/app/appStoreAppHandler.jsp" />
<% }
formHandler = (ApplicationAppHandler) request.getAttribute("appStoreAppHandler");

if (formHandler == null) {
  return;
}

ApplicationManager mgr = ApplicationManager.getInstance();

Group department = formHandler.getAvailableDepartmentGroup();

ApplicationLauncher defaultLauncher = null;

if (department != null) {
  defaultLauncher = mgr.getDefaultApplicationLauncher(department);
} else {
  defaultLauncher = mgr.getDefaultApplicationLauncher();
}

Group currentGroupLauncher = mgr.getDefaultApplicationLauncherGroup(department);
boolean showLauncherConfiguration = mgr.hasDefaultApplicationLauncher(department) || Util.isEmpty(formHandler.getAvailableDepartmentGroup());
%>

<div class="ajax-refresh-div app-store-default-setup" data-jalios-ajax-refresh-url="jcore/appstore/app/appStoreAppDefaultSetup.jsp">
  <% if (formHandler.isDepartmentLauncherEnabled()) { %>
    <p><%= glp("appstore.admin.launcher.description") %></p>
  <% } %>
  <% if (defaultLauncher != null) { %>
    <div class="application-default-chooser br">
      <% if (formHandler.isDepartmentLauncherEnabled()) { %>
        <jalios:field resource="field-vertical" name="departmentGroup" value="<%= department %>" required="true">
          <% String targetAriaLabel = " aria-label=\"appstore.admin.field-target\" "; %>
          <jalios:control settings="<%= formHandler.getDepartmentEnumerateSettings().htmlAttributes(targetAriaLabel) %>" />
        </jalios:field>
      <% } %>
      
      <% if (department != null) { %>
        <input class="departmentGroup" type="hidden" name="defaultPreferenceGroupId" value="<%= department.getId() %>" />
      <% } %>
        <% if (!showLauncherConfiguration) { %>
          <jalios:message css="js-toggle-launcher-conf" dismissable="false">
            <% if (currentGroupLauncher == null) { %>
              <p><%= glp("appstore.admin.launcher.is-using-site-launcher", formHandler.getAvailableDepartmentGroup().getName(userLang)) %></p>
            <% } else { %>
              <p><%= glp("appstore.admin.launcher.is-using-parent-launcher", formHandler.getAvailableDepartmentGroup().getName(userLang), currentGroupLauncher.getName(userLang)) %></p>
            <% } %>
            <button class="btn btn-default" data-jalios-action="toggle:hide" data-jalios-target=".js-toggle-launcher-conf"><%= glp("appstore.admin.customize") %></button>
          </jalios:message>
        <% } %>
        <div class="js-toggle-launcher-conf <%= !showLauncherConfiguration ? "hide" : "" %>">
          <ul class="nav nav-tabs nav-tabs-underlined" data-tabdrop=true>
            <% 
              int itTabCounter = 0; 
              int itTabPaneCounter = 0;
            %>
            <% for (ApplicationLauncherTab itTab : defaultLauncher.getTabs()) { %>
              <li data-jalios-tab-nameml="<%= encodeForHTMLAttribute(itTab.getNameMLJSon()) %>" class="<%= itTabCounter == 0 ? "active" : "" %> application-nav-tab-item">
                <a href="#application-tab_<%= department == null ? "default" : department.getId() %>_<%= itTabCounter %>" role="tab" data-toggle="tab" onclick="return false;"><%= itTab.getLangName(userLang) %></a>
                <div class="dropdown">
                  <a class="tab-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="caret"></span>
                  </a>
                  <ul class="dropdown-menu">
                    <li><a class="btn-tab-rename" data-jalios-appstore-action="renameActiveTab"><%= glp("appstore.admin.rename-tab-btn") %></a></li>
                    <li><a class="btn-tab-delete" data-jalios-appstore-action="deleteActiveTab"><%= glp("appstore.admin.delete-tab-btn") %></a></li>
                  </ul>
                </div>
              </li>
              <% itTabCounter++; %>
            <% } %>
            
          </ul>
          <a class="app-store-add-tab" data-jalios-appstore-action="addTab" title="<%= glp("appstore.admin.add-tab-btn") %>" aria-label="<%= glp("appstore.admin.add-tab-btn") %>"><jalios:icon src="appstore-add-tab" alt="+" /></a>
          
          <div class="tab-content">
            <% for (ApplicationLauncherTab itTab : defaultLauncher.getTabs()) { %>
              <div id="application-tab_<%= department == null ? "default" : department.getId() %>_<%= itTabPaneCounter %>" class="launcher-editor-tab-content tab-pane <%= itTabPaneCounter == 0 ? "active" : "" %>">
                <jalios:field css="launcher-application-items" resource="field-vertical" mv="1" value="<%= itTab.getShortcutIds() %>">
                  <jalios:control settings="<%= new PublicationSettings().chooser().superType(Shortcut.class) %>" />
                </jalios:field>
              </div>
              <% itTabPaneCounter++; %>
            <% } %> 
            <input type="hidden" name="defaultApplicationJson" value="<%= encodeForHTMLAttribute(ApplicationManager.getInstance().getApplicationLauncherAsJson(defaultLauncher)) %>" />
         </div>
         <button type="button" class="btn btn-primary" data-jalios-appstore-action="saveDefaultPreference"><%= glp("appstore.admin.save-btn") %></button>
         <% if (Util.notEmpty(formHandler.getAvailableDepartmentGroup()) && currentGroupLauncher != null) { %>
           <button type="submit" name="opResetDefaultLauncher" value="true" class="btn btn-danger confirm" data-jalios-action="ajax-refresh"><%= glp("appstore.admin.reset-default-launcher") %></button>
         <% } %>
       </div>

    </div>
  <% } %>
</div>