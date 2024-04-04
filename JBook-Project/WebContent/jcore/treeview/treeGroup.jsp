<%@ include file="/jcore/doInitPage.jspf" %><%@page import="com.jalios.jcms.taglib.TreeViewTag" %><%

  Group node = channel.getGroup((String) request.getAttribute("treeId"));
  request.removeAttribute("treeId");

  // Provides a Set of roots
  Collection<Group> nodeSet = (Collection<Group>) request.getAttribute("treeCollection");
  request.removeAttribute("treeCollection");
  if (nodeSet == null && node != null){
    nodeSet = node.getChildrenSet();
  }
  
  TreeViewTag.TreeView treeview = (TreeViewTag.TreeView) request.getAttribute("treeview");
  String prefix =  treeview != null ? treeview.getTreePrefix() : null;
  
  if (nodeSet == null) { return; }
  Collection highlighted = Util.emptyTreeSet();
  if (treeview != null && treeview.getTreeHighlighted() != null){
    highlighted = treeview.getTreeHighlighted();
  }
  for (Group itNode : nodeSet) {
    // Check if the category is persisted because when a category is deleted, the TreeView object in the AjaxRequestAttribute still contains this category
    if ((treeview != null && treeview.isRemoved(itNode)) || !itNode.isPersisted()) {
      continue;
    }
    
    if(itNode != null && itNode.canBeReadBy(loggedMember)) {
      boolean hl = highlighted.contains(itNode);
  %><li data-jalios-id="<%= itNode.getId() %>">
      <jalios:icon src="group" />
      <% if (null != treeview) { %>
      <a href='<%= Util.getString(treeview.getTreeLink(itNode, jcmsContext),"#") %>' class='treeview-name <%= hl ? "highlight" : "" %> <%= treeview.isAjaxLink() ? "ajax-refresh" : "" %>'><%= itNode.getName(userLang) %></a>
      <% } else { %><span class='treeview-name'><%= itNode.getName(userLang) %></span><% } %>
      <% if (Util.notEmpty(treeview.getFilteredChildren(itNode))) { %>
        <jalios:treeview prefix="<%= prefix %>" node="<%= itNode %>" />
      <% } %>
    </li>
  <% } %>
<% } %>