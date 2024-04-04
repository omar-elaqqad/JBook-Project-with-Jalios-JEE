<%--
  @Summary: allows a member to add a workspace to its favorites
    - triggers bean validation
    - no HTML produced
    - redirection must be handled client side
--%><%@ include file="/jcore/doInitPage.jspf" %><%

%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.workspace.FavoriteWorkspaceHandler">
  <jsp:setProperty name="formHandler" property="request" value="<%= request %>"/>
  <jsp:setProperty name="formHandler" property="response" value="<%= response %>"/>
  <jsp:setProperty name="formHandler" property="*" />
  <jsp:setProperty name="formHandler" property="opAdd" value="true"/>
</jsp:useBean><%

formHandler.validate();
%>
