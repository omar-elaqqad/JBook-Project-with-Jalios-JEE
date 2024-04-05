<%@ page import="com.jalios.jcmsplugin.smartphone.*" %><%--
--%><%@ page import="com.jalios.jcms.alert.Alert" %><%--
--%><%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%

  Alert notificationAlert = getDataParameter("alertId", Alert.class);
  if (Util.notEmpty(notificationAlert)) {
    //Show alert associated with the received notification.
    sendRedirect("plugins/SmartPhonePlugin/jsp/core/alertDetail.jsp?alertId="+ notificationAlert.getId());

  } else {
    //Show all alerts page.
    sendRedirect("plugins/SmartPhonePlugin/jsp/core/alert.jsp");
  }
%>