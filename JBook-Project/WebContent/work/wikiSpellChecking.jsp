<%@ include file='/jcore/doInitPage.jspf' %><% 

  String lang = getAlphaNumParameter("lang", userLang);
  // Ensure language exists, otherwise use default site language 
  if (channel.getProperty(lang + ".lang", null) == null) {
    lang = channel.getLanguage();
  }

  String tiId = Util.getString(getChooserParameter("tiId"), "" );
  
  jcmsContext.setPageTitle(glp("ui.wiki.spellcheck"));
  request.setAttribute("zone","InternalUI");

%><%@ include file='/jcore/doEmptyHeader.jspf' %>

<div class="container-fluid">

 <form id="spell" action="work/wikiSpellCorrecting.jsp" method="post" class="form-horizontal">
 
  <input type="hidden" name="lang" value="<%= encodeForHTMLAttribute(lang) %>" />
  <input type="hidden" name="tiId" value="<%= encodeForHTMLAttribute(tiId) %>" />
  <input type="hidden" id="text" name="text" value="" />
  
  <br/>
  
  <jalios:icon src="wait" />
  <%= glp("ui.wiki.spellcheck.txt.process") %>
  
  <br/>
  
  <input class="btn btn-primary" type="submit" value="SpellCheck" />
 </form>
</div>

<%
 jcmsContext.addJavaScript("js/wikispell.js");
%>
<jalios:javascript>
	<% if (Util.isEmpty(tiId)) { // IE showModelessDialog %>
	var target = window.dialogArguments ;
	<% } else { %>
	var target = top.opener.document.getElementById('<%= tiId %>') ;
	<% } %>
	if ( document.getElementById('text').value.length == 0 ) {
	 document.getElementById('text').value = target.value ;
	}
	setTimeout("document.getElementById('spell').submit()", 1) ;
</jalios:javascript>
<%@ include file='/jcore/doEmptyFooter.jspf' %>