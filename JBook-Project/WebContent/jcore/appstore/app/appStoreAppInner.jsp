<%@page import="com.jalios.jcms.uicomponent.Button.ButtonType"%>
<%@page import="com.jalios.jcms.application.ApplicationAppHandler.AdminPage"%>
<%@page import="com.jalios.jcms.taglib.card.LinkOptions"%>
<%@page import="com.jalios.jcms.application.ApplicationAppHandler"%>
<%@page import="com.jalios.jcms.application.json.ApplicationLauncher"%>
<%@page import="com.jalios.jcms.application.ApplicationManager.InstalledApplications"%>
<%@page import="com.jalios.jcms.application.json.ApplicationLauncherTab"%>
<%@page import="com.jalios.jcms.application.ApplicationManager"%>
<%@page import="com.jalios.jcms.application.ApplicationFetcher"%>
<%@page import="com.jalios.jcms.taglib.card.CardsDisplayMode"%>
<%@page import="com.jalios.jcms.application.json.Application"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/jcore/doInitPage.jspf" %><%
%>
<jalios:include jsp="jcore/appstore/app/appStoreAppHandler.jsp" />
<%
ApplicationAppHandler formHandler = (ApplicationAppHandler) request.getAttribute("appStoreAppHandler");

if (formHandler == null) {
  return;
}

if (!isLogged) {
  sendForbidden(request, response);
  return;
}

