<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/tabs/doInitEditTab.jspf' %><%

%>
<jalios:accordion css="edit-profile-accordion" multiOpen="true">
  <%-- Do not set title on accordion-panel to trigger custom panel heading hook --%>
  <jalios:accordion-panel active="true" css="profile-body-block edit-member-profile-information">
    <jalios:buffer name="PANEL_HEADING">
      <jalios:accordion-panel-heading resource="esn.profile.edit.panel-heading" title="ui.adm.mbr-edit.fs.info" />
    </jalios:buffer>
    <%@ include file='/plugins/ESNPlugin/jsp/form/editProfile_info.jspf' %>
    <%= esnEditProfileButtons %>
  </jalios:accordion-panel>
  <jalios:accordion-panel css="profile-body-block edit-member-profile-address">
    <jalios:buffer name="PANEL_HEADING">
      <jalios:accordion-panel-heading resource="esn.profile.edit.panel-heading" title="jcmsplugin.esn.lbl.info" />
    </jalios:buffer>
    <%@ include file='/plugins/ESNPlugin/jsp/form/editProfile_address.jspf' %>
    <%= esnEditProfileButtons %>
  </jalios:accordion-panel>
  <jalios:accordion-panel css="profile-body-block edit-member-profile-presentation">
    <jalios:buffer name="PANEL_HEADING">
      <jalios:accordion-panel-heading resource="esn.profile.edit.panel-heading" title="jcmsplugin.esn.edit-profile.presentation" />
    </jalios:buffer>
    <%@ include file='/plugins/ESNPlugin/jsp/form/editProfile_presentation.jspf' %>
    <%= esnEditProfileButtons %>
  </jalios:accordion-panel>
</jalios:accordion>
