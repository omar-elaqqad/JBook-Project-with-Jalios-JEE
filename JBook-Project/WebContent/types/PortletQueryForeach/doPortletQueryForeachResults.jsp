<%@ include file='/jcore/doInitPage.jspf' %>
<%@ include file='/jcore/portal/doPortletParams.jspf' %>
<% 
  PortletQueryForeach box = (PortletQueryForeach) portlet;
  jcmsContext.setTemplateUsage(TypeTemplateEntry.USAGE_DISPLAY_QUERY);  
%>
<%@ include file="/types/PortletQueryForeach/doQuery.jspf" %>
<%@ include file="/types/PortletQueryForeach/doSort.jspf" %>
<%@ include file="/types/PortletQueryForeach/doForeachHeader.jspf" %>
  <jsp:include page='<%= "/"+itPub.getTemplatePath(jcmsContext) %>' flush="true" />
<%@ include file="/types/PortletQueryForeach/doForeachFooter.jspf" %>
<%@ include file="/types/PortletQueryForeach/doPager.jspf" %>