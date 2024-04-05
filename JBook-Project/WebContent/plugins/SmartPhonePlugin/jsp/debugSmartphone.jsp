<%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %>
<%@ include file="/jcore/doHeader.jspf" %>
<div class="well well-sm">
  <button class="btn-primary btn" onclick="var ifr=document.getElementsByName('smartphone')[0]; ifr.src=ifr.src;">Refresh Iframe</button>
</div>
<iframe style="resize:both;overflow:auto;display:block;padding: 40px 10px 30px 10px;border-radius: 8px;background-color: black;box-shadow: 6px 7px 9px #666;" name="smartphone" SRC="plugins/SmartPhonePlugin/jsp/index.jsp" scrolling="yes" height="600" width="380" FRAMEBORDER="yes"></iframe>
