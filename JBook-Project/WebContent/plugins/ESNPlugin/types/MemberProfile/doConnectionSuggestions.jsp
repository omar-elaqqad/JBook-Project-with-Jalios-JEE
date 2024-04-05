<%@page import="com.jalios.jcms.taglib.card.CardsDisplayMode"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/doInitMemberProfile.jspf' %><%

// Skip if ! my profile
if (!esnProfileDisplayHandler.showConnectionSuggestions()) {
  return;
}
%>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.esn.MemberConnectionHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
</jsp:useBean>
<%
// Process remove suggestion or reset suggestions
if (formHandler.validate()) {
  HibernateUtil.commitTransaction();
  HibernateUtil.beginTransaction();
}

// Then only, compute suggestion List
Set<Member> memberSet = esnProfileDisplayHandler.getSuggestionSet();
// Do not return as we allow a "Reset suggestions" action in case of empty results

boolean showResetSuggestions = dataWriteEnabled && Util.isEmpty(memberSet);
boolean showRemoveCard = dataWriteEnabled;

String title = glp("jcmsplugin.esn.lbl.connections.suggestions");
String refreshUrl = "plugins/ESNPlugin/types/MemberProfile/doConnectionSuggestions.jsp";
String css = "profile-body-block esn-connection-suggestions profile-card-deck" + (Util.isEmpty(memberSet)?" has-no-results":"");
css += " ajax-refresh-div";
%>

<div class="<%= css %>" data-jalios-ajax-refresh-url="<%= refreshUrl %>">
  <div class="section-title"<%
      %> role="<%= ESNHTMLConstants.HEADING_ROLE %>"<%
      %> aria-level="3"><%= title %></div>
  <% if (Util.notEmpty(memberSet)) { %>
  <% request.setAttribute("removeConnectionSuggestionUrl", "plugins/ESNPlugin/jsp/form/resetConnectionSuggestion.jsp"); %>
  <jalios:pager name='pagerHandler' declare='true' action='init' pageSize='4' pageSizes="8,16,32" size='<%= memberSet.size() %>' paramPrefix="profileConnectionSuggestions_" />
  <jalios:cards mode="<%= CardsDisplayMode.INLINE %>">
    <jalios:foreach collection="<%= memberSet %>" type="Member" name="cardMember" max="<%= pagerHandler.getPageSize() %>" skip="<%= pagerHandler.getStart() %>">
      <jalios:link data='<%= cardMember %>'>
        <jalios:cardData data='<%= cardMember %>' template='esn-mbr-connection-suggestion' />
      </jalios:link>
    </jalios:foreach>
  </jalios:cards>
  <jalios:pager name='pagerHandler' template='pqf' />
  <% request.removeAttribute("removeConnectionSuggestionUrl"); %>
  <% } %>

  <% if (showResetSuggestions) { %>
  <% String resetSuggestionsUrl = refreshUrl + "?opResetSuggestion=true&amp;redirect=" + encodeForURL(ServletUtil.getUrl(request)); %>
  <div class="no-suggestion">
    <a href="<%= resetSuggestionsUrl %>" class="btn btn-default <%= dataWriteEnabled ? "modal confirm" : "disabled" %>">
      <%= glp("jcmsplugin.esn.lbl.connections.suggestions.reset") %>
    </a>
  </div>
  <% } %>
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>