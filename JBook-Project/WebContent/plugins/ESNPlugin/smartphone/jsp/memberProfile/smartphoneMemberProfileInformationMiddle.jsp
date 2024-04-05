<%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneManager"%><%
%><%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%
%><%@ page import="com.jalios.jcmsplugin.esn.*" %><%

Member member = getMemberParameter("id");
if (member == null) {
  member = (Member) request.getAttribute("com.jalios.jcmsplugin.smartphone.member");
}
SmartPhoneManager smartPhoneManager = SmartPhoneManager.getInstance();
MemberProfile profile = ESNManager.getInstance().getMemberProfile(member, true);
boolean isContact = member.isContact();
%><%@ include file='/plugins/ESNPlugin/smartphone/jsp/service/member-esn-introduction-interest.jspf' %><% 
%><%@ include file='/plugins/ESNPlugin/smartphone/jsp/service/contact-esn-note.jspf' %><%
%><%@ include file='/plugins/ESNPlugin/smartphone/jsp/service/member-esn-information.jspf' %>