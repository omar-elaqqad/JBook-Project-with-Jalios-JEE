<%@ include file="/admin/properties/doCommonProp.jspf" %>
<div class="row">
  <div class="col-md-6">
  <fieldset class="col-md-12">
    <legend><% /* %>Misc<% */ %><%= glp("ui.adm.prop.mbr.lgd.misc") %></legend>

    <jalios:field label="ui.adm.prop.mbr.def-grp" name='channel_default_group' value='<%= formHandler.getChannel_default_group() %>' disabled='<%= formHandler.isDisabled("channel.default-group") %>'>
      <jalios:control type="<%= ControlType.GROUP %>" />
    </jalios:field>

    <jalios:field label="ui.adm.prop.mbr.def-adm" name='channel_default_admin' value='<%= formHandler.getChannel_default_admin() %>' disabled='<%= formHandler.isDisabled("channel.default-admin") %>' css='jstoreOnly adminOnly'>
      <jalios:control settings="<%= new MemberSettings().filter(MemberSettings.MemberFilter.ACCOUNT) %>" />
    </jalios:field>

    <jalios:field label="ui.adm.prop.wkspc.defwkspc" name='channel_default_workspace' value='<%= formHandler.getChannel_default_workspace() %>' disabled='<%= formHandler.isDisabled("channel.default-workspace") %>'>
      <jalios:control type="<%= ControlType.WORKSPACE %>" />
    </jalios:field>

    <jalios:field label="ui.adm.prop.mbr.def-author" name='channel_default_author' value='<%= formHandler.getChannel_default_author() %>' disabled='<%= formHandler.isDisabled("channel.default-author") %>'>
      <jalios:control settings="<%= new MemberSettings().filter(MemberSettings.MemberFilter.ACCOUNT) %>" />
    </jalios:field>

    <jalios:field label="ui.adm.prop.mbr.organization-root-grp" name='channel_organization_root_group' value='<%= formHandler.getChannel_organization_root_group() %>' disabled='<%= formHandler.isDisabled("channel_organization_root_group") %>'>
      <jalios:control settings="<%= new GroupSettings() %>" />
    </jalios:field>

  </fieldset>

  <fieldset class="col-md-12">
    <legend><% /* %>User profile<% */ %><%= glp("ui.adm.prop.mbr.lgd.userprofile") %></legend>

    <jalios:field label="ui.adm.prop.adv.notif" name='notification_enabled' tooltip="ui.adm.prop.adv.notif.h" value='<%= Util.toBoolean(formHandler.getNotification_enabled(),false) %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>

    <jalios:field label="ui.adm.prop.mbr.photo" name='member_photo_upload' tooltip="ui.adm.prop.mbr.photo.h" value='<%= Util.toBoolean(formHandler.getMember_photo_upload(),false) %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>

    <jalios:field label="ui.adm.prop.mbr.emailvisible" name='member_email_visible' tooltip="ui.adm.prop.mbr.emailvisible.h" value='<%= Util.toBoolean(formHandler.getMember_email_visible(),false) %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>

    <jalios:field label="ui.adm.prop.mbr.statusvisible" name='member_status_visible' tooltip="ui.adm.prop.mbr.statusvisible.h" value='<%= Util.toBoolean(formHandler.getMember_status_visible(),false) %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>

  </fieldset>

</div><div class="col-md-6">

  <%-- --- DEV ADMIN ------------------------------ --%>
  <fieldset class="col-md-12">
    <legend class='formLabel'><% /* %>Dev Admin<% */ %><%= glp("ui.adm.prop.mbr.lgd.devadmin") %></legend>

    <jalios:field label="ui.com.lbl.enabled" name='channel_devadmin_enabled' value='<%= Util.toBoolean(formHandler.getChannel_devadmin_enabled(),false) %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>

    <jalios:field label="ui.adm.prop.mbr.devadmin" name='channel_devadmin' value='<%= formHandler.getChannel_devadmin() %>' disabled='<%= formHandler.isDisabled("channel.devadmin.enabled") %>'>
      <jalios:control settings="<%= new MemberSettings().filter(MemberSettings.MemberFilter.ACCOUNT) %>" />
    </jalios:field>

  </fieldset>

  <%-- --- READER TRACKER ------------------------------ --%>
  <fieldset class="col-md-12">
    <legend class='formLabel'><% /* %>Reader Tracker<% */ %><%= glp("ui.adm.prop.tab.readertracker") %></legend>
    
    <jalios:field label="ui.adm.prop.readertracker_types" name="readertracker_types" tooltip="ui.adm.prop.readertracker_types.h" value='<%= formHandler.getReadertracker_types() %>' disabled='<%= formHandler.isDisabled("readertracker.types") %>'>
      <jalios:control settings='<%= new TypeSettings().uniqueValue(" ").superType(Content.class, UserContent.class).acceptSuperType().multiple() %>' />
    </jalios:field>
    
    <jalios:field label="ui.adm.prop.readertracker_enabled" name='readertracker_enabled' value='<%= Util.toBoolean(formHandler.getReadertracker_enabled(),false) %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>
    
    <jalios:field label="ui.adm.prop.readertracker_anonymize_enabled" name='readertracker_anonymize_enabled' value='<%= Util.toBoolean(formHandler.getReadertracker_anonymize_enabled(),false) %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>
  </fieldset>

  <%-- --- AUDIENCE RIGHTS (Publication Read Rights) ------------------------------ --%>
  <fieldset class="col-md-12">
    <legend class='formLabel'><% /* %>Publication Read Rights Axes (Audience Rights)<% */ %><%= glp("ui.adm.prop.mbr.pub-read-r.title") %></legend>
    <p><% /* %>Help/Intro Text<% */ %><%= glp("ui.adm.prop.mbr.pub-read-r.intro") %></p>

    <jalios:field label="ui.com.lbl.enabled" name='audience_rights_enabled' value='<%= Util.toBoolean(formHandler.getAudience_rights_enabled(),false) %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>

    <jalios:field label="ui.adm.prop.mbr.pub-read-r.cat-axes" name='audience_rights_axes' value='<%= formHandler.getAudience_rights_axes() %>' disabled='<%= formHandler.isDisabled("audience-rigths.axes") %>'>
     <jalios:control settings='<%= new CategorySettings().tree().multiple().filter(CategoryFilter.READ) %>' />
    </jalios:field>
  </fieldset>

  </div>
</div>