<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ page import="com.jalios.jcmsplugin.collaborativespace.*" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file="/jcore/portal/doPortletParams.jspf" %><%

CSManager csMgr = CSManager.getInstance();
CollaborativeSpace cs = csMgr.getCollaborativeSpace(workspace);
if (!csMgr.showIntroduction(cs, loggedMember)) {
  String forbiddenUrl = JcmsConstants.FORBIDDEN_REDIRECT + "?redirect=" + ServletUtil.encodeURL(ServletUtil.getUrl(request));
  if (jcmsContext.isAjaxRequest()) { 
    %><% request.setAttribute("modal.redirect", forbiddenUrl);
    %><%@ include file="/jcore/modal/modalRedirect.jspf" %><%
  } else { 
    sendForbidden(request, response);
  }
  return;
}
%>

<jalios:modal title="jcmsplugin.collaborativespace.header.introduction">
  <div class="cs-introduction">
    <div class="introduction-content">
      <% request.setAttribute("collaborative-space", cs); %>
      <%@ include file='/plugins/CollaborativeSpacePlugin/jsp/doIntroContent.jspf' %>
      <% request.removeAttribute("collaborative-space"); %>
    </div>
  </div>
</jalios:modal>