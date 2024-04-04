<%@page import="com.jalios.io.IOUtil"%>
<%@page import="com.jalios.jcms.uicomponent.Button.ButtonType"%><%
%><%@page import="com.jalios.jcms.jportal.JPortalAddPorletHandler"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
if (!isLogged) {
  sendForbidden(request, response);
  return;
}
%>
<jalios:include jsp="jcore/jportal/edition/doJPortalAddPortletModalHandler.jsp" /><%
JPortalAddPorletHandler formHandler = (JPortalAddPorletHandler) request.getAttribute("formHandler"); %>
<div class="jportal-portlets">
  <% Set<PortalElement> portlets = formHandler.getPortletSet(); %>
  
  <% if (Util.notEmpty(portlets)) { %>
	    <jalios:cards css="card-count-3" mode="<%= CardsDisplayMode.DECK %>">
	           
      <% for(PortalElement itPortlet : portlets) { %>
        <% 
          String templateImage = itPortlet instanceof PortletSkinable ? ((PortletSkinable) itPortlet).getTemplateEntry("box", false).getThumbnailPath() : channel.getProperty("jportal.portlet-type.Default-colored.icon", "");
          templateImage = new File(channel.getRealPath(templateImage)).exists() ? templateImage : channel.getProperty("jportal.portlet-type.Default-colored.icon", "");
        %>
        <jalios:card>
          <jalios:cardImage src="<%= templateImage %>" />
          <jalios:cardBlock>
            <div class="card-title"  data-jalios-truncate='{ "value" : 2 }'><%= itPortlet.getTitle() %></div>
          </jalios:cardBlock>
          <jalios:cardBlock css="card-block-xs text-center no-grow" mode="<%= CardBlockMode.FOOTER %>">
          <jalios:buttonAjax 
            name="opSelectPortlet" 
            css="btn btn-default" 
            buttonType="<%= ButtonType.BUTTON_SUBMIT %>" 
            value="<%= itPortlet.getId() %>" 
            icon="jportal-simple-edition-add-portlet"
            label="jportal.simple-edition.add-portlet-modal.btn"
            />
          </jalios:cardBlock>
       </jalios:card>
      <% } %>
       
    </jalios:cards>
  <% } else { %>
    <jalios:noResults />            
  <% } %>
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>