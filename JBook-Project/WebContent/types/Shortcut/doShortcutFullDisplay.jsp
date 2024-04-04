<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

boolean isVersionJsp = Util.toBoolean(request.getAttribute("work-version"), false);
        isVersionJsp |= Util.getString(ServletUtil.getUrl(request), "").equals("work/version/version.jsp");
if (isVersionJsp) {
  return;
}

Shortcut obj = (Shortcut)request.getAttribute(PortalManager.PORTAL_PUBLICATION);
if (obj == null) {
  sendRedirect("index.jsp");
  return;
}

if (obj.isPublicationShortcut()) {
  Publication redirectPub = obj.getPub();
  sendRedirect(redirectPub);
  return;
}

// Redirection on external URLs cannot be done in a FullDisplay.
// Use a standalone JSP to process redirection.
sendRedirect("types/Shortcut/processExternalShortCut.jsp?pubId=" + obj.getId());
%>