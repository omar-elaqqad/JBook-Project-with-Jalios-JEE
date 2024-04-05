<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/doInitMemberProfile.jspf' %><%

if (logger.isTraceEnabled()) { logger.trace("doMemberProfileFullDisplayBody.jsp: start render"); }

com.jalios.jcmsplugin.esn.profile.ui.UITabs tabs = esnProfileDisplayHandler.getUITabs();

String refreshUrl = "plugins/ESNPlugin/types/MemberProfile/doMemberProfileFullDisplayBody.jsp";
%><jalios:javascript>
<% String profileQueryString = ServletUtil.getUpdatedParams(request, null, null, new String[] {"jsp","id"}, false); %>
window.history.replaceState(history.state, "<%= encodeForJavaScript(glp("jcmsplugin.esn.profile.tab.profil")) %>", "<%= ServletUtil.getResourcePath(request) %><%= profileQueryString %>");
</jalios:javascript>
<div class="profile-body ajax-refresh-div" data-jalios-ajax-refresh-url="<%= refreshUrl %>">
  <%
  //Target before tabs loop (allow target to ask for tab rendering)
  if (logger.isTraceEnabled()) { logger.trace("doMemberProfileFullDisplayBody.jsp: calling Target PLUGIN_ESN_MEMBER_PROFILE_BODY_TOP"); }
  %><jalios:include target="PLUGIN_ESN_MEMBER_PROFILE_BODY_TOP" /><%
  if (logger.isTraceEnabled()) { logger.trace("doMemberProfileFullDisplayBody.jsp: end of calling Target PLUGIN_ESN_MEMBER_PROFILE_BODY_TOP"); }
  
  if (logger.isTraceEnabled()) { logger.trace("doMemberProfileFullDisplayBody.jsp: calling tabs rendering -> doTabs.jspf"); }
  %><%@ include file='/plugins/ESNPlugin/front/tabs/doTabs.jspf' %><%
  if (logger.isTraceEnabled()) { logger.trace("doMemberProfileFullDisplayBody.jsp: end of calling tabs rendering -> doTabs.jspf"); }
  
  if (Util.notEmpty(tabs.getItems())) {
    %><nav role="navigation" aria-label="<%= encodeForHTMLAttribute(glp("jcmsplugin.esn.profile.nav.aria-label")) %>"><%
      %><ul class="esn-ui-tabs profile-tabs nav nav-tabs nav-tabs-underlined"><%
        %><%= uiTabsNavigationBuilder.toString() %><%
      %></ul><%
    %></nav><%
    %><div class="profile-body-inner">
      <%= uiTabsBodyBuilder.toString() %>
      <%
      if (logger.isTraceEnabled()) { logger.trace("doMemberProfileFullDisplayBody.jsp: calling Target PLUGIN_ESN_MEMBER_PROFILE_BODY"); }
      %>
      <jalios:include target="PLUGIN_ESN_MEMBER_PROFILE_BODY" />
      <%
      if (logger.isTraceEnabled()) { logger.trace("doMemberProfileFullDisplayBody.jsp: end of calling Target PLUGIN_ESN_MEMBER_PROFILE_BODY"); }
      %>
    </div>
  <% } %>
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>
<%
// Remove active tab for targets to know about active tab
String legacyActiveTabRequestAttributeName = "esn.show" + Util.recapitalize(activeTabId);
request.removeAttribute(legacyActiveTabRequestAttributeName);
%>

<%
if (logger.isTraceEnabled()) { logger.trace("doMemberProfileFullDisplayBody.jsp: end render"); }
%>