<%@page import="com.jalios.jcmsplugin.esn.activity.MemberActivityMode"%>
<%@ include file='/jcore/doInitPage.jspf' %><%

String microbloggingMode = getUntrustedStringParameter("microbloggingMode", "");
boolean isPollMode = microbloggingMode.equals("poll");

if (!isPollMode) {
  return;
}

PortletMemberActivity box = (PortletMemberActivity) request.getAttribute("jcmsplugin.esn.activity.box");
boolean isWorkspaceMode = "currentWS".equals(box.getActivityMode());

EditPollHandler formHandler = (EditPollHandler) request.getAttribute("pollHandler");
request.setAttribute("formHandler", formHandler);
request.setAttribute("field-vertical",true);
%>
<% if (!isWorkspaceMode) { %>
  <%
    ServletUtil.backupAttribute(pageContext, "TRIGGER_WS_CHANGE_REFRESH");
    request.setAttribute("TRIGGER_WS_CHANGE_REFRESH", true);
  %>
  <%@ include file='/jcore/doWorkspaceField.jspf' %>
  <%
    ServletUtil.restoreAttribute(pageContext, "TRIGGER_WS_CHANGE_REFRESH");
  %>
<% } %>

<jalios:field name="title" formHandler="<%= formHandler %>" css="focus">
  <jalios:control />
</jalios:field>

<jalios:include jsp="/types/Poll/doEditPoll.jsp" />
<% request.removeAttribute("field-vertical"); %>

<div class="buttons text-right">
  <button type="submit" name="opCreate" data-jalios-target-position="closest" data-jalios-target=".PortletMemberActivity" data-jalios-action="ajax-refresh" value="true" class="btn btn-primary" ><%= glp("ui.com.btn.publish") %></button>
</div>