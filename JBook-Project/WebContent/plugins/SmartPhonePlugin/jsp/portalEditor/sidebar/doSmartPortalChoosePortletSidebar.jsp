<%@page import="com.jalios.jcms.taglib.card.CardsDisplayMode"%>
<%@page import="com.jalios.jcmsplugin.smartphone.portal.SmartPhonePortalManager"%>
<%@page import="com.jalios.jcmsplugin.smartphone.portal.SmartPhonePortalEditorHandler"%>
<%@page import="com.jalios.jcms.jportal.JPortalEditorHandler"%>
<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.smartphone.portal.SmartPhonePortalEditorHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
  <jsp:setProperty name='formHandler' property='noRedirect' value='<%= true %>' />
</jsp:useBean>
<%
request.setAttribute(JPortalEditorHandler.PORTLET_EDITION_REQUEST_ATTR, true);
request.setAttribute(SmartPhonePortalEditorHandler.FORMHANDLER_REQUEST_ATTR, formHandler);
request.setAttribute("jcms.edit.footer.display", false);
request.setAttribute(EditPortletSkinableHandler.DISPLAY_PORTLET_SKINABLE_FORM_REQUEST_ATTR, false);
request.setAttribute("field-vertical", true);
%>
<div class="ajax-refresh-div" data-jalios-ajax-refresh-url="plugins/SmartPhonePlugin/jsp/portalEditor/sidebar/doSmartPortalChoosePortletSidebar.jsp">
  <div class="edition-sidebar sidebar-component sidebar-left sidebar-tabbed is-open" data-jalios-sidebar-overlay="false" data-jalios-sidebar-direction="left" >
    <div class="sidebar-header-icon">
      <a class="" title="<%= encodeForHTMLAttribute(glp("jportal.edition.sidebar.header.back.title")) %>" data-jalios-jmobile-portal-action="cancelPortletOperation"
        ><jalios:icon src="glyph: icomoon-mobile2" />
      </a>
    </div>
    <ul class="sidebar-tabs" role="tablist">
      <li role="presentation" class="active">
        <a href="#PORTLET_SETUP" data-toggle="tab" aria-controls="paths" role="tab" title='<%= encodeForHTMLAttribute(glp("portal.edition.sidebar.portal-edit.tab-edit.title")) %>'>
         <jalios:icon src="jcmsplugin-smartphone-portal-editor-tab-add" />
        </a>
      </li>
    </ul>
    <div class="sidebar-body">
      <div class="sidebar-tab-title"><%= glp("portal.edition.history.portlet-chooser") %></div>
      <% if (loggedMember.canPublishSome(formHandler.getAvailablePortletClass())) { %>
  	    <a class="btn btn-default btn-block br" data-jalios-action="ajax-refresh" data-jalios-ajax-refresh-url="plugins/SmartPhonePlugin/jsp/portalEditor/sidebar/doCreateSmartPhonePortletSidebar.jsp?smartphonePortalId=<%= formHandler.getAvailablePortal().getId() %>&amp;portletClass=<%= formHandler.getAvailablePortletClass().getSimpleName() %>"><%= glp("portal.edition.history.create-portlet") %></a>
      <% } %>
      <h2><%= glp("portal.edition.history.existing-portlets") %></h2>
      <form>
        <jalios:field resource="field-vertical" name="workspaceFilter" value="<%= formHandler.getAvailableWorkspaceFilter() %>">
          <jalios:control settings='<%= new EnumerateSettings().select().dataAttribute("jalios-action", "ajax-refresh").emptyValueLabel(glp("jcmsplugin.smartphone.portal.lbl.filter-workspace")).enumValues(formHandler.getWorkspaceFilterSet()) %>' />
        </jalios:field>
        <jalios:control settings='<%= new HiddenSettings().name("portletClass").value(formHandler.getAvailablePortletClass().getSimpleName()) %>'/>
        <jalios:control settings='<%= new HiddenSettings().name("smartphonePortalId").value(formHandler.getAvailablePortal().getId()) %>'/>
      </form>
      <jalios:cards mode="<%= CardsDisplayMode.DECK %>" css="card-count-2">
        <% for (Portlet itPortlet : formHandler.getPortletInstanceSet()) { %>
          <% 
            DataAttribute dataAttribute = new DataAttribute();
            dataAttribute.addData("jalios-data-id", itPortlet.getId());
            dataAttribute.addData("jalios-jmobile-portlet-label", itPortlet.getTitle(userLang));
            dataAttribute.addData("jalios-jmobile-portlet-image", itPortlet.getDataImage(userLang));
            dataAttribute.addData("jalios-jmobile-portal-action", "selectPortlet");
          %>
          <jalios:card dataAttribute="<%= dataAttribute %>">
            <% 
              String templateImage = itPortlet instanceof PortletSkinable ? ((PortletSkinable) itPortlet).getTemplateEntry(SmartPhonePortalManager.TEMPLATE_USAGE_NAME, false).getThumbnailPath() : itPortlet.getPreview(jcmsContext, 300, 200, null);
              String componentImage = Util.isEmpty(templateImage) || itPortlet instanceof PortletImage ? itPortlet.getDataImage() : templateImage;
              componentImage = Util.isEmpty(componentImage) || !new File(channel.getRealPath(componentImage)).exists() ? "images/jalios/jportal/jportlet/core/Default_grey.png" : componentImage;
            %>
            <jalios:cardImage src="<%= componentImage %>" />
            <jalios:cardBlock>
              <div class="card-title"><%= itPortlet.getTitle(userLang) %></div>
              <% if (Util.isEmpty(formHandler.getAvailableWorkspaceFilter())) { %>
                <div class="card-meta"><%= itPortlet.getWorkspace().getTitle(userLang) %></div>
              <% } %>
            </jalios:cardBlock>
          </jalios:card>
        <% } %>
      </jalios:cards>
      
    </div>
  </div>
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>
