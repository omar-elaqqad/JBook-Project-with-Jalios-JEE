<%@page import="com.jalios.jcms.uicomponent.autocomplete.TopbarSearchAutocompleteHandler"%>
<%@ include file="/jcore/doInitPage.jspf" %><%

TopbarSearchAutocompleteHandler handler = (TopbarSearchAutocompleteHandler) request.getAttribute("jcms.topbar.search.formHandler");
%>
<div class="topbar-search-results-wrapper topbar-search-publication-list">
  <jalios:include target="TOPBAR_SEARCH_RESULTS_PUBLICATION_TOP" />
  <%
    Set<Publication> publicationResultSet = handler.getResult().getPublicationSet();
	  boolean isPublicationResultsEmpty = Util.toBoolean(request.getAttribute("jcms.topbar.search.publication.is-empty"), Util.isEmpty(publicationResultSet));
  %>
  <% if (Util.notEmpty(publicationResultSet)) { %>
    <jalios:foreach collection="<%= handler.getResult().getPublicationSet() %>" name="itPublication" type="Publication" max="10">
      <jalios:link css="typeahead-link js-ripple topbar-search-result-item topbar-search-result-publication" data="<%= itPublication %>" title="<%= itPublication.getDataName(userLang) %>" ><jalios:dataicon data="<%= itPublication %>"/><%= itPublication.getDataName(userLang) %></jalios:link>
    </jalios:foreach>
  <% } else if (isPublicationResultsEmpty){ %>
    <%@ include file="/jcore/autocomplete/acTopbarSearch_empty.jspf" %>
  <% } %>
  <jalios:include target="TOPBAR_SEARCH_RESULTS_PUBLICATION_BOTTOM" />
</div>