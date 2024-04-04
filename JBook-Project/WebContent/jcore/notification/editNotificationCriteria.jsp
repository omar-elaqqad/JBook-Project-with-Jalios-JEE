<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import='com.jalios.jcms.handler.*' %><%
%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.handler.EditNotificationCriteriaHandler'><%
  %><jsp:setProperty name='formHandler' property='request' value='<%=request%>' /><%
  %><jsp:setProperty name='formHandler' property='response' value='<%=response%>' /><%
  %><jsp:setProperty name='formHandler' property='*' /><%
%></jsp:useBean><%
if (formHandler.validate()) {
  if (formHandler.isAjaxRequest()) {
    request.setAttribute("modal.redirect", formHandler.getRedirect());
    %><%@ include file="/jcore/modal/modalRedirect.jspf" %><%
  } else {
    sendRedirect(formHandler.getRedirect());
  }
}
int step = formHandler.getFormStep();
int stepCount = formHandler.getFormStepCount();
jcmsContext.addJavaScript("js/jalios/ux/jalios-notification-criteria.js");
jcmsContext.addCSSHeader("css/jalios/ux/jalios-notification.css");
%>
<jalios:modal css="editNotificationCriteria modal-lg no-focus" formHandler="<%= formHandler %>" title="ui.work.notification.edit-criteria.title" url="jcore/notification/editNotificationCriteria.jsp">
  <%@ include file='/jcore/notification/editNotificationCriteria_criteria.jspf' %>
  <%@ include file='/jcore/notification/editNotificationCriteria_types.jspf' %>
  <%@ include file='/jcore/notification/editNotificationCriteria_kinds.jspf' %>
</jalios:modal>