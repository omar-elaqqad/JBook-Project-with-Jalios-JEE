<%@page import="com.jalios.jcmsplugin.esn.calendar.LegacyCalendarHelper"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/doInitMemberProfile.jspf' %><%

if (!LegacyCalendarHelper.isLegacyEsnCalendarMode()) {
  return;
}
%>
<jalios:include jsp='/plugins/ESNPlugin/types/MemberProfile/doMemberProfileFullDisplayHeaderEventInternal.jsp' />