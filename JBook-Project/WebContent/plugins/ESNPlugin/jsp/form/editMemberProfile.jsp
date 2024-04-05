<%@page import="com.jalios.jcmsplugin.esn.*"%><%
%><%@page import="com.jalios.jcmsplugin.esn.ui.*"%><%
%><%@page import="com.jalios.jcmsplugin.esn.profile.*"%><%
%><%@page import="com.jalios.jcms.uicomponent.app.AppConstants"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file="/front/app/doAppCommon.jspf" %><%
// No doHeader.jspf here!

%><jsp:useBean id='esnProfileDisplayHandler' scope='page' class='com.jalios.jcmsplugin.esn.profile.ProfileDisplayHandler'><%
  %><jsp:setProperty name='esnProfileDisplayHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='esnProfileDisplayHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='esnProfileDisplayHandler' property='*' /><%
  %><jsp:setProperty name='esnProfileDisplayHandler' property='esnProfileAction' value='<%= ProfileDisplayHandler.Action.EDIT %>'/><%
%></jsp:useBean><%

if (esnProfileDisplayHandler.validate()) {
  return;
}

ESNManager esnMgr = ESNManager.getInstance();
Member member = esnProfileDisplayHandler.getMember();
MemberProfile profile = esnProfileDisplayHandler.getProfile();

String title = esnProfileDisplayHandler.isMyProfile() ? glp("jcmsplugin.esn.edit-profile.title.me") : glp("jcmsplugin.esn.edit-profile.title.other", member);
request.setAttribute("title", title); 

MemberCategories mcat = esnMgr.getMemberCategories(member);

boolean isDBAccount = member instanceof DBMember;
boolean isLdapAccount = member.isLdapAccount() && channel.isLdapEnabled();
boolean isAccount = member.isAccount();

PortalInterface forcedPortal = getDataParameter("portal", PortalInterface.class);

%><jsp:useBean id="alertSettingsHandler" scope="page" class="com.jalios.jcms.alert.MemberAlertSettingsHandler"><%
  %><jsp:setProperty name="alertSettingsHandler" property="request" value="<%= request %>"/><%
  %><jsp:setProperty name="alertSettingsHandler" property="response" value="<%= response %>"/><%
  %><jsp:setProperty name="alertSettingsHandler" property="*" /><%
  %><jsp:setProperty name="alertSettingsHandler" property="member" value='<%= member %>'/><%
%></jsp:useBean><%
%><jsp:useBean id='memberFH' scope='page' class='com.jalios.jcms.handler.EditMemberHandler'><%
  %><jsp:setProperty name='memberFH' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='memberFH' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='memberFH' property='*' /><%
  %><jsp:setProperty name="memberFH" property="memberAlertSettingsFormHandler" value="<%= alertSettingsHandler %>"/><%
  %><jsp:setProperty name="memberFH" property="profileEditor" value="<%= true %>"/><%
  %><jsp:setProperty name='memberFH' property='id' value='<%= member == null ? "" : member.getId() %>'/><%
  %><jsp:setProperty name='memberFH' property='noRedirect' value='true'/><%
  %><jsp:setProperty name='memberFH' property='ws' value='<%= profile.getWorkspace().getId() %>'/><%
%></jsp:useBean><%
%><jsp:useBean id='profileFH' scope='page' class='generated.EditMemberProfileHandler'><%
  %><jsp:setProperty name='profileFH' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='profileFH' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='profileFH' property='*' /><%
  %><jsp:setProperty name='profileFH' property='id' value='<%= profile == null ? "" : profile.getId() %>'/><%
  %><jsp:setProperty name='profileFH' property='noRedirect' value='true'/><%
  %><jsp:setProperty name='profileFH' property='ws' value='<%= profile.getWorkspace().getId() %>'/><%
%></jsp:useBean><%
%><jsp:useBean id='categoriesFH' scope='page' class='generated.EditMemberCategoriesHandler'><%
  %><jsp:setProperty name='categoriesFH' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='categoriesFH' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='categoriesFH' property='*' /><%
  %><jsp:setProperty name='categoriesFH' property='id' value='<%= mcat == null ? "" : mcat.getId() %>'/><%
  %><jsp:setProperty name='categoriesFH' property='noRedirect' value='true'/><%
  %><jsp:setProperty name='categoriesFH' property='ws' value='<%= profile.getWorkspace().getId() %>'/><%
%></jsp:useBean><%
%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.esn.EditFullProfileHandler'><%
  %><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
  %><jsp:setProperty name='formHandler' property='memberFH' value='<%= memberFH %>'/><%
  %><jsp:setProperty name='formHandler' property='profileFH' value='<%= profileFH %>'/><%
  %><jsp:setProperty name='formHandler' property='categoriesFH' value='<%= categoriesFH %>'/><%
  %><jsp:setProperty name='formHandler' property='ws' value='<%= profile.getWorkspace().getId() %>'/><%
%></jsp:useBean><%
boolean handlerValidateState = formHandler.validate();

String ESN_HANDLER_VALIDATION_STATE = "ESN_HANDLER_VALIDATION_STATE";
ServletUtil.backupAttribute(pageContext,ESN_HANDLER_VALIDATION_STATE);
request.setAttribute(ESN_HANDLER_VALIDATION_STATE, handlerValidateState);

%><jalios:include target="PLUGIN_ESN_EDIT_MEMBER_BEFORE_VALIDATION_TEST" /><%

