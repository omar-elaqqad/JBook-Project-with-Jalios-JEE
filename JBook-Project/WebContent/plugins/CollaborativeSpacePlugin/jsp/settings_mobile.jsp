<%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneWorkspaceManager.CollaborativeSpaceUsage"%>
<%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneWorkspaceManager"%>
<%@page import="com.jalios.jcmsplugin.smartphone.SmartPhonePortalPolicyFilter"%>
<%@page import="com.jalios.jcmsplugin.collaborativespace.EditCSJMobileSettingsHandler"%>
<%@page import="com.jalios.jcmsplugin.collaborativespace.portal.CSDisplayHandler"%>
<%@ include file="/jcore/doInitPage.jspf" %><%
%><jalios:include jsp="plugins/CollaborativeSpacePlugin/jsp/doCSDisplayHandler.jsp" /><%
%><jalios:include jsp="plugins/CollaborativeSpacePlugin/jsp/settings_mobileHandler.jsp" /><%
%><%
CSDisplayHandler csHandler = (CSDisplayHandler) request.getAttribute("csDisplayHandler");
EditCSJMobileSettingsHandler csMobileSettingsHandler = (EditCSJMobileSettingsHandler) request.getAttribute("csDisplayMobileSettingsHandler");
csMobileSettingsHandler.validate();
%>

<div class="ajax-refresh-div" data-jalios-ajax-refresh-url="plugins/CollaborativeSpacePlugin/jsp/settings_mobile.jsp">
  <form class="jalios-dirty-form-control">
    <% 
    request.setAttribute("field-vertical", true);
    %>
    <div class="mobile-settings">
      <div class="mobile-settings-inputs">
        <jalios:field name="mobileShowIntro" formHandler="<%= csMobileSettingsHandler %>">
          <jalios:control />
        </jalios:field>
        <jalios:field name="mobileShowApplications" formHandler="<%= csMobileSettingsHandler %>">
          <jalios:control />
        </jalios:field>      
        <% if (!csHandler.isJPortalSynchronized()) { %>
          <jalios:include jsp="plugins/CollaborativeSpacePlugin/jsp/settings_mobilePortlets.jsp" />
        <% } else { %>
          <jalios:field name="mobilePortlets" label="types.CollaborativeSpace.fields.mobilePortlets.label">
            <%= glp("jcmsplugin.collaborativespace.lbl.synchronization-on-model") %>
          </jalios:field>
        <% } %>
        <div class="buttons">
          <input type="hidden" name="collaborativeSpaceId" value="<%= csHandler.getCollaborativeSpace().getId() %>" />
          <input type="hidden" name="mobilePortlets" value="" />
          <button class="btn btn-primary" data-jalios-action="ajax-refresh" name="opUpdate" value="true"><%= glp("ui.com.btn.save") %></button>
        </div>
      </div>
      <div class="mobile-preview-wrapper">
        <iframe id="mobile-preview-frame" class="mobile-preview" src="plugins/SmartPhonePlugin/jsp/workspace/workspace-index.jsp?workspaceId=<%= workspace.getId() %>"></iframe>
      </div>
    </div>
  </form>
</div>