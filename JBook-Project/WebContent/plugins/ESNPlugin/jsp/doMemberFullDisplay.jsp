<%@page import="com.jalios.jcmsplugin.esn.profile.ProfileDisplayHandler"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><% 
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/doHeader.jspf' %><%
%><%@ page import="com.jalios.jcmsplugin.esn.*" %><%

ESNManager esnMgr = ESNManager.getInstance();

Member member = getDataParameter("mid", Member.class);
if (member == null) {
  member = (Member) request.getAttribute("member");
}
if (member == null) {
  member = loggedMember;  
}
if (member == null) {
  sendForbidden(request, response);
  return;
}

MemberProfile profile = esnMgr.getMemberProfile(member, true);
if (profile == null) {
  sendForbidden(request, response);
  return;
}

String portalId = getDataIdParameter("portal");
boolean isGuest = isLogged && loggedMember.isGuest();
if (isGuest) {
  Data portalData = channel.getData(Data.class, portalId);
  PortalInterface newGuestPortal = esnMgr.getGuestDefaultHomePortal(loggedMember, (PortalInterface) portalData);
  if (newGuestPortal instanceof Data) {
    portalId = ((Data)newGuestPortal).getId();
  }
} else if (Util.isEmpty(portalId)) {
  portalId = channel.getProperty(ESNConstants.PROFILE_PORTAL_VID,  null);
}

List<String> paramList = new ArrayList();
if (Util.notEmpty(portalId)) {
  paramList.add(MessageFormat.format("portal={0}", portalId));
}
String tab = getAlphaNumParameter(ProfileDisplayHandler.TAB_PARAM, "");
if (Util.notEmpty(tab)) {
  paramList.add(MessageFormat.format("{0}={1}", ProfileDisplayHandler.TAB_PARAM, tab));
}

String params = Util.join(paramList, "&amp;");
String redirectUrl;
String redirectBaseUrl = profile.getDisplayUrl(userLocale);
if (Util.isEmpty(params)) {
  redirectUrl = redirectBaseUrl;
} else {
  redirectUrl = MessageFormat.format("{0}?{1}", redirectBaseUrl, params);
}
sendRedirect(redirectUrl);
%>