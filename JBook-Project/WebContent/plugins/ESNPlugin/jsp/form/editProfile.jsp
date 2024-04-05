<%@page import="org.apache.commons.lang.StringUtils"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ page import="com.jalios.jcmsplugin.esn.*" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
if (!isLogged) {
  sendForbidden(request, response);
  return;
}
Member member = getDataParameter("mid", Member.class);
if (member == null) {
  member = loggedMember;
}
String title = JcmsUtil.isSameId(member, loggedMember) ? glp("jcmsplugin.esn.edit-profile.title.me") : glp("jcmsplugin.esn.edit-profile.title.other", member);
request.setAttribute("title", title); 
%><%@ include file='/jcore/doHeader.jspf' %><%

ESNManager esnMgr = ESNManager.getInstance();

MemberProfile profile = esnMgr.getMemberProfile(member, true);
MemberCategories mcat = esnMgr.getMemberCategories(member);

boolean isDBAccount = member instanceof DBMember;
boolean isLdapAccount = member != null && member.isLdapAccount() && channel.isLdapEnabled();
boolean isAccount = member.isAccount();

PortalInterface forcedPortal = getDataParameter("portal", PortalInterface.class);
String profileRedirect = profile.getDisplayUrl(userLocale) + (forcedPortal != null ? "?portal=" + forcedPortal.getId() : "");

String tab = getAlphaNumParameter("esnProfileTab", "");
if (Util.notEmpty(tab)) {
  profileRedirect = profileRedirect + "?esnProfileTab=" + tab;
}

jcmsContext.addCSSHeader("plugins/ESNPlugin/css/esn.css");
jcmsContext.addCSSHeader("css/fff-sprite.css");
%><jsp:useBean id="alertSettingsHandler" scope="page" class="com.jalios.jcms.alert.MemberAlertSettingsHandler"><%
  %><jsp:setProperty name="alertSettingsHandler" property="request" value="<%= request %>"/><%
  %><jsp:setProperty name="alertSettingsHandler" property="response" value="<%= response %>"/><%
  %><jsp:setProperty name="alertSettingsHandler" property="*" /><%
  %><jsp:setProperty name="alertSettingsHandler" property="member" value='<%= member %>'/><%
%></jsp:useBean>
<jsp:useBean id='memberFH' scope='page' class='com.jalios.jcms.handler.EditMemberHandler'>
  <jsp:setProperty name='memberFH' property='request' value='<%= request %>'/>
  <jsp:setProperty name='memberFH' property='response' value='<%= response %>'/>
  <jsp:setProperty name='memberFH' property='*' />
  <jsp:setProperty name="memberFH" property="memberAlertSettingsFormHandler" value="<%= alertSettingsHandler %>"/>
  <jsp:setProperty name="memberFH" property="profileEditor" value="<%= true %>"/>  
  <jsp:setProperty name='memberFH' property='id' value='<%= member == null ? "" : member.getId() %>'/>
  <jsp:setProperty name='memberFH' property='noRedirect' value='true'/>  
  <jsp:setProperty name='memberFH' property='ws' value='<%= profile.getWorkspace().getId() %>'/>  
</jsp:useBean>
<jsp:useBean id='profileFH' scope='page' class='generated.EditMemberProfileHandler'>
  <jsp:setProperty name='profileFH' property='request' value='<%= request %>'/>
  <jsp:setProperty name='profileFH' property='response' value='<%= response %>'/>
  <jsp:setProperty name='profileFH' property='*' />
  <jsp:setProperty name='profileFH' property='id' value='<%= profile == null ? "" : profile.getId() %>'/>
  <jsp:setProperty name='profileFH' property='noRedirect' value='true'/>  
  <jsp:setProperty name='profileFH' property='ws' value='<%= profile.getWorkspace().getId() %>'/>  
</jsp:useBean>
<jsp:useBean id='categoriesFH' scope='page' class='generated.EditMemberCategoriesHandler'>
  <jsp:setProperty name='categoriesFH' property='request' value='<%= request %>'/>
  <jsp:setProperty name='categoriesFH' property='response' value='<%= response %>'/>
  <jsp:setProperty name='categoriesFH' property='*' />
  <jsp:setProperty name='categoriesFH' property='id' value='<%= mcat == null ? "" : mcat.getId() %>'/>
  <jsp:setProperty name='categoriesFH' property='noRedirect' value='true'/>  
  <jsp:setProperty name='categoriesFH' property='ws' value='<%= profile.getWorkspace().getId() %>'/>  
