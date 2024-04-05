<%@page import="com.jalios.jcms.taglib.card.CardsDisplayMode"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/doInitMemberProfile.jspf' %><%

if (logger.isTraceEnabled()) { logger.trace("doMcrReceived.jsp: start render"); }
if (!esnProfileDisplayHandler.showMemberConnectionRequestReceived()) {
  if (logger.isTraceEnabled()) { logger.trace("doMcrReceived.jsp: nothing to render"); }
  return;
}
List<MemberConnectionRequest> mcrList = esnProfileDisplayHandler.getMemberConnectionRequestReceivedList();
if (Util.isEmpty(mcrList)) {
  if (logger.isTraceEnabled()) { logger.trace("doMcrReceived.jsp: nothing to render"); }
  return;
}
String title = glp("jcmsplugin.esn.lbl.connections.requests.in");
String refreshUrl = "plugins/ESNPlugin/types/MemberProfile/doMcrReceived.jsp";
String css = "profile-body-block esn-connection-request-received profile-card-deck";
css += " ajax-refresh-div";
%>
<div class="<%= css %>" data-jalios-ajax-refresh-url="<%= refreshUrl %>">
  <div class="section-title"<%
      %> role="<%= ESNHTMLConstants.HEADING_ROLE %>"<%
      %> aria-level="3"><%= title %></div>
  <jalios:pager name='pagerHandler' declare='true' action='init' pageSize='4' pageSizes="8,16,32" size='<%= mcrList.size() %>' paramPrefix="profileMcrSent_" />
  <jalios:cards mode="<%= CardsDisplayMode.INLINE %>">
    <jalios:foreach collection="<%= mcrList %>" type="MemberConnectionRequest" name="itData" max="<%= pagerHandler.getPageSize() %>" skip="<%= pagerHandler.getStart() %>">
      <jalios:link data='<%= itData %>'>
      <jalios:cardData data='<%= itData %>' template='esn-mcr-received' />
      </jalios:link>
    </jalios:foreach>
  </jalios:cards>
  <jalios:pager name='pagerHandler' template='pqf' />
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>
<%
if (logger.isTraceEnabled()) { logger.trace("doMcrReceived.jsp: end render"); }
%>