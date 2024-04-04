<%@page import="com.jalios.jcms.uicomponent.autocomplete.TopbarSearchAutocompleteHandler"%>
<%@ include file="/jcore/doInitPage.jspf" %><% 
TopbarSearchAutocompleteHandler handler = (TopbarSearchAutocompleteHandler) request.getAttribute("jcms.topbar.search.formHandler");
%>
<div class="topbar-search-results-wrapper topbar-search-member-list">
  <% if (Util.notEmpty(handler.getResult().getMemberSet())) { %>
    <jalios:foreach collection="<%= handler.getResult().getMemberSet() %>" name="itMember" type="Member" max="10">
      <jalios:link data="<%= itMember %>" css="typeahead-link ">
        <div class="topbar-search-result-member topbar-search-result-item js-ripple">
          <jalios:memberphoto member="<%= itMember %>" link="false" size="<%= PhotoSize.TINY %>"/>
          <div class="topbar-search-result-member-content">
            <jalios:include target="LIVE_SEARCH_MEMBER_TOP" />
            <div class="media-heading typeahead-result-mbr-name">
              <%= encodeForHTML(itMember.getFullName()) %>
            </div>
            <%
            String mOrga = Util.getString(itMember.getOrganization(), "");
            String mJobTitle = Util.getString(itMember.getJobTitle(), "");
            %>
            <% if (Util.notEmpty(mOrga) || Util.notEmpty(mJobTitle)) { %>
              <div class="info">
              <% if (Util.notEmpty(mOrga)) { %><%= mOrga %><% } %>
              <% if (Util.notEmpty(mOrga) && Util.notEmpty(mJobTitle)) { %>&middot;<% } %>
              <% if (Util.notEmpty(mJobTitle)) { %><%= mJobTitle %><% } %>
              </div>
            <% } %>
            <% request.setAttribute("jcms.live-search.member", itMember); %>
            <jalios:include target="LIVE_SEARCH_MEMBER_BOTTOM" />
            <% request.removeAttribute("jcms.live-search.member"); %>
          </div>
        </div>
      </jalios:link>
    </jalios:foreach>
  <% } else { %>
    <%@ include file="/jcore/autocomplete/acTopbarSearch_empty.jspf" %>
  <% } %>
</div>