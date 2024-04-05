<%@page import="com.jalios.jcms.upload.UploadManager"%><%
%><%@page import="com.jalios.jcmsplugin.esn.MemberActivityManager"%><%
%><%@page import="com.jalios.jcmsplugin.esn.activity.ActivityEntryPageResult"%><%
%><%@page import="com.jalios.jcmsplugin.esn.activity.MemberActivityMode"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%
%><%@ page import="com.jalios.jcmsplugin.esn.*" %><%  
MemberActivityManager maMgr = MemberActivityManager.getInstance();
   
  PortletMemberActivity box = (PortletMemberActivity)portlet;
  
  if (box == null){
    box = getDataParameter("boxId",PortletMemberActivity.class);
  }
  
  if (box == null) {
    return;
  }
  
  String filters = (String)box.getFieldValue(jcmsContext, "filters");  
  
  jcmsContext.addCSSHeader("plugins/ESNPlugin/css/activity.css");
  jcmsContext.addJavaScript("plugins/ESNPlugin/js/activity.js");
  jcmsContext.addCSSHeader("css/jalios/core/jalios-member-card.css");
  
  if (!jcmsContext.isAjaxRequest()) {
    UploadManager.getInstance().addUploadComponentScripts(jcmsContext);
  }
  
  boolean canMicroBlog = MicroBloggingManager.getInstance().canMicroBlog(loggedMember,workspace);
  boolean isMicroBloggingFiltered = filters != null && filters.contains("microBlogging");
  request.setAttribute("jcmsplugin.esn.activity.box", box);
  request.setAttribute("jcmsplugin.esn.activity.is-card-template", false);
%>
<div class="portlet-member-activity esn">
  <% if (canMicroBlog && !isMicroBloggingFiltered) { %>
    <jalios:include jsp="plugins/ESNPlugin/jsp/microblogging/doMicroBloggingForm.jsp"/>
  <% } %>
  <jalios:include jsp="types/PortletMemberActivity/doPortletMemberActivityFullDisplayInner.jsp"/>
</div>