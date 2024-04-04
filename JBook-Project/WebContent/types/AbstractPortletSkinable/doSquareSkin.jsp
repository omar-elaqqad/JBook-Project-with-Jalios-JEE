<%@page import="com.jalios.jcms.portlet.PortletDisplayHandler.PortletSkinUI"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
String classesOutter = Util.getString(request.getAttribute("classOutterCustom"), "");
classesOutter += " panel-square";
request.setAttribute("classOutterCustom",classesOutter);
jcmsContext.addCSSHeader("css/jalios/core/portlet/skin/jalios-panel-square.css");
%><jalios:include jsp="types/AbstractPortletSkinable/doDefaultSkin.jsp" />