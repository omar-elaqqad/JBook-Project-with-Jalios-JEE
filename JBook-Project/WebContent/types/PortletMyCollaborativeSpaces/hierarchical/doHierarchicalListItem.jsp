<%@page import="com.jalios.jcmsplugin.collaborativespace.CSHelper"%><%
%><%@page import="com.jalios.jcmsplugin.collaborativespace.CSNode"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%!

// ----------------------------------------------------------------------
// Static utility classes
// ----------------------------------------------------------------------

public static String getToggleLinkHTML(
    CSNode csNode, 
    HttpServletRequest request, 
    String refinePortletParam,
    List<CollaborativeSpace> openedCSList) throws IOException {
  
  // Do CS have childs ?
  Collection<CSNode> childs = csNode.getTreeChildren();
  if (Util.isEmpty(childs)) {
    return "";
  }
  CollaborativeSpace cs = csNode.getCs();
  String param = HttpUtil.getDataIdParameter(request, refinePortletParam);
  
  StringBuilder htmlBuilder = new StringBuilder();
  String openUrl;
  if (cs.getId().equals(param)) {
    openUrl = ServletUtil.getAbsUrlWithRemovedParams(request, new String[]{refinePortletParam});
  } else {
    openUrl = ServletUtil.getAbsUrlWithUpdatedParam(request, refinePortletParam, cs.getId());
  }

  htmlBuilder.append("<span");
  htmlBuilder.append(" class='cs-node-toggle-childs ctx-caret subspaces-opener'");
  htmlBuilder.append(" role=\"button\"");
  htmlBuilder.append(" tabindex=\"0\"");
  boolean isOpened = openedCSList != null && openedCSList.contains(cs);
  String userLang = Channel.getChannel().getCurrentUserLang();
  String label = isOpened ? JcmsUtil.glp(userLang, "jcmsplugin.collaborativespace.portlet.mycs.btn.toggle-subspaces.hide")
      : JcmsUtil.glp(userLang, "jcmsplugin.collaborativespace.portlet.mycs.btn.toggle-subspaces.show");
  htmlBuilder.append(" aria-label=\"" + HttpUtil.encodeForHTMLAttribute(label) + "\"");
  htmlBuilder.append(" title=\"" + HttpUtil.encodeForHTMLAttribute(label) + "\"");
  htmlBuilder.append(" aria-expanded=\"" + isOpened + "\"");

  if (!isOpened) {
    DataAttribute refreshAttr = new DataAttribute();
    refreshAttr.addData("jalios-cs-tree-param-name", refinePortletParam);
    refreshAttr.addData("jalios-cs-tree-param-value", cs.getId());
    htmlBuilder.append(refreshAttr.toString());
  }

  htmlBuilder.append(">");
  htmlBuilder.append("</span>");
  return htmlBuilder.toString();
}

%><%

CSNode itNode = (CSNode) request.getAttribute("cs-node");
if (itNode == null) {
  return;
}

PortletMyCollaborativeSpaces portlet = (PortletMyCollaborativeSpaces) request.getAttribute(PortalManager.PORTAL_PORTALELEMENT);
if (portlet == null) {
  return;
}

String refinePortletParam = "subspace_" + portlet.getId();
// A CS which has been clicked, to be expand
String clickedCSId = Util.getString(HttpUtil.getDataIdParameter(request, refinePortletParam), "");

CollaborativeSpace clickedCs = (CollaborativeSpace) channel.getData(clickedCSId);

List<CollaborativeSpace> openedCSList = (ArrayList) request.getAttribute("cs-node-opened-list");

CollaborativeSpace itCS = itNode.getCs();

// Am I an ancestor of the opened CS
boolean isAncestor = clickedCs != null && itNode.hasDescendant(clickedCs);
if (isAncestor) {
  openedCSList.add(itCS);
}

// Is my parent opened ?
boolean isMyParentOpen = false;
for (CollaborativeSpace openedCS : openedCSList) {
  isMyParentOpen = itNode.hasParent(openedCS);
  if (isMyParentOpen) {
    break;
  }
}

// itLevel: a TreeTag variable
Integer itLevel = (Integer) request.getAttribute("cs-node-level");

if (itLevel == null) {
  itLevel = 0;
}

// Should CS to be displayed ?
  // Yes, if first level
  // Yes, if my parent has been clicked
  // Yes, if any of my descendant has been clicked
boolean isOpened = openedCSList != null && openedCSList.contains(itCS);
boolean displayCS = itLevel == 0 || isMyParentOpen || isOpened;

if (displayCS) {
  boolean isPublic = CSHelper.isPublic(itCS);
  String csInnerClass = "sub-workspace level-"+(itLevel + 1);
  csInnerClass += " " + (isPublic ? "access-public" : (CSHelper.isPrivate(itCS) ? "access-private" : (CSHelper.isSecret(itCS) ? "access-secret" : "")));
  if (isOpened) {
    csInnerClass += " is-opened";
  }

  %><jalios:buffer name="toggleLinkBuffer"><%
  if (itNode.isTreeNode()) {
    String openLink = getToggleLinkHTML(itNode, request, refinePortletParam, openedCSList);
    %><%= openLink %><%
  }
  %></jalios:buffer><%
  String itemText = itCS.getTitle(userLang);
  String itemIcon = CSHelper.getIcon(itCS);
  String itemCss = csInnerClass;
  if (itNode.isTreeNode()) {
    itemText += toggleLinkBuffer.toString();
  }
  %>
  <jalios:dataListItem 
          text="<%= itemText %>"
          data="<%= itCS %>" 
          icon="<%= itemIcon %>" 
          css="<%= itemCss %>" />
<% } %>