<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@page import="com.jalios.jcms.alert.AlertAppHandler"%><%
%><%@page import="com.jalios.jcms.alert.AlertAppHandler.*"%><%
%><%@page import="com.jalios.jcms.uicomponent.app.AppConstants"%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ include file="/front/app/doAppCommon.jspf" %><%
%><%@ include file="/jcore/doHeader.jspf" %><%

if (!isLogged) {
  sendForbidden(request, response);
  return;
}

jcmsContext.addCSSHeader("css/jalios/ux/jalios-alert-app.css");
jcmsContext.addCSSHeader("css/jalios/core/components/card/jalios-card.css");
jcmsContext.addCSSHeader("css/jalios/core/components/card/jalios-card-alert.css");
jcmsContext.addJavaScript("js/jalios/core/alert/jalios-alert.js");
jcmsContext.addJavaScript("js/jalios/ux/jalios-alert-app.js");

// Toastr
jcmsContext.addCSSHeader("css/lib/toastr/toastr.css");
jcmsContext.addCSSHeader("css/jalios/core/components/toastr/jalios-toastr.css");
jcmsContext.addJavaScript("js/lib/toastr/toastr.js"); 
%>
<jalios:include jsp="<%= AlertAppHandler.getAppInnerJsp() %>" />
<%@ include file="/jcore/doFooter.jspf" %>
