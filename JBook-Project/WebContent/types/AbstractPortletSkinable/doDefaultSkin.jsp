<%@page import="com.jalios.jcms.portlet.PortletDisplayHandler.PortletSkinUI"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%
PortletSkinable portletSkinable  = (PortletSkinable) portlet;%>
<jsp:useBean id='portletHandler' scope='page' class='com.jalios.jcms.portlet.PortletDisplayHandler'><%
  %><jsp:setProperty name='portletHandler' property='request' value='<%=request%>'/><%
  %><jsp:setProperty name='portletHandler' property='response' value='<%=response%>'/><%
  %><jsp:setProperty name='portletHandler' property='*' /><%
%></jsp:useBean><%
PortletSkinUI portletUI = portletHandler.buildPortletUI((Portlet) portlet, jcmsContext);

if ("h2".equals(portletUI.getTitleTag())) {
  request.setAttribute("cardDataForceTitleTag", "h3");
}
%><jalios:buffer name="buffer"><%@ include file='/jcore/portal/doIncludePortletTemplate.jspf' %></jalios:buffer><%
jcmsContext.addCSSHeader("css/jalios/core/portlet/skin/jalios-panel.css");
%>
<jalios:panel id="<%=portletUI.getId()%>" css='<%="panel-default panel-skin " + portletUI.getClassOutter()%>' style="<%=portletUI.getStyleOutter()%>">
  <% if (portletUI.showHeader()) { %>
    <jalios:panel-heading css='portlet-header-primary portlet-header-secondary'>
      <% if (portletUI.showInfo()) { %>
        <div class="panel-actions"><%= portletUI.getInfo()%></div>
      <% } %>
      <%@ include file="doSkinTitleWithIcon.jspf" %>
    </jalios:panel-heading>
  <% } %>
  <jalios:panel-body css="<%= portletUI.getClassInner() %>" style="<%= portletUI.getStyleInner() %>">
    <% if (Util.notEmpty(portletUI.getHeaderSubText())) { %>
      <p class="skin-header-sub panel-sub-text"><%= portletUI.getHeaderSubText() %></p>
    <% } %>
    <%= buffer %>
    <% if (portletUI.hasFooterButtons()) { %>
      <div class="skin-footer-buttons align-<%= portletUI.getFooterButtonAlign() %>"><%= portletUI.getFooterButtonHtml() %></div>
    <% } %>
  </jalios:panel-body>
  <% if (Util.notEmpty(portletUI.getFooter())) { %>
    <jalios:panel-footer>
      <%= Util.getString(portletUI.getFooter(), "") %>
    </jalios:panel-footer>
  <% } %>
</jalios:panel>
<% portletHandler.cleanUpRequest(); %>