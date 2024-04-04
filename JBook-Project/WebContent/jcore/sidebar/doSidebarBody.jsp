<%@page import="com.jalios.jcms.uicomponent.sidebar.SidebarHandler"%><% 
%><%@page import="com.jalios.jcms.uicomponent.sidebar.MemberSidebarTab"%><%
%><%@page import="com.jalios.jcms.uicomponent.sidebar.MemberSidebarManager"%><%
%><%@ include file='/jcore/doInitPage.jspf' %>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.uicomponent.sidebar.SidebarHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
</jsp:useBean><%
%><%
Set<MemberSidebarTab> tabs = MemberSidebarManager.getInstance().getSortedTabSet(userLang);
if (Util.isEmpty(tabs)) {
  return;
}

request.setAttribute("jcms.sidebar.formHandler", formHandler);

%>
<div class="sidebar-body ajax-refresh-div" data-jalios-ajax-refresh-url="jcore/sidebar/doSidebarBody.jsp">
  <ul class="sidebar-tabs" role="tablist">
    <% for (MemberSidebarTab tab : tabs) { %>
      <% request.setAttribute("jcms.sidebar.tab", tab); %>
      <% if (Util.isEmpty(tab.getTabUrl())) { %>
        <% SidebarHandler handler = formHandler; %>
				<%@ include file='/jcore/sidebar/doSidebarTab.jspf' %>
      <% } else { %>
        <jalios:include jsp="<%= tab.getTabUrl() %>" />
      <% } %>
      <% request.removeAttribute("jcms.sidebar.tab"); %>
    <% } %>
  </ul>
  <div class="sidebar-tab-content">
    <% for (MemberSidebarTab itTab : tabs) { %>
      <% if (formHandler.isActiveTab(itTab)) { %>
        <%-- Only lazy load the first time sidebar is opened --%>
        <% if (!jcmsContext.isAjaxRequest()) { %>
          <div class="sidebar-lazyload sidebar-section-lazyload" data-jalios-sidebar-lazyload-url="<%= itTab.getUrl() %>"></div>
        <% } else { %>
        <div role="tabpanel" aria-labelledby="#site-tab-<%= itTab.getName() %>">
          <jalios:include jsp="<%= itTab.getUrl() %>" />
        </div>
        <% } %>
      <% } %>
    <% } %>
  </div>
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>
<%
request.removeAttribute("jcms.sidebar.formHandler");
%>