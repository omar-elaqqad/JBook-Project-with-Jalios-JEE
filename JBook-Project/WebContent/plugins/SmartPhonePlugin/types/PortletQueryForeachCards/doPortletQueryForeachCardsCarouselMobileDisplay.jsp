<%@page import="com.jalios.jcmsplugin.smartphone.slick.SlickManager"%>
<%@page import="com.jalios.jcmsplugin.smartphone.slick.SlickConfiguration"%>
<%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneManager"%>
<%@ include file="/plugins/SmartPhonePlugin/jsp/components/portlet/doInitPortlet.jspf" %><% 
PortletQueryForeachCards box = (PortletQueryForeachCards) portlet;
%><%@ include file="/plugins/SmartPhonePlugin/types/PortletQueryForeach/doInitPortletQueryForeach.jspf" %>
<% 
  SlickConfiguration configuration = new SlickConfiguration();
  configuration.setAdaptiveHeight(true);
  configuration.setLazyLoad("ondemand");
  configuration.setSlidesToShow(Util.toInt(box.getCardsPerLine(), 1));
%>

<% request.setAttribute(SlickManager.SLICK_CONFIGURATION_ATTRIBUTE, configuration); %>
<jalios:dataCarousel resource="cardsdata.jmobile-carousel" dots="false" slidesToShow="<%= Util.toInt(box.getCardsPerLine(), 1) %>" collection="<%= formHandler.getPageResult().getResultList() %>"  />
<% request.removeAttribute(SlickManager.SLICK_CONFIGURATION_ATTRIBUTE); %>