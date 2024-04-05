<%--
  Provides action on competence, add, rename, delete, move, etc 
--%><%
%><jsp:useBean id='competenceFormHandler' scope='page' class="com.jalios.jcmsplugin.esn.directory.CompetenceDirectoryHandler"><%
  %><jsp:setProperty name='competenceFormHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='competenceFormHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='competenceFormHandler' property='*' /><%
%></jsp:useBean><%

if (competenceFormHandler.validate()) {
  return;
}

%>