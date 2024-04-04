<%@page import="com.jalios.jcms.uicomponent.app.AppConstants"%>
<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %>
<%
jcmsContext.setPageTitle("My app page title"); // The app page title (Displayed in head)
// Sample tabs (Optional)
String currentTab = getUntrustedStringParameter("appTab","appTable");
boolean isAppColorTab = "appColor".equals(currentTab);
boolean isAppTableTab = "appTable".equals(currentTab);
boolean isClassicTableTab = "classicTable".equals(currentTab);
boolean isCardTab = "card".equals(currentTab);
boolean isPublicationTab = "pub".equals(currentTab);
boolean isPublicationHeaderTab = "pubHeader".equals(currentTab);

// Sample data to fullfill tables
Set<Member> sampleMbrSet = workspace.getMemberSet();
Article sampleArticle = Util.getFirst(channel.getPublicationSet(Article.class, loggedMember));
%>
<div class="ajax-refresh-div" data-jalios-ajax-refresh-url="types/TestPortletApp/doAppInclude.jsp">
	<form action="myUrl.jsp" method="POST">
	  <div class="app app-myapp is-sidebar-folded">
	    <%-- SIDEBAR --%>
	    <div class="app-sidebar">
	      <%@ include file="/types/TestPortletApp/doDebugAppSidebar.jspf" %>
	    </div>
	    <%-- MAIN --%>  
	    <div class="app-main">
	  
	      <%-- HEADER --%>
	      <div class="app-header has-title">
	        <%@ include file="/types/TestPortletApp/doDebugAppHeader.jspf" %>
	      </div>
	    
	      <%-- BODY --%>
	      <div class="app-body">
	        <%@ include file="/front/app/doAppSidebarToggler.jspf" %>
	        <% if (isAppColorTab) { %>
	          <%@ include file="/types/TestPortletApp/doDebugAppColor.jspf" %>
	        <% } else if (isCardTab) { %>
	          <%@ include file="/types/TestPortletApp/doDebugAppBodyCard.jspf" %>
	        <% } else if (isAppTableTab) { %>
	          <%@ include file="/types/TestPortletApp/doDebugAppBodyAppTable.jspf" %>
	        <% } else if (isClassicTableTab) { %>
	          <%@ include file="/types/TestPortletApp/doDebugAppBodyTable.jspf" %>
	        <% } else if (isPublicationTab) { %>
	          <% 
	            request.setAttribute(AppConstants.BODY_INCLUDE_PUB_REQUEST_ATTR, sampleArticle);
	            request.setAttribute(AppConstants.BODY_INCLUDE_PATH_REQUEST_ATTR, "/types/Article/doArticleFullDisplay.jsp");
	          %>
	          <jalios:include jsp="/front/app/doAppBodyInclude.jsp" />
	        <% } else if (isPublicationHeaderTab) { %>
	          <% 
	            request.setAttribute(AppConstants.BODY_INCLUDE_PUB_REQUEST_ATTR, sampleArticle);
	            request.setAttribute(AppConstants.BODY_INCLUDE_PATH_REQUEST_ATTR, "/types/Article/doArticleFullDisplay.jsp");
	            request.setAttribute(AppConstants.BODY_INCLUDE_REMOVE_ACTIONS_ATTR, true);
	          %>
	          <jalios:include jsp="/front/app/doAppBodyInclude.jsp" />
	        <% } %>        
	      </div>
	    </div>
	  </div>
	</form>
	<jalios:javascript>
	  // Do not copy this
	  jQuery(document).on("click",".app-sidebar-menu A", function(){
	    console.log("Element clicked");
	  });
	</jalios:javascript>
	<%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>