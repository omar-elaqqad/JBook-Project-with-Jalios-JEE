<%@page import="com.jalios.jcmsplugin.smartphone.portal.SmartPhonePortalManager"%>
<%@page import="com.jalios.jcmsplugin.smartphone.portal.SmartPhonePortalStructure"%>
<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.smartphone.portal.SmartPhonePortalEditorHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
</jsp:useBean><%


jcmsContext.addCSSHeader("plugins/SmartPhonePlugin/css/portalEditor/portal-history.css");
SmartPhonePortal smartphonePortal = (SmartPhonePortal) formHandler.getPortal();

if (smartphonePortal == null) {
  smartphonePortal = (SmartPhonePortal) jcmsContext.getAjaxRequestAttribute("portal");
}

if (smartphonePortal == null) {
  return;
}

SmartPhonePortalStructure structure = Util.getFirst(SmartPhonePortalManager.getInstance().getPortalStructures(smartphonePortal, 0, 1));
String displayUrl = smartphonePortal.getDisplayUrl(userLocale);
%>
<div class="portal-history">
  <div class="edition-topbar">
	  <div class="portal-navigation portal-topbar-left">
	    <a data-smartphone-portal-action="remove-history" class="portal-name portal-navigation-item"><%= smartphonePortal.getTitle(userLang) %></a>
	    <div class="portal-navigation-item"><%= glp("portal.edition.history.breadcrumb.label") %></div>
	  </div>	
		<form method="post" class="edition-topbar-right portal-revert-form" action="plugins/SmartPhonePlugin/jsp/portalEditor/mobilePortalEditor.jsp?smartphonePortalId=<%= smartphonePortal.getId() %>">
	    <a data-smartphone-portal-action="remove-history" class="btn btn-default" href="#">
			  <%= glp("portal.edition.history.back-edition.label") %>
			</a>
	    <a data-smartphone-portal-action="rename-history" class="btn btn-default" href="#">
	      <%= glp("portal.structure.rename-title.label") %>
	    </a>
		  <button class="btn btn-primary portal-history-revert" data-smartphone-portal-action="history-revert" disabled="disabled">
		    <%= glp("portal.edition.history.back-to-version.label") %>
		  </button>
		  <input type="hidden" name="structureId" value="<%= structure.getId() %>" />
		</form>
	</div>

  <div class="portal-history-sidebar">
    <div class="list-group">
		  <jalios:include jsp="plugins/SmartPhonePlugin/jsp/portalEditor/doSmartphonePortalHistoryResult.jsp" />
    </div>
  </div>
  <div class="portal-history-preview">
    <iframe id="portalHistoryIframe" src='plugins/SmartPhonePlugin/jsp/index-portal.jsp?portalId=<%= smartphonePortal.getId() %>&amp;structure=<%= structure.getId() %>' height="100%" width="100%" 
            data-jalios-confirm-text='<%= glp("portal.edition.history.back-to-version.confirm")%>'/>
  </div>
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>