<%@ page import="com.jalios.jcms.unifiedinsert.*" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><jsp:useBean id="unifiedInsertHandler" scope="page" class="com.jalios.jcms.unifiedinsert.UnifiedInsertHandler"><%
  %><jsp:setProperty name="unifiedInsertHandler" property="request" value="<%= request %>"/><%
  %><jsp:setProperty name="unifiedInsertHandler" property="response" value="<%= response %>"/><%
  %><jsp:setProperty name="unifiedInsertHandler" property="*" /><%
%></jsp:useBean><%

unifiedInsertHandler.validate();

Set<MenuItem> menuItems = unifiedInsertHandler.getMenuItems();
MenuItem selectedItem = unifiedInsertHandler.getSelectedItem();

InsertionContext.addScripts(jcmsContext, request);
jcmsContext.addCSSHeader("css/jalios/unifiedinsert.css");
jcmsContext.addCSSHeader("css/jalios/core/components/loading/jalios-loading-iframe.css");
jcmsContext.setPageTitle(glp("unified-insert.title") + (selectedItem != null ? (" - " + selectedItem.getLabel(userLang)) : "") );
jcmsContext.addBodyAttributes("class", (selectedItem != null) ? "uni-" + selectedItem.getId() : "uni-default" );

%><%@ include file='/jcore/doEmptyHeader.jspf' %><%
%><%@ include file="/front/app/doAppCommon.jspf" %>
<div class="unifiedinsert app app-unifiedinsert"> 

  <%-- SideBar with Item selection --%>
  <div class="app-sidebar">
    <div class="app-sidebar-icon">
      <% if (selectedItem != null) { %>
      <a href="work/unifiedinsert/unifiedinsert.jsp?select=<%= selectedItem.getId() %>" title="<%= encodeForHTMLAttribute(selectedItem.getLabel(userLang)) %>"><jalios:icon src="<%= selectedItem.getIcon() %>" css="uni-item-icon" /></a>
      <% } else { %>
      <a href="work/unifiedinsert/unifiedinsert.jsp" title="<%= encodeForHTMLAttribute(glp("unified-insert.title")) %>"><jalios:icon src="unified-insert-app"/></a>
      <% } %>
    </div>
    <div class="app-sidebar-section" role="navigation">
      <ul class="app-sidebar-menu" role="tablist">
      <% for (MenuItem item : menuItems) { 
        String longTitleProp = "unified-insert.items." + item.getId() + ".longtitle";
        String subTitleProp  = "unified-insert.items." + item.getId() + ".subtitle";
        %><li role="presentation" class="<% if (item == selectedItem)  { %>active<% } %>">
           <a href="<%= ServletUtil.getUrlWithUpdatedParam(request, "select", item.getId()) %>" 
              id="menuitem-<%= item.getId() %>" role="tab"
              title="<%= encodeForHTMLAttribute(glp(longTitleProp)) %> <%= encodeForHTMLAttribute(glp(subTitleProp)) %>">
             <jalios:icon src="<%= item.getIcon() %>" css="uni-item-icon"/>
             <%= encodeForHTML(item.getLabel(userLang)) %>
           </a>
          </li>
      <% } %>
      </ul>
    </div>
  </div>

  <%-- Main content with each item interface --%>
  <div class="app-main">
   <% if (selectedItem != null) { %>
    <div class="app-body uni-selected">
      <iframe name="itemIFrame" class="loading" src="<%= encodeForHTMLAttribute(unifiedInsertHandler.getItemUrl(selectedItem)) %>"></iframe>
    </div>
   <% } else { %>
    <div class="app-body uni-default">
      <h1 class="uni-body-title"><%= glp("unified-insert.body.title") %></h1>
      <div class="container-fluid">
      
        <% for (MenuItem item : menuItems) { 
          String longTitleProp = "unified-insert.items." + item.getId() + ".longtitle";
          String subTitleProp  = "unified-insert.items." + item.getId() + ".subtitle";
          %>
          <div class="uni-bodyitem clickable" data-jalios-url="<%= ServletUtil.getUrlWithUpdatedParam(request, "select", item.getId()) %>">
             <jalios:icon src="<%= item.getIcon() %>" css="uni-item-icon" />
             <h2 class="uni-item-long-title"><%= encodeForHTML(glp(longTitleProp)) %></h2>
             <div class="uni-item-sub-title"><%= encodeForHTML(glp(subTitleProp)) %></div>
          </div>
        <% } %>
        
      </div>
    </div>
   <% } %>
   
  </div><%-- EOF app-main --%>
  
</div>
<%@ include file='/jcore/doEmptyFooter.jspf' %>