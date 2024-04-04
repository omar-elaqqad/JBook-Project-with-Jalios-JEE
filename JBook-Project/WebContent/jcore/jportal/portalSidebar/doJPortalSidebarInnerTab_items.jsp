<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="com.jalios.jcms.taglib.card.LinkOptions"%>
<%@page import="com.jalios.jcms.jportal.component.JPortalComponent"%>
<%@page import="com.jalios.jcms.jportal.JPortalManager"%>
<%@page import="com.jalios.jcms.taglib.card.CardsDisplayMode"%>
<%@ page contentType="text/html; charset=UTF-8"%><%--
--%><%@ include file="/jcore/doInitPage.jspf"%>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.jportal.JPortalEditorHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='noRedirect' value='<%= true %>' />
  <jsp:setProperty name='formHandler' property='*' />
</jsp:useBean>
<% if (formHandler.isSearchPerformed()) { %>
  <% Set<JPortalComponent> componentSet = JPortalManager.getInstance().getJPortalComponentSet(userLang, formHandler.getText()); %>
  <% if (Util.notEmpty(componentSet)) { %>
  <jalios:cards mode="<%= CardsDisplayMode.DECK %>" css="card-count-2">
    <% for (JPortalComponent itComponent : componentSet) { %>
      <jalios:card css="jportal-component is-draggable" dataAttribute='<%= new DataAttribute().addData("jalios-jportal-portlet-name",itComponent.getLabel(userLang)).addData("jalios-jportal-component-type",itComponent.getType()).addData("jalios-portlet-classname",itComponent.getPortletClass().getSimpleName()) %>'>
        <jalios:cardImage src="<%= itComponent.getIconSrc() %>" />
        <jalios:cardBlock css="card-body">
          <div class="card-title jportal-component-label"><%= itComponent.getLabel(userLang) %></div>
        </jalios:cardBlock>
      </jalios:card>        
    <% } %>
  </jalios:cards>
  <% } else { %>
    <div class="sidebar-no-result">
      <jalios:icon src="clear"/>
      <p><%= glp("ui.com.lbl.no-result") %></p>
    </div>
  
  <% } %>
<% } else { %>
  <div class="jportal-component-type"><%= glp("jportal.edition.sidebar.components.layout.title") %></div>
  <div class="jportal-component-type-wrapper clearfix">
    <jalios:cards mode="<%= CardsDisplayMode.DECK %>" css="card-count-2">
      <jalios:card css="jportal-component is-draggable" dataAttribute='<%= new DataAttribute().addData("jalios-jportal-component-id","LAYOUT_JBLOCK").addData("jalios-jportal-component-type","LAYOUT_JBLOCK") %>'>
         <jalios:icon src="jportal-jblock" css="card-img jportal-component-icon" />
         <jalios:cardBlock css="card-body">
           <div class="card-title jportal-component-label"><%= glp("jportal.edition.sidebar.components.layout.jblock.label") %></div>
         </jalios:cardBlock>
      </jalios:card>
    </jalios:cards>
  </div>
  <div class="jportal-component-type-wrapper clearfix">
    <div class="jportal-component-type"><%= glp("jportal.edition.sidebar.components.portlets.title") %></div>
    <jalios:cards mode="<%= CardsDisplayMode.DECK %>" css="card-count-2">
      <% for (JPortalComponent itComponent : JPortalManager.getInstance().getJPortalComponentSet(userLang, null)) { %>
        <jalios:card css="jportal-component is-draggable"
        						dataAttribute='<%= new DataAttribute().addData("jalios-jportal-portlet-name",itComponent.getLabel(userLang)).addData("jalios-jportal-component-type",itComponent.getType()).addData("jalios-portlet-classname",itComponent.getPortletClass().getSimpleName()) %>'>
           <jalios:cardImage src="<%= itComponent.getIconSrc() %>" />
           <jalios:cardBlock css="card-body">
            <div class="card-title jportal-component-label"><%= itComponent.getLabel(userLang) %></div>
          </jalios:cardBlock>
        </jalios:card>        
      <% } %>
    </jalios:cards>
  </div>
<% } %>