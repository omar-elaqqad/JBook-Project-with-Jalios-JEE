<%@page import="com.jalios.jcmsplugin.esn.MicroBloggingManager"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/plugins/SmartPhonePlugin/jsp/components/portlet/doInitPortlet.jspf" %><%
PortletMemberActivity box = (PortletMemberActivity) portlet;

if (box == null){
  box = getDataParameter("boxId",PortletMemberActivity.class);
}

if (box == null) {
  return;
}
%>
<div class="portlet-member-activity">
  <jalios:include jsp="plugins/ESNPlugin/smartphone/jsp/service/activity/doMicroBloggingForm.jsp"/>
  <jalios:include jsp="types/PortletMemberActivity/doPortletMemberActivityMobileDisplayInner.jsp"/>
</div>