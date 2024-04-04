<%@ include file='/jcore/topbar/items/doInitTopbarItem.jspf' %><% 

if (topbarHandler == null && jcmsContext.isAjaxRequest()) { 
  %><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.uicomponent.topbar.TopbarHandler"><%
    %><jsp:setProperty name="formHandler" property="request" value="<%= request %>" /><%
    %><jsp:setProperty name="formHandler" property="response" value="<%= response %>" /><%
    %><jsp:setProperty name="formHandler" property="*" /><%
  %></jsp:useBean><%
  topbarHandler = formHandler;
}

if (topbarHandler == null) {
  return;
}

if (!topbarHandler.showCaddyMenuEntry()) {
  return;
}

if (!isLogged || !loggedMember.canUseCaddy()) {
  return;
}

int count = topbarHandler.getCaddyCount();
boolean visible = count != 0;

boolean isAdminZone = topbarHandler.isAdminZone();
String caddyUrl = "work/caddy/index.jsp";
       caddyUrl += isAdminZone ? "?adminArea=true" : "";
%>
<div class="topbar-item-wrapper topbar-caddy-menu ajax-refresh-div" <% if (!visible) { %>style="display: none;"<% } %>
  data-jalios-ajax-refresh-url="jcore/topbar/items/doTopbarWorkCaddyMenu.jsp">
  <a href="<%= caddyUrl %>" title="<%= encodeForHTMLAttribute(glp("ui.com.alt.manage-caddy")) %>" class="topbar-item topbar-item-caddy">
    <jalios:icon src="topbar-caddy"/>
    <span class="topbar-caddy-count topbar-item-badge animated<%if (jcmsContext.isAjaxRequest()) {%> bounce<%}%><%= count == 0 ? " hide" : "" %>"><%= count %></span>
  </a><% 
  //because the ajax-refresh-div classes are merged with, 
  // any hide classes or attribute would not be removed during ajax-refresh
  // --> explictely change in JS
  if (jcmsContext.isAjaxRequest()) { 
    %><jalios:javascript>jQuery(".topbar-caddy-menu").toggle(<%= visible %>);</jalios:javascript><%    
  }
  %><%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>