<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@page import="com.jalios.jcms.alert.AlertAppHandler"%><%
%><%@page import="com.jalios.jcms.alert.AlertAppHandler.*"%><%
%><%@page import="com.jalios.jcms.uicomponent.app.AppConstants"%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%

if (!isLogged) {
  sendForbidden(request, response);
  return;
}

%>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.alert.AlertAppHandler'><%
  %><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
%></jsp:useBean><%
%><jsp:useBean id="alertSettingsHandler" scope="page" class="com.jalios.jcms.alert.MemberAlertSettingsHandler"><%
  %><jsp:setProperty name="alertSettingsHandler" property="request" value="<%= request %>"/><%
  %><jsp:setProperty name="alertSettingsHandler" property="response" value="<%= response %>"/><%
  %><jsp:setProperty name="alertSettingsHandler" property="*" /><%
  %><jsp:setProperty name="alertSettingsHandler" property="member" value='<%= loggedMember %>'/><%
%></jsp:useBean><%
%><jsp:useBean id='memberFH' scope='page' class='com.jalios.jcms.handler.EditMemberHandler'><%
  %><jsp:setProperty name='memberFH' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='memberFH' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='memberFH' property='*' /><%
  %><jsp:setProperty name='memberFH' property='id' value='<%= loggedMember.getId() %>'/><%
  %><jsp:setProperty name='memberFH' property='noRedirect' value='true'/>  <%
  %><jsp:setProperty name="memberFH" property="memberAlertSettingsFormHandler" value="<%= alertSettingsHandler %>"/><%
%></jsp:useBean><%

formHandler.setEditMemberHandler(memberFH);
jcmsContext.setPageTitle(formHandler.getAppHeaderTitle(userLang));
request.setAttribute("formHandler", formHandler);
request.setAttribute("jcms.alert-app", true);

if (formHandler.validate()) {
  %><%@ include file="/jcore/modal/modalRedirect.jspf" %><%
  return;
}
%>

<% if (formHandler.isEditAlertRulesValidated()){ %>
  <% Map<String,String> toastrOptionMap = Util.getHashMap("timeOut", "2000");  %>
  <jalios:toastr message='<%= glp("alert.rule-editor.msg.update-success") %>' optionMap="<%= toastrOptionMap %>"/>
<% } %>

<div class="ajax-refresh-div" data-jalios-ajax-refresh-url="<%= AlertAppHandler.getAppInnerJsp() %>">
  <form class="app-alert-form" action="<%= AlertAppHandler.getAppInnerJsp() %>" method="POST">
    <jalios:app name="alerts">
      <jalios:appSidebar appUrl="jcore/alert/app/alertApp.jsp" css="no-focus" icon="alert-app" iconTitleProp="alert-app.alert-icon-title" >
      <%-- VIEWS --%>
<jalios:include jsp="/jcore/alert/app/doAlertAppViews.jsp" />
        <jalios:include jsp='<%= formHandler.getAppSidebarJsp() %>' />
        <jalios:include target="ALERT_APP_SIDEBAR" targetContext="div" />
      </jalios:appSidebar>
      <jalios:appMain headerTitle="<%= formHandler.getAppHeaderTitle(userLang) %>">
        <jalios:include jsp='<%= formHandler.getAppBodyJsp() %>' />
    </jalios:appMain>
    <%= formHandler.getFormStepHiddenFields() %>
    </jalios:app>
  </form>
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>