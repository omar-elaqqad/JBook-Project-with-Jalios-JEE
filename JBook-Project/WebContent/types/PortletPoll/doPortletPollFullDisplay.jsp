<%--
  @Summary: Portlet Poll Full Display
--%>
<%@ include file='/jcore/doInitPage.jspf' %>
<%@ include file='/jcore/portal/doPortletParams.jspf' %>
<%@ page import="com.jalios.jcmsplugin.dbpoll.*"  %>

<%
PortletPoll box = (PortletPoll) portlet;

boolean refineWorkspace = Util.toBoolean(box.getRefineWorkspace(),false);
%>

<%@ include file='/plugins/DBPollPlugin/jsp/app/doDBPoll.jspf' %>