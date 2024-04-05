<%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %>
<%@ page import="com.jalios.jcms.recenthistory.*" %><%  
  Publication pub = (Publication) request.getAttribute("com.jalios.jcmsplugin.smartphone.pub");
  RecentHistoryManager.getInstance().updateHistory(pub, loggedMember);
%>