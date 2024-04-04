<%@page import="com.jalios.jcms.portlet.PortletDisplayHandler.PortletSkinUI"%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%

if (!(portlet instanceof AbstractPortletSkinable)) {

  String style   = PortalManager.getOutterStyles(portlet).trim() +" "+ PortalManager.getInnerStyles(portlet).trim();
  String classes = PortalManager.getOutterClasses(portlet).trim()+" "+ PortalManager.getInnerClasses(portlet).trim();
  jcmsContext.addCSSHeader("css/jalios/core/portlet/skin/jalios-empty.css");
%><jalios:buffer name="buffer"><%@ include file="doSkinAdd.jspf" %><%@ include file='/jcore/portal/doIncludePortletTemplate.jspf' %></jalios:buffer><% 
  style   += " "+Util.getString(request.getAttribute("styleOutterCustom"),"");
  style   += " "+Util.getString(request.getAttribute("styleInnerCustom"), "");
  classes += " "+Util.getString(request.getAttribute("classOutterCustom"),"");
  classes += " "+Util.getString(request.getAttribute("classInnerCustom"), "");
  
  classes += " empty-skin";
  
  if (Util.notEmpty(style)){
    style = " style=\""+style.trim()+"\"";
  }
  
  if (Util.notEmpty(classes)){
    classes = " class=\""+classes.trim()+"\"";
  }
  
%><div id="<%= portletDomId %>" <%= classes %><%= style %>><%= buffer %></div><%
%><jalios:include jsp="types/AbstractPortletSkinable/doAbstractPortletSkinableSkinFooter.jsp" /><%
  request.removeAttribute("styleOutterCustom");
  request.removeAttribute("styleInnerCustom");
  request.removeAttribute("classOutterCustom");
  request.removeAttribute("classInnerCustom");   
} else {
  PortletSkinable portletSkinable  = (PortletSkinable) portlet;
  %>
  <jsp:useBean id='portletHandler' scope='page' class='com.jalios.jcms.portlet.PortletDisplayHandler'><%
    %><jsp:setProperty name='portletHandler' property='request' value='<%=request%>'/><%
    %><jsp:setProperty name='portletHandler' property='response' value='<%=response%>'/><%
    %><jsp:setProperty name='portletHandler' property='*' /><%
  %></jsp:useBean><%
  PortletSkinUI portletUI = portletHandler.buildPortletUI((Portlet) portlet, jcmsContext);
  jcmsContext.addCSSHeader("css/jalios/core/portlet/skin/jalios-empty.css");
  
  String classes = portletUI.getClassOutter() + " empty-skin";
  %><jalios:buffer name="bufferSkinable"><%@ include file="doSkinAdd.jspf" %><%@ include file='/jcore/portal/doIncludePortletTemplate.jspf' %></jalios:buffer><% 
  %>
  <div id="<%= portletUI.getId() %>" class="<%= classes %>" style="<%= portletUI.getStyleOutter() %>">
    <% if (Util.notEmpty(portletUI.getHeaderSubText())) { %>
      <p class="skin-header-sub"><%= portletUI.getHeaderSubText() %></p>
    <% } %>
    <%= bufferSkinable %>
    <% if (portletUI.showFooter()) { %>
    <div class="skin-footer">
      <%= Util.getString(portletUI.getFooter(), "") %>
      <% if (portletUI.hasFooterButtons()) { %>
        <div class="skin-footer-buttons align-<%= portletUI.getFooterButtonAlign() %>"><%= portletUI.getFooterButtonHtml() %></div>
      <% } %>
    </div>
  <% } %>
  </div><%
  %><jalios:include jsp="types/AbstractPortletSkinable/doAbstractPortletSkinableSkinFooter.jsp" />
  <%
  %><% portletHandler.cleanUpRequest(); %>
<% } %>