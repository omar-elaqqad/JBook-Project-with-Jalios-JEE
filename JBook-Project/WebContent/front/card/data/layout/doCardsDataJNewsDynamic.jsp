<%@ include file="/front/card/data/layout/doInitCardsData.jspf" %><% 
%><%@page import="com.jalios.jcms.jnews.CssStyleLayout"%><% 
%><%@page import="com.jalios.jcms.jnews.PubDisplayStyleLayoutBasic"%><% 
%><%@page import="com.jalios.jcms.jnews.PubDisplayStyleLayout"%><% 
%><%@page import="com.jalios.jcms.jnews.PubDisplayStyleBuilder"%><% 
%><% jcmsContext.addCSSHeader("css/jalios/core/components/card/jnews/jalios-publications-cssgrid.css"); %><% 
%><% jcmsContext.addCSSHeader("css/jalios/core/components/card/jnews/jalios-publications-card.css"); %><% 
%><% jcmsContext.addCSSHeader("css/jalios/core/components/card/jnews/jalios-dropdown-menu-icons.css"); %><% 
%><% jcmsContext.addJavaScript("js/jalios/core/components/jnews/jalios-display-pubs.js"); %><% 
String template = channel.getProperty("jcms.jnews.layout.dynamic", "dynamic"); 
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

//Dynamic layout      
PubDisplayStyleLayout layout = new PubDisplayStyleLayoutBasic();   
//List of css Card Style 
List<CssStyleLayout> allCssStyleLayout = new ArrayList<CssStyleLayout>();
  
if(Util.notEmpty(pubList)) {
  allCssStyleLayout = layout.runLayoutEngine(pubDisplayStyleBuilder,false);
}
  
Iterator<CssStyleLayout> itrCssStyleLayout = allCssStyleLayout.iterator();
int index = 0;
%>
<div class="layout-jnews layout-dynamic-jnews" style="visibility: hidden;">
  <% while (itrPub.hasNext()) { %>      
	  <% if (itrCssStyleLayout.hasNext()) { %> 
	    <%@ include file='/front/card/data/layout/jnews/doDisplayPubs.jspf' %>
    <% } else { 
        break;
      }   
    }
  %>   
</div>    