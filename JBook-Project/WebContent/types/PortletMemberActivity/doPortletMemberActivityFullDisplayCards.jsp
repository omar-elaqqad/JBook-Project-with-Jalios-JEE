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
  
  jcmsContext.addCSSHeader("plugins/ESNPlugin/css/activity/activity-cards.css");
  jcmsContext.addCSSHeader("plugins/ESNPlugin/css/activity/portlet-member-activity-cards.css");
  jcmsContext.addJavaScript("plugins/ESNPlugin/js/activity.js");
  jcmsContext.addCSSHeader("css/jalios/core/jalios-member-card.css");
  if (!jcmsContext.isAjaxRequest()) {
    UploadManager.getInstance().addUploadComponentScripts(jcmsContext);
  }
  
  boolean canMicroBlog = MicroBloggingManager.getInstance().canMicroBlog(loggedMember,workspace);
  boolean isMicroBloggingFiltered = filters != null && filters.contains("microBlogging");
  request.setAttribute("jcmsplugin.esn.activity.is-card-template", true);
  request.setAttribute("jcmsplugin.esn.activity.box", box);
%>
<div class="portlet-member-activity-cards member-activity-cards esn">
  <% if (canMicroBlog && !isMicroBloggingFiltered) { %>
    <jalios:include jsp="plugins/ESNPlugin/jsp/microblogging/doMicroBloggingForm.jsp"/>
  <% } %>
  <jalios:include jsp="types/PortletMemberActivity/doPortletMemberActivityFullDisplayInnerCards.jsp"/>
</div><%
request.removeAttribute("jcmsplugin.esn.activity.box.showComments");
request.removeAttribute("jcmsplugin.esn.activity.box.showAbstract");
request.removeAttribute("jcmsplugin.esn.activity.box.showMedia");
%>