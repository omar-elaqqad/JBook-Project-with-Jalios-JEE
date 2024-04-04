<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%
%><% PortletPortalRedirect box = (PortletPortalRedirect) portlet;  
	if (Util.notEmpty(box.getRedirectURL(loggedMember))){
    String redirectUrl = box.getRedirectURL(loggedMember);
		request.setAttribute("redirect", redirectUrl);
    request.setAttribute("redirect.UrlWithoutSecurityCheck", redirectUrl);
    request.setAttribute("force-redirect-status-code", channel.getIntegerProperty("channel.redirect.portlet-redirect", HttpServletResponse.SC_MOVED_TEMPORARILY));
		return;
	}
%>
