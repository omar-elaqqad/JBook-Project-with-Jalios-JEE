<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%-- Article --%>

<% if (isLogged && loggedMember.canPublish(Article.class)) { %>
<a class="list-group-item publish-menu-item modal publish-menu-add-article" role="menuitem" href="types/Article/addArticle.jsp">
  <jalios:dataicon class="<%= Article.class %>" title="" />
  <%= glp("publish-menu.content.article") %>
  </a>
<% } %>