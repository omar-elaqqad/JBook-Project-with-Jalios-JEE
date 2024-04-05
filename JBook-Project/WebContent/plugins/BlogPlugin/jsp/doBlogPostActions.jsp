<%@ include file="/jcore/doInitPage.jspf" %><%
Publication pub = (Publication) request.getAttribute(PortalManager.PORTAL_PUBLICATION);
if (pub instanceof BlogPost) {%>
  <jalios:buffer name="customEditIcon">
    <a class="list-group-item pub-action-main pub-action-edit" href="types/BlogPost/doBlogPostEditDisplay.jsp?id=<%= pub.getId() %><%= workspace.getHomePortal() != null ? "&amp;portal=" + workspace.getHomePortal().getId() : "" %>" title="<%= encodeForHTMLAttribute(glp("ui.com.alt.edit")) %>">
      <span class="pub-action-edit-icon nowrap"><jalios:icon src="edit" /></span>
      <span class="publication-action-label"><%= glp("ui.com.alt.edit") %></span>
    </a>
    <jalios:edit data="<%= pub %>" ctxEdit="false" popup="true" css="list-group-item pub-action-optional pub-action-edit">
      <span class="pub-action-edit-icon nowrap"><jalios:icon src="edit"/></span>
      <span class="publication-action-label"> <%=glp("ui.com.btn.edit-full") %></span>
    </jalios:edit>
  </jalios:buffer><%
  request.setAttribute("PUBLICATION_ACTIONS_EDIT_ITEM", ((Map<String, Object>) request.getAttribute("BUFFER_CONTEXT")).get("customEditIcon"));
} 
if (pub instanceof Blog) {%>
  <jalios:buffer name="customEditBlogIcon">
    <a class="list-group-item pub-action-main pub-action-edit" href="types/Blog/doBlogEditDisplay.jsp?id=<%= pub.getId() %><%= workspace.getHomePortal() != null ? "&amp;portal=" + workspace.getHomePortal().getId() : "" %>" title="<%= encodeForHTMLAttribute(glp("ui.com.alt.edit")) %>">
      <span class="pub-action-edit-icon nowrap"><jalios:icon src="edit" /></span>
      <span class="publication-action-label"><%= glp("ui.com.alt.edit") %></span>
    </a>
    <jalios:edit data="<%= pub %>" ctxEdit="false" popup="true" css="list-group-item pub-action-optional pub-action-edit">
      <span class="pub-action-edit-icon nowrap"><jalios:icon src="edit"/></span>
      <span class="publication-action-label"> <%=glp("ui.com.btn.edit-full") %></span>
    </jalios:edit>
  </jalios:buffer><%
  request.setAttribute("PUBLICATION_ACTIONS_EDIT_ITEM", ((Map<String, Object>) request.getAttribute("BUFFER_CONTEXT")).get("customEditBlogIcon"));
} %>