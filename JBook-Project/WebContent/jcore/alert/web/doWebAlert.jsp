<%@page import="com.jalios.jcms.alert.AlertHandler"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/alert/web/doInitWebAlert.jspf' %><%
%><div data-jalios-alert-id="<%= alert.getId() %>" data-jalios-dataid="<%= alert.getId() %>" class="<%= alertCss %>" <%= isReadAllAlert ? "data-jalios-alert-parent-data-id=\"" + AlertHandler.getAlertParentDataId(alert) + "\"" : "" %>>
  <%@ include file='/jcore/alert/web/doWebAlertHeader.jspf' %>  
  <%@ include file='/jcore/alert/web/doWebAlertBody.jspf' %>  
  <%@ include file='/jcore/alert/web/doWebAlertFooter.jspf' %>  
</div>