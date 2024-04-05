<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file='/plugins/SmartPhonePlugin/jsp/common/header.jspf'%>
<div id="service-jmobileabout" class="service-jmobileabout"
	data-role="page" data-dom-cache="true">
	<ul
		class="breadcrumb colored-banner application-breadcrumb application-breadcrumb">
		<li class="active colored-banner-content"><span
			class="jalios-icon icomoon-info"></span><a
			href="plugins/SmartPhonePlugin/jsp/mobileapp/aboutJMobile.jsp"
			class="ui-link"><%=glp("jcmsplugin.smartphone.lbl.jmobile.about-jmobile")%></a></li>
	</ul>
	<div class="service-jmobileabout-content">
		<div class="jmobile-version">
			<p id="jmobile-version-message"></p>
			<p><%=glp("jcmsplugin.smartphone.jmobile.version.droits")%></p>
		</div>
		<div class="jmobile-notification">
			<p class="notification-title">
				<span
					class="jalios-icon icomoon-bell2 jmobile-notification-post-icon"></span><%=glp("jcmsplugin.smartphone.jmobile.notification")%></p>
			<ul data-role="listview">
				<li id="registred-deviceId"></li>
				<li id="notification-permission"></li>
				<li id="jmobile-alert-type"></li>
			</ul>
		</div>
	</div>
</div>
<%@ include file='/plugins/SmartPhonePlugin/jsp/common/footer.jspf'%>