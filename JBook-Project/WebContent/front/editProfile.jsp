<%--
  @Summary: Member profile edit form
  @Category: Authentication
  @Deprecated: False
  @Customizable: False
  @Requestable: True
--%><%@ page import="com.jalios.jcms.authentication.handlers.DelegationAuthenticationHandler" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%if (!isLogged) { 
  sendForbidden(request, response);
  return;
}

Member member = loggedMember;
boolean isLdapAccount = member != null && member.isLdapAccount() && channel.isLdapEnabled();
boolean isExternalAuthentication = member != null && member.isExternalAuthentication();
boolean isDBAccount = member instanceof DBMember;

boolean emptyHeader = getBooleanParameter("emptyheader", false);
String redirect = ServletUtil.getBaseUrl(request) + "front/memberProfile.jsp";
if (emptyHeader) {
  redirect = redirect + "?emptyheader=true";
}%><jsp:useBean id="extFormHandler" scope="page" class="generated.EditMemberExtensionHandler"><%
  %><jsp:setProperty name="extFormHandler" property="request" value="<%= request %>"/><%
  %><jsp:setProperty name="extFormHandler" property="response" value="<%= response %>"/><%
  %><jsp:setProperty name="extFormHandler" property="id" value="<%= loggedMember.getId() %>"/><%
  %><jsp:setProperty name="extFormHandler" property="*" /><%
%></jsp:useBean><%
%><jsp:useBean id="alertSettingsHandler" scope="page" class="com.jalios.jcms.alert.MemberAlertSettingsHandler"><%
  %><jsp:setProperty name="alertSettingsHandler" property="request" value="<%= request %>"/><%
  %><jsp:setProperty name="alertSettingsHandler" property="response" value="<%= response %>"/><%
  %><jsp:setProperty name="alertSettingsHandler" property="*" /><%
  %><jsp:setProperty name="alertSettingsHandler" property="member" value='<%= member %>'/><%
%></jsp:useBean><%
%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.handler.EditMemberHandler"><%
  %><jsp:setProperty name="formHandler" property="request" value="<%= request %>"/><%
  %><jsp:setProperty name="formHandler" property="response" value="<%= response %>"/><%
  %><jsp:setProperty name="formHandler" property="extFormHandler" value="<%= extFormHandler %>"/><%
  %><jsp:setProperty name="formHandler" property="memberAlertSettingsFormHandler" value="<%= alertSettingsHandler %>"/><%
  %><jsp:setProperty name="formHandler" property="id" value="<%= loggedMember.getId() %>"/><%
  %><jsp:setProperty name="formHandler" property="*" /><%
  %><jsp:setProperty name="formHandler" property="profileEditor" value="<%= true %>"/><%
%></jsp:useBean><%

if (formHandler.validate()) {
  return;
}
request.setAttribute("title", glp("ui.work.prof.title", member)); 
request.setAttribute("profileWAMenu", "true");
request.setAttribute("formHandler", formHandler);
request.setAttribute("extFormHandler", extFormHandler);
request.setAttribute("classBeingProcessed", isDBAccount ? DBMember.class : Member.class);

if (channel.getBooleanProperty("js.member.edit.auto-convert-address", false)) {
  jcmsContext.addJavaScript(channel.getProperty("google-js.maps"));
  jcmsContext.addJavaScript("js/jalios/ux/jalios-member-edit.js");
}

if (emptyHeader) {
  %><%@ include file='/jcore/doEmptyHeader.jspf' %><%
  %><div class="WorkArea front-memberProfile"><%
} else { 
  %><%@ include file='/work/doWorkHeader.jspf' %><%
}
%>
<div class="page-header">
  <h1<%= isDBAccount ? " class=\"DBMember\"" : "" %>><% /* %>Profile of ...<% */ %><%=glp("ui.work.prof.title",member.getFullName())%></h1>
</div>

