<%@page import="com.jalios.jcms.slick.SlickManager"%><% 
%><%@page import="com.jalios.jcms.slick.SlickConfiguration"%><%
%><%@ include file="/plugins/SmartPhonePlugin/jsp/components/portlet/doInitPortlet.jspf" %><%
%><% PortletCarousel box = (PortletCarousel) portlet; %><%
%><%@ include file="/plugins/SmartPhonePlugin/types/PortletQueryForeach/doInitPortletQueryForeach.jspf" %><%
int defaultCarouselTruncate = channel.getIntegerProperty("jcms.carousel.title.truncate",3);
String numberOfLinesInTheTitle = box.getNumberOfLinesInTheTitle();
int carouselTruncate = Util.notEmpty(numberOfLinesInTheTitle) ? Integer.parseInt(numberOfLinesInTheTitle) : defaultCarouselTruncate;
request.setAttribute("carouselTruncate", carouselTruncate);
%>
<jalios:dataCarousel 
  resource="cardsdata.jmobile-carousel" 
  collection="<%= formHandler.getPageResult().getResultList() %>" 
  autoplayCarousel="<%= box.getAutoplaycarousel() %>" 
  arrows="<%= box.getArrows() %>" 
  dots="<%= box.getDots() %>" 
  showTitle="<%= box.getShowTitle() %>" 
  slidesToShow="<%= box.getSlidesToShow() %>"/>