<%@page import="com.jalios.jcms.portlet.PortletDisplayHandler.PortletSkinUI"%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%
PortletSkinable portletSkinable  = (PortletSkinable) portlet;
jcmsContext.addCSSHeader("css/jalios/core/portlet/skin/jalios-borderless.css");
%>
<jsp:useBean id='portletHandler' scope='page' class='com.jalios.jcms.portlet.PortletDisplayHandler'><%
  %><jsp:setProperty name='portletHandler' property='request' value='<%=request%>'/><%
  %><jsp:setProperty name='portletHandler' property='response' value='<%=response%>'/><%
  %><jsp:setProperty name='portletHandler' property='*' /><%
%></jsp:useBean><%
PortletSkinUI portletUI = portletHandler.buildPortletUI((Portlet) portlet, jcmsContext);

if ("h2".equals(portletUI.getTitleTag())) {
  request.setAttribute("cardDataForceTitleTag", "h3");
}
%>
<div class="borderless-skin <%= portletUI.getClassOutter() %>" id="<%= portletUI.getId() %>" style="<%= portletUI.getStyleOutter() %>">
  <% if (portletUI.showHeader()) { %>
    <div class="borderless-header portlet-header-primary">
      <%@ include file="doSkinTitleWithIcon.jspf" %>
      <div class="borderless-title-border portlet-header-secondary"></div>
      <% if (Util.notEmpty(portletUI.getHeaderSubText())) { %>
        <p class="borderless-header-sub"><%= portletUI.getHeaderSubText() %></p>
      <% } %>
    </div>
  <% } %>
  <div class="borderless-body portlet-body-primary portlet-body-secondary">
    <%@ include file='/jcore/portal/doIncludePortletTemplate.jspf' %>
  </div>
  <% if (portletUI.showFooter()) { %>
    <div class="borderless-footer">
      <%= Util.getString(portletUI.getFooter(), "") %>
      <% if (portletUI.hasFooterButtons()) { %>
        <div class="borderless-footer-buttons skin-footer-buttons align-<%= portletUI.getFooterButtonAlign() %>"><%= portletUI.getFooterButtonHtml() %></div>
      <% } %>
    </div>
  <% } %>
</div>
<% portletHandler.cleanUpRequest(); %>