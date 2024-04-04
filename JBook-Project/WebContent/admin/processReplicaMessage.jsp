<%@page import="com.jalios.jcms.replicamessage.ReplicaMessageManager"%>
<%@ include file="/jcore/doInitPage.jspf" %>
<%
HibernateUtil.commitTransaction(); // NOTE:OD: processNewMessage() handle the transaction
ReplicaMessageManager.getInstance().processNewMessages(getStringParameter("sender", null, "[0-9a-z_A-Z]+"));
%>
