<%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneManager"%>
<%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneWorkspaceManager.CollaborativeSpaceUsage"%>
<%@page import="com.jalios.jcmsplugin.smartphone.service.SmartPhoneService"%>
<%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneWorkspaceManager"%>
<%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %>
<%@ taglib uri="/jcmsplugin/SmartPhonePlugin/tld/smartphone.tld" prefix="smartphone" %>
<jsp:useBean id="searchHandler" scope="page" class="com.jalios.jcmsplugin.smartphone.SmartPhoneSearchHandler"><%
  %><jsp:setProperty name='searchHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='searchHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name="searchHandler" property="*" /><%
%></jsp:useBean>


<% 
String noResultMessage = searchHandler.getNoResultMessage(userLang);

boolean isSearching = Util.notEmpty(searchHandler.getAvailableText());

int skip = getIntParameter("skip",0);
int max = 5;

Map<String,String> paramMap = new HashMap<String, String>();

paramMap.put("skip", String.valueOf(skip + max));
String type = searchHandler.getAvailableType();
if (Util.notEmpty(type)) {
  paramMap.put("type", type);
}
searchHandler.setWorkspaceId(workspace.getId());
paramMap.put("workspaceId", workspace.getId());

searchHandler.performSearch();
%>
<% if (isSearching) { %>
	<%
	if(Util.notEmpty(noResultMessage) && Util.isEmpty(searchHandler.getResultSet())){
	%>
	  <li class="smartphone-message-important">
	    <div class="message-no-results no-result">
	      <jalios:icon src="jcmsplugin-smartphone-no-result"/>
	      <p><%= noResultMessage %></p>
	    </div>
	  </li>
	<% } %>
	<% if(searchHandler.displayPublications()){ %>
	  <% Set<Publication> pubSet = searchHandler.getResultSet(); %>
	  <jalios:foreach collection="<%= pubSet %>" name="itPub" type="Publication" skip="<%= skip %>" max="<%= max %>" >
	    <jalios:dataListItem  data="<%= itPub %>" template="jmobile-dataimage-or-icon-detailed"/>
	  </jalios:foreach>
    <% if ((skip + max) < Util.getSize(pubSet)) {%>
      <li class="ui-listview-showmore">
        <a data-role="button" data-theme="b" data-jalios-ajax-params-form=".ws-search-form-<%= workspace.getId() %>" 
           data-jalios-ajax-method="post" class="ajax-refresh ui-link" 
           data-jalios-ajax-params='<%= SmartPhoneManager.getInstance().getJsonString(paramMap) %>' 
           data-jalios-ajax-action="plugins/SmartPhonePlugin/jsp/workspace/workspace-inner.jsp">
            <%= glp("jcmsplugin.smartphone.action.showmore") %>
        </a>
      </li>
    <% } %>
	<% } %>
<% } else { %>
	<% if (channel.getBooleanProperty("jcmsplugin.collaborativespace.jportal", false) && workspace.isCollaborativeSpace()) { %>
	  <%-- Delegate display to CollaborativeSpace plugin (Since 8.0) --%>
	  <jalios:include jsp="plugins/CollaborativeSpacePlugin/smartphone/jsp/workspace-inner-cs.jsp" />
  <% } else { %>
		<%
		Set<SmartPhoneService> appSet = SmartPhoneWorkspaceManager.getInstance().getWorkspaceApplications(loggedMember, userLang, workspace);
		%>
		<% if (Util.notEmpty(appSet)) { %>
		  <div class="portlet-skinable-wrapper-default">
		    <div class="portlet-title"><%= glp("ui.topbar.application-menu") %></div>
		    <div class="application-launcher">
		      <% for (SmartPhoneService itService : appSet) { %>
		        <a class="application-item" href="<%= itService.getUrl() %>">
		          <jalios:icon src="<%= itService.getIcon() %>" />
		          <span class="application-item-name"><%= itService.getLabel(userLang) %></span>
		        </a>
		      <% } %>
		    </div>
		  </div> 
		  <div class="content-divider-contrasted"></div>
		<% } %>
		<% Set<Portlet> portletList = SmartPhoneWorkspaceManager.getInstance().getWorkspaceSmartPhonePortletList(workspace, loggedMember, CollaborativeSpaceUsage.DASHBOARD_SERVICE);	%>
		<jalios:foreach collection="<%= portletList %>" name="itPortlet" type="Portlet">
		  <smartphone:includePortlet portlet="<%= itPortlet %>" />
		</jalios:foreach>
	<% } %>
<% } %>