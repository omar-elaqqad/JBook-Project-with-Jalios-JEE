<%@page import="com.jalios.jcms.taglib.card.CardsDisplayMode"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/doInitMemberProfile.jspf' %><%

if (logger.isTraceEnabled()) { logger.trace("doMcrSent.jsp: start render"); }
if (!esnProfileDisplayHandler.showMemberConnectionRequestSent()) {
  if (logger.isTraceEnabled()) { logger.trace("doMcrSent.jsp: nothing to render"); }
  return;
}
List<MemberConnectionRequest> mcrList = esnProfileDisplayHandler.getMemberConnectionRequestSentList();
if (Util.isEmpty(mcrList)) {
  if (logger.isTraceEnabled()) { logger.trace("doMcrSent.jsp: nothing to render"); }
  return;
}
String title = glp("jcmsplugin.esn.lbl.connections.requests.out");
String refreshUrl = "plugins/ESNPlugin/types/MemberProfile/doMcrSent.jsp";
String css = "profile-body-block esn-connection-request-sent profile-card-deck";
css += " ajax-refresh-div";
%>
<div class="<%= css %>" data-jalios-ajax-refresh-url="<%= refreshUrl %>">
  <div class="section-title"<%
      %> role="<%= ESNHTMLConstants.HEADING_ROLE %>"<%
      %> aria-level="3"><%= title %></div>
  <jalios:pager name='pagerHandler' declare='true' action='init' pageSize='4' pageSizes="8,16,32" size='<%= mcrList.size() %>' paramPrefix="profileMcrSent_" />
  <jalios:cards mode="<%= CardsDisplayMode.INLINE %>">
    <jalios:foreach collection="<%= mcrList %>" type="MemberConnectionRequest" name="itData" max="<%= pagerHandler.getPageSize() %>" skip="<%= pagerHandler.getStart() %>">
      <% if (itData.getMember() != null) { %>
      <jalios:link data='<%= itData.getMember() %>'>
      <jalios:cardData data='<%= itData.getMember() %>' template='esn-mcr-sent' />
      </jalios:link>
      <% } %>
    </jalios:foreach>
  </jalios:cards>
  <jalios:pager name='pagerHandler' template='pqf' />
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>
<%
if (logger.isTraceEnabled()) { logger.trace("doMcrSent.jsp: end render"); }
%>