<%--
  @Summary: The page returned when processing a forbidden action
  @Category: Internal
  @Author: Oliver Dedieu
  @Copyright: Jalios SA
  @Customizable: True
  @Requestable: True
  @Deprecated: False
  @Since: jcms-2.1
--%>
<%@ include file='/jcore/doInitPage.jspf' %><% 

  String redirect = getValidHttpUrl("redirect");
  String redirectValue = "";
  if (Util.notEmpty(redirect)) {
    redirectValue = "?redirect=" + ServletUtil.encodeURL(redirect);
  }
  setWarningMsgSession(glp(loggedMember == null ? "msg.auth-required" : "msg.forbidden-page"), request);
  String forbiddenUrl = loggedMember == null ? ResourceHelper.getLogin() : ResourceHelper.getForbidden();
  sendRedirect(forbiddenUrl + redirectValue, request, response);
%>
