<%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneManager"%>
<%@ include file="/plugins/SmartPhonePlugin/jsp/components/portlet/doInitPortlet.jspf" %><% 
PortletQueryForeachCards box = (PortletQueryForeachCards) portlet;
%><%@ include file="/plugins/SmartPhonePlugin/types/PortletQueryForeach/doInitPortletQueryForeach.jspf" %>
<jalios:cards resource="cards.jmobile-sliding">
  <jalios:foreach collection='<%= formHandler.getPageResult().getResultList() %>' type='Publication' name='itPub' skip="<%= 0 %>" max='<%= formHandler.getPortletPageSize() %>'>
    <jalios:cardData css="is-image-squared slide-card rounded-card" data="<%= itPub  %>" template="jmobile-light" />
  </jalios:foreach>
</jalios:cards>