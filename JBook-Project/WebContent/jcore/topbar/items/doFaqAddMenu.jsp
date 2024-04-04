<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%-- Article --%>

<% if (isLogged && loggedMember.canPublishSome(Faq.class)) { %>
  <a class="list-group-item publish-menu-item modal publish-menu-add-faq" role="menuitem" href="types/Faq/editFaqModal.jsp">
    <jalios:dataicon class="<%= Faq.class %>" title="" />
    <%= glp("publish-menu.content.faq") %>
  </a>
<% } %>