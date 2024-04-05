<%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneManager"%>
<%@ include file="/plugins/SmartPhonePlugin/jsp/components/portlet/doInitPortlet.jspf" %><% 
PortletQueryForeach box = (PortletQueryForeach) portlet;
%><%@ include file="/plugins/SmartPhonePlugin/types/PortletQueryForeach/doInitPortletQueryForeach.jspf" %>
<jalios:list resource="jmobile-list">
  <jalios:foreach collection='<%= formHandler.getPageResult().getResultList() %>' type='Publication' name='itPub' skip="<%= 0 %>" max='<%= formHandler.getPortletPageSize() %>'>
    <jalios:dataListItem data="<%= itPub %>" template="jmobile" />
  </jalios:foreach>
</jalios:list>
<%@ include file="/plugins/SmartPhonePlugin/types/PortletQueryForeach/doPortletQueryForeachMobilePager.jspf" %>