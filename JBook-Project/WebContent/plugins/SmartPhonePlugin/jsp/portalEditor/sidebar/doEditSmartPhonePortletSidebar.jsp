<%@page import="com.jalios.jcmsplugin.smartphone.portal.SmartPhonePortalEditorHandler"%>
<%@page import="com.jalios.jcms.jportal.JPortalEditorHandler"%>
<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.smartphone.portal.SmartPhonePortalEditorHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='noRedirect' value='<%= true %>' />
  <jsp:setProperty name='formHandler' property='*' />
</jsp:useBean>
<%
request.setAttribute(JPortalEditorHandler.PORTLET_EDITION_REQUEST_ATTR, true); // Used to hide some elements in doEdit* jsps
request.setAttribute(SmartPhonePortalEditorHandler.FORMHANDLER_REQUEST_ATTR, formHandler);
request.setAttribute("jcms.edit.footer.display", false);
request.setAttribute(EditPortletSkinableHandler.DISPLAY_PORTLET_SKINABLE_FORM_REQUEST_ATTR, false);
request.setAttribute("field-vertical", true);
request.setAttribute("smartphone.portal-editor-creation", true);

boolean canWorkOnPortlet = loggedMember.canWorkOn(channel.getPublication(formHandler.getPortletId()));
String portletEditTemplatePath = formHandler.getPortletEditTemplatePath();
boolean isSkinablePortlet = channel.getPublication(formHandler.getPortletId()) instanceof AbstractPortletSkinable;
%>
<form>
  <div class="edition-sidebar sidebar-component sidebar-left sidebar-tabbed is-open" data-jalios-sidebar-overlay="false" data-jalios-sidebar-direction="left" >
    <div class="sidebar-header-icon">
      <a class="" title="<%= encodeForHTMLAttribute(glp("jportal.edition.sidebar.header.back.title")) %>" data-jalios-jmobile-portal-action="cancelPortletOperation"
        ><jalios:icon src="glyph: icomoon-mobile2" />
      </a>
    </div>
    <ul class="sidebar-tabs" role="tablist">
      <li role="presentation" class="active">
        <a href="#PORTLET_SETUP" data-toggle="tab" aria-controls="paths" role="tab" title='<%= encodeForHTMLAttribute(glp("portal.edition.sidebar.portal-edit.tab-edit.title")) %>'>
         <jalios:icon src="jcmsplugin-smartphone-portal-editor-tab-portlet-edition" />
        </a>
      </li>
      <li role="presentation">
        <a href="#PORTLET_TEMPLATES" data-toggle="tab" aria-controls="paths" role="tab" title="<%= encodeForHTMLAttribute(glp("portal.edition.sidebar.portal-edit.template.title")) %>">
         <jalios:icon src="jcmsplugin-smartphone-portal-editor-tab-templates" />
        </a>
      </li>
      <li role="presentation">
        <a href="#PORTLET_ADVANCED" data-toggle="tab" aria-controls="paths" role="tab" title="<%= encodeForHTMLAttribute(glp("portal.edition.sidebar.portal-edit.portal-advanced.title")) %>">
         <jalios:icon src="jcmsplugin-smartphone-portal-editor-tab-advanced" />
        </a>
      </li>        
          
  <!--     <li role="presentation">
        <a href="#PORTAL_EDIT" data-toggle="tab" aria-controls="paths" role="tab" title="JPortal parameters">
         <span class="jalios-icon jportal-sidebar-tab-jportal-edit icomoon-pencil5"></span>
        </a>
      </li>  
      <li role="presentation" class="">
        <a href="#UI" data-toggle="tab" aria-controls="paths" role="tab" title="JPortal style">
         <span class="jalios-icon jportal-sidebar-tab-ui icomoon-palette"></span>
        </a>
      </li> -->
    </ul>
    <div class="sidebar-body">
      <div class="tab-content">
        <div class="tab-pane active" id="PORTLET_SETUP">
          <jalios:include jsp="plugins/SmartPhonePlugin/jsp/portalEditor/sidebar/tab/doEditSmartPhonePortletSidebar_edit.jsp" />
          <% EditPortalElementHandler genericFormHandler = (EditPortalElementHandler) request.getAttribute("formHandler"); %>
          <% boolean updateSuccess = Util.toBoolean(request.getAttribute("smartphone.portal-editor-creation.success-update"), false); %>
          <% if (updateSuccess || genericFormHandler.validate()) { %>
            <script>
            jQuery.plugin.SmartphonePortalApp.triggerEvent("updatePortlet",{
              portletId: "<%= genericFormHandler.getPublication().getId() %>",
              portletLabel: "<%= genericFormHandler.getPublication().getTitle(userLang) %>",
              portletImage: "<%= genericFormHandler.getPublication().getDataImage(userLang) %>"
            });          
            </script>
          <% } %>
        </div>
        <div class="tab-pane" id="PORTLET_TEMPLATES">
          <jalios:include jsp="plugins/SmartPhonePlugin/jsp/portalEditor/sidebar/tab/doEditSmartPhonePortletSidebar_templates.jsp" />
        </div>
        <div class="tab-pane" id="PORTLET_ADVANCED">
          <jalios:include jsp="plugins/SmartPhonePlugin/jsp/portalEditor/sidebar/tab/doEditSmartPhonePortletSidebar_advanced.jsp" />
        </div>        
                  
      </div>
    </div>
  </div>
  <input type="hidden" name="id" value="<%= genericFormHandler.getPublication().getId() %>" />
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</form>
