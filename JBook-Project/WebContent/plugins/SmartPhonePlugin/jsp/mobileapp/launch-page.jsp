<%@ include file="/plugins/SmartPhonePlugin/jsp/mobileapp/skipWaffle.jspf" %><%
%><%@ page import="com.jalios.jcms.application.json.Application" %><%
%><%@ page import="com.jalios.jcmsplugin.smartphone.application.SmartPhoneApplicationManager" %><%
%><%@ include file='/jcore/doInitPage.jspf'%><%
  // volontarily do not check if the user is logged in
  request.setAttribute("jcms.plugin.smartphone.smartphone-resource", true);
%><%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhoneWorkspace.jspf" %><%

  String url;
			String basicUrl;
			String redirectURL;
			String shareUrl = "";
			String redirectUrl = "";

			basicUrl = ServletUtil.getBaseUrl(request);
			String urlreq = ServletUtil.getUrl(request);
			String param = getUntrustedStringParameter("param", "");
			String encodeUrl = getUntrustedStringParameter("sharedUrl", null);
			if (encodeUrl != null) {
				shareUrl = Util.decodeBASE64(encodeUrl);
			}
			String encodeRedirectUrl = getUntrustedStringParameter("redirectUrl", null);
			if (encodeRedirectUrl != null) {
				redirectUrl = Util.decodeBASE64(encodeRedirectUrl);
			}
			
			String deviceLanguage = getStringParameter("deviceLang", null, "[a-zA-Z][a-zA-Z_]+");

			if (Util.isEmpty(deviceLanguage)) {
				deviceLanguage = "en";
			}

			String parameter = "?context=mobileApp&PortalAction_x_000_userLang=" + deviceLanguage;

			if (!basicUrl.isEmpty()) {
				switch (param) {
					case "home" :
						redirectURL = basicUrl + "plugins/SmartPhonePlugin/jsp/index.jsp" + parameter;
						break;
					case "redirect" :
						redirectURL = redirectUrl;
						break;
					case "share" :
						redirectURL = basicUrl
								+ channel.getProperty("jcmsplugin.smartphone.mobileapp.info.sharePage",
										"plugins/SmartPhonePlugin/jsp/mobileapp/share-url.jsp")
								+ parameter + "&sharedUrl=" + encodeForURL(shareUrl);
						break;
					case "notification" :
						String notificationJSP = channel.getProperty("jcmplugin.smartphone.jpush.notifications.jsp",
								"plugins/SmartPhonePlugin/jsp/core/notifications.jsp");

						String alertId = getDataIdParameter("alertId");
						redirectURL = basicUrl + notificationJSP + parameter + "&alertId=" + alertId;
						break;

					case "notification-horizon" :
						Application app = new Application("$id.shortcut.jcmsplugin.horizon");
						String rid = getUntrustedStringParameter("rid", "");
						redirectURL = basicUrl + SmartPhoneApplicationManager.getInstance().getApplicationMobileUrl(app, userLocale);
						%>
						<script>							
							let roomId = "";
							<% if(Util.notEmpty(rid)){ %>
								roomId = "<%= rid %>";
							<% } %>
							if(roomId && roomId != ""){ 
							  let dateNow = new Date();
								let focusRoom = {
								  date: dateNow
								};
								focusRoom.rid = roomId;
								let focusRoomString = JSON.stringify(focusRoom);
								localStorage.setItem("horizon-room-focus", focusRoomString);
							}
							window.location.href = "<%= redirectURL %>";
						</script>
						<%
        break;

      case "error":
        redirectURL = basicUrl + "plugins/SmartPhonePlugin/jsp/mobileapp/error-page.jsp" + parameter;
        break;
      default:
        redirectURL = basicUrl + "plugins/SmartPhonePlugin/jsp/index.jsp" + parameter;
        break;
    }
		if(!param.equals("notification-horizon")){
        sendRedirect(redirectURL);
        return;
		}
  }
%>
<div id="launche-page" class="jmobile-launch-page" data-role="page"
	data-dom-cache="true">
	<div class="launche-page-content">
		<%=param%>
		<img class="img-center" alt="launch-page"
			src="<%=basicUrl%>plugins/SmartPhonePlugin/images/jmobile_launch_page.png">
	</div>
</div>