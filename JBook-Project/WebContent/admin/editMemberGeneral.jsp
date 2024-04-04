<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ page import="com.jalios.jcms.authentication.handlers.DelegationAuthenticationHandler" %><%
%><%@page import="com.jalios.jcms.handler.EditMemberPhotoHandler"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

com.jalios.jcms.handler.EditMemberHandler formHandler = (com.jalios.jcms.handler.EditMemberHandler)request.getAttribute("EditMemberHandler");
Member member = formHandler.getMember();
boolean isLdapAccount = member != null && member.isLdapAccount() && channel.isLdapEnabled();
boolean isDBAccount = member instanceof DBMember || getBooleanParameter("db", false);
final String MBR_ACL_RESOURCE = isDBAccount ? "admin/users/dbmember" : "admin/users/member";
EditMemberExtensionHandler extFormHandler = (EditMemberExtensionHandler)request.getAttribute("extFormHandler");
boolean canUploadPhoto = member != null && EditMemberPhotoHandler.canEdit(loggedMember, member, workspace);
BasicSettings nameControlSettings = new TextFieldSettings();
if (member == null) {
  nameControlSettings.autofocus();
}
%>

<jalios:include target="EDIT_MBR_MAINTAB_HEADER" />
<div class='row'>
  <div class='col-md-6'>
    
  <fieldset>
    <legend><%= glp("ui.adm.mbr-edit.fs.info") %></legend>
    
    <jalios:field label="ui.adm.mbr-edit.lbl.name" name='name' value='<%= formHandler.getAvailableName() %>' required='<%= true %>'>
      <jalios:control settings="<%= nameControlSettings %>" />
    </jalios:field>
    
    <jalios:field label="ui.adm.mbr-edit.lbl.f-name" name='firstName' value='<%= formHandler.getAvailableFirstName() %>' >
      <jalios:control type="<%= ControlType.TEXTFIELD %>" />
    </jalios:field>
    
      <% 
        String[] salutValues = Util.split(channel.getProperty("ui.member.salutations", ""), " ");
        if (Util.notEmpty(salutValues)) {
          String[] salutLabels = new String[salutValues.length];
          int i = 0;
          for (String salut : salutValues){
            salutLabels[i++] = glp("ui.com.lbl.salut." + salut);
          }
      %>
    <jalios:field label="ui.adm.mbr-edit.lbl.salut" name='salutation' value='<%= formHandler.getAvailableSalutation() %>' >
      <jalios:control settings='<%= new EnumerateSettings().select().enumValues(salutValues).enumLabels(salutLabels) %>' />
    </jalios:field>
    <%  } %>
    
    <jalios:field label="ui.adm.mbr-edit.lbl.mail" name='email' value='<%= formHandler.getAvailableEmail() %>' >
      <jalios:control type="<%= ControlType.EMAIL %>" />
    </jalios:field>
    
    <jalios:field label="ui.adm.mbr-edit.lbl.phone" name='phone' value='<%= formHandler.getAvailablePhone() %>' >
      <jalios:control type="<%= ControlType.TEXTFIELD %>" />
    </jalios:field>    
    
    <jalios:field label="ui.adm.mbr-edit.lbl.mobile" name='mobile' value='<%= formHandler.getAvailableMobile() %>' >
      <jalios:control type="<%= ControlType.TEXTFIELD %>" />
    </jalios:field>
    
    <jalios:field label="ui.adm.mbr-edit.lbl.street" name='street' value='<%= formHandler.getAvailableStreet() %>' >
      <jalios:control type="<%= ControlType.TEXTAREA %>" />
    </jalios:field>    
    <jalios:field label="ui.adm.mbr-edit.lbl.postalCode" name='postalCode' value='<%= formHandler.getAvailablePostalCode() %>' >
      <jalios:control type="<%= ControlType.TEXTFIELD %>" />
    </jalios:field>
    <jalios:field label="ui.adm.mbr-edit.lbl.poBox" name='poBox' value='<%= formHandler.getAvailablePoBox() %>' >
      <jalios:control type="<%= ControlType.TEXTFIELD %>" />
    </jalios:field>
    <jalios:field label="ui.adm.mbr-edit.lbl.locality" name='locality' value='<%= formHandler.getAvailableLocality() %>' >
      <jalios:control type="<%= ControlType.TEXTFIELD %>" />
    </jalios:field>
    <jalios:field label="ui.adm.mbr-edit.lbl.region" name='region' value='<%= formHandler.getAvailableRegion() %>' >
      <jalios:control type="<%= ControlType.TEXTFIELD %>" />
    </jalios:field>
    <jalios:field label="ui.com.lbl.country" name="country"  value='<%= formHandler.getAvailableCountry() %>'>
      <jalios:control type="<%= ControlType.COUNTRY %>" />
    </jalios:field>
    
    <% if (channel.getBooleanProperty("member.edit.show-address", true)) { %> 
    <jalios:field label="ui.adm.mbr-edit.lbl.addr" name='address' value='<%= formHandler.getAvailableAddress() %>' >
      <jalios:control type="<%= ControlType.TEXTAREA %>" />
    </jalios:field>
    <% } %>
    
    <% if (!isDBAccount) { %>
    <jalios:field label="ui.adm.mbr-edit.lbl.info" name='info' value='<%= formHandler.getAvailableInfo() %>' >
      <jalios:control type="<%= ControlType.TEXTAREA %>" />
    </jalios:field>
    <% } %>
    
    <% if (member != null) { %>
      <% if (canUploadPhoto) { %>
        <jalios:field label="ui.adm.mbr-edit.lbl.photo" name='photo'>
          <a class="modal btn btn-default" onclick="return false;" href="front/memberPhoto/editPhoto.jsp?mbrId=<%= member.getId() %>"><%= glp("ui.member-editor.change-photo") %></a>
        </jalios:field>
      <% } %>
      <jalios:field label="&nbsp;" name="photo">    
        <jalios:memberphoto size="<%= PhotoSize.SMALL %>" css="pull-left" link="false" member="<%= member %>"/>        
        <%= glp("ui.adm.mbr-edit.lbl.photo.h") %>
        <% if (member.hasPhoto()){ %>
          <jalios:field name='removePhoto'>
            <jalios:control settings='<%= new EnumerateSettings().checkbox().enumValues("true").enumLabels("ui.adm.mbr-edit.lbl.no-photo") %>' />
          </jalios:field>
        <% } %>
      </jalios:field>
    <% } %>
    
    <% if (!isDBAccount) { %>
      <%@ include file="/types/MemberExtension/doEditMemberExtension.jspf" %>
    <% } %>
  </fieldset>
  
  
  <fieldset>
    <legend><%= glp("ui.adm.mbr-edit.lbl.organization") %></legend>
    
    <jalios:field label="ui.adm.mbr-edit.lbl.organization" name='organization' value='<%= formHandler.getAvailableOrganization() %>' >
      <jalios:control type="<%= ControlType.TEXTFIELD %>" />
    </jalios:field>
    
    <jalios:field label="ui.adm.mbr-edit.lbl.department" name='department' value='<%= formHandler.getAvailableDepartment() %>' >
      <jalios:control type="<%= ControlType.TEXTFIELD %>" />
    </jalios:field>
    
    <jalios:field label="ui.adm.mbr-edit.lbl.job" name='jobTitle' value='<%= formHandler.getAvailableJobTitle() %>' >
      <jalios:control type="<%= ControlType.TEXTFIELD %>" />
    </jalios:field>
    
    <%-- DeclaredManager ------------------------------------------------------------ --%>
    <% if (formHandler.showDeclaredManager()) { %>
    <%
    Member currentManager = member == null ? null : member.getManager();
    String managerDescription = currentManager == null ? null : glp("ui.adm.mbr-edit.txt.declared-manager", currentManager.getDisplayLink(userLocale)); 
    %>
    <jalios:field name='declaredManager' label='ui.com.lbl.manager' description="<%= managerDescription %>" value='<%= formHandler.getAvailableDeclaredManager() %>'>
      <jalios:control settings='<%= new MemberSettings().filter(MemberSettings.MemberFilter.ACCOUNT) %>' />
    </jalios:field>
    <% } %>

    <%-- Assistant ------------------------------------------------------------ --%>
    <% if (formHandler.showAssistant()) { %>
    <%
    Member currentAssistant = member == null ? null : member.getAssistant();
    String assistantDescription = currentAssistant == null ? null : glp("ui.adm.mbr-edit.txt.assistant", currentAssistant.getDisplayLink(userLocale)); 
    %>
    <jalios:field name='assistant' label='ui.com.lbl.assistant' description="<%= assistantDescription %>" value='<%= formHandler.getAvailableAssistant() %>'>
      <jalios:control settings='<%= new MemberSettings().filter(MemberSettings.MemberFilter.ACCOUNT) %>' />
    </jalios:field>
    <% } %>
  </fieldset>    
  
    
    <%-- EXTRA DATA INFO ----------------------------------------- --%>
    <jalios:buffer name="extraDataFieldSet">
      <% request.setAttribute("extraDataFieldSet","true"); %>
      <jalios:include jsp="/jcore/doEditExtraData.jsp" />
  
      <jalios:include target="EDIT_MBR_MAINTAB_FOOTER" />
    </jalios:buffer>
   <% if (Util.notEmpty(extraDataFieldSet)) { %>
    <fieldset>
      <legend><%= glp("ui.extra-data.edit.lbl.edit") %></legend>
      <%= extraDataFieldSet %>          
    </fieldset> 
   <% } %>
    
  </div>
  
  <div class='col-md-6'>
          
  <% String accountClass = "account" + (formHandler.getAvailableUsage() == 1 ? " hide" : ""); %>
  <% if (member == null || checkAccess(MBR_ACL_RESOURCE)) { %>  
  <fieldset>
    <legend><%= glp("ui.adm.mbr-edit.fs.account") %></legend>
    
    <jalios:field label='ui.adm.mbr-edit.lbl.usage' required="true" name='usage' tooltip="ui.adm.mbr-edit.lbl.usage.h" value="<%= formHandler.getAvailableUsage() %>">
      <jalios:control settings='<%= new EnumerateSettings()
                                          .select()
                                          .enumValues("0", "1")
                                          .enumLabels("ui.adm.mbr-edit.usage.0", "ui.adm.mbr-edit.usage.1")
                                          .dataAttribute("jalios-action", "toggle:hide")
                                          .dataAttribute("jalios-target", ".account") %>' />
    </jalios:field>
  
    <jalios:field label="ui.adm.mbr-edit.lbl.login" name='login' value='<%= formHandler.getAvailableLogin() %>' css='<%= accountClass %>' tooltip="ui.adm.mbr-edit.txt.login" required='<%= true %>'>
      <% String htmlAttributes = "autocomplete=\"off\""; %>
      <jalios:control settings='<%= new TextFieldSettings().htmlAttributes(htmlAttributes) %>'>
        <% if (isLdapAccount) { %>
        <jalios:buffer name="APPEND"><jalios:tooltip sprite="ss_error" property="ui.adm.mbr-edit.txt.login-ldap" /></jalios:buffer>
        <% } %>
      </jalios:control>
    </jalios:field>
    
    <% String localPasswordsClass = accountClass  + " local-passwords " + formHandler.getAvailableAuthType(); %>
    <jalios:field label='ui.adm.mbr-edit.lbl.auth-type' required="true" name='authType' css='<%= accountClass %>' tooltip="ui.adm.mbr-edit.lbl.auth-type.h" value="<%= formHandler.getAvailableAuthType() %>">
      <jalios:control settings='<%= new EnumerateSettings()
                                          .select()
                                          .enumValues("ALL", "EXTERNAL", "DISABLED")
                                          .enumLabels("ui.adm.mbr-edit.lbl.auth-type.ALL", "ui.adm.mbr-edit.lbl.auth-type.EXTERNAL", "ui.adm.mbr-edit.lbl.auth-type.DISABLED")
                                          .dataAttribute("jalios-action", "sync:value")
                                          .dataAttribute("jalios-target", ".local-passwords")
                                          .dataAttribute("jalios-target-attribute", "class") %>'/>
      <jalios:buffer name="WIDGET_APPEND">
        <div class="<%= localPasswordsClass %>">
          <p class="help-block ALL"><%= glp("ui.adm.mbr-edit.lbl.auth-type.ALL.h") %></p>
          <p class="help-block EXTERNAL"><%= glp("ui.adm.mbr-edit.lbl.auth-type.EXTERNAL.h") %></p>
          <p class="help-block DISABLED"><%= glp("ui.adm.mbr-edit.lbl.auth-type.DISABLED.h") %></p>        
        </div>
      </jalios:buffer>
    </jalios:field>

    <div class="<%= localPasswordsClass %>">
    
      <%-- OLD PASSWORD: ONLY IF ADMIN IS EDITING HIS/HER OWN PROFILE -------------------------------------------------------- --%>
      <% if (checkAccess(MBR_ACL_RESOURCE) && loggedMember.equals(member)) { %>
      <jalios:field label="ui.adm.mbr-edit.lbl.oldpwd" name='password0' css='<%= accountClass %>'>
        <jalios:control type="<%= ControlType.PASSWORD %>" />
      </jalios:field>
      <% } %>
      
      <% String passDesc = formHandler.getMember() == null ? "ui.adm.mbr-edit.txt.pwd1" : "ui.adm.mbr-edit.txt.pwd2"; %>
      <% String passwordFieldCss = accountClass + " password-double-input"; %>
      <jalios:field label="ui.adm.mbr-edit.lbl.pwd" name='password1' tooltip="<%= passDesc %>" css='<%= passwordFieldCss %>' required="true">
        <div class="input-group">
          <jalios:control settings='<%= new PasswordSettings().autocomplete("new-password").placeholder("ui.adm.mbr-edit.lbl.pwd") %>' />
        </div>
        <div class="input-group">
          <jalios:control settings='<%= new PasswordSettings().autocomplete("new-password").name("password2").placeholder("ui.adm.mbr-edit.lbl.pwd-confirm") %>' />
        </div>
      </jalios:field>
      
    </div>

  </fieldset>
  <% } %>

  <fieldset>
    <legend><%= glp("ui.adm.mbr-edit.fs.options") %></legend>
    
    <div class='<%= accountClass %>'>
    <%-- IMPORTANT : Admin status modification requires TRUE ADMIN ACCESS --%>
    <% if (!isDBAccount && isAdmin) { %>
        <jalios:field label="ui.adm.mbr-edit.lbl.admin" name='admin' value='<%= formHandler.getAvailableAdmin() %>' >
          <jalios:control type="<%= ControlType.BOOLEAN %>" />
        </jalios:field>
    <% } %>
    
    <jalios:field label="ui.adm.mbr-edit.lbl.mail-vis" name='emailVisible' value='<%= formHandler.getAvailableEmailVisible() %>' >
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>
    

    <% if (channel.isWebdavEnabled() && !isDBAccount) { %>
      <jalios:field label="ui.com.lbl.webdav-access" name='webdavAccess' value='<%= formHandler.getAvailableWebdavAccess() %>' >
        <jalios:control type="<%= ControlType.BOOLEAN %>" />
      </jalios:field>
    <% } %>
    
    <% if (channel.isLdapEnabled()) { %>
      <jalios:field label="ui.com.lbl.ldap-sync" name='ldapSync' value='<%= formHandler.getAvailableLdapSync() %>' >
        <jalios:control type="<%= ControlType.BOOLEAN %>" />
      </jalios:field>
    <% } %>
    </div>
         
    <% if (channel.isMultilingual()) { %>
      <jalios:field label="ui.com.lbl.language" name='language' value='<%= formHandler.getAvailableLanguage() %>' >
        <jalios:foreach collection='<%= channel.getLanguageList() %>' name='itLang' type='String'>
            <jalios:control settings='<%= new EnumerateSettings().enumValues(itLang).enumLabels("lang." + itLang) %>'>
              <jalios:buffer name="PREPEND"><jalios:lang lang='<%= itLang %>'/></jalios:buffer>        
            </jalios:control>
        </jalios:foreach>
      </jalios:field>
    <% } %>
    
    <% if (channel.isTimeZoneEnabled()) { %>
      <jalios:field label="ui.com.lbl.timezone" name='zoneId' value='<%= formHandler.getAvailableZoneId() %>' >
        <jalios:control type="<%= ControlType.TIMEZONE %>" />
      </jalios:field>
    <% } %>
      
  </fieldset>

  <%-- Delegate members -------------------------------------------------------- --%>
  <% if (formHandler.showDelegateMemberSet()) { %><%-- JCMS-7445 --%>
  <fieldset class='<%= accountClass %>'>
    <legend class='formLabel'><%= glp("ui.adm.mbr-edit.delegation") %></legend>
    <jalios:field label="ui.adm.mbr-edit.delegation" name="delegateMbrIds"  value='<%= formHandler.getAvailableDelegateMemberSet() %>' description='<%= glp("ui.adm.mbr-edit.del.delegates", loggedMember == member ? 0 : 1) %>' mv="1">
      <jalios:control settings="<%= new MemberSettings().filter(MemberSettings.MemberFilter.ACCOUNT) %>" />
    </jalios:field>
  </fieldset>
  <% } %>
  </div>
</div>