handlerValidateState = Util.toBoolean(request.getAttribute(ESN_HANDLER_VALIDATION_STATE), false);

if (handlerValidateState) {
  return;
}
ServletUtil.restoreAttribute(pageContext, ESN_HANDLER_VALIDATION_STATE);
// doHeader.jspf after validate to prevent multiple redirection, and URI too large bug
// and before our css variable (doEmptyHeader same var)
%>
<%@ include file='/jcore/doHeader.jspf' %>
<%
request.setAttribute("profileFH", profileFH);
request.setAttribute("formHandler", memberFH);
request.setAttribute("editFullProfileHandler", formHandler);
request.setAttribute("editProfileCategoriesFH", categoriesFH);
request.setAttribute("classBeingProcessed", member.getClass());

com.jalios.jcmsplugin.esn.profile.ui.UITabs tabs = esnProfileDisplayHandler.getUITabs();
// Target before tabs loop (allow target to ask for tab rendering)
%><jalios:include target="PLUGIN_ESN_EDIT_MEMBER_PROFILE_TOP" /><%
%><%@ include file='/plugins/ESNPlugin/front/tabs/doValidateTabs.jspf' %><%

if (Util.isEmpty(tabs.getItems())) {
  sendRedirect(member.getDisplayUrl(userLocale));
  return;
}

String css = esnProfileDisplayHandler.getAppCss();
String refreshUrl = "plugins/ESNPlugin/jsp/form/editMemberProfile.jsp";
%>
<%-- BUTTONS ---------------------------------------------- --%>
<jalios:buffer name="buttons">
  <div class="edit-profile-buttons">
    <input type="submit" name="opUpdateProfile" class="btn btn-primary" <%= channel.isDataWriteEnabled() ? "" : "disabled='disabled'" %> value='<%= encodeForHTMLAttribute(glp("ui.com.btn.save")) %>' />
    <input type="submit" class="btn btn-default" name="opCancel" value="<%= encodeForHTMLAttribute(glp("ui.com.btn.cancel")) %>" />
    <% if (isAdmin) { %>
    <input type="button" class="btn btn-default" value="<%= encodeForHTMLAttribute(glp("ui.com.btn.edit-back")) %>" onclick="document.location = '<%= contextPath + "/edit.jsp?id=" + member.getId() %>';" />
    <% } %>
  </div>
</jalios:buffer>
<% request.setAttribute("esn-edit-profile-buttons-DOM", buttons.toString()); %>

<div class="<%= css %>" id="member-profile" itemscope itemtype="http://schema.org/Person" data-jalios-ajax-refresh-url="<%= refreshUrl %>">
  <div class="member-profile-inner">

    <%-- Header --%>
    <jalios:include resource="esn.profile.full.header" />

    <%-- Body --%>
    <%@ include file='/plugins/ESNPlugin/types/MemberProfile/tabs/doEditTabs.jspf' %>
    
    <div class="profile-body">
      <form action="<%= ServletUtil.getResourcePath(request) %>" method="post" name="editForm" enctype="multipart/form-data">
        <jalios:include target="PLUGIN_ESN_EDIT_MEMBER_PROFILE_FORM_TOP" />

        <div class="form-horizontal">
          <ul class="esn-ui-tabs profile-tabs nav nav-tabs nav-tabs-underlined" role="tablist">
            <%= uiTabsNavigationBuilder.toString() %>
          </ul>
          <%@ include file='/jcore/doMessageBox.jspf' %>
          <div class="tab-content">
            <%-- MUST directly follow > DIV.tab-content --%>
            <%= uiTabsBodyBuilder.toString() %>
          </div>
        </div><%-- // .form-horizontal--%>
        <input type="hidden" name="mid" value="<%= member.getId() %>" />
        <input type="hidden" name="cids" value="" />
        <input type="hidden" name="jsp" value="<%= encodeForHTMLAttribute(getUntrustedStringParameter("jsp", refreshUrl)) %>" />
        <% if (Util.notEmpty(forcedPortal)) { %>
          <input type="hidden" name="portal" value="<%= forcedPortal.getId() %>" />
        <% } %>
        <% if (member.getExtraDBDataMap() != null) { %>
          <% for (String itMyKey : formHandler.backupedExtraDataSet(true)) { %>
            <input type="hidden" name="extraDBKeys" value="<%= encodeForHTMLAttribute(itMyKey) %>" />
            <input type="hidden" name="extraDBValues" value="<%= encodeForHTMLAttribute(member.getExtraDBDataMap().get(itMyKey)) %>" />
          <% } %>
        <% } %>
        <% if (member.isStored()) { %>
          <% if (member.getExtraDataMap() != null) { %>
            <% for (String itMyKey : formHandler.backupedExtraDataSet(false)) { %>
              <input type="hidden" name="extraKeys" value="<%= encodeForHTMLAttribute(itMyKey) %>" />
              <input type="hidden" name="extraValues" value="<%= encodeForHTMLAttribute(member.getExtraDataMap().get(itMyKey)) %>" />
            <% } %>
          <% } %>
        <% } %>
        <%= esnProfileDisplayHandler.getFormStepHiddenFields() %>
        <jalios:include target="PLUGIN_ESN_EDIT_MEMBER_PROFILE_FORM_BOTTOM" />
      </form>
      </div><%-- // .profile-body-inner --%>
  </div><%-- // .member-profile-inner --%>
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div><%-- // #member-profile --%>