</jsp:useBean>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.esn.EditFullProfileHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
  <jsp:setProperty name='formHandler' property='memberFH' value='<%= memberFH %>'/>
  <jsp:setProperty name='formHandler' property='profileFH' value='<%= profileFH %>'/>
  <jsp:setProperty name='formHandler' property='categoriesFH' value='<%= categoriesFH %>'/>
  <jsp:setProperty name='formHandler' property='ws' value='<%= profile.getWorkspace().getId() %>'/>  
</jsp:useBean><%
if (formHandler.validate()) {
  return;
}

request.setAttribute("formHandler", memberFH);
request.setAttribute("classBeingProcessed", member.getClass());
request.setAttribute("extraDataHorizontalLayout", "true");
%>  
<div id="edit-profile" class="esn editMemberProfile">

  <%@ include file='/jcore/doMessageBox.jspf' %>
  
  <form action="<%= ServletUtil.getResourcePath(request) %>" method="post" name="editForm" enctype="multipart/form-data">
    <h1><%= title %></h1>
    
    <div class="tab-pane" id="mainTab">
      <%@ include file='/plugins/ESNPlugin/jsp/form/editProfile_info.jspf' %>
      <%@ include file='/plugins/ESNPlugin/jsp/form/editProfile_address.jspf' %>
      <%@ include file='/plugins/ESNPlugin/jsp/form/editProfile_presentation.jspf' %>
      <%@ include file='/plugins/ESNPlugin/jsp/form/editProfile_expertise.jspf' %>
      <%@ include file='/plugins/ESNPlugin/jsp/form/editProfile_account.jspf' %>
      <%@ include file='/plugins/ESNPlugin/jsp/form/editProfile_alert.jspf' %>
      <%@ include file='/plugins/ESNPlugin/jsp/form/editProfile_notification.jspf' %>
    </div>

    <%-- BUTTONS ---------------------------------------------- --%>
    <div class="buttons">
      <input type="submit" class="btn btn-primary" name="opUpdateProfile" value="<%= glp("ui.com.btn.save") %>" <%= channel.isDataWriteEnabled() ? "" : "disabled='disabled'" %>/>
      <input type="submit" class="btn btn-default" name="opCancel" value="<%= glp("ui.com.btn.cancel") %>" />
      <% if (isAdmin) { %>
      <input type="button" class="btn btn-default" value="<%= glp("ui.com.btn.edit-back") %>" onclick="document.location = '<%= contextPath + "/edit.jsp?id=" + member.getId() %>';" />
      <% } %>
      <input type="hidden" name="redirect" value="<%= encodeForHTMLAttribute(profileRedirect) %>" />  
      <input type="hidden" name="mid" value="<%= member.getId() %>" />  
      <input type="hidden" name="cids" value="" />  
      <input type="hidden" name="jsp" value="<%= encodeForHTMLAttribute(getUntrustedStringParameter("jsp", "")) %>" />
      <% if (Util.notEmpty(forcedPortal)) { %>
      <input type="hidden" name="portal" value="<%= forcedPortal.getId() %>" />
      <% } %>
      
      <% for (String itMyKey : formHandler.backupedExtraDataSet(true)) { %>
        <input type="hidden" name="extraDBKeys" value="<%= itMyKey %>" />
        <input type="hidden" name="extraDBValues" value="<%= member.getExtraDBDataMap().get(itMyKey) %>" />
      <% } %>
      
      <% for (String itMyKey : formHandler.backupedExtraDataSet(false)) { %>
        <input type="hidden" name="extraKeys" value="<%= itMyKey %>" />
        <input type="hidden" name="extraValues" value="<%= member.getExtraDataMap().get(itMyKey) %>" />
      <% } %>
    </div>
  </form>
  <%-- JAVASCRIPT ---------------------------------------------- --%>
  <jalios:javascript>
  setSelectedTab("mainTab", <%= formHandler.getOpenTab() %>);
  </jalios:javascript>  
</div>
