<%@ page contentType="text/html; charset=UTF-8"%><%--
--%><%@ include file="/jcore/doInitPage.jspf"%><%--
--%>
<jsp:useBean id='portalHandler' scope='page' class='com.jalios.jcmsplugin.smartphone.portal.SmartPhonePortalEditorHandler'>
  <jsp:setProperty name='portalHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='portalHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='portalHandler' property='*' />
  <jsp:setProperty name='portalHandler' property='noRedirect' value='<%= true %>' />
</jsp:useBean><%
SmartPhonePortal portal = (SmartPhonePortal) portalHandler.getAvailablePortal();
%>
<div class="ajax-refresh-div mobilePortal-sidebar" data-jalios-ajax-refresh-url="plugins/SmartPhonePlugin/jsp/portalEditor/sidebar/doPortalSidebarInner.jsp">
  <div class="tab-content">
    <div class="tab-pane <%= !portalHandler.isPortalEdition()  ? " active in" : ""  %>" id="ADD_PORTLET">
      <jalios:include jsp="plugins/SmartPhonePlugin/jsp/portalEditor/mobilePortalEditor_portletTypes.jsp" />
    </div> 
        
    <div class="tab-pane <%= portalHandler.isPortalEdition()  ? " active in" : ""%>" id="PORTAL_EDIT">
      <%@ include file="/plugins/SmartPhonePlugin/jsp/portalEditor/sidebar/doPortalSidebarInnerTab_edit.jspf" %>   
    </div>  
        
    <div class="tab-pane" id="UI">
      <%@ include file="/plugins/SmartPhonePlugin/jsp/portalEditor/sidebar/doPortalSidebarInnerTab_ui.jspf" %>
    </div>           
  </div>
  <%@ include file="/jcore/doAjaxFooter.jspf" %>
</div>