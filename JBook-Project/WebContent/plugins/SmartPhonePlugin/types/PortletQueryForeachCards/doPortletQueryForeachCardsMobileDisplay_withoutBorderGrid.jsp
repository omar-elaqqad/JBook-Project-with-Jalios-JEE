<%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneManager"%>
<%@ include file="/plugins/SmartPhonePlugin/jsp/components/portlet/doInitPortlet.jspf" %><% 
PortletQueryForeachCards box = (PortletQueryForeachCards) portlet;
%><%@ include file="/plugins/SmartPhonePlugin/types/PortletQueryForeach/doInitPortletQueryForeach.jspf" %>
<jalios:cards resource="cards.jmobile" css="padded-content pqf-cards-2x2">
  <jalios:foreach collection='<%= formHandler.getPageResult().getResultList() %>' type='Publication' name='itPub' skip="<%= 0 %>" max='<%= formHandler.getPortletPageSize() %>'>
    <jalios:cardData css="is-borderless is-image-squared" data="<%= itPub  %>" template="jmobile-light" />
  </jalios:foreach>
</jalios:cards>
<%@ include file="/plugins/SmartPhonePlugin/types/PortletQueryForeach/doPortletQueryForeachMobilePager.jspf" %>