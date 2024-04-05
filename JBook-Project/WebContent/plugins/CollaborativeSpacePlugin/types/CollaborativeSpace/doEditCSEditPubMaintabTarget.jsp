<%--
  @Summary: CollaborativeSpace editor
  @Category: Custom
  @Author: Sylvain Devaux <sylvain.devaux@jalios.com>
  @Target: EDIT_PUB_MAINTAB
--%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

Object formHandler = request.getAttribute("formHandler");
if (formHandler instanceof EditCollaborativeSpaceHandler) {
  // Add custom JS initialization for editCollaborativeSpace Form
  jcmsContext.addJavaScript("plugins/CollaborativeSpacePlugin/js/accessSignup.js");
  jcmsContext.addJavaScript("types/CollaborativeSpace/editCollaborativeSpace.js");
}
%>