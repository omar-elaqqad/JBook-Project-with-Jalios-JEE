<%-- This file has been automatically generated. --%>
<%--
  @Summary: PortletQueryForeach content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditPortletQueryForeachHandler formHandler = (EditPortletQueryForeachHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.PortletQueryForeach.class);
  boolean isPublicationListEdition = Util.toBoolean(request.getAttribute("pqf-publication-list"), false);
  isPublicationListEdition &= !formHandler.getFieldStatus("displayMode").isHidden();
  
  String displayMode = formHandler.getAvailableDisplayMode();
%>
<% if (isPublicationListEdition) { %>
  <% 
    jcmsContext.addCSSHeader("css/jalios/core/admin/jalios-admin-portlet-pub-list-editor.css"); 
    jcmsContext.addJavaScript("js/jalios/core/jalios-admin-portlet-pub-list-editor.js"); 
  %>
  <jalios:field label="types.PortletQueryForeach.fields.displayMode.label">
    <div class="pub-list-choice-wrapper">
      <div class="pub-list-choice-mode <%= "dynamicPubList".equals(displayMode) || displayMode == null ? "active" : "" %>" data-jalios-display-mode="pub-list-choice-dynamic">
        <div class="item-input-wrapper">
          <input class="item-input" type="radio" name="displayMode" value="dynamicPubList" <%= "dynamicPubList".equals(displayMode) || displayMode == null ? "checked=\"checked\"" : "" %> />
        </div>
        <div class="content">
          <div class="item-title"><%= glp("types.PortletQueryForeach.display-mode.dynamic") %></div>
          <div class="description"><%= glp("types.PortletQueryForeach.display-mode.dynamic.description") %></div>
        </div>
      </div>
      <div class="pub-list-choice-mode <%= "pubList".equals(displayMode) ? "active" : "" %>" data-jalios-display-mode="pub-list-choice-list" >
        <div class="item-input-wrapper">
          <input class="item-input" type="radio" name="displayMode" value="pubList" <%= "pubList".equals(displayMode) ? "checked=\"checked\"" : "" %>/>
        </div>
        <div class="content">
          <div class="item-title"><%= glp("types.PortletQueryForeach.display-mode.list") %></div>
          <div class="description"><%= glp("types.PortletQueryForeach.display-mode.list.description") %></div>
        </div>
      </div>
    </div>
  </jalios:field>
<% } %>
<div class="pub-list-choice-fields pub-list-choice-dynamic <%= "pubList".equals(displayMode) ? "hide" : "" %>">
  <% if(!formHandler.isPartialFieldEdition()) { %>
    <ul class="nav nav-tabs nav-tabs-underlined is-left-aligned">
      <li class='active'><a href="#PortletQueryForeach_query_tab" onclick="return false;"><%= formHandler.getTabLabel("query") %></a></li>
      <li><a href="#PortletQueryForeach_sort_tab" onclick="return false;"><%= formHandler.getTabLabel("sort") %></a></li>
      <li><a href="#PortletQueryForeach_pager_tab" onclick="return false;"><%= formHandler.getTabLabel("pager") %></a></li>
      <li><a href="#PortletQueryForeach_advanced_tab" onclick="return false;"><%= formHandler.getTabLabel("advanced") %></a></li>
      
    </ul>
  <% } %>
  <div<%= !formHandler.isPartialFieldEdition() ? " class='tab-content jalios-tab-template clearfix'" : "" %>><div id="PortletQueryForeach_query_tab"<%= !formHandler.isPartialFieldEdition() ? " class='tab-pane active'" : "" %>>
  <%-- SearchInDB ------------------------------------------------------------ --%>
  
   
  <%-- Queries ------------------------------------------------------------ --%>
  <jalios:field name="queries" formHandler="<%= formHandler %>" mv="1">
    <jalios:control />
  </jalios:field>
   
  <%-- RefineQueries ------------------------------------------------------------ --%>
  <jalios:field name="refineQueries" formHandler="<%= formHandler %>">
    <jalios:control />
  </jalios:field>
   
  <%-- RefineWithContextualCategories ------------------------------------------------------------ --%>
  <jalios:field name="refineWithContextualCategories" formHandler="<%= formHandler %>">
    <jalios:control />
  </jalios:field>
   
  </div><div id="PortletQueryForeach_sort_tab"<%= !formHandler.isPartialFieldEdition() ? " class='tab-pane'" : "" %>>
  <%-- OrderBy ------------------------------------------------------------ --%>
  <jalios:field name="orderBy" formHandler="<%= formHandler %>">
    <jalios:control />
  </jalios:field>
   
  <%-- ReverseOrder ------------------------------------------------------------ --%>
  <jalios:field name="reverseOrder" formHandler="<%= formHandler %>">
    <jalios:control />
  </jalios:field>
   
  </div><div id="PortletQueryForeach_pager_tab"<%= !formHandler.isPartialFieldEdition() ? " class='tab-pane'" : "" %>>
  <%-- ShowPager ------------------------------------------------------------ --%>
  <jalios:field name="showPager" formHandler="<%= formHandler %>">
    <jalios:control />
  </jalios:field>
   
  <%-- PagerLabel ------------------------------------------------------------ --%>
  <jalios:field name="pagerLabel" formHandler="<%= formHandler %>">
    <jalios:control />
  </jalios:field>
   
  <%-- PageSizes ------------------------------------------------------------ --%>
  <jalios:field name="pageSizes" formHandler="<%= formHandler %>" mv="1">
    <jalios:control />
  </jalios:field>
   
  <%-- PagerAllLimit ------------------------------------------------------------ --%>
  <jalios:field name="pagerAllLimit" formHandler="<%= formHandler %>">
    <jalios:control />
  </jalios:field>
   
   <%-- MaxResults ------------------------------------------------------------ --%>
  <jalios:field name="maxResults" formHandler="<%= formHandler %>">
    <jalios:control />
  </jalios:field>
   
  <%-- SkipFirstResults ------------------------------------------------------------ --%>
  <jalios:field name="skipFirstResults" formHandler="<%= formHandler %>">
    <jalios:control />
  </jalios:field>
   
  <%-- SkipDisplayedPublications ------------------------------------------------------------ --%>
  <jalios:field name="skipDisplayedPublications" formHandler="<%= formHandler %>">
    <jalios:control />
  </jalios:field>
 
   
  </div><div id="PortletQueryForeach_advanced_tab"<%= !formHandler.isPartialFieldEdition() ? " class='tab-pane'" : "" %>>
  <%-- HideWhenNoResults ------------------------------------------------------------ --%>
  <jalios:field name="hideWhenNoResults" formHandler="<%= formHandler %>">
    <jalios:control />
  </jalios:field>
   
  <%-- FirstPublications ------------------------------------------------------------ --%>
  <jalios:field name="firstPublications" formHandler="<%= formHandler %>">
    <jalios:control />
  </jalios:field>
   
  <%-- ShowInCurrentPortal ------------------------------------------------------------ --%>
  <jalios:field name="showInCurrentPortal" formHandler="<%= formHandler %>">
    <jalios:control />
  </jalios:field>
   
  <%-- ContextCategory ------------------------------------------------------------ --%>
  <jalios:field name="contextCategory" formHandler="<%= formHandler %>">
    <jalios:control />
  </jalios:field>
  
  <jalios:field name="searchInDB" formHandler="<%= formHandler %>">
    <jalios:control />
  </jalios:field>
   
  </div>
  </div><%-- End 'tab-content' --%>
</div>
<div class="pub-list-choice-fields pub-list-choice-list <%= "dynamicPubList".equals(displayMode) || displayMode == null ? "hide" : "" %>">
  <%-- ReverseOrder ------------------------------------------------------------ --%>
  <jalios:field name="publications" formHandler="<%= formHandler %>">
    <jalios:control />
  </jalios:field>
</div>

  <%-- SUPER ------------------------------------------------------------ --%>
  <% request.setAttribute("formHandler", formHandler); %>
  <jsp:include page="/types/AbstractPortletSkinable/doEditAbstractPortletSkinable.jsp" />
   
<%
{ 
  TreeSet  removedCatSet = new TreeSet(); 
  Category itRemoveCat = null;
  request.setAttribute("PortletQueryForeach.removedCatSet", removedCatSet);
}  
%>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- wcDhFFUFjjOqIIQEe04R6w== --%>