<%@page import="com.jalios.jcms.taglib.card.CardsDisplayMode"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/doInitMemberProfile.jspf' %><%

if (logger.isTraceEnabled()) { logger.trace("doCommonConnections.jsp: start render"); }
if (!esnProfileDisplayHandler.showCommonConnections()) {
  if (logger.isTraceEnabled()) { logger.trace("doCommonConnections.jsp: nothing to render"); }
  return;
}
Set<Member> memberSet = esnProfileDisplayHandler.getCommonConnectionSet();
if (Util.isEmpty(memberSet)) {
  if (logger.isTraceEnabled()) { logger.trace("doCommonConnections.jsp: nothing to render"); }
  return;
}

long count = Util.getSize(memberSet);
String title = glp("jcmsplugin.esn.lbl.connections.common");
title += " (" + count + ")";
String refreshUrl = "plugins/ESNPlugin/types/MemberProfile/doCommonConnections.jsp";
String css = "profile-body-block profile-connections profile-common-connections profile-card-deck";
css += " ajax-refresh-div";
%>
<div class="<%= css %>" data-jalios-ajax-refresh-url="<%= refreshUrl %>">
  <div class="section-title"<%
      %> role="<%= ESNHTMLConstants.HEADING_ROLE %>"<%
      %> aria-level="3"><%= title %></div>
  <jalios:pager name='pagerHandler' declare='true' action='init' pageSize='8' pageSizes="16,32" size='<%= memberSet.size() %>' paramPrefix="profileCommonConnections_" />
  <jalios:cards mode="<%= CardsDisplayMode.INLINE %>">
    <jalios:foreach collection="<%= memberSet %>" type="Member" name="itData" max="<%= pagerHandler.getPageSize() %>" skip="<%= pagerHandler.getStart() %>">    
      <jalios:link data='<%= itData %>'>
      <jalios:cardData data='<%= itData %>' template='esn-mbr-connection' />
      </jalios:link>
    </jalios:foreach>
  </jalios:cards>
  <jalios:pager name='pagerHandler' template='pqf' />
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>
<%
if (logger.isTraceEnabled()) { logger.trace("doCommonConnections.jsp: end render"); }
%>