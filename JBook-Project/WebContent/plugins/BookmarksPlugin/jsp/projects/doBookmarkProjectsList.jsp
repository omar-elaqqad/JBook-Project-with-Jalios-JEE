<%@page import="com.jalios.jcmsplugin.jtask.project.ProjectQueryBuilder"%>
<%@page import="com.jalios.jcms.uicomponent.app.AppConstants"%>
<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ include file="/front/app/doAppCommon.jspf" %><%
%><%@ include file="/jcore/doHeader.jspf" %><%
%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcmsplugin.jtask.project.TaskProjectAppHandler"><%
%><jsp:setProperty name="formHandler" property="request"  value="<%= request %>"/><%
%><jsp:setProperty name="formHandler" property="response" value="<%= response %>"/><%
%><jsp:setProperty name="formHandler" property="*" /><%
%><jsp:setProperty name='formHandler' property='noRedirect' value='<%= true %>' /><%
%></jsp:useBean><%
jcmsContext.addJavaScript("plugins/JTaskPlugin/js/app-project.js");
jcmsContext.addCSSHeader("plugins/JTaskPlugin/css/projects-app.css");
%>
<div class="ajax-refresh-div" data-jalios-ajax-refresh-url="plugins/BookmarksPlugin/jsp/projects/doBookmarkProjectsList.jsp">
  <form class="app-taskproject-form" method="POST">
	  <div class="app app-project">
	      <%-- SIDEBAR --%>
	      <div class="app-sidebar">
	        <div class="app-sidebar-icon">
					  <a href="plugins/JTaskPlugin/jsp/app/project/projectApp.jsp" title=''>
					    <jalios:icon src="jcmsplugin-tasks-app"/>
					  </a>
					</div>
	        <div class="app-sidebar-section">
					  <div class="app-sidebar-section-title">
					    <%= glp("jcmsplugin.jtask.app.project.sidebar.display.label") %>
					  </div>
					  <ul class="app-sidebar-menu" >
					    <li>
					      <a href="plugins/JTaskPlugin/jsp/app/project/projectApp.jsp?projectDisplayFilter=<%=ProjectQueryBuilder.DisplayFilter.MY_PROJECTS.name()%>">
					        <jalios:icon src="icon.jcmsplugin.jtask.app.project.my-projects" css="app-list-icon-prefix" />
					        <%= glp("jcmsplugin.jtask.app.project.sidebar.my-projects.label") %>
					      </a>
					    </li>
	
	            <li>
	              <a href="plugins/JTaskPlugin/jsp/app/project/projectApp.jsp?projectDisplayFilter=<%=ProjectQueryBuilder.DisplayFilter.FOLLOWED_PROJECTS.name()%>">
					        <jalios:icon src="icon.jcmsplugin.jtask.app.project.followed-projects" css="app-list-icon-prefix" />
					        <%= glp("jcmsplugin.jtask.app.project.sidebar.followed-projects.label") %>
					      </a>
	            </li>
	            
	            <li class="active">
	              <jalios:icon src="app-list-chevron" css="app-list-right-icon" />
							  <a href="plugins/BookmarksPlugin/jsp/projects/doBookmarkProjectsList.jsp">
							    <jalios:icon src="icon.jcmsplugin.bookmarks.app.project.favorites-projects" css="app-list-icon-prefix" />
							    <%= glp("jcmsplugin.bookmarks.app.project.sidebar.favorite-projects.label") %>
							  </a>
							</li>
	            
	            <li>
	              <a href="plugins/JTaskPlugin/jsp/app/project/projectApp.jsp?projectDisplayFilter=<%=ProjectQueryBuilder.DisplayFilter.ALL_PROJECTS.name()%>">
					        <jalios:icon src="icon.jcmsplugin.jtask.app.project.all-projects" css="app-list-icon-prefix" />
					        <%= glp("jcmsplugin.jtask.app.project.sidebar.all-projects.label") %>
					      </a>
	            </li>
					  </ul>
					</div>
	      </div>
	      <%-- MAIN --%>  
	      <div class="app-main">
	        
	        <%-- HEADER --%>
	        <div class="app-header has-title">
	          <%@ include file="/plugins/JTaskPlugin/jsp/app/project/doProjectAppHeader.jspf" %>
	        </div>
	       
	      
	        <%-- BODY --%>
	        <div class="app-body">
	          <jalios:include jsp="/plugins/BookmarksPlugin/jsp/projects/doBookmarkProjectsBody.jsp" />
	        </div>
	      </div>
	    </div>
	    </form>
	    <%@ include file="/jcore/doAjaxFooter.jspf" %>
    </div>
<%@ include file='/jcore/doFooter.jspf' %>
