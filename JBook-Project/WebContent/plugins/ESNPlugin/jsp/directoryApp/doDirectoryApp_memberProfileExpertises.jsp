<%@page import="com.jalios.jcmsplugin.esn.directory.CompetenceQueryHandler"%><%
%><%@page import="com.jalios.jcmsplugin.esn.ESNManager"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%

Member member = getMemberParameter("mid");
ESNManager esnMgr = ESNManager.getInstance();

Map<Category, Set<Category>> catMap = esnMgr.getMemberCategoryMap(member, loggedMember, userLang); 
boolean hasCategories = Util.notEmpty(catMap);
%>
<% if (hasCategories) { %>
<div class="profile-body-block profile-expertises esn-component esn-component-expertise esn-component-experience">
  <div class="section-title esn-component-header">
    <%= glp("jcmsplugin.esn.lbl.categories") %>
  </div>
  <table class="logs profile-info-expertise-content">
    <jalios:foreach collection="<%= catMap.entrySet() %>" 
                    name="entry" 
                    type="Map.Entry<Category, Set<Category>>">
    <tr>
      <td class="expertise-branch-label">
        <%= entry.getKey().getName(userLang) %>
      </td>
      <td class="expertise-list">
        <%
        String directoryAppHandlerParamNav = "directoryApp_nav";
        String directoryAppHandlerNavCompetencies = "competencies";
        %>
        <jalios:foreach collection="<%= entry.getValue() %>" type="Category" name="cat" counter="itCounter2">
          <%
          String searchExpertiseUrl = channel.getProperty("jcms.resource.include.directory.app") + "?" + CompetenceQueryHandler.PARAM_CURRENT_COMPETENCE + "=" + cat.getId();
          searchExpertiseUrl += "&amp;" + directoryAppHandlerParamNav + "=" + directoryAppHandlerNavCompetencies;
          %>
          <a href="<%= searchExpertiseUrl %>" class="meta-cat">
            <%= cat.getName(userLang) %>
          </a>      
        </jalios:foreach>
      </td>
    </tr>
    </jalios:foreach>
  </table>
  <% } %>
</div>
