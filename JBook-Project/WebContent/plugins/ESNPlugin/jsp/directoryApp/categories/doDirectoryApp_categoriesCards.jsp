<%@ page import="com.jalios.jcmsplugin.esn.ESNManager" %><%
%><%@ page import="com.jalios.jcms.taglib.card.LinkOptions" %><%
%><%@ page import="com.jalios.jcms.taglib.card.CardsDisplayMode"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf'%><%
%><%@ include file='/plugins/ESNPlugin/jsp/directoryApp/doInitDirectoryApp_expertiseHandler.jspf'%><%

Set<Category> expertiseCatSet = formHandler.getCurrentCompetenceRootCategories();
if (Util.isEmpty(expertiseCatSet)) {
  return;
}
Set<Category> selectedCatSet = formHandler.getFilterCompetenceCategories();
Set<Category> pinnedCatSet = formHandler.getAvailableCompetenceCategories();

Category currentCompetenceCategory = formHandler.getAvailableCurrentCompetenceCategory();
%>

<%
// ----------------------------------------------------------------------
// EXPERTISE CARDS
// ----------------------------------------------------------------------
%>
<%-- ESN expertiseCatSet (<%= Util.getSize(expertiseCatSet) %>): <%= expertiseCatSet %> --%>
<!-- <br/> -->

<%--
<jalios:pager name='pagerHandler' declare='true' action='init'
              paramPrefix='<%= CompetenceQueryHandler.PARAM_PREFIX %>'
              size='<%= Util.getSize(expertiseCatSet) %>'
              pageSize='<%= getIntParameter(CompetenceQueryHandler.PARAM_PREFIX + "_pageSize", 12) %>'
              pageSizes='12 24 60'
              sizeAccurate='true'
              sort='name' />
 --%>

<jalios:cards mode="<%= CardsDisplayMode.INLINE %>" css='is-centered directory-cards'>

 <%-- CATEGORIES CARDS --%>
  <jalios:foreach name="itCat" 
        type="Category" 
        collection="<%= expertiseCatSet %>">
  <%--  skip="<%= pagerHandler.getStart() %>" --%>
  <%--  max="<%= pagerHandler.getPageSize() %>"> --%>
      <% 
      DataAttribute cardDataAttribute = new DataAttribute();
      String additionalCss = "esn-competencies-item esn-competencies-item-category";
      boolean isPinned = pinnedCatSet != null && pinnedCatSet.contains(itCat);
      boolean isActive = selectedCatSet != null && selectedCatSet.contains(itCat);
      boolean isNode = itCat.isNode(loggedMember);
      
      if (!ESNManager.getInstance().getMemberCategoriesRootSet().contains(itCat)) {
        additionalCss += " esn-competencies-item-draggable";
      }

      if (isActive) { additionalCss += " is-active"; }
      if (isPinned) { additionalCss += " is-pinned"; }
      if (isNode) { additionalCss += " is-node"; }
      %>
      <jalios:cardData template="esn-directory-competencies" 
            css="<%= additionalCss %>" 
            data="<%= itCat %>" 
            link="<%= null %>"
            dataAttribute='<%= cardDataAttribute %>'/>
  </jalios:foreach>
  
 <%-- "ADD COMPETENCES..." CARD  --%>
  <%
  Category parentCategoryInWhichToProposeCreation = (currentCompetenceCategory != null && currentCompetenceCategory.isLeaf()) ? currentCompetenceCategory.getParent() : currentCompetenceCategory;
  if (isLogged && loggedMember.canManageCategory(parentCategoryInWhichToProposeCreation)) {
    
    String additionalCss = "esn-competencies-item esn-competencies-item-new-category";
    LinkOptions linkOptions = new LinkOptions().hrefLink(false);
  %>
  <jalios:card css='<%= additionalCss %>'>
    <jalios:cardBlock>
      <div class="card-title item-title">
        <a href="#" role="button" tabindex="0" onclik="return false;"
           data-jalios-data-id="<%= parentCategoryInWhichToProposeCreation.getId() %>"
           data-jalios-competence-action="add"
           data-jalios-text="<%= encodeForHTMLAttribute(glp("jcmsplugin.esn.directory.app.competence-action.add-prompt")) %>">
          <jalios:icon src="add" />
          <span><%= glp("jcmsplugin.esn.directory.app.competence-action.add") %></span>
        </a>
      </div>
    </jalios:cardBlock>
  </jalios:card>
  <% } %>

</jalios:cards>


<%-- PAGER  --%>
<%--
<jalios:pager name="pagerHandler" />
 --%>