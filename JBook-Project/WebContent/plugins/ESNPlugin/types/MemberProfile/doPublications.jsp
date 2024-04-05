<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/doInitMemberProfile.jspf' %><%

if (logger.isTraceEnabled()) { logger.trace("doPublications.jsp: start render"); }

Set pubSet = esnProfileDisplayHandler.getMemberContentSet();
if (Util.isEmpty(pubSet)) {
  return;
}
String title = glp("jcmsplugin.esn.lbl.publications");
String refreshUrl = "plugins/ESNPlugin/types/MemberProfile/doPublications.jsp";
String css = "profile-body-block profile-publications";
css += " ajax-refresh-div";
%>
<div class="<%= css %>" data-jalios-ajax-refresh-url="<%= refreshUrl %>">
  <div class="section-title"<%
      %> role="<%= ESNHTMLConstants.HEADING_ROLE %>"<%
      %> aria-level="3"><%= title %></div>
  <jalios:pager name='pagerHandler' declare='true' action='init' pageSize='5' pageSizes='10,20' size='<%= pubSet.size() %>' paramPrefix="esnProfilePubs-"/>
  <jalios:list>
    <jalios:foreach collection="<%= pubSet %>" name="pub" type="Publication" max="<%= pagerHandler.getPageSize() %>" skip="<%= pagerHandler.getStart() %>">
      <%
      if (logger.isTraceEnabled()) { logger.trace("doPublications.jsp: start render of publication: " + JcmsUtil.dataToString(pub)); }
      %>
      <jalios:dataListItem data="<%= pub %>" />
      <%
      if (logger.isTraceEnabled()) { logger.trace("doPublications.jsp: end render of publication: " + JcmsUtil.dataToString(pub)); }
      %>
    </jalios:foreach> 
  </jalios:list>
  <jalios:pager name='pagerHandler' template="pqf"/>
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>

<%
if (logger.isTraceEnabled()) { logger.trace("doPublications.jsp: end render"); }
%>