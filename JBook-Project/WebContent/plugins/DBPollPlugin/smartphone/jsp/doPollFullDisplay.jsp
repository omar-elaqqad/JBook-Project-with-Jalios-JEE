<%@ include file='/plugins/SmartPhonePlugin/jsp/common/header.jspf' %><%
Poll pub = (Poll) getPublicationParameter("id");
request.setAttribute("poll", pub);
%><%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubCommon.jspf' %>

<div id="pub-poll" data-role="page">
  
  <%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubTopbarMenu.jspf' %>

  <jsp:include page="/plugins/DBPollPlugin/smartphone/jsp/doPollBody.jsp"></jsp:include>
   
</div>
<%@ include file='/plugins/SmartPhonePlugin/jsp/common/footer.jspf' %>