<%@ include file="/plugins/SmartPhonePlugin/jsp/common/header.jspf" %>
<%@page import="com.jalios.jcmsplugin.esn.activity.ActivityEntry"%>
<%@page import="com.jalios.jcmsplugin.esn.MemberActivityManager"%>
<%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneConstants"%><%
%><%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneControlType"%><%
%><%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneManager"%><%
%><%@ page import="com.jalios.jcmsplugin.esn.*" %>
<%@ page import="com.jalios.jcms.workspace.Workspace" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.jalios.jcms.JcmsUtil" %>
<%
  MicroBloggingManager mbManager = MicroBloggingManager.getInstance();
  String mbTitle = JcmsUtil.unescapeHtml(loggedMember.getFriendlyName()) +" - "+ new Date();

  Workspace microBloggingWorkspace = mbManager.getMicroBloggingWorkspace(workspace);

  //ESN-584 - Make sure the microblogging type is enabled (otherwise, do not display the form at all)
  if ( ! microBloggingWorkspace.getTypeSet().contains( MicroBloggingManager.getMicroBloggingClass() ) ) {
    return;
  }

%>
<div id="share-image" data-role="page" data-dom-cache="true" class="service-page service-background-contrast service-activity-page">
  <div class="activity-container" data-role="content">
    <div class="ajax-refresh-wrapper">
      <%@ include file='/plugins/ESNPlugin/smartphone/jsp/service/activity/microblogging-form.jspf' %>
    </div>
  </div>
</div>
<%@ include file='/plugins/SmartPhonePlugin/jsp/common/footer.jspf' %>