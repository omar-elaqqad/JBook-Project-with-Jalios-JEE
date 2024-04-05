<%@ page import="com.jalios.util.*, com.jalios.jcms.*, com.jalios.jcms.portlet.*, com.jalios.jcms.context.*, generated.*, java.util.*" %><%
%><%@ taglib uri="jcms.tld" prefix="jalios" %><%
  JcmsJspContext jcmsContext = (JcmsJspContext)request.getAttribute("jcmsContext");
  PortalElement portlet    = (PortalElement) request.getAttribute("PortalElement");
  PortalElement portal     = (PortalElement) request.getAttribute("Portal");
  String userLang          = Util.getString(request.getAttribute("userLang"), Channel.getChannel().getLanguage()); // May include doInitPage.jsp
  String displayTemplate   = portlet.getTemplatePath(jcmsContext);
  String idName            = Util.notEmpty(portlet.getCssId()) ? "id='"+portlet.getCssId()+"'" : "";
  String styleOutter       = PortalManager.getOutterStyles(portlet).trim();
  String styleInner        = PortalManager.getInnerStyles(portlet).trim();
  String classOutter       = PortalManager.getOutterClasses(portlet).trim();
  String classInner        = PortalManager.getInnerClasses(portlet).trim();
  Category portalCategory  = (Category) request.getAttribute("portalCategory");
  Category currentCategory = (Category) request.getAttribute("currentCategory");
  
  String   portletTitle = Util.getString(((PortletSkinable)portlet).getDisplayTitle(userLang),portlet.getTitle(userLang));
%>
<div style="<%= styleOutter %>" class="side-block skin box box-content <%= classOutter %>" <%= idName %>>
    <%@ include file='/jcore/portal/doIncludePortletTemplate.jspf' %>
</div>