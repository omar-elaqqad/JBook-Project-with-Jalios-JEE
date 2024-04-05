<%--
  @Summary: CollaborativeSpace PortletSelection template
  @Category: Layout
  @Author: Olivier Dedieu <olivier.dedieu@jalios.com>
  @Customizable: True
  @Requestable: False
--%><%@page import="com.jalios.jcmsplugin.collaborativespace.*"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%
%><%@ include file='/types/PortletSelection/doSelection.jspf' %><%

PortletSelection box = (PortletSelection) portlet;
if (!(portal instanceof CollaborativeSpace)) {
  %><jalios:message msg="jcmsplugin.collaborativespace.dashboard.warn.invalid-portal-container" level="<%= MessageLevel.ERROR %>" /><%
  return;
}

CollaborativeSpace cs = (CollaborativeSpace) portal;
PortalElement[] portlets = (PortalElement[]) cs.getChildren(new String[]{"apps","apps1","apps2","apps3","apps4","apps5"});
List<PortalElement> portletList = new ArrayList<PortalElement>();

for (int i = 0 ; i < portlets.length; i++) {
  PortalElement itPortlet = portlets[i];
  if (itPortlet == null) {
    continue;
  }
  if (!itPortlet.hasAbility("portlet.ability.jcmsplugin.collaborativespace.dashboard")) {
    continue;
  }
  portletList.add(itPortlet);
}
request.setAttribute("children",portletList.toArray(new PortalElement[0]));
request.setAttribute("PortalElement", cs);
final CSManager csMgr = CSManager.getInstance();
if (csMgr.canManageCSServices(loggedMember, workspace)) {
  jcmsContext.setAjaxRequestAttribute(CSManager.EDIT_SERVICES_REQUEST_FLAG, Boolean.TRUE); // For Drag&Drop to be allowed for ACL Members
}
request.setAttribute("isCollaborativeSpaceDashboard", Boolean.TRUE);

int columnCount = cs.getDashboardColumnCount() > 0 ? cs.getDashboardColumnCount() : 2;
if (Util.notEmpty(request.getAttribute("children"))) {
  ServletUtil.backupAttribute(pageContext, "ShowChildPortalElement");
  %><%@ include file='/types/AbstractCollection/doIncludePortletCollection.jspf' %><%
  ServletUtil.restoreAttribute(pageContext, "ShowChildPortalElement");

  // Clear buffer
  for (Iterator it = bufferList.iterator(); it.hasNext();) {
    if (Util.isEmpty(it.next())) {
      it.remove();
    }
  }
  // Cast to Array
  String[] buffers = (String[]) bufferList.toArray(new String[0]);
  
  // Set ID
  String appsCSS = "dashboard-column";
  if (isLogged && loggedMember.canWorkOn(cs)) {
    appsCSS += " ID_"+cs.getId()+" dnd-container";
  }
  
  // Columns width
  boolean isSidebar = !"sidebar-none".equals(cs.getLayout());
  String columnCSS = "col-xs-12";
  
  if (isSidebar) {
    if (columnCount > 1) {
      columnCSS += " col-sm-12 col-md-6";
    }
    if (columnCount > 2) {
      columnCSS += " col-lg-" + (int)(12 / columnCount);
    }
  } else {
    if (columnCount > 1) {
      columnCSS += " col-sm-6";
    }
    if (columnCount > 2) {
      columnCSS += " col-md-4";
    }
    if (columnCount > 3) {
      columnCSS += " col-lg-" + (int)(12 / columnCount);
    }
  }
  %>
  <div id="dashboard-wrapper">
    <div id="dashboard" class="responsive">
      <jalios:include target="PLUGIN_COLLABORATIVESPACE_DASHBOARD_TOP" />
      <div class="row">
        <% for(int i = 1; i <= columnCount; i++) { %>
          <div class="<%= columnCSS %>">
            <div id="apps<%= i %>" class="<%= appsCSS %>">
              <%= getPortlets(bufferMap,"apps" + i,"") %>
            </div>
          </div>
        <% } %>
      </div>
      <jalios:include target="PLUGIN_COLLABORATIVESPACE_DASHBOARD_BOTTOM" />
    </div>
  </div>
<% } %>