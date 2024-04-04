<%@page import="com.jalios.jcms.slick.SlickManager"%><%
%><%@page import="com.jalios.jcms.slick.SlickConfiguration"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file="/jcore/portal/doPortletParams.jspf" %><%
%><% PortletCarousel box = (PortletCarousel) portlet; %><%
%><%@ include file="/types/PortletQueryForeach/doQuery.jspf" %><%
%><%@ include file="/types/PortletQueryForeach/doSort.jspf" %><%
int defaultCarouselTruncate = channel.getIntegerProperty("jcms.carousel.title.truncate",3);
String numberOfLinesInTheTitle = (String) box.getFieldValue(jcmsContext, "numberOfLinesInTheTitle");
int carouselTruncate = Util.notEmpty(numberOfLinesInTheTitle) ? Integer.parseInt(numberOfLinesInTheTitle) : defaultCarouselTruncate;
request.setAttribute("carouselTruncate", carouselTruncate);
long autoplayCarousel = box.getLongFieldValue(jcmsContext, "autoplaycarousel");
boolean arrows = box.getArrows();
boolean dots = box.getBooleanFieldValue(jcmsContext, "dots");
boolean showTitle = box.getShowTitle();
boolean showDate = box.getShowDate();
boolean showAuthor = box.getShowAuthor();
int slidesToShow = box.getIntFieldValue(jcmsContext, "slidesToShow");
List<Publication> publications = new ArrayList<Publication>();
List<Map<String, String[]>> displayUrlParamsMapList = new ArrayList<Map<String, String[]>>();
%><%@ include file="/types/PortletQueryForeach/doForeachHeader.jspf" %><% 
	publications.add(itPub);
  displayUrlParamsMapList.add(displayUrlParamsMap);
%><%@ include file="/types/PortletQueryForeach/doForeachFooter.jspf" %>
<% request.setAttribute("displayUrlParamsMapList", displayUrlParamsMapList); %>
<jalios:dataCarousel titleTag="h2" collection="<%= publications %>" showAuthor="<%= showAuthor %>" showDate="<%= showDate %>" autoplayCarousel="<%= autoplayCarousel %>" arrows="<%= arrows %>" dots="<%= dots %>" showTitle="<%= showTitle %>" slidesToShow="<%= slidesToShow %>"/>
<% request.removeAttribute("displayUrlParamsMapList"); %>