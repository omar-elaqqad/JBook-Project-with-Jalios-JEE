<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ page import="com.jalios.jcmsplugin.collaborativespace.*" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf'%><%

if (!isLogged) {
  sendForbidden(request, response); 
  return;
}
String workspaceArchiveMail = workspace.getIncomingAddress(loggedMember);
String localPart = workspace.getIncomingMailLocalPart();
%>
<jalios:modal title="jcmsplugin.collaborativespace.incoming-mail-enabled.modal.title" 
              url="plugins/CollaborativeSpacePlugin/jsp/updateSettings.jsp" 
              css="modal-lg guest-account-creation "
              picture="jcmsplugin-collaborativespace-incoming-mail-settings-update">

  <div class="alert alert-success">
    <%= glp("jcmsplugin.collaborativespace.incoming-mail-enabled.modal.content") %>
  </div>

  <p>
    <jalios:panel>
      <p class="help-block">
        <%= glp("jcmsplugin.collaborativespace.introduction.infos.incoming-mail.your-address") %>&nbsp;<jalios:icon src='jcmsplugin-collaborativespace-incoming-mail' />&nbsp;<a href='mailto:<%= encodeForHTMLAttribute(workspace.getIncomingAddress(loggedMember, true)) %>'><%= encodeForHTML(workspace.getIncomingAddress(loggedMember, false)) %></a>
      </p>
      <p class="help-block">
        <%= glp("jcmsplugin.collaborativespace.introduction.infos.incoming-mail.h") %>&nbsp;<strong>(<%= loggedMember.getFriendlyName() %>)</strong>
      </p>
      <p class="help-block">
        <%= glp("jcmsplugin.collaborativespace.introduction.infos.incoming-mail.warning") %>
      </p>
    </jalios:panel>
  </p>
  
  <p>
    <jalios:icon src='tooltip' />
    <%= glp("jcmsplugin.collaborativespace.incoming-mail-enabled.modal.footer", localPart) %>
  </p>

  <jalios:buffer name='MODAL_BUTTONS'>
    <a href='<%= portalCategory.getDisplayUrl(userLocale) + "?jsp=plugins/CollaborativeSpacePlugin/jsp/settings.jsp#incomingMail" %>' class='btn btn-default'><%= glp("jcmsplugin.collaborativespace.incoming-mail-enabled.modal.edit-button") %></a>
    <button type="submit" class="btn btn-primary" name="opClose" data-dismiss="modal" value="true"><%= glp("ui.com.btn.close") %></button>
  </jalios:buffer>

</jalios:modal>