<%@ include file='/jcore/doMessageBox.jspf' %>
<form action="<%= channel.getSecuredBaseUrl(request) %>front/editProfile.jsp" class="form-horizontal" method="post" name="editForm" enctype="multipart/form-data">
<jalios:buffer name="buttonsBuffer" >
 <% if (emptyHeader) { %>
<input type="submit" name="opUpdateProfile" value='<%=glp("ui.com.btn.save")%>' class='btn btn-primary' />
<input type="button" class='btn btn-default' value='<%=glp("ui.com.btn.cancel")%>' onclick='document.location="<%= contextPath %>/front/memberProfile.jsp<%= emptyHeader ? "?emptyheader=true" : "" %>"' />
 <% } %>
</jalios:buffer>
<%= buttonsBuffer %>

  <%
    boolean tabAlert     = true;
    boolean tabNotif     = channel.isNotificationEnabled() && !isDBAccount;
  %>
  <ul class="nav nav-tabs br">
              <li class="active"><a href="#editProfile_gen" onclick="return false;"><%= glp("ui.com.tab.general") %></a></li>
    <% if (tabAlert)     { %><li><a href="#editProfile_alert" onclick="return false;"><%= glp("alert.rule-editor.lbl.title") %></a></li><% } %>
    <% if (tabNotif)     { %><li><a href="#editProfile_notif" onclick="return false;"><%= glp("ui.fo.notification.notification") %></a></li><% } %>
  </ul>
  
