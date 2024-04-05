<%@page import="com.jalios.jcmsplugin.bookmarks.BookmarkManager"%>
<%@page import="com.jalios.jcmsplugin.bookmarks.BookmarkItemMenuInfo"%>
<%@page import="com.jalios.jcmsplugin.bookmarks.BookmarkItem"%>
<%@page import="com.jalios.jcms.taglib.menu.MenuInfo"%>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
BookmarkManager bookMarkMgr = BookmarkManager.getInstance();
Collection<BookmarkItemMenuInfo> menuInfoList = (Collection<BookmarkItemMenuInfo>) request.getAttribute("menuInfoList");
StringBuilder childrenMenu = (StringBuilder) request.getAttribute("childrenMenu"); 
Map<Integer, StringBuilder> childrenDepthMap = (Map<Integer, StringBuilder>) request.getAttribute("childrenDepthMap");
Integer depth = (Integer) request.getAttribute("menu-depth");
if(depth == null){
  depth = 0;
}
%>
<% for(BookmarkItemMenuInfo menuInfo : menuInfoList){ %>
  <% if(menuInfo.isTreeLeaf()){ 
    boolean isExternalLink = bookMarkMgr.isExternalLinks(menuInfo.getLink());
    boolean isInNewWindows = bookMarkMgr.getExternalLinksInNewWindow(null,isExternalLink);
    String title = bookMarkMgr.getLinkTitle(menuInfo.getLabel(),userLang,isExternalLink);%>
    <a <% if(isInNewWindows){ %>target="_blank"<% } %> <% if(isExternalLink){ %>rel="noopener noreferrer"<% } %> class="list-group-item slide-menu-item slide-menu-bookmark" href='<%= encodeForHTMLAttribute(menuInfo.getLink()) %>' title="<%= title%>">
      <jalios:icon src="<%= menuInfo.getIcon() %>" css="jalios-icon-sm"/>
      <%= menuInfo.getLabel() %>
    </a>
  <% } %>
  <% if(menuInfo.isTreeNode()){ %>
    <a data-bound="<%=menuInfo.getId() %>" data-depth="<%=depth%>" class="slide-menu-item list-group-item has-child slide-menu-folder" title="<%=menuInfo.getLabel()%>">
     <jalios:icon src="<%= menuInfo.getIcon() %>" />
     <%= menuInfo.getLabel() %>
     <jalios:icon src="menu-next" css="icon-child-menu"/>
    </a>
    <jalios:buffer name="children">
      <div class="list-group child-menu hide" data-bound="<%= menuInfo.getId() %>" data-depth="<%=depth%>">
        <a class="slide-menu-item list-group-item back" data-jalios-slidemenu-bound-mode="back" data-depth="<%=depth%>" data-bound="<%=menuInfo.getParent().getId()%>">
          <jalios:icon src="menu-prev" />
          <%= glp("menu.back") %>
        </a>

        <% 
         request.setAttribute("menuInfoList", menuInfo.getChildren());
         depth++; 
         request.setAttribute("menu-depth", depth); 
        %>
        <jalios:include jsp="plugins/BookmarksPlugin/jsp/menu/slideMenu.jsp" />
        <% depth--; %>
      </div>
    </jalios:buffer>
    <%
    if(childrenDepthMap.get(depth) == null){
      StringBuilder stringBuilder = new StringBuilder().append(children);
      childrenDepthMap.put(depth, stringBuilder);
    }else{
      StringBuilder stringBuilder = childrenDepthMap.get(depth);
      stringBuilder.append(children);
    }
    
    request.setAttribute("childrenDepthMap", childrenDepthMap); 
    %>
  <% } %>
<% } %>
  