formHandler.addFrontEndDependencies();
%>
<div class="ajax-refresh-div appstore" data-jalios-ajax-refresh-url="jcore/appstore/app/appStoreAppInner.jsp">
  <jalios:app name="appstore">
    <jalios:appSidebar icon="application-store" iconTitleProp="appstore.return-to-home" formAction="jcore/appstore/app/appStoreApp.jsp" formCss="js-appstore-form" appUrl="jcore/appstore/app/appStoreApp.jsp">
      <jalios:include target="APP_CATALOG_SEARCH_TOP" targetContext="div"/>
      <jalios:appSidebarSectionSearch ajaxRefresh="true" inputName="appstoreSearch" value="<%= formHandler.getAppstoreSearch() %>" label="appstore.search.placeholder" placeholder="appstore.search.placeholder" />
      <jalios:include target="APP_CATALOG_SEARCH_BOTTOM" targetContext="div"/>      
      <jalios:appSidebarSection name="navigation" title="ui.app.sidebar-section.views">
        <jalios:include target="APP_CATALOG_DISPLAY_TOP" targetContext="div"/>
        <jalios:field name="mode" resource="field-app">
          <jalios:control settings='<%= formHandler.getModeSettings() %>' />
        </jalios:field>
        <jalios:include target="APP_CATALOG_DISPLAY_BOTTOM" targetContext="div"/>
      </jalios:appSidebarSection>
      <% if (formHandler.displayTypeChooser()) { %>
        <jalios:appSidebarSection title="appstore.sidebar.section.category" name="category">
          <ul class="app-sidebar-treecat" >
            <jalios:include target="APP_CATALOG_CATEGORY_TOP" targetContext="li"/>
            <li class="<%= Util.isEmpty(Util.trimStringArray(formHandler.getCids())) ? "active is-checked" : ""  %>">
              <label class="" dir="ltr">
                <input name="cids" type="radio" value="" data-jalios-action="ajax-refresh">
                <%= glp("appstore.section.others") %> 
              </label>
            </li>
            <jalios:include target="APP_CATALOG_CATEGORY_MIDDLE" targetContext="li"/>
            <% 
              Set<Category> typeSet = new TreeSet<>(Category.getOrderComparator(userLang)); 
              typeSet.addAll(ApplicationManager.getInstance().getTypeRoot().getChildrenSet());
            %>
            <% for (Category cat : typeSet) { 
                if(!cat.canBeReadBy(loggedMember, true, true)){
                  continue;
                }
            %>
              <% request.setAttribute("appstore.category", cat); %>
              <jalios:include jsp="jcore/appstore/app/appStoreApp_categoryNode.jsp" />
            <% } %>
            <jalios:include target="APP_CATALOG_CATEGORY_BOTTOM" targetContext="li"/>
          </ul>
        </jalios:appSidebarSection>
      <% } %>
     
      <% if (formHandler.displayAdministration()) { %>
        <jalios:appSidebarSection title="appstore.sidebar.section.administration" name="admin">
          <ul class="app-sidebar-menu">
           <jalios:include target="APP_CATALOG_ADMIN_TOP" targetContext="li"/>
            <li class="<%= AdminPage.STATS == formHandler.getAvailableAdminPage() ? "active is-checked" : "" %>">
              <a href="jcore/appstore/app/appStoreApp.jsp?adminPage=<%= AdminPage.STATS.toString() %>" data-jalios-action="ajax-refresh" ><%= glp("appstore.sidebar.admin.stats") %></a>
            </li>
            <li class="<%= AdminPage.LAUNCHER == formHandler.getAvailableAdminPage() ? "active is-checked" : "" %>">
              <a href="jcore/appstore/app/appStoreApp.jsp?adminPage=<%= AdminPage.LAUNCHER.toString() %>" data-jalios-action="ajax-refresh" ><%= glp("appstore.sidebar.admin.launcher") %></a>
            </li>
            <li class="<%= AdminPage.SETUP == formHandler.getAvailableAdminPage() ? "active is-checked" : "" %>">
              <a href="jcore/appstore/app/appStoreApp.jsp?adminPage=<%= AdminPage.SETUP.toString() %>" data-jalios-action="ajax-refresh" ><%= glp("appstore.sidebar.admin.setup") %></a>
            </li>
            <jalios:include target="APP_CATALOG_ADMIN_BOTTOM" targetContext="li"/>
          </ul>
        </jalios:appSidebarSection>
      <% } %>
      <% if (loggedMember.canPublish(Shortcut.class)) { %>
        <jalios:appSidebarSection name="actions">
	        <jalios:include target="APP_CATALOG_ACTION_TOP" targetContext="li"/>
	         <jalios:buttonModal buttonType="<%= ButtonType.BUTTON %>" label="appstore.sidebar.admin.add-application" url="jcore/appstore/app/createApplicationModal.jsp" css="btn btn-default btn-add-application" icon="add"/>
	        <jalios:include target="APP_CATALOG_ACTION_BOTTOM" targetContext="li"/>
        </jalios:appSidebarSection>
      <% } %>
    </jalios:appSidebar>
    <jalios:appMain headerTitle="appstore.application.label" css='<%= formHandler.isAdminPageDisplayed() ? "is-admin-page" : "" %>'>
      <% if (Util.notEmpty(formHandler.getAvailableDisplayedApplication())) { %>
        <jalios:appBodyInclude jsp="jcore/appstore/app/appStoreApp_displayedApplication.jsp" />
      <% } else if (formHandler.isAdminPageDisplayed()) { %>
        <form action="jcore/appstore/app/appStoreApp.jsp?adminPage=<%= formHandler.getAvailableAdminPage().toString() %>" method="POST">
          <jalios:appBodyInclude jsp="<%= formHandler.getAvailableAdminPage().getUrl() %>" />
        </form>
      <% } else if (formHandler.getAvailableMode() == ApplicationFetcher.Mode.MY_DEPARTMENT && Util.isEmpty(loggedMember.getOrganizationGroupSet())) { %>
        <jalios:appBodyNoResult text="appstore.msg.no-department" />
      <% } else { %>
        <% if (Util.isEmpty(formHandler.getApplications())) { %>
          <jalios:appBodyNoResult />
        <% } else { %>
          <jalios:include jsp="jcore/appstore/app/appStoreApp_suggestions.jsp" />
            <nav class="navbar navbar-default">
              <div class="container-fluid">
                <ul class="nav navbar-nav">
                  <jalios:dropdown triggerCss="dropdown-toggle ctx-caret" wrapperTag="li" triggerLabel='<%= formHandler.getAvailableSortMode().equals(ApplicationFetcher.SortMode.POPULARITY) ? glp("appstore.sort.POPULARITY") : glp("appstore.sort.PDATE") %>'>
                    <li><a href="#" data-jalios-appstore-sort="<%= ApplicationFetcher.SortMode.POPULARITY %>" class="js-change-sort" role="button"><%= glp("appstore.sort.POPULARITY") %></a></li>
                    <li><a href="#" data-jalios-appstore-sort="<%= ApplicationFetcher.SortMode.PDATE %>" class="js-change-sort" role="button"><%= glp("appstore.sort.PDATE") %></a></li>                  
                  </jalios:dropdown>
                </ul>
              </div><!-- /.container-fluid -->
            </nav>
          
            <% if (Util.notEmpty(formHandler.getSuggestions())) { %>
              <h2><%= glp("appstore.section.others") %></h2>
            <% } %>
            <jalios:cards css="card-appstore-layout">
              <% for (Application itApplication : formHandler.getApplications()) { %>
                <% request.setAttribute("appstore.application", itApplication); %>
                <jalios:include jsp="jcore/appstore/app/appStoreApp_applicationCard.jsp" />
              <% } %>
            </jalios:cards>
        <% } %>
      <% } %>
    
    </jalios:appMain>
  </jalios:app>
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>