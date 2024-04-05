<%--
  @Summary: PortletMyCollaborativeSpaces Subspace list
  @Category: Custom
  @Author: Sylvain Devaux <sylvain.devaux@jalios.com> 
  @Since: csp-7.3
--%>
<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ page import="com.jalios.jcmsplugin.collaborativespace.*" %><%
%><%@page import="com.jalios.jcmsplugin.collaborativespace.guest.*"%><%
%><%@ page import="com.jalios.jcmsplugin.collaborativespace.guest.selector.*" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%

if (portlet == null) {
  return;
}
if (!isLogged) {
  request.setAttribute("ShowPortalElement", Boolean.FALSE);
  return;
}
// Not a collaborative Space ?
if (workspace == null || ! workspace.isCollaborativeSpace()) {
  request.setAttribute("ShowPortalElement", Boolean.FALSE);
  return;
}

jcmsContext.addCSSHeader("plugins/CollaborativeSpacePlugin/css/cs-my-spaces.css");
jcmsContext.addJavaScript("plugins/CollaborativeSpacePlugin/js/cs-hierarchical-spaces.js");

String url = "types/PortletMyCollaborativeSpaces/doPortletMyCollaborativeSpacesHierarchicalFullDisplay.jsp";
CSManager csMgr = CSManager.getInstance();
String csTypoParam = "cstypology_" + JcmsUtil.getId(portlet);
Category typoCat = getCategoryParameter(csTypoParam);
String typoFormAction = url;
%>
<%@ include file='/types/PortletMyCollaborativeSpaces/hierarchical/doHierarchicalFooter.jspf' %>
<%
//----------------------------------------------------------------------
// COMPUTE LIST
//----------------------------------------------------------------------
Comparator<Workspace> comparator = Workspace.getNameComparator(userLang);
DataSelector csSelector = new CSCollaborativeSpaceSelector(loggedMember);
boolean isTypoFilter = typoCat != null;
if (isTypoFilter) {
  csSelector = new AndDataSelector(csSelector, new CSTypologySelector(typoCat, loggedMember));
}

int maxLevel = ((PortletMyCollaborativeSpaces)portlet).getDepth();

CSNode rootNode = csMgr.getCSTree(workspace, null, 0, maxLevel, csSelector, comparator);

%>

<div class="subCollaborativeSpaces">
  <%-- TYPOLOGY --%>
  <%@ include file='/types/PortletMyCollaborativeSpaces/doTypologyFilter.jspf' %>

  <%
  if (rootNode.isTreeLeaf()) {
    %><div class="no-cs"><%= glp("jcmsplugin.collaborativespace.portlet.mycs.lbl.none") %></div><%
  } else {
    String refinePortletParam = "subspace_" + portlet.getId();
    String clickedCSId = Util.getString(HttpUtil.getDataIdParameter(request, refinePortletParam), "");    // A CS which has been clicked, to be expand
    
    CollaborativeSpace clickedCs = (CollaborativeSpace) channel.getData(clickedCSId);
    
    List<CollaborativeSpace> openedCSList = new ArrayList<CollaborativeSpace>();
    if (clickedCs != null) {
      openedCSList.add(clickedCs); // Add to "CS to be opened" list
    }
    %>
    <jalios:list>
      <jalios:tree root='<%= rootNode %>' type='CSNode' name='itNode'>
        <%
        ServletUtil.backupAttribute(pageContext, "cs-node");
        ServletUtil.backupAttribute(pageContext, "cs-node-level");
        ServletUtil.backupAttribute(pageContext, "cs-node-opened-list");
        request.setAttribute("cs-node", itNode);
        request.setAttribute("cs-node-level", itLevel);
        request.setAttribute("cs-node-opened-list", openedCSList);
        %>
        <jalios:include jsp="/types/PortletMyCollaborativeSpaces/hierarchical/doHierarchicalListItem.jsp" />
        <%
        ServletUtil.restoreAttribute(pageContext, "cs-node");
        ServletUtil.restoreAttribute(pageContext, "cs-node-level");
        ServletUtil.restoreAttribute(pageContext, "cs-node-opened-list");
        %>
      </jalios:tree>
    </jalios:list>
  <% } %>
  <%@ include file='/types/PortletMyCollaborativeSpaces/doPortletFooter.jspf' %>
</div>
