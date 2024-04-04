<%@page import="com.jalios.jcms.slick.SlickConfiguration"%>
<%@page import="com.jalios.jcms.slick.SlickManager"%><% 
%><%@ include file="/front/card/layout/doInitCards.jspf" %><%
jcmsContext.addCSSHeader("css/jalios/core/jalios-carousel-slick.css"); 
jcmsContext.addJavaScript("js/lib/slick/slick.js");
jcmsContext.addJavaScript("js/jalios/core/components/jalios-carousel-slick.js");

String cssArrowExt = (String) request.getAttribute("cssArrowExt");
cssArrowExt = Util.notEmpty(cssArrowExt) ? cssArrowExt : "";
String hideTitle = "";
if (Util.notEmpty(request.getAttribute("showTitle")) && !(boolean) request.getAttribute("showTitle")) {
  hideTitle = " title-hidden";
}
SlickConfiguration configuration = (SlickConfiguration) request.getAttribute(SlickManager.SLICK_CONFIGURATION_ATTRIBUTE);
boolean showDots = configuration.getDots();
String pauseCss = showDots ? "carousel-pause-button" : "carousel-pause-button btn btn-rounded";
%>
<div class="carousel">
  <div class='<%= css + " carousel-container " + cssArrowExt + hideTitle %> <%= showDots ? "has-dots" : "" %>' style="opacity:0;">
    <% if (configuration != null && configuration.getAutoplay()) { %>
	    <jalios:button  css="<%= pauseCss %>" htmlAttributes='tabindex="0"'>
	      <jalios:icon src="carousel-pause" title="js.ui.carousel.pause" />
        <jalios:icon src="carousel-start" title="js.ui.carousel.start" />
	    </jalios:button>
    <% } %>
    <div class="slick-carousel" <% if(Util.notEmpty(configuration)){ %> data-slick-config='<%= SlickManager.getInstance().getJsonSlickConfiguration(configuration) %>' <% } %>>
      <%= getIncludeBody() %>
    </div>
  </div>
</div>
<% request.removeAttribute(SlickManager.SLICK_CONFIGURATION_ATTRIBUTE); %>