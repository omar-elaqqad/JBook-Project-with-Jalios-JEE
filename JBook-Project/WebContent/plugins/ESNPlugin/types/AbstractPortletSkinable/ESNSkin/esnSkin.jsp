<%@ include file="/jcore/doInitPage.jspf" %>
<%@ include file='/jcore/portal/doPortletParams.jspf' %>
<% 
PortletSkinable portletSkinable = (PortletSkinable) portlet; 
jcmsContext.addCSSHeader("plugins/ESNPlugin/types/AbstractPortletSkinable/ESNSkin/esnSkin.css");
%>
<%@ include file='/types/AbstractPortletSkinable/doActions.jspf' %><%

  String idName          = Util.notEmpty(portlet.getCssId()) ? "id='"+portlet.getCssId()+"'" : "";
  String styleOutter     = PortalManager.getOutterStyles(portlet).trim();
  String styleInner      = PortalManager.getInnerStyles(portlet).trim() + (isExpand ? "" : " display: none;");
  String classOutter     = PortalManager.getOutterClasses(portlet).trim();
  String classInner      = PortalManager.getInnerClasses(portlet).trim();
%>
<jalios:buffer name="portletBuffer"><%@ include file='/jcore/portal/doIncludePortletTemplate.jspf' %></jalios:buffer>
<%
  String menu = (String)request.getAttribute("esnSkin.menu");
  String footer =  (String)request.getAttribute("esnSkin.footer");
  boolean showMenu = Util.notEmpty(menu);
  boolean showFooter = Util.notEmpty(footer);
%>
<div class="esnSkin <%= classOutter %>" <%= idName %>>
  <div class='skinHeader'>
    <%@ include file="/types/AbstractPortletSkinable/doSkinTitle.jspf" %>
    <% if (showMenu) { %>
    <span class="menu"><%= menu %></span>
    <% } %>
  </div>
  <div style="<%= styleInner %>" class="skinContent <%= showFooter ? "" : "noFooter" %> <%= classInner %>">
    <%= portletBuffer %>
  </div>
  <% if (showFooter) { %>
  <div class="skinFooter"><%= footer %></div>
  <% } %>
</div>
<% 
request.removeAttribute("clickExpand");  
request.removeAttribute("classExpand"); 
request.removeAttribute("esnSkin.menu"); 
request.removeAttribute("esnSkin.footer"); 

%>
