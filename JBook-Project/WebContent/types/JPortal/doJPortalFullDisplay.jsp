<%@page import="com.jalios.jcms.jportal.JPortalConstants"%><%
%><%@page import="com.jalios.jcms.jportal.JPortalDisplayContext"%><%
%><%@page import="com.jalios.jcms.jportal.json.JPortalMapping"%><%
%><%@page import="com.jalios.jcms.jportal.JPortalUtils"%><%
%><%@page import="com.jalios.jcms.jportal.json.JBlockMapping"%><%
%><%@page import="com.jalios.jcms.jportal.JPortalStructure"%><%
%><%@page import="com.jalios.jcms.jportal.JPortalManager"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.jportal.JPortalDisplayHandler'><%--
--%><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%--
--%><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%--
--%><jsp:setProperty name='formHandler' property='*' /><%--
--%><jsp:setProperty name='formHandler' property='jportal' value="<%= displayPortal %>" /><%--
--%></jsp:useBean><%--
--%><%

if (!formHandler.canAccessJPortal()) {
	sendForbidden(request, response);
}

JPortalMapping mapping = formHandler.getJPortalMapping();

if (mapping == null) {
  return;
}

formHandler.addFrontEndDependencies();

JPortalDisplayContext jPortalDisplayContext = new JPortalDisplayContext();
if (!JPortalUtils.isCollaborativeSpaceJPortal(formHandler.getJportal())) {
  jPortalDisplayContext.setPageTitle(formHandler.getJportalDisplayTitle());
  jPortalDisplayContext.setPageDescription(formHandler.getJportal().getDescription(userLang), userLang);
}
request.setAttribute(JPortalConstants.DISPLAY_CONTEXT_REQUEST_ATTR, jPortalDisplayContext);
request.setAttribute(JPortalConstants.DISPLAY_HANDLER_REQUEST_ATTR, formHandler);
%>
<%-- BUFFERS resolution : retrieve all childrens to define context --%>
<jalios:buffer name="jportalHeader">
  <% if (formHandler.isDisplayHeader()) { %>
    <div class="jportal-structured-header container-fluid">
      <div class="row jportal-row">
        <% request.setAttribute("jcms.jportal.jblock-mapping", mapping.getUi().getJblockHeader()); %>
        <jalios:include jsp="types/JPortal/doJBlocks.jsp" />
        <% request.removeAttribute("jcms.jportal.jblock-mapping"); %>
      </div>
    </div>
  <% } %>
</jalios:buffer>
<jalios:buffer name="jportalBody">
  <% for (JBlockMapping jBlock : mapping.getjBlocks()) { %>
    <% request.setAttribute("jcms.jportal.jblock-mapping",jBlock); %>
    <jalios:include jsp="types/JPortal/doJBlocks.jsp" />
    <% request.removeAttribute("jcms.jportal.jblock-mapping"); %>
  <% } %>
</jalios:buffer>
<jalios:buffer name="jportalFooter">
  <%-- FOOTER --%>
  <% if(formHandler.isDisplayFooter()){ %>
    <footer class="jportal-structured-footer container-fluid">
      <div class="row jportal-row">
        <% request.setAttribute("jcms.jportal.jblock-mapping",mapping.getUi().getJblockFooter()); %>
        <jalios:include jsp="types/JPortal/doJBlocks.jsp" />
        <% request.removeAttribute("jcms.jportal.jblock-mapping"); %>
      </div>
    </footer>
  <% } %>
</jalios:buffer>
<%
//Retrieve display context fullfilled by buffers
jPortalDisplayContext = (JPortalDisplayContext) request.getAttribute(JPortalConstants.DISPLAY_CONTEXT_REQUEST_ATTR);
// Page meta data
request.setAttribute("metakeywords", Util.join(jPortalDisplayContext.getPageKeywords(), ","));
request.setAttribute("metadescription", jPortalDisplayContext.getPageDescription());
request.setAttribute("metaimage", jPortalDisplayContext.getPageImage());
request.setAttribute("customHeaderJPortalStyleContent", formHandler.getJPortalCss());
if (Util.notEmpty(jPortalDisplayContext.getPageTitle())) {
  jcmsContext.setPageTitle(jPortalDisplayContext.getPageTitle());
}

if (!jPortalDisplayContext.hasPub()) {
  formHandler.trackPortal();
}

%><%@ include file='/jcore/doHeader.jspf'%>
<% 
String jPortalJS = formHandler.getJPortalJs();
if (Util.notEmpty(jPortalJS)) { %>
<jalios:javascript>
  try{
    <%= jPortalJS %>
  }catch(e){
    jQuery.console.log("Error in your portal's custom javascript");
    jQuery.console.log(e);
  }
</jalios:javascript>
<% } %>

<% if (jPortalDisplayContext.hasAnimation()) { %>
	<%
	jcmsContext.addCSSHeader("js/lib/aos/aos.css");
	jcmsContext.addJavaScript("js/lib/aos/aos.js");
	%>
	<jalios:javascript>
	  AOS.init();
	</jalios:javascript>
<% } %>

