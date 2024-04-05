<%@ include file='/plugins/SmartPhonePlugin/jsp/common/header.jspf' %><%
%><%
SortedSet<Workspace> recentWorkspaceSortedSet = smartPhoneManager.getRecentWorkspaceSortedSet(loggedMember, userLang);
SortedSet<Workspace> otherWorkspaceSortedSet = smartPhoneManager.getOtherWorkspaceSet(loggedMember, userLang, recentWorkspaceSortedSet);
request.setAttribute("smartphoneRecentWorkspaceSortedSet", recentWorkspaceSortedSet);
request.setAttribute("smartphoneOtherWorkspaceSortedSet", otherWorkspaceSortedSet);

SmartPhoneService service = new WorkspaceSmartPhoneService("jcmsplugin.smartphone.service.workspace");
if (!service.isEnabled(jcmsContext)) {
  sendRedirect(SmartPhoneConstants.FORBIDDEN_JSP_PATH);
  return;
}
%>
<jalios:include target="SMARTPHONE_INDEX_WORKSPACE_SET" targetContext="empty"/>
<% 
recentWorkspaceSortedSet = (SortedSet<Workspace>) request.getAttribute("smartphoneRecentWorkspaceSortedSet");
otherWorkspaceSortedSet.addAll((SortedSet<Workspace>) request.getAttribute("smartphoneOtherWorkspaceSortedSet")); 
%>

<div id="service-workspace" class="service-workspace-page" data-role="page" data-dom-cache="true">
  <smartphone:breadcrumb icon="collaborative-space" service="<%= service %>" css="no-padding-bottom" />
  <%@ include file='/plugins/SmartPhonePlugin/jsp/common/doServiceTopbarMenu.jspf' %>

  <div class="index-workspace no-focus">
    <% if (Util.notEmpty(recentWorkspaceSortedSet) || Util.notEmpty(otherWorkspaceSortedSet)) {
      boolean displayFilterWorkspace = Util.getSize(recentWorkspaceSortedSet) + Util.getSize(otherWorkspaceSortedSet) > 1;
      %>
      <form>
      <% if (displayFilterWorkspace) { %>
        <div class="colored-banner input-in-header smartphone-autocomplete-filter-input-wrapper smartphone-workspace-filter-input-wrapper">
           <input name="q" data-type="search" placeholder="<%= glp("ui.com.placeholder.search") %>" class="smartphone-search-filter-input">
        </div>
		</form>
      <% } %>
      
      <div class="service-workspace-content" data-role="content">
        <ul data-role="listview" data-jalios-autocomplete="plugins/SmartPhonePlugin/jsp/service/workspace/workspace-autocomplete.jsp" class="autocomplete smartphone-workspace-filter-list <%= displayFilterWorkspace ? "ajax-autocomplete" : ""  %>" data-jalios-autocomplete-minchar="0" data-filter-reveal="false" data-autodividers="false" data-inset="false" data-input=".smartphone-search-filter-input" data-filter-placeholder="<%= glp("jcmsplugin.smartphone.action.filter") %>" <%= displayFilterWorkspace ? "data-filter=\"true\"" : "" %>>
         
         <%@ include file='/plugins/SmartPhonePlugin/jsp/service/workspace/workspace-listview.jspf' %>
         
        </ul>
      </div>
    <% } %>
  </div>
</div>

<%@ include file='/plugins/SmartPhonePlugin/jsp/common/footer.jspf' %> 