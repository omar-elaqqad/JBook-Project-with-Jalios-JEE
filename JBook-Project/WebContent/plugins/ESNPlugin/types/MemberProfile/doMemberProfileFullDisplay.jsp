<%@page import="com.jalios.jcmsplugin.esn.profile.ProfileDisplayHandler"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file="/front/app/doAppCommon.jspf" %><%

if (logger.isTraceEnabled()) { logger.trace("doMemberProfileFullDisplay.jsp: start render"); }

boolean useOldTemplate = ProfileDisplayHandler.useOldTemplate();
if (useOldTemplate) {
  %><jalios:include jsp="/types/MemberProfile/doMemberProfileFullDisplay.jsp" /><%
  return;
}
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/doInitMemberProfile.jspf' %><%
jcmsContext.setPageTitle(esnProfileDisplayHandler.getPageTitle());
%><%@ include file="/jcore/doHeader.jspf" %><%
String css = esnProfileDisplayHandler.getAppCss();
String refreshUrl = "plugins/ESNPlugin/types/MemberProfile/doMemberProfileFullDisplay.jsp";
%>

<%
if (logger.isDebugEnabled()) { logger.debug("doMemberProfileFullDisplay.jsp: calling Target PLUGIN_ESN_MEMBER_PROFILE_TOP"); }
%>
<jalios:include target="PLUGIN_ESN_MEMBER_PROFILE_TOP" />
<%
if (logger.isDebugEnabled()) { logger.debug("doMemberProfileFullDisplay.jsp: calling Target PLUGIN_ESN_MEMBER_PROFILE_TOP"); }
%>

<section id="member-profile" class="<%= css %>"<%
      %> itemscope itemtype="http://schema.org/Person"<%
      %> data-jalios-ajax-refresh-url="<%= refreshUrl %>">
  <div class="member-profile-inner">
    <%
    if (logger.isTraceEnabled()) { logger.trace("doMemberProfileFullDisplay.jsp: start render of resource 'esn.profile.full.header'"); }
    %>
    <jalios:include resource="esn.profile.full.header" />
    <%
    if (logger.isTraceEnabled()) { logger.trace("doMemberProfileFullDisplay.jsp: end render of resource 'esn.profile.full.header'"); }
    %>

    <%
    if (logger.isTraceEnabled()) { logger.trace("doMemberProfileFullDisplay.jsp: start render of resource 'esn.profile.full.body'"); }
    %>
    <jalios:include resource="esn.profile.full.body" />
    <%
    if (logger.isTraceEnabled()) { logger.trace("doMemberProfileFullDisplay.jsp: end render of resource 'esn.profile.full.body'"); }
    %>
  </div>
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</section>
<%
if (logger.isTraceEnabled()) { logger.trace("doMemberProfileFullDisplay.jsp: end render"); }
%>