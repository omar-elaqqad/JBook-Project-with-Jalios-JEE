<%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneManager"%>
<%@ include file='/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf' %>
<% if(SmartPhoneManager.getInstance().isMobileApp(request)){ %>
<li class="action-jmobile-about"><a data-ajax="false" href="plugins/SmartPhonePlugin/jsp/mobileapp/aboutJMobile.jsp"><jalios:icon src="smartphone-about-jmobile" /><%= glp("jcmsplugin.smartphone.lbl.jmobile.about-jmobile") %></a></li>
<%
}
%>