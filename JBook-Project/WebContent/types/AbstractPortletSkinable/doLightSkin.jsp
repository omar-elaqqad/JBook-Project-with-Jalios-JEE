<%@page import="com.jalios.jcms.portlet.PortletDisplayHandler.PortletSkinUI"%><% 
%><%@ include file='/jcore/doInitPage.jspf' %><%@ include file='/jcore/portal/doPortletParams.jspf' %><%
PortletSkinable portletSkinable  = (PortletSkinable) portlet;
jcmsContext.addCSSHeader("types/AbstractPortletSkinable/light-skin.css");
%><jsp:useBean id='portletHandler' scope='page' class='com.jalios.jcms.portlet.PortletDisplayHandler'><%
  %><jsp:setProperty name='portletHandler' property='request' value='<%=request%>'/><%
  %><jsp:setProperty name='portletHandler' property='response' value='<%=response%>'/><%
  %><jsp:setProperty name='portletHandler' property='*' /><%
%></jsp:useBean><%
PortletSkinUI portletUI = portletHandler.buildPortletUI((Portlet) portlet, jcmsContext);

if ("h2".equals(portletUI.getTitleTag())) {
  request.setAttribute("cardDataForceTitleTag", "h3");
}
%>
<div class="light-skin <%= portletUI.getClassOutter() %>" id="<%= portletUI.getId()%>" style="<%=portletUI.getStyleOutter()%>">
  <% if (portletUI.showHeader()) { %>
    <div class="portlet-header">
      <div class="light-skin-header portlet-header-primary">
        <%@ include file="doSkinTitleWithIcon.jspf" %>
      </div>
        <% if (Util.notEmpty(portletUI.getHeaderSubText())) { %>
          <p class="skin-header-sub light-skin-header-sub"><%= portletUI.getHeaderSubText() %></p>
        <% } %>
      </div>
  <% } %>
  <%@ include file='/jcore/portal/doIncludePortletTemplate.jspf' %>
  <% if (portletUI.showFooter()) { %>
    <div class="light-skin-footer">
      <%= Util.getString(portletUI.getFooter(), "") %>
      <% if (portletUI.hasFooterButtons()) { %>
        <div class="light-skin-footer-buttons align-<%= portletUI.getFooterButtonAlign() %>"><%= portletUI.getFooterButtonHtml() %></div>
      <% } %>
    </div>
  <% } %>  
</div><%
%>