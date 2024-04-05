<%@page import="com.jalios.jcmsplugin.collaborativespace.migration.CSMigrationManager"%>
<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@page import="com.jalios.jcms.uicomponent.app.AppConstants"%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ include file="/front/app/doAppCommon.jspf" %><%
%><%@ include file="/jcore/doHeader.jspf" %>
<jalios:app name="sample">
  <jalios:appSidebar appUrl="plugins/CollaborativeSpacePlugin/jsp/migrate/migrateCollaborativeSpacesApp.jsp" ></jalios:appSidebar>
  <jalios:appMain headerTitle="Migrate collaborative spaces">
    <jalios:appBodyInclude jsp="plugins/CollaborativeSpacePlugin/jsp/migrate/migrateCollaborativeSpacesAppInner.jsp" />
  </jalios:appMain>
</jalios:app>
<%@ include file="/jcore/doFooter.jspf" %>