<%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %>
<%@ page import="com.jalios.jcmsplugin.smartphone.*" %>
<%  
  SmartPhoneManager smartPhoneManager = SmartPhoneManager.getInstance();
  DBComment comment = getDataParameter("id",DBComment.class);
  sendRedirect(smartPhoneManager.getDataUrl(comment.getTargetContent()));
  return;
%>