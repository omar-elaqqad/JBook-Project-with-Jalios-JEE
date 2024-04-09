<%@ include file='/jcore/doInitPage.jspf'%>
<%

%><%@ include file="/front/app/doAppCommon.jspf"%>
<%

%><%@ page import="com.jalios.jcmsplugin.jbook.*"%>
<%
%><%@ page import="com.jalios.jcmsplugin.jbook.data.*" %><%
%>

<jsp:useBean id="appHandler" scope="page"
	class="com.jalios.jcmsplugin.jbook.ui.JBookAppHandler">
	<%

	%><jsp:setProperty name="appHandler" property="request"
		value="<%=request%>" />
	<%

	%><jsp:setProperty name="appHandler" property="response"
		value="<%=response%>" />
	<%

	%><jsp:setProperty name="appHandler" property="*" />
	<%

	%>
</jsp:useBean>

<%
if (appHandler.validate()) {
	return;
}

String appUrl=appHandler.getAppUrl();

jcmsContext.setPageTitle("JBook");
jcmsContext.addCSSHeader("plugins/JBookPlugin/css/jbook.css");
jcmsContext.addJavaScript("plugins/JBookPlugin/js/jbook.js");
%>


<%@ include file='/jcore/doHeader.jspf'%>

<div class="ajax-refresh-div"
	data-jalios-ajax-refresh-url="plugins/JBookPlugin/jsp/app/jbook.jsp">
	<jalios:app name="jbook">

		<%-- SIDEBAR --%>
		<%@ include file='/plugins/JBookPlugin/jsp/app/doJBookSidebar.jspf'%>

		<%-- MAIN --%>

		<jalios:appMain headerTitle="<%=appHandler.getAppTitle()%>">
			<%@ include file='/plugins/JBookPlugin/jsp/app/doJBookBody.jspf'%>
		</jalios:appMain>


	</jalios:app>
</div>

<%@ include file='/jcore/doFooter.jspf'%>