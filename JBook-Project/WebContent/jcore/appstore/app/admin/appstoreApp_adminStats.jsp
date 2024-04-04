<%@page import="com.jalios.jcms.application.ApplicationAppHandler"%>
<%@page import="com.jalios.jcms.taglib.card.CardsDisplayMode"%>
<%@page import="com.jalios.jcms.application.ApplicationManager"%>
<%@page import="com.jalios.jcms.application.ApplicationManager"%>
<%@page import="com.jalios.jcms.application.json.Application"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/jcore/doInitPage.jspf" %><%
%>
<%
ApplicationAppHandler formHandler = (ApplicationAppHandler) request.getAttribute("appStoreAppHandler");

if (formHandler == null) {%>
  <jalios:include jsp="jcore/appstore/app/appStoreAppHandler.jsp" />
<% }

if (formHandler == null) {
  return;
}

if (!formHandler.canAccessAdminPage()) {
  sendForbidden(request, response);
  return;
}

ApplicationManager manager = ApplicationManager.getInstance();

%>

<div class="appstore-admin-analytics">
	
	<jalios:cards mode="<%= CardsDisplayMode.DECK %>" css="card-count-3">
	  <jalios:indicatorCard iconCss="primary" css="is-center-aligned" text='<%= glp("appstore.stats.applications") %>' icon="appstore-stats-applications" number="<%= formHandler.getApplications().size() %>"  />
	  <jalios:indicatorCard iconCss="success" css="is-center-aligned" text='<%= glp("appstore.stats.installations") %>' icon="appstore-stats-installations" number="<%= manager.getTotalInstallCount() %>"  />
	  <jalios:indicatorCard iconCss="primary" css="is-center-aligned" text='<%= glp("appstore.stats.installations-per-member") %>' icon="appstore-stats-install-per-member" number="<%= manager.getAverageInstallCount() %>"  />
	</jalios:cards>
	
  <% if (ApplicationManager.getInstance().canRecomputeInstallCountCache(loggedMember)) { %>
		<div class="navbar navbar-default navbar-table-header">
		  <div class="container-fluid">
			  <div class="navbar-left navbar-form">
				  <% if (ApplicationManager.getInstance().canRecomputeInstallCountCache(loggedMember)) { %>
				    <button type="submit" class="btn btn-default confirm" data-jalios-action="ajax-refresh" name="opRecomputeInstallCountCache" value="true"><%= glp("appstore.sidebar.admin.recompute-install") %></button>
				  <% }  %>		  
			  
		    </div>
		  </div>
		</div>
  <% }  %>      
  <div class="table-responsive">
  	<table class="table table-data table-app">
  	  <thead>
  	    <tr>
          <td class="fit numeric"></td>
  		    <th><%= glp("appstore.stats.table-header.app-name") %></th>
  		    <th class="numeric"><%= glp("appstore.stats.table-header.install-count") %></th>
          <th class="fit"></th>
  	    </tr>
  	  </thead>
  	  <tbody>
  		  <jalios:foreach name="itApplication" type="Application" collection="<%= formHandler.getApplications() %>">
  		    <tr>
            <td class="fit numeric"><%= itCounter %></td>
  		      <td>
  			      <img style="width: 24px; height: 24px; margin-right: 10px" src="<%= itApplication.getImage() %>" alt="" />
  		        <a href="<%= ApplicationAppHandler.getApplicationLink(itApplication) %>" class="" data-jalios-action="ajax-refresh"><%= itApplication.getName() %></a>
  		      </td>
  	        <td class="numeric"><%= manager.getInstallCount(itApplication) %></td>
            <td class="fit">
  						<div class="dropdown">
  						  <a class="btn btn-rounded" id="appmenu-<%= itApplication.getShortcutId() %>" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
  						    <jalios:icon src="glyph: icomoon-more2" />
  						  </a>
  						  <ul class="dropdown-menu" aria-labelledby="appmenu-<%= itApplication.getShortcutId() %>">
  							  <% if (loggedMember.canWorkOn(channel.getPublication(itApplication.getShortcutId()))) { %>
  							    <li>
  								    <a onclick="return false;" class="modal"  href="jcore/appstore/app/createApplicationModal.jsp?id=<%= itApplication.getShortcutId() %>">
  								      <jalios:icon src="edit" /> <%= glp("ui.com.alt.edit") %>
  								    </a>
  							    </li>
  							  <% } %>						  
  						    <li>
  						      <a class="modal" href="jcore/appstore/app/modal/recommendApplicationModal.jsp?shortcut=<%= itApplication.getShortcutId() %>" title="<%= glp("application-launcher.recommend-app") %>" aria-label="<%= glp("application-launcher.recommend-app") %>" ><jalios:icon src="recommendation" /> <%= glp("ui.recommendation") %></a>
  						    </li>
  						  </ul>
  						</div>
            </td>
  		    </tr>
  		  </jalios:foreach>
  	  </tbody>
  	</table>
  </div>
</div>