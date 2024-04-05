<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/doInitMemberProfile.jspf' %><%

if (!esnProfileDisplayHandler.showContactReferrers()) {
  return;
}
Set<Publication> pubSet = esnProfileDisplayHandler.getContactReferrerSet();
String title = glp("jcmsplugin.esn.lbl.contact-referrers");
String refreshUrl = "plugins/ESNPlugin/types/MemberProfile/doContactReferrers.jsp";
String css = "profile-body-block profile-contact-referrers";
css += " ajax-refresh-div";
%>

<% if (Util.notEmpty(pubSet)) { %>
<div class="<%= css %>" data-jalios-ajax-refresh-url="<%= refreshUrl %>">
  <div class="section-title esn-component-header"<%
      %> role="<%= ESNHTMLConstants.HEADING_ROLE %>"<%
      %> aria-level="3"><%= title %></div>
  <jalios:pager name='pagerHandler' declare='true' action='init' pageSize='5' size='<%= pubSet.size() %>' paramPrefix="esnProfileContactReferrers-"/>
  <jalios:list>
    <jalios:foreach collection="<%= pubSet %>" name="pub" type="Publication" max="<%= pagerHandler.getPageSize() %>" skip="<%= pagerHandler.getStart() %>">
      <jalios:dataListItem data="<%= pub %>" />
    </jalios:foreach> 
  </jalios:list>
  <jalios:pager name='pagerHandler' template="pqf"/>
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>
<% } %>
