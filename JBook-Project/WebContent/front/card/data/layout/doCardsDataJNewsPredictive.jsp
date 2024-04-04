<%@ include file="/front/card/data/layout/doInitCardsData.jspf" %><% 
%><%@page import="java.util.ArrayList"%><%
%><%@page import="com.jalios.jcms.jnews.PubDisplayStyleLayout"%><%
%><%@page import="com.jalios.jcms.jnews.PubDisplayStyleLayoutPredictive"%><%
%><%@page import="com.jalios.jcms.jnews.CssStyleLayout"%><%
%><%@page import="com.jalios.jcms.jnews.PubDisplayStyleBuilder"%><%
%><% jcmsContext.addCSSHeader("css/jalios/core/components/card/jnews/jalios-publications-cssgrid.css"); %><%
%><% jcmsContext.addCSSHeader("css/jalios/core/components/card/jnews/jalios-publications-card.css"); %><%
%><% jcmsContext.addCSSHeader("css/jalios/core/components/card/jnews/jalios-dropdown-menu-icons.css"); %><%
%><% jcmsContext.addJavaScript("js/jalios/core/components/jnews/jalios-display-pubs.js"); %><%
String template = channel.getProperty("jcms.jnews.layout.predictive", "predictive"); 
String layoutModel = (String) request.getAttribute("layoutModel");
int pubMax = 0;
if (Util.notEmpty(collection)) {
  pubMax = collection.size();
}  
String currentUserLang = channel.getCurrentUserLang();
List<Publication> pubList = new ArrayList<Publication>();  

if (Util.notEmpty(collection)) {
  Iterator<Publication> iteratorPub = collection.iterator();
  
  while (iteratorPub.hasNext()) {
    pubList.add(iteratorPub.next());
  }
}
Iterator<Publication> itrPub = pubList.iterator();  
  
//List of parameters for each publication required to create cards and layout 
PubDisplayStyleBuilder pubDisplayStyleBuilder = new PubDisplayStyleBuilder();
  
if(Util.notEmpty(pubList)) {
  pubDisplayStyleBuilder.setSettingsAllPublicationCard(pubList);
}  

//Predictive layout
int maxPubPerModel = 7;
if (Util.notEmpty(layoutModel)) {
  if (layoutModel.equals("model1")) {
    maxPubPerModel = 7;
  }
  else if (layoutModel.equals("model2")) {
    maxPubPerModel = 9;
  }
  else if (layoutModel.equals("model3")) {
    maxPubPerModel = 5;
  }
} else {
  layoutModel = "model1";
}
  
PubDisplayStyleLayout layout = new PubDisplayStyleLayoutPredictive(layoutModel,maxPubPerModel);
//List of css Card Style 
List<CssStyleLayout> allCssStyleLayout = new ArrayList<CssStyleLayout>();
  
if(Util.notEmpty(pubList)) {
  allCssStyleLayout = layout.runLayoutEngine(pubDisplayStyleBuilder,false);
}
  
Iterator<CssStyleLayout> itrCssStyleLayout = allCssStyleLayout.iterator();
int index = 0;
%>
<div class="layout-jnews layout-predictive-jnews" style="visibility: hidden;">
  <% while (itrPub.hasNext()) { %>       
	  <% if (itrCssStyleLayout.hasNext()) { %> 
	    <%@ include file='/front/card/data/layout/jnews/doDisplayPubs.jspf' %>
    <% } else { 
      break;
      }   
    } 
  %>   
</div>    