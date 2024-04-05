<%--
  @Summary: Template used to display images for smartphones
--%><%
%><%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%
%><%@ include file='/jcore/media/mediaTemplateInit.jspf' %><%
%><div class="pub-dataimage">
  <a href="#popupSmartphoneImage" data-rel="popup" data-position-to="window" data-transition="fade">
    <img data-overlay-theme="b" class="thumbnail nobr center-block" alt="" src="<%= mediaPath %>"/>
  </a>
</div>
<div data-role="popup" id="popupSmartphoneImage" data-overlay-theme="b" data-theme="b" data-corners="false">
  <a href="#" data-rel="back">
    <img class="popphoto" src="<%= mediaPath %>" style="max-height:512px;" alt="<%= encodeForHTMLAttribute(mediaDescription) %>">
  </a>
</div>