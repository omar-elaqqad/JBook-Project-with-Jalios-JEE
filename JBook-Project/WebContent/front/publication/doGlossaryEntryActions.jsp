<%@page import="com.jalios.jcms.recommendation.RecommendationManager"%>
<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page contentType="text/html; charset=UTF-8" %>

<% 
  Publication pub = (Publication)request.getAttribute("glossary-entry");
  boolean canRecommend = RecommendationManager.getInstance().canBeRecommendedBy(pub, loggedMember); 
  boolean canEdit = pub.canBeEditedFieldByField(loggedMember);
  String modalUrl = "types/GlossaryEntry/editGlossaryEntryModal.jsp?id=" + pub.getId();
%>

<div class="dropdown-container">
  <div class="dropdown">
    <button class="dropdown-toggle btn btn-rounded" title='<%= encodeForHTMLAttribute(glp("ui.entry-actions.toggle.title-open", pub.getTitle(userLang)), true) %>' data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"  aria-label="<%= encodeForHTMLAttribute(glp("ui.pub-actions.toggle.title-open", pub.getTitle(userLang, true))) %>">
      <jalios:icon src="pub-actions-open" />
    </button>
    <div class="dropdown-menu">
    <!-- Dropdown menu links -->
      <%-- Edit Action --%>
      <% if (canEdit) { %>
        <a class="modal" onclick="return false" href="<%= modalUrl %>" title='<%= encodeForHTMLAttribute(glp("ui.com.alt.edit-data", pub.getTitle(userLang)), true) %>'>
          <jalios:icon src="edit"/>
          <%= glp("ui.com.alt.edit") %>
        </a>
        <jalios:edit data="<%=pub%>" ctxEdit="false" popup="true">
          <jalios:icon src="edit"/>
          <%=glp("ui.com.btn.edit-full") %>
        </jalios:edit>
      <% } %>
      <%-- Recommendation Action --%>
      <% if (canRecommend) { %>
        <jalios:recommendation data="<%= pub %>"><jalios:icon src="recommendation" alt='<%= glp("ui.recommendation") %>'/><%= glp("ui.recommendation") %></jalios:recommendation>          
      <% } %>
    </div>
  </div>
</div> 