<div class="tab-content responsive" id="editProfile-tab">

  <%-- *** GENERAL ******************************************* --%>
  <div class="tab-pane fade in active" id="editProfile_gen">
    <jalios:include target="EDIT_MBR_MAINTAB_HEADER" />
    <div class='row'>
          <% if (isLdapAccount) { %>
           <% /* %>LDAP Field<% */ %><%=glp("ui.work.prof.ldap-field")%>
          <% } %>
    </div>
    
    <div class='row'>
     <div class='col-md-6'>
          <fieldset>
          <legend class='formLabel'><jalios:icon src='ldap'  /> <%= glp("ui.adm.mbr-edit.fs.info") %> <% if (isLdapAccount) { %> (LDAP)<%}%></legend>

               <%-- SALUTATION ------------------------------------------------------- --%> 
                  <% boolean isSalutLDAP = isLdapAccount && Util.notEmpty(channel.getProperty("ldap.mapping.salut")); %>
                  <% 
                    String[] salutValues = Util.split(channel.getProperty("ui.member.salutations", ""), " ");
                    if (Util.notEmpty(salutValues)) {
                      String[] salutLabels = new String[salutValues.length];
                      int i = 0;
                      for (String salut : salutValues){
                        salutLabels[i++] = glp("ui.com.lbl.salut." + salut);
                      }
                  %>
                 <jalios:field  name='<%= "salutation" %>' label='<%= glp("ui.adm.mbr-edit.lbl.salut") %>' required='<%= false %>' value='<%= formHandler.getAvailableSalutation() %>'>
                  <% if (!isSalutLDAP){ %>
                    <jalios:control settings='<%= new EnumerateSettings().select().enumValues(salutValues).enumLabels(salutLabels) %>' />
                   <% } else { %>
                    <jalios:tooltip property="ui.com.txt.mandatory-field" icon="mandatory"/>
                    <%= encodeForHTML(formHandler.getAvailableSalutation()) %>
                   <% } %>
                 </jalios:field>
                 <% } %>
                 
              <%
               Object[][] fieldsInfo = {
                 /*             input name,       widget type,                     LDAP mapping,     label,           required, value                                    */             
                 new Object[] { "name",           ControlType.TEXTFIELD,   "name",           "name",          true,    formHandler.getAvailableName(),         },
                 new Object[] { "firstName",      ControlType.TEXTFIELD,   "f-name",         "f-name",        false,   formHandler.getAvailableFirstName(),    },
                 new Object[] { "organization",   ControlType.TEXTFIELD,   "organization",   "organization",  false,   formHandler.getAvailableOrganization(), },
                 new Object[] { "department",     ControlType.TEXTFIELD,   "department",     "department",    false,   formHandler.getAvailableDepartment(),   },
                 new Object[] { "jobTitle",       ControlType.TEXTFIELD,   "job",            "job",           false,   formHandler.getAvailableJobTitle(),     },
                 new Object[] { "email",          ControlType.EMAIL,       "mail",           "mail",          false,   formHandler.getAvailableEmail(),        },
                 new Object[] { "phone",          ControlType.TEXTFIELD,   "phone",          "phone",         false,   formHandler.getAvailablePhone(),        },
                 new Object[] { "mobile",         ControlType.TEXTFIELD,   "mobile",         "mobile",        false,   formHandler.getAvailableMobile(),       },
                 new Object[] { "street",         ControlType.TEXTAREA,    "street",         "street",        false,   formHandler.getAvailableStreet(),       },
                 new Object[] { "postalCode",     ControlType.TEXTFIELD,   "postalCode",     "postalCode",    false,   formHandler.getAvailablePostalCode(),   },
                 new Object[] { "poBox",          ControlType.TEXTFIELD,   "postOfficeBox",  "poBox",         false,   formHandler.getAvailablePoBox(),        },
                 new Object[] { "region",         ControlType.TEXTFIELD,   "region",         "region",        false,   formHandler.getAvailableRegion(),       },
                 new Object[] { "locality",       ControlType.TEXTFIELD,   "locality",       "locality",      false,   formHandler.getAvailableLocality(),     }, 
               };
              
               for (int fieldIdx = 0; fieldIdx < fieldsInfo.length; fieldIdx++) {
                  String curFieldName = (String) fieldsInfo[fieldIdx][0];
                  ControlType curFieldType = (ControlType) fieldsInfo[fieldIdx][1];
                  
                  String curFieldLdapMapping = "ldap.mapping." + ((String) fieldsInfo[fieldIdx][2]);
                  boolean isLDAPField = isLdapAccount && Util.notEmpty(channel.getProperty(curFieldLdapMapping, ""));
                  
                  String curFieldLabel = glp("ui.adm.mbr-edit.lbl." + ((String) fieldsInfo[fieldIdx][3]));
                  boolean curFieldRequired = Util.toBoolean(fieldsInfo[fieldIdx][4], false);
                  String  curFieldValue = (String) fieldsInfo[fieldIdx][5];
                  
                  String curFieldAllowedChanged = "member.rights.allow-" + ((String) fieldsInfo[fieldIdx][2]) + "-change";  
                  boolean curFieldDisabled = !channel.getBooleanProperty(curFieldAllowedChanged, true);
              %>
                 <jalios:field  name='<%= curFieldName %>' label='<%= curFieldLabel %>'                                 
                                value='<%= curFieldValue %>' required='<%= curFieldRequired %>' disabled='<%= curFieldDisabled %>'>
                  <% if (!isLDAPField) { %>
                      <jalios:control type="<%= curFieldType %>" />
                  <% } else { %>
                    <% if (curFieldRequired) { %>
                    <jalios:tooltip property="ui.com.txt.mandatory-field" icon="mandatory" />
                    <% } %>
                    <%= encodeForHTML(curFieldValue) %>
                  <% } %>
                 </jalios:field>
              <%
                }
              %>
              
              <%-- COUNTRY ------------------------------------------------------- --%> 
              <jalios:field label="ui.com.lbl.country" name="country"  value='<%= Util.getString(formHandler.getAvailableCountry(), channel.getCountry()) %>'>
                <% boolean isCountryLDAP = isLdapAccount && Util.notEmpty(channel.getProperty("ldap.mapping.country", "")); %>
                <% if (!isCountryLDAP) { %>
                  <jalios:control type="<%= ControlType.COUNTRY %>" />
                <% } else { %>
                  <% final String country = Util.getString(formHandler.getAvailableCountry(), channel.getCountry()); %>
                  <jalios:country country='<%= country %>'/> <%= glp("country." + country) %>
                <% } %>
              </jalios:field>

              <%-- ADDRESS ------------------------------------------------------- --%>
              <% if (channel.getBooleanProperty("member.edit.show-address", true)) { %> 
	             <jalios:field  name='<%= "address" %>' label='<%= glp("ui.adm.mbr-edit.lbl.addr") %>' required='<%= false %>' value='<%= formHandler.getAvailableAddress() %>'>
                 <% boolean isAddressLDAP = isLdapAccount && Util.notEmpty(channel.getProperty("ldap.mapping.address", "")); %>
                 <% if (!isAddressLDAP) { %>
                  <jalios:control settings='<%= new TextAreaSettings().rows(4) %>' />
                 <% } else { %>
                   <jalios:tooltip property="ui.com.txt.mandatory-field" icon="mandatory" />
                   <%= encodeForHTML(formHandler.getAvailableAddress()) %>
                 <% } %>
               </jalios:field>
              <% } %>
              

              <%-- INFORMATIONS ------------------------------------------------------------ --%> 
              <% if (!isDBAccount) { %>
                 <jalios:field  name='<%= "info" %>' label='<%= glp("ui.adm.mbr-edit.lbl.info") %>' required='<%= false %>' value='<%= formHandler.getAvailableInfo() %>'>
                  <% boolean isInfoLDAP = isLdapAccount && Util.notEmpty(channel.getProperty("ldap.mapping.info", "")); %>
                  <% if (!isInfoLDAP) { %>
                    <jalios:control settings='<%= new TextAreaSettings().rows(4) %>' />
                  <% } else { %>
                    <jalios:tooltip property="ui.com.txt.mandatory-field" icon="mandatory"/>
                    <%= encodeForHTML(formHandler.getAvailableInfo()) %>
                  <% } %>
                 </jalios:field>                
              <% } %>
              
				      <%-- PHOTO ------------------------------------------------------------ --%> 
  <% if (member.canUploadPhoto()) { %>
    <jalios:field name="photo" label="ui.adm.mbr-edit.lbl.photo">
      <div class="media">
        <% if (member.hasPhoto()) { %>
          <jalios:memberphoto css="pull-left" member="<%= member %>" size="<%= PhotoSize.SMALL %>" />
        <% } %>
        <div class="media-body">
          <a class="modal btn btn-default" href="front/memberPhoto/editPhoto.jsp?mbrId=<%= member.getId() %>"><%= glp("ui.member-editor.change-photo") %></a>
          <% if (member.hasPhoto()) { %>
            <jalios:control settings='<%= new EnumerateSettings().name("removePhoto")
                                                .checkbox()
                                                .enumLabels("ui.adm.mbr-edit.lbl.no-photo").enumValues("true") %>' />
          <% } %>
        </div>
      </div>
    </jalios:field>                  
   <% } %>       
               
				      
				      <%-- DATA EXTENSION ----------------------------------------- --%>
              <% if (!isDBAccount) { %>
				      <jalios:buffer name="memberExtensionbuffer"><%@ include file="/types/MemberExtension/doEditMemberExtension.jspf" %></jalios:buffer>
				      <% if (Util.notEmpty(memberExtensionbuffer.toString().trim())) { %>
				      <table class='layout'><%= memberExtensionbuffer.toString() %></table>
				      <% } %>
              <% } %>
                    
          </fieldset>
          

          <%-- EXTRA DATA INFO ----------------------------------------- --%>
          <div>
            <% request.setAttribute("extraDataFieldSet","true"); %>
            <jalios:include jsp="/jcore/doEditExtraData.jsp" />
          </div>
        
          <jalios:include target="EDIT_MBR_MAINTAB_FOOTER" />
      </div>
      
      <div class='col-md-6'>
      
          <fieldset>
            <legend class='formLabel'>
              <jalios:icon src='login'  />
              <%= glp("ui.adm.mbr-edit.fs.account") %>
            </legend>
            
            <%-- LOGIN ------------------------------------------------------------ --%> 
            <%
             final boolean loginModificationDisabled =
               (isLdapAccount && !channel.getBooleanProperty("ldap.authorize-ldap-field-modification", false)) ||
               (isExternalAuthentication && !channel.getBooleanProperty("member.rights.allow-external-login-change", false)) ||
               !channel.getBooleanProperty("member.rights.allow-login-change", true);
            %>
              <jalios:field  name='<%= "login" %>' label='<%= glp("ui.adm.mbr-edit.lbl.login") %>' description='<%= glp("ui.adm.mbr-edit.txt.login") %>' 
                             required='<%= true %>' value='<%= formHandler.getAvailableLogin() %>'
                             disabled="<%= loginModificationDisabled %>">
                <jalios:control type="<%= ControlType.TEXTFIELD %>" />
              </jalios:field>

            <jalios:if predicate='<%= !isLdapAccount && !isExternalAuthentication %>'>              
              <%-- OLD PASSWORD ------------------------------------------------------------ --%>
              <jalios:field  name='<%= "password0" %>' label='<%= glp("ui.adm.mbr-edit.lbl.oldpwd") %>' description='<%= glp("ui.adm.mbr-edit.lbl.oldpwd") %>' required='<%= true %>'>
                <jalios:control type="<%= ControlType.PASSWORD %>" />
              </jalios:field>
              <%-- PASSWORD ------------------------------------------------------------ --%> 
              <jalios:field label="ui.adm.mbr-edit.lbl.pwd" name='password1'>
                <jalios:control settings='<%= new PasswordSettings().autocomplete("new-password").name("password1") %>' />
                <jalios:control settings='<%= new PasswordSettings().autocomplete("new-password").name("password2") %>' />
              </jalios:field>
            </jalios:if>
            
            <jalios:include target="EDIT_MBR_MAINTAB_ACCOUNT" />
          </fieldset>

          <fieldset>
            <legend class='formLabel'><%= glp("ui.adm.mbr-edit.fs.options") %></legend>

              <jalios:field label="ui.adm.mbr-edit.lbl.mail-vis" name='emailVisible' value='<%= formHandler.getAvailableEmailVisible() %>' >
                <jalios:control type="<%= ControlType.BOOLEAN %>" />
              </jalios:field>
              
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
          <fieldset>
            <legend class='formLabel'><%= glp("ui.adm.mbr-edit.delegation") %></legend>
            <jalios:field label="ui.adm.mbr-edit.delegation" name="delegateMbrIds" value='<%= formHandler.getAvailableDelegateMemberSet() %>' description='<%= glp("ui.adm.mbr-edit.del.delegates", loggedMember == member ? 0 : 1) %>' mv="1">
              <jalios:control settings="<%= new MemberSettings().filter(MemberSettings.MemberFilter.ACCOUNT) %>" />
            </jalios:field>
          </fieldset>
          <% } // showDelegatedMemberSet %>
        </div>
     </div>
  </div>

  <%-- *** ALERT ********************************************* --%>
  <% com.jalios.jcms.handler.EditMemberHandler memberFH = formHandler; %> 
  <div class="tab-pane fade" id="editProfile_alert">
   <%@ include file="/jcore/alert/doAlertRuleEditor.jspf" %>    
  </div>

  <%-- *** NOTIFICATION EDITOR ************************************** --%>
  <jalios:if predicate='<%= tabNotif %>'>
    <% request.setAttribute("showGroupsParameters", "true"); %>
    <div class="tab-pane fade" id="editProfile_notif">
     <% { %>  
     <%@ include file="/jcore/notification/doMemberNotificationList.jspf" %>
     <% } %>    
    </div>
  </jalios:if>
 
   <%-- *** PLUGIN ********************************************* --%>
   <jalios:include target="EDIT_MEMBER_PROFILE" targetContext="tab-page" />
 
</div>
 <%-- BUTTONS -------------------------------------------------------------------- --%>
 <% if (Util.notEmpty(buttonsBuffer)) { %>
  <%= buttonsBuffer %>
 <% } %>
 <% if (!emptyHeader) { %>
	      <p>
              <input type="submit" name="opUpdateProfile" value='<%=glp("ui.com.btn.save")%>' class='btn btn-primary' />
 	      </p>
 <% } %>
              <input type="hidden" name="redirect" value="<%= encodeForHTMLAttribute(redirect) %>" />
              <input type="hidden" name="id" value="<%= loggedMember.getId() %>" />
              <input type='hidden' name='action' value='true' />
              <input type='hidden' name='loaded' value='false' />
              <input type='hidden' name="anchor" />
              <input type='hidden' name="opItem" />
              <input type='hidden' name="itemPos" />
              <input type='hidden' name="emptyheader" value='<%= emptyHeader %>' />
</form>
<% if (emptyHeader) { %>
</div>
<%@ include file='/jcore/doEmptyFooter.jspf' %>
<% } else { %>
<%@ include file='/work/doWorkFooter.jspf' %>
<% } %>

