<%--
  @Summary: Template used to display audio for smartphones
--%><%
%><%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%
%><%@ include file='/jcore/media/mediaTemplateInit.jspf' %><%
%><div class="smartphone-audio-preview">
  <audio controls>
    <source src="<%= mediaPath %>">
    Your browser does not support the audio element.
  </audio>
</div>
