<%@ include file='/plugins/SmartPhonePlugin/jsp/common/header.jspf' %><%
%><div class="download-mobile-application-content" data-role="page" data-dom-cache="true">
  <p><%= glp("jcmsplugin.smartphone.lbl.download-mobile-app") %></p>
    <ul>
	  <li><a href="<%= channel.getProperty("jcmsplugin.smartphone.mobileapp.android.play-store")%>">Android</a></li>
	  <li><a href="<%= Util.getString(channel.getProperty("jcmsplugin.smartphone.mobileapp.ios.app-store"), "plugins/SmartPhonePlugin/jsp/ios/download.jsp")%>">iOS</a></li>
	</ul>
</div>
<%@ include file='/plugins/SmartPhonePlugin/jsp/common/footer.jspf' %>