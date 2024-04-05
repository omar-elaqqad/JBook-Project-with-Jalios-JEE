<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/plugins/SmartPhonePlugin/jsp/common/header.jspf' %><%
%><%@ page import="com.jalios.jcmsplugin.smartphone.*" %><%

SmartPhoneService service = new DefaultSmartPhoneService("jcmsplugin.smartphone.dbpoll");

if (!service.isEnabled(jcmsContext)) {
  sendRedirect(SmartPhoneConstants.FORBIDDEN_JSP_PATH);
  return;
}

%>

<div class="service-dbpoll-page" id="service-dbpoll" data-role="page" data-dom-cache="false">
  
  <%@ include file='/plugins/SmartPhonePlugin/jsp/common/doServiceTopbarMenu.jspf' %>
 
  <%-- Title --%>
  <smartphone:breadcrumb service="<%= service %>" />
  
  <%-- Body --%>
  <jalios:appBodyInclude jsp="plugins/DBPollPlugin/smartphone/jsp/doDBPoll.jsp" />
    
</div>

<%@ include file='/plugins/SmartPhonePlugin/jsp/common/footer.jspf' %>