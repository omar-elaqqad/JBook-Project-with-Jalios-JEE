<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%

boolean confirm = getBooleanParameter("value", false);
JPortal jportal = (JPortal) getPublicationParameter("jPortal");
if (confirm) {
	sendRedirect("jcore/jportal/edition/jportalEdition.jsp?jPortal="+jportal.getId()+"&opResetHistory=true");
  return;
}
request.setAttribute("modal-confirm-title", glp("jportal.edition.reset.modal-confirm-title"));
request.setAttribute("modal-confirm-message", glp("jportal.edition.reset.modal-confirm-message"));
request.setAttribute("modal-confirm-button", glp("jportal.edition.reset.modal-confirm-button"));
request.setAttribute("modal-confirm-again", true);
%>
<input type="hidden" value="<%= jportal.getId() %>" name="jPortal" />
<jalios:include resource="confirm-modal" />
<%
request.removeAttribute("modal-confirm-title");
request.removeAttribute("modal-confirm-message");
request.removeAttribute("modal-confirm-button");
request.removeAttribute("modal-confirm-again");
%>