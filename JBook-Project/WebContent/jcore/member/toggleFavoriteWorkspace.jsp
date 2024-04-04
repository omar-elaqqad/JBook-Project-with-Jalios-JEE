<%--
  @Summary: allows a member to add or remove a workspace from its favorites
    - produces "add" or "remove" HTML button
    - on button action: 
      - adds or removes current workspace from Member's favorite workspaces
      - refreshes the page (for Topbar to be updated)
--%><%@ include file="/jcore/doInitPage.jspf" %><%

%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.workspace.FavoriteWorkspaceHandler">
  <jsp:setProperty name="formHandler" property="request" value="<%= request %>"/>
  <jsp:setProperty name="formHandler" property="response" value="<%= response %>"/>
  <jsp:setProperty name="formHandler" property="*" />
</jsp:useBean><%

jcmsContext.addCSSHeader("css/jalios/ux/jalios-toggle-favorite-ws.css");
// Toastr
jcmsContext.addCSSHeader("css/lib/toastr/toastr.css");
jcmsContext.addCSSHeader("css/jalios/core/components/toastr/jalios-toastr.css");
jcmsContext.addJavaScript("js/lib/toastr/toastr.js"); 

formHandler.validate();
if (formHandler.hasBeenAdded()) {
  JcmsToastr toastr = new JcmsToastr(glp("ui.com.msg.favorite-ws-added", workspace.getTitle(userLang)));
  jcmsContext.addToastrSession(toastr);
  sendRedirect(Util.notEmpty(formHandler.getRedirect()) ? formHandler.getRedirect() : "index.jsp");
} else if (formHandler.hasBeenRemoved()) {
  JcmsToastr toastr = new JcmsToastr(glp("ui.com.msg.favorite-ws-removed", workspace.getTitle(userLang)));
  jcmsContext.addToastrSession(toastr);
  sendRedirect(Util.notEmpty(formHandler.getRedirect()) ? formHandler.getRedirect() : "index.jsp");
}
if (!formHandler.showToggleFavorite()) {
  return;
}
%>
<div class="toggle-favorite-workspace-form">
  <form action="jcore/member/toggleFavoriteWorkspace.jsp" method="POST">
    <% if (formHandler.isFavorite()) { %>
    <button type="submit" name="opRemove" value="true" class="btn btn-default toggle-favorite-workspace" title='<%= encodeForHTMLAttribute(glp("ui.com.btn.remove-favorite-ws.h")) %>'><%= glp("ui.com.btn.remove-favorite-ws") %></button>
    <% } else { %>
    <button type="submit" name="opAdd" value="true" class="btn btn-default toggle-favorite-workspace" title='<%= encodeForHTMLAttribute(glp("ui.com.btn.add-favorite-ws.h")) %>'><%= glp("ui.com.btn.add-favorite-ws") %></button>
    <% } %>
    <input type="hidden" name="redirect" value="<%= ServletUtil.getUrl(request) %>" />
    <input type="hidden" name="ws" value="<%= workspace.getId() %>" />
  </form>
</div>