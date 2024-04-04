<%@page import="com.jalios.jcms.Publication"%>
<%@page import="com.jalios.util.Util"%>
<%@page import="com.jalios.jcms.recommendation.RecommendationManager"%>
<%@ include file="/jcore/doInitPage.jspf"%>
<%
  Publication pub = (Publication) request.getAttribute("jcms-plugin-jnews-publication");
  boolean canRecommend = RecommendationManager.getInstance().canBeRecommendedBy(pub, loggedMember);
%>

<div class="dropdown-container navbar-nav">
  <div class="dropup">
    <button class="dropdown-toggle" data-toggle="dropdown"
            aria-haspopup="true" aria-expanded="false"
            aria-label='<%=glp("jcms.jnews.dropdown.label")%>'>
            <jalios:icon src="jnews-dropdown" />
    </button>
    <div class="dropdown-menu">
      <!-- Dropdown menu links -->
      <%-- Recommendation Action --%>
      <%
        if (canRecommend) {
      %>
        <jalios:recommendation css="card-recommend" data="<%=pub%>">
          <jalios:icon src="jnews-pub-recommend" />
          &nbsp;
          <span> <%=glp("ui.recommendation")%></span>
        </jalios:recommendation>
      <%
        }
      %>
      <% 
        String jspToInclude = (String) request.getAttribute("jnewsDropdown"); 
        if (Util.notEmpty(jspToInclude)) { %>
          <jalios:include jsp="<%= jspToInclude %>" /><%         
        }
      %>
      <jalios:include target="JNEWS_PUB_ACTION_DROPDOWN" />
    </div>
  </div>
</div>
