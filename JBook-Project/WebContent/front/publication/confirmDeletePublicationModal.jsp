<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%

Publication pub = getPublicationParameter("pubId");
if (pub == null) {
  %><jalios:javascript>
    jQuery.jalios.Browser.redirect("<%= contextPath + "/" + "index.jsp" %>", false, false);
  </jalios:javascript><%
  return;
}

// JCMS-6490: Get a custom delete confirmation message if any
String customConfirmDeleteMessage = (String) pub.getExtraInfo("msg.confirm-delete");

String modalConfirmTitle = glp("ui.com.lbl.confirm-delete");
String modalConfirmMessage = Util.getString(customConfirmDeleteMessage, glp("msg.js.confirm-final-delete", pub.getTitle(userLang)));
String modalConfirmButton = glp("ui.com.btn.delete");

if (pub instanceof TreeNode && ((TreeNode) pub).isTreeNode()) {
  modalConfirmTitle = glp("ui.com.lbl.confirm-deep-delete");
  modalConfirmMessage = glp("msg.js.confirm-final-deep-delete", pub.getTitle(userLang), Util.join(((TreeNode) pub).getTreeChildren(), ", ", 3, "..."));
  modalConfirmButton = glp("ui.com.btn.deep-delete");
}

request.setAttribute("modal-confirm-title", modalConfirmTitle);
request.setAttribute("modal-confirm-message", modalConfirmMessage);
request.setAttribute("modal-confirm-button", modalConfirmButton);
request.setAttribute("modal-confirm-again", true);
%>
<jalios:include resource="confirm-modal" />
<%
request.removeAttribute("modal-confirm-title");
request.removeAttribute("modal-confirm-message");
request.removeAttribute("modal-confirm-button");
request.removeAttribute("modal-confirm-again");
%>