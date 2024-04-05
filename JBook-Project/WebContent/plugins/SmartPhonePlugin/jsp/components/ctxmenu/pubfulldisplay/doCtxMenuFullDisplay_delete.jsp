<%@ include file='/plugins/SmartPhonePlugin/jsp/components/ctxmenu/pubfulldisplay/doInitCtxMenuFullDisplay.jspf' %><%
boolean allowDeletion = Util.toBoolean(request.getAttribute("jcms.plugin.smartphone.allow-deletion"), true); 
boolean showDelete = allowDeletion && channel.isDataWriteEnabled() && isLogged && pub.checkDelete(loggedMember).isOK();

if (!showDelete) {
  return;
}
%>
<li class="action-delete"><a class="confirm" data-ajax="false" href="plugins/SmartPhonePlugin/jsp/action/deletePub.jsp?pubId=<%= pub.getId() %>"><jalios:icon src="delete" /> <%= glp("ui.com.btn.delete") %></a></li>