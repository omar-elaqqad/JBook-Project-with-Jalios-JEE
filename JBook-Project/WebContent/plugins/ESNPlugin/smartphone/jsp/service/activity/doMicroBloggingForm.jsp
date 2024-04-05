<%@page import="com.jalios.jcmsplugin.esn.activity.ActivityEntry"%><%
%><%@page import="com.jalios.jcmsplugin.esn.MemberActivityManager"%><%
%><%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneConstants"%><%
%><%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneControlType"%><%
%><%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneManager"%><%
%><%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%
%><%@ page import="com.jalios.jcmsplugin.esn.*" %><%

  MicroBloggingManager mbManager = MicroBloggingManager.getInstance(); 
  SmartPhoneManager smartPhoneManager = SmartPhoneManager.getInstance();
  String mbTitle = JcmsUtil.unescapeHtml(loggedMember.getFriendlyName()) +" - "+ new Date();
  
  Workspace microBloggingWorkspace = mbManager.getMicroBloggingWorkspace(workspace);
  
  //ESN-584 - Make sure the microblogging type is enabled (otherwise, do not display the form at all)
  if ( ! microBloggingWorkspace.getTypeSet().contains( MicroBloggingManager.getMicroBloggingClass() ) ) {
    return;
  }
  
%>
<% if (mbManager.canMicroBlog(loggedMember, microBloggingWorkspace)){ %>
<jsp:useBean id='microBlogHandler' scope='page' class="com.jalios.jcmsplugin.esn.smartphone.EditSmartPhoneMicroBloggingHandler">
  <jsp:setProperty name='microBlogHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='microBlogHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='microBlogHandler' property='noRedirect' value='<%= true%>' />
  <jsp:setProperty name='microBlogHandler' property='*' />
  <jsp:setProperty name='microBlogHandler' property='ws' value='<%= microBloggingWorkspace.getId() %>'/>  
</jsp:useBean>
<% 
  boolean isMicroBloggingCreated = false;
  MicroBlogging createdMicroBlogging = null;
  if (hasParameter("opCreate") && microBlogHandler.validate()) {
    HibernateUtil.commitTransaction();
    HibernateUtil.beginTransaction();   
    isMicroBloggingCreated = true;
    createdMicroBlogging = (MicroBlogging) microBlogHandler.getPublication();
  }
%>
<div class="ajax-refresh-wrapper">
    <%@ include file='/plugins/ESNPlugin/smartphone/jsp/service/activity/microblogging-form.jspf' %>
</div>
<% if (isMicroBloggingCreated) {
  boolean displayWorkspace = true;

    ActivityEntry itActivityEntry = new ActivityEntry();
    itActivityEntry.setActivityData(createdMicroBlogging);
    itActivityEntry.setTodayComments(false);
    itActivityEntry.setLastActivity(Util.getFirst(MemberActivityManager.getInstance().getDataActivityList(createdMicroBlogging, loggedMember, null)));
    MemberActivity itActivity = itActivityEntry.getLastActivity();
    %>
    <%@ include file='/plugins/ESNPlugin/smartphone/jsp/service/activity/doActivityRow.jspf' %>
  <% } %>
<% } %>