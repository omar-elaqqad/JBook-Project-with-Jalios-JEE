<%--
  @Summary: Generic channel query page
  @Deprecated: False
  @Customizable: False
  @Requestable: True
  @Category: Search / Query
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file="/front/app/doAppCommon.jspf" %><%
%><%@ include file='/jcore/doHeader.jspf' %><%

   jcmsContext.addCSSHeader("css/queryresult.css");  
   jcmsContext.addCSSHeader("css/jalios/ux/jalios-search.css");
   jcmsContext.addJavaScript("js/jalios/core/jalios-search.js");
   
   String defaultfoQuerySort = Util.getString(channel.getProperty("query.sort.fo"), "relevance");
   String foQuerySortParam = getAlphaNumParameter("sort", defaultfoQuerySort);
   boolean foCatName       = channel.getBooleanProperty("query.facets.text.cat", false);
   boolean foSearchInFiles = channel.getBooleanProperty("query.facets.text.file",false);
   String[] types          = channel.getBooleanProperty("query.facets.ugcs",false) ? new String[]{"com.jalios.jcms.Content", "com.jalios.jcms.UserContent"} : new String[]{"com.jalios.jcms.Content"};
   
%><%
%><jsp:useBean id="queryHandler" scope="page" class="com.jalios.jcms.search.QueryAppHandler"><%
  %><jsp:setProperty name="queryHandler" property="request"       value="<%= request %>"/><%
  %><jsp:setProperty name="queryHandler" property="response"      value="<%= response %>"/><%
  %><jsp:setProperty name="queryHandler" property="catName"       value="<%= foCatName %>"/><%
  %><jsp:setProperty name="queryHandler" property="searchInFiles" value="<%= foSearchInFiles %>"/><%  
  %><jsp:setProperty name="queryHandler" property="types"         value="<%= types %>"/><%
  %><jsp:setProperty name="queryHandler" property="*" /><%
  %><jsp:setProperty name="queryHandler" property="checkPstatus" value="true"/><%
  %><jsp:setProperty name="queryHandler" property="sort"         value="<%= foQuerySortParam %>"/><%
%></jsp:useBean><%
%><%
  queryHandler.init();
  request.setAttribute("title", glp("ui.fo.query.title")); 
  Date lastWeekDate = new Date(System.currentTimeMillis() - JcmsConstants.MILLIS_IN_ONE_WEEK);


  queryHandler.setAttribute(QueryFilter.FRONTOFFICE_SEARCH, Boolean.TRUE);
  if (queryHandler.getSearchInSubWorkspaces()) {
    request.setAttribute("query.result.showWs", Boolean.TRUE);
  }
  
  // do Query (if not an empty text search, see JCMS-8680)
  QueryResultSet queryResultSet = new QueryResultSet();
  if (!queryHandler.getTextSearch() || Util.notEmpty(queryHandler.getText())) {
    queryResultSet = queryHandler.getResultSet();
  }

  int resultSize = queryResultSet.getResultSize();
  request.setAttribute("query.queryHandler", queryHandler);
  request.setAttribute("query.queryResultSet", queryResultSet);
  
%><jalios:pager name='plPagerHandler' declare='true' action='init'
                size='<%= resultSize %>'
                sizeAccurate='<%= queryResultSet.isTotalAccurate()  %>' 
                sort='<%= defaultfoQuerySort %>'/><%
              
  // Sort using pager param
  Class<? extends Publication> typesCommonSuperClass = com.jalios.jcms.handler.QueryHandler.getTypesCommonSuperClass(queryHandler);
  SortedSet<Publication> resultSet = queryResultSet.getAsSortedSet(typesCommonSuperClass, plPagerHandler.getSort(), plPagerHandler.isReverse());
  String escapedQueryString = ServletUtil.getQueryString(request, true);  
  boolean isCollaborativeSpace = workspace.isCollaborativeSpace();
  
  String appTab = getStringEnumParameter("appTab", "publication", "publication", "member", "workspace");
  boolean isPublicationTab = "publication".equals(appTab);
  boolean isMemberTab = !isPublicationTab && "member".equals(appTab);
%>





<%-- *** DISPLAY THE RESULTS ******************************************* --%>
<%
  ServletUtil.backupAttribute(pageContext , PortalManager.PORTAL_PUBLICATION);
  ServletUtil.backupAttribute(pageContext , "counter");
  ServletUtil.backupAttribute(pageContext , "isNew");
  ServletUtil.backupAttribute(pageContext , "score");
  ServletUtil.backupAttribute(pageContext , "maxScore");
  ServletUtil.backupAttribute(pageContext , "hasScore");
  request.setAttribute("maxScore", new Float(queryResultSet.getMaxScore())); 
  request.setAttribute("hasScore", Boolean.TRUE);
  queryHandler.addHighlightAttributes(request);
  ServletUtil.backupAttribute(pageContext , "displayURLparams");
  
  String actionUrl = Util.getString(request.getAttribute("actionUrl"),ResourceHelper.getQuery());
  
  String refreshUrl = ResourceHelper.getQuery();
%>
<div class="ajax-refresh-div" data-jalios-ajax-refresh-url="<%= refreshUrl %>">
	<form action="<%= actionUrl %>" name="queryForm" method="get" class="layout">
	
	  <% if (hasParameter("jsp")) { %>
	    <input type="hidden" name="jsp" value="<%= encodeForHTMLAttribute(getUntrustedStringParameter("jsp", "")) %>"/>
	  <% } %>
	  <input type="hidden" name="searchInMembers" value="<%= queryHandler.getSearchInMembers() %>"/>
	<jalios:app name="query">
	  <%@ include file='/front/query/doQuerySidebar.jspf' %>
    <jalios:appMain headerTitle="ui.work.query-app.title">
	    <%@ include file='/front/query/doQueryBody.jspf' %>
    </jalios:appMain>
	</jalios:app>
	</form>
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>
<%
  ServletUtil.restoreAttribute(pageContext , PortalManager.PORTAL_PUBLICATION);
  ServletUtil.restoreAttribute(pageContext , "counter");
  ServletUtil.restoreAttribute(pageContext , "isNew");
  ServletUtil.restoreAttribute(pageContext , "score");
  ServletUtil.restoreAttribute(pageContext , "maxScore");
  ServletUtil.restoreAttribute(pageContext , "hasScore");
  queryHandler.clearHighlightAttributes(request);
  ServletUtil.restoreAttribute(pageContext , "displayURLparams");
  if (jcmsContext.isInFrontOffice()) {
    // invert test done in doFooter which ignore doEmptyFooter.jspf
    // so add eventData
  %><%@ include file='/admin/analytics/doAddEventData.jspf' %><%
}
%>
<%@ include file='/jcore/doFooter.jspf' %> 