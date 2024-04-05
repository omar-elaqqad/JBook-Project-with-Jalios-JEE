<%@page import="com.jalios.jcmsplugin.smartphone.portal.SmartPhonePortalManager.SmartPhonePortlet"%>
<%@page import="com.jalios.jcmsplugin.smartphone.portal.SmartPhonePortalManager"%>
<%@page import="com.jalios.jcms.taglib.card.CardsDisplayMode"%>
<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %>
<%
Set<SmartPhonePortlet> portletTypes = SmartPhonePortalManager.getInstance().getPortletTypeEntries(userLang);
%>
<div class="sidebar-tab-title"><%= glp("types.SmartPhonePortal.fields.portlets.label") %></div>
<jalios:cards css="card-count-2" mode="<%= CardsDisplayMode.DECK %>">
  <% for (SmartPhonePortlet itPortletType : portletTypes) { %>
	  <jalios:card css="portal-element js-smartphone-portlet" dataAttribute='<%= new DataAttribute().addData("jalios-jmobile-portlet-class", itPortletType.getPortletClass().getSimpleName()) %>'>
      <img src="<%= itPortletType.getIconSrc() %>" class="card-img jalios-icon jportal-component-icon jportal-component-icon-colored" alt="">
      <jalios:cardBlock>
	      <div class="card-title component-label js-type-name"><%= itPortletType.getLabel(userLang) %></div>
	    </jalios:cardBlock>
	  </jalios:card>  
  <% } %>
</jalios:cards>