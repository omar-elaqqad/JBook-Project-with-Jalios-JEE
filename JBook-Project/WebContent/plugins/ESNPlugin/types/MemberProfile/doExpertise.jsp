<%@page import="com.jalios.jcmsplugin.esn.directory.CompetenceQueryHandler"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/doInitMemberProfile.jspf' %><%

if (logger.isTraceEnabled()) { logger.trace("doExpertise.jsp: start render"); }

Map<Category, Set<Category>> catMap = esnProfileDisplayHandler.getMemberCategoryMap(member, loggedMember, userLang); 
boolean hasExpertises = Util.notEmpty(catMap);

String css = "profile-body-block profile-expertises";
css += " esn-component esn-component-expertise esn-component-experience";

boolean show = hasExpertises
  || esnProfileDisplayHandler.canPublishMemberCategories();

if (!show) {
  if (logger.isTraceEnabled()) { logger.trace("doExpertise.jsp: nothing to render"); }
  return;
}
String title = glp("jcmsplugin.esn.lbl.categories");
String editUrl = MessageFormat.format("{0}?esnProfileTab=expertises&amp;mid={1}",
    esnMgr.getMemberProfileEditor(), 
    member.getId());
%>
<div class="<%= css %>">
  <div class="section-title esn-component-header"<%
      %> role="<%= ESNHTMLConstants.HEADING_ROLE %>"<%
      %> aria-level="3">
    <%= title %>
    <% if (canEdit) { %>
    <span class="right">
      <a class="edit-link" href="<%= editUrl %>"><jalios:icon src="edit" /></a>
    </span>
    <% } %>
  </div>
  <div class="esn-component-body" itemscope itemtype="http://schema.org/Organization">
  <% if (hasExpertises) { %>
  <table class="logs profile-info-expertise-content">
    <% for (Map.Entry<Category, Set<Category>> entry : catMap.entrySet()) { %>
    <tr>
      <td class="expertise-branch-label">
        <%= entry.getKey().getName(userLang) %>
      </td>
      <td class="expertise-list">
        <jalios:foreach collection="<%= entry.getValue() %>" type="Category" name="cat" counter="itCounter2">
          <%
          String directoryAppUrl = channel.getProperty("jcms.resource.include.directory.app", "");
          boolean noDirectoryApp = Util.isEmpty(directoryAppUrl);
          String searchExpertiseUrl;
          if (noDirectoryApp) {
            String esnExpertiseLegacyUrl = "plugins/ESNPlugin/jsp/expertDirectory.jsp?mcat=" + cat.getId();
            searchExpertiseUrl = esnExpertiseLegacyUrl;
          } else {
            String directoryAppHandlerParamNav = "directoryApp_nav";
            String directoryAppHandlerNavCompetencies = "competencies";
            String directoryAppExpertiseUrl = directoryAppUrl + "?" + CompetenceQueryHandler.PARAM_CURRENT_COMPETENCE + "=" + cat.getId();
                   directoryAppExpertiseUrl += "&amp;" + directoryAppHandlerParamNav + "=" + directoryAppHandlerNavCompetencies;
            searchExpertiseUrl = directoryAppExpertiseUrl;
          }
          %>
          <a href="<%= searchExpertiseUrl %>" class="meta-cat">
            <%= cat.getName(userLang) %>
          </a>      
        </jalios:foreach>
      </td>
    </tr>
    <% } %>
  </table>
  <% } %>
  </div><%-- .EOF .esn-component-body --%>
</div><%-- EOF .esn-component --%>

<%
if (logger.isTraceEnabled()) { logger.trace("doExpertise.jsp: end render"); }
%>