<jalios:include target='jportal-top' />
<% 
String jportalWrapperTag = Util.getString(request.getAttribute("jportal.wrapperTag"), "main"); 
boolean isWrapperMain = "main".equals(jportalWrapperTag);
%>
<<%= jportalWrapperTag %> <% if (isWrapperMain) { %>role="main"<% } %> class="jportal-wrapper <%= jPortalDisplayContext.getCssClass() %>" data-jportal-id="<%=displayPortal.getId()%>">
	<%-- HEADER --%>
  <%= jportalHeader %>
	<%-- BODY --%>
	<div class="<%= formHandler.getContainerCss() %>">
		<div class="row jportal-row">
	    <%= jportalBody %>
	  </div>
	</div>
  <%-- FOOTER --%>
  <%= jportalFooter %>
  <%-- FIXED BOTTOM --%>
  <% if(formHandler.displayScrollToTop() || formHandler.isJPortalSimplifiedEditAvailable()){ %>
  	<div class="jportal-fixed-bottom">
  		<% if (formHandler.displayScrollToTop()) { %>
				<!-- Return to Top -->
				<a role="button" tabindex="0" class="fixed-bottom__link" id="jportal-return-to-top" title="<%= encodeForHTMLAttribute(glp("jportal.return-to-top")) %>"><jalios:icon src="jportal-return-to-top" /><span class="sr-only"><%= glp("jportal.return-to-top") %></span>
				</a>
		  <% } %>
		  <% if (formHandler.isJPortalSimplifiedEditAvailable()) { %>
				<!-- Simplified edition -->
				<a tabindex="0" role="button" class="fixed-bottom__link jportal-stop-edition" data-jalios-jportal-action="activate-jportal-simple-edit" id="jportal-simple-edition" aria-label="<%= encodeForHTMLAttribute(glp("jportal.simple-edition.stop-edition.label")) %>">
					<jalios:icon css="simple-edit-start" src="jportal-simple-edition-edit" />
					<jalios:icon css="simple-edit-stop"  src="jportal-simple-edition-stop-edit" />
					<span><%= glp("jportal.simple-edition.stop-edition.label") %></span>
				</a>
		  <% } %>
  	</div>
  <% } %>
</<%= jportalWrapperTag %>>
<jalios:include target='jportal-bottom' />
<% if(formHandler.isJPortalSimplifiedEditAvailable()){ %>
<script id="portlet-edition-overlay" type="text/x-handlebars-template">
<div class="portlet-edition-overlay">
  <div class="edition_menu">
    <div class="edition_menu__left edition_menu__sides" />
    <a href="<%= formHandler.getHandlebarPortletEditUrl() %>" title="<%= encodeForHTMLAttribute(glp("ui.com.alt.edit")) %>" class="edition_menu__action modal"><jalios:icon src="edit" alt="ui.com.alt.edit" /></a>
    <a role="button" tabindex="0" class="edition_menu__drag menu__grab" title="<%= encodeForHTMLAttribute(glp("ui.portalihm.alt.shift")) %>"><jalios:icon src="jportal-simple-edition-portlet-drag" alt="ui.portalihm.alt.shift"/></a>
    <a role="button" tabindex="0" data-action="delete" title='<%= glp("ui.portalihm.alt.remove")%>' class="edition_menu__action"><jalios:icon src="remove" alt="ui.portalihm.alt.remove" /></a>
    <div class="edition_menu__right edition_menu__sides" />
  </div>
  <div class="portlet-overlay_split">
    <div class="portlet-overlay__drop-arrow" data-drop-position="top">
      <jalios:icon src="jportal-simple-edition-drop-arrow"  css="drop-arrow arrow_up"/>
    </div>
  </div>
  <div class="portlet-overlay_split">
    <div class="portlet-overlay__drop-arrow overlay__bottom" data-drop-position="bottom">
      <jalios:icon src="jportal-simple-edition-drop-arrow" css="drop-arrow arrow_down"/>
    </div>
  </div>
</div>
</script>
  
<script id="new-block-template" type="text/x-handlebars-template">
<div data-block-id="{{block-id}}" class="jportal-block col-xs-12 col-sm-12 col-md-{{size}}">
  <div class="jportal-block-inner {{block-id}}">

  </div>
</div>
</script>
<script id="new-block-portlet-template" type="text/x-handlebars-template">
<div data-portlet-id="{{portlet-id}}" data-block-id="{{block-id}}" class="jportal-block col-xs-12 col-sm-12 col-md-{{size}}">
	<div class="jblock-portlet">
    <div class="jportal-block-inner {{block-id}}">

    </div>
	</div>
</div>
</script>
<script id="add-portlet-button-template" type="text/x-handlebars-template">
<div class="add-portlet__wrapper">
  <a href="jcore/jportal/edition/doJPortalAddPortletModal.jsp?blockId={{block-id}}&jPortal={{jportal-id}}" class="modal btn-add-portlet" title='<%= glp("ui.portalihm.alt.add") %>'><jalios:icon src="jportal-simple-edition-add-portlet" alt="ui.portalihm.alt.add" /></a>
</div>
</script>

<% } %>
<%@ include file='/jcore/doFooter.jspf'%>