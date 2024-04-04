<%@ include file="/jcore/doInitPage.jspf" %><%
if (!isLogged) {
  sendForbidden(request, response);
  return;
}
%>
<jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.AddArticleHandler">
  <jsp:setProperty name="formHandler" property="request" value="<%= request %>" />
  <jsp:setProperty name="formHandler" property="response" value="<%= response %>" />
  <jsp:setProperty name="formHandler" property="*" />
  <jsp:setProperty name="formHandler" property="id" value="<%= null %>" />
  <jsp:setProperty name="formHandler" property="noRedirect" value="true" />
</jsp:useBean>

<% if(formHandler.validate()) { %>
  <%
  // JCMS-5344: use redirection from by the handler
  request.setAttribute("modal.redirect", formHandler.getRedirect());
  %>
  <%@ include file="/jcore/modal/modalRedirect.jspf" %>
<% } %>

<jalios:modal formHandler="<%= formHandler %>" 
              url="types/Article/addArticle.jsp" 
              picture="" 
              title="ui.com.lbl.Article.new.title"
              button="ui.com.btn.next"
              op="opAdd">
  <%
  ServletUtil.backupAttribute(pageContext, "TRIGGER_WS_CHANGE_REFRESH");
  request.setAttribute("TRIGGER_WS_CHANGE_REFRESH", true);
  %>
  <%@ include file="/jcore/doWorkspaceField.jspf" %>
  <%
  ServletUtil.restoreAttribute(pageContext, "TRIGGER_WS_CHANGE_REFRESH");
  %>

  <jalios:field name="title" formHandler="<%= formHandler %>" css="focus" required="false">
    <jalios:control />
  </jalios:field>
</jalios:modal>