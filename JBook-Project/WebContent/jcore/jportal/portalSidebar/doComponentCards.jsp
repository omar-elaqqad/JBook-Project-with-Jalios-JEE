<%@page import="com.jalios.jcms.taglib.card.CardsDisplayMode"%>
<%@page import="com.jalios.jcms.jportal.component.*"%>
<%@ page contentType="text/html; charset=UTF-8"%><%--
--%><%@ include file="/jcore/doInitPage.jspf"%><%--
--%>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.jportal.JPortalEditorHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='noRedirect' value='<%= true %>' />
  <jsp:setProperty name='formHandler' property='*' />
</jsp:useBean>

<div class="js-autocomplete-field-result">
	<jalios:cards mode="<%= CardsDisplayMode.DECK %>" css="card-count-2">
   <% for (Portlet itPortlet : formHandler.getPortletSet()) { %> 
     <% 
      String templateImage = itPortlet instanceof PortletSkinable ? ((PortletSkinable) itPortlet).getTemplateEntry("box", false).getThumbnailPath() : "";
      String componentImage = Util.isEmpty(templateImage) || itPortlet instanceof PortletImage ? itPortlet.getDataImage() : templateImage;
     %>
    <jalios:card css="is-clickable jportal-component jportal-component-portlet" dataAttribute='<%= new DataAttribute().addData("jalios-jportal-component-id", itPortlet.getId()).addData("jalios-jportal-component-type", "JPORTLET") %>'>
       <jalios:cardImage src='<%= componentImage %>' alt="" css="jportal-component-icon" />
	     <jalios:cardBlock css="jalios-card-body">
		     <div class="card-title jportal-component-label"><%= itPortlet.getTitle() %></div>
		     <div class="metadata"><%= itPortlet.getWorkspace().getTitle(userLang, true) %></div>
       </jalios:cardBlock>
      <span class="jportal-component-overlay"><jalios:icon src="glyph: icomoon-move" /></span>
	  </jalios:card>
    <% } %>
	</jalios:cards>
</div>