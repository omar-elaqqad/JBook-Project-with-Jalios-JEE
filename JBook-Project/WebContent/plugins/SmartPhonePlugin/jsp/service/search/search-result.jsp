<%@page import="com.jalios.jcmsplugin.smartphone.slick.SlickManager"%>
<%@page import="com.jalios.jcms.analytics.AnalyticsManager"%>
<%@page import="com.jalios.jcms.analytics.EventData"%>
<%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %>
<%@ page import="com.jalios.jcmsplugin.smartphone.*" %>
<%  
  SmartPhoneManager smartPhoneManager = SmartPhoneManager.getInstance();

  workspace = (Workspace) request.getAttribute("jcms.plugin.smartphone.workspace");

  int skip = getIntParameter("skip",0);
  int max = smartPhoneManager.getDefaultPageSize();
%>
<jsp:useBean id="searchHandler" scope="page" class="com.jalios.jcmsplugin.smartphone.SmartPhoneSearchHandler"><%
  %><jsp:setProperty name='searchHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='searchHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name="searchHandler" property="*" /><%
%></jsp:useBean>    
<%
  Map<String,String> paramMap = new HashMap<String, String>();

  paramMap.put("skip", String.valueOf(skip + max));
  String type = searchHandler.getAvailableType();
  if (Util.notEmpty(type)) {
    paramMap.put("type", type);
  }
  if (workspace != null) {
    searchHandler.setWorkspaceId(workspace.getId());
    paramMap.put("workspaceId", workspace.getId());
  }  
  
  boolean validate = searchHandler.performSearch();
	if(!validate){
	  return;
	}
%>

<% String noResultMessage = searchHandler.getNoResultMessage(userLang);
if(Util.notEmpty(noResultMessage)){
%>
<li class="smartphone-message-important">
  <div class="message-no-results no-result">
	  <jalios:icon src="jcmsplugin-smartphone-no-result"/>
		<p><%= noResultMessage %></p>
	</div>
</li>
<% }else{ %>
  <% if(searchHandler.displayMembers()) { %>
	  <% if(searchHandler.isTabActive("members")) { %>
		  <jalios:foreach collection="<%= searchHandler.getMembers() %>" name="mbr" type="Member" skip="<%= skip %>" max="<%= max %>">
		    <jalios:dataListItem  data="<%= mbr %>" template="jmobile-detailed"/>
		  </jalios:foreach>
		  <% if ((skip + max) < Util.getSize(searchHandler.getMembers())) {%>
			  <li class="ui-listview-showmore">
			    <a data-role="button" data-theme="b" data-jalios-ajax-params-form=".search-form" 
			    	 data-jalios-ajax-method="post" class="ajax-refresh ui-link" 
			    	 data-jalios-ajax-params='<%= smartPhoneManager.getJsonString(paramMap) %>' 
			    	 data-jalios-ajax-action="plugins/SmartPhonePlugin/jsp/service/search/search-result.jsp">
			    	 	<%= glp("jcmsplugin.smartphone.action.showmore") %>
			   	</a>
			  </li>
	  	<% } %>
		<% }else{ %>
			<% request.setAttribute(SlickManager.SLICK_CONFIGURATION_ATTRIBUTE, searchHandler.getSlickConfiguration()); %>
			<jalios:cards resource="cards.jmobile-sliding" >
			<jalios:foreach name="member" type="Member" collection="<%= searchHandler.getMembers() %>" max="<%= max %>">
			  <jalios:cardData css="slide-card" data="<%= member  %>" template="jmobile-search-result"/>
	    </jalios:foreach>
		</jalios:cards>
	  <% request.removeAttribute(SlickManager.SLICK_CONFIGURATION_ATTRIBUTE); %>
  <% } %>
<% } %>
  <% if(searchHandler.displayPublications()){ %>
	  <% Set<Publication> pubSet = searchHandler.getResultSet(); %>
		<jalios:foreach collection="<%= pubSet %>" name="itPub" type="Publication" skip="<%= skip %>" max="<%= max %>">
		  <jalios:dataListItem  data="<%= itPub %>" template="jmobile-dataimage-or-icon-detailed"/>
		</jalios:foreach>
		<% if ((skip + max) < Util.getSize(pubSet)) {%>
		  <li class="ui-listview-showmore">
		    <a data-role="button" data-theme="b" data-jalios-ajax-params-form=".search-form" 
		    	 data-jalios-ajax-method="post" class="ajax-refresh ui-link" 
		    	 data-jalios-ajax-params='<%= smartPhoneManager.getJsonString(paramMap) %>' 
		    	 data-jalios-ajax-action="plugins/SmartPhonePlugin/jsp/service/search/search-result.jsp">
		    	 	<%= glp("jcmsplugin.smartphone.action.showmore") %>
		   	</a>
		  </li>
		<% } %>
  <% } %>
<% } %>
<%
EventData eventData = new EventData(SmartPhoneConstants.ANALYTICS_SEARCH_ZONE,loggedMember, null, null, request); 
Map<String, String> contextMap = AnalyticsManager.generateAccessContextMap(request, eventData);
String statQueryString = (searchHandler.getQueryHandler() != null) ? (searchHandler.getQueryHandler().getQueryString()) : null;
//log an event data 
if (statQueryString != null) {
  contextMap.put(AnalyticsManager.QUERYSTRING,statQueryString);
}
AnalyticsManager.processQueries(contextMap);
eventData.getContext().putAll(contextMap);
AnalyticsManager.appendEventData(eventData, request);
%>