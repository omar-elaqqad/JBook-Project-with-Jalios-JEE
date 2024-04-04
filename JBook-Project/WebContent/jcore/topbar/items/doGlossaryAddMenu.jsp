<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%-- Article --%>

<% if (isLogged && loggedMember.canPublishSome(Glossary.class)) { %>
  <a class="list-group-item publish-menu-item modal publish-menu-add-glossary" role="menuitem" href="types/Glossary/editGlossaryModal.jsp">
    <jalios:dataicon class="<%= Glossary.class %>" title="" />
    <%= glp("publish-menu.content.glossary") %>
  </a>
<% } %>