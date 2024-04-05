<%@ page contentType="text/html; charset=UTF-8"%><%
%><%@page import="com.jalios.jcmsplugin.collaborativespace.CSManager"%><%
%><%@page import="com.jalios.jcms.uicomponent.app.AppConstants"%><%
%><%@ include file="/jcore/doInitPage.jspf"%><%
%><%@ include file="/plugins/CollaborativeSpacePlugin/jsp/hub/doInitApp.jspf"%><%

jcmsContext.addCSSHeader("css/jalios/core/components/card/jalios-card.css");

Comparator<?> comp = Publication.getTitleComparator(userLang);
%>
<%@ include file="/plugins/CollaborativeSpacePlugin/jsp/hub/processFavoriteUpdate.jspf"%>

<% if (formHandler.showResultSet()) { %>
  <%@ include file="/plugins/CollaborativeSpacePlugin/jsp/hub/doResultSet.jspf"%>
<% } else if (formHandler.isModeCSRequest()) { %>
  <%@ include file="/plugins/CollaborativeSpacePlugin/jsp/hub/doCSRequestList.jspf"%>
<% } %>