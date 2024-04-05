<%@page import="com.jalios.jtaglib.DateTag"%>
<%@page import="com.jalios.jcmsplugin.smartphone.portal.SmartPhonePortalAppHandler"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/jcore/doInitPage.jspf" %>
<%
SmartPhonePortalAppHandler formHandler = (SmartPhonePortalAppHandler) request.getAttribute("mobileAppHandler");
%>
<div class="app-header has-title app-header-default">
  <h1><%= glp("jcmsplugin.smartphone.portal.administration.mobile-portals") %></h1>
</div>
<%-- BODY --%>
<div class="app-body">
  <div class="app-body-content">
    <div class="table-responsive">
      <table class="table-data">
        <thead>
          <tr>
            <th class="fit">#</th>
            <th><%= glp("jcmsplugin.smartphone.portal.administration-table.title") %></th>
            <th><%= glp("ui.com.lbl.category") %></th>
            <th class="fit"><%= glp("jcmsplugin.smartphone.portal.administration-table.mdate") %></th>
            <th class="fit"></th>
          </tr>
        </thead>
        <tbody>
        	<% int globalCounter = 0; %>
          <jalios:foreach type="SmartPhonePortal" name="itPortal" collection="<%= formHandler.getMainNavigationPortals() %>">
            <% boolean canWorkOnPortal = loggedMember.canWorkOn(itPortal); %>
            <tr>
              <td><%= itCounter %></td>
              <td>
                <jalios:dataicon data="<%= itPortal %>" />
                
                <% if (canWorkOnPortal) { %>
                <a href="plugins/SmartPhonePlugin/jsp/portalEditor/mobilePortalEditor.jsp?smartphonePortalId=<%= itPortal.getId() %>">
                <% } %>
                  <%= itPortal.getTitle() %>
                <% if (canWorkOnPortal) { %>
                </a>
                <% } %>
              </td>
              <td> <div class="portal-breadcrumb"><%= formHandler.getPortalCategoryPathHtml(itPortal) %></div></td>
              <td><jalios:date date="<%= itPortal.getMdate() %>" format="dateOrTime" /></td>
              <td><jalios:edit css="btn btn-rounded"  data="<%= itPortal %>" /></td>
            </tr>
            <% globalCounter++; %>
          </jalios:foreach>
          <jalios:foreach type="SmartPhonePortal" name="itPortal" collection="<%= formHandler.getOtherPortals() %>">
            <% boolean canWorkOnPortal = loggedMember.canWorkOn(itPortal); %>
            <tr>
              <td><%= itCounter+globalCounter %></td>
              <td>
                <jalios:dataicon data="<%= itPortal %>" /> 
                <% if (canWorkOnPortal) { %>
                <a href="plugins/SmartPhonePlugin/jsp/portalEditor/mobilePortalEditor.jsp?smartphonePortalId=<%= itPortal.getId() %>">
                <% } %>
                  <%= itPortal.getTitle() %>
                <% if (canWorkOnPortal) { %>
                </a>
                <% } %>
              </td>
              <td></td>
              <td><jalios:date date="<%= itPortal.getMdate() %>" format="dateOrTime" /></td>
              <td><jalios:edit css="btn btn-rounded" data="<%= itPortal %>" /></td>
            </tr>
          </jalios:foreach>        
        </tbody>
      </table>
    </div>
  </div>
</div>