<%--
  @Summary: Display information about the site
  @Category: Admin / Channel
  @Author: Oliver Dedieu
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-5.5
--%><%
%><%@ page import="com.jalios.jcms.quota.*" %><%
%><%@ page import="com.jalios.jstore.jsync.*" %><% 
%><%@ include file='/jcore/doInitPage.jspf' %><%
request.setAttribute("fileSizeSubAdminMenu", "true");
if(!jcmsContext.isAjaxRequest()){
	jcmsContext.addJavaScript("js/jalios/ux/jalios-file-size-map.js");
%>
	<%@ include file='/admin/doAdminHeader.jspf' %>
	<div class="page-header">
		<h1><%= glp("ui.adm.mn.files.file-size-map") %></h1>
	</div>
	<%
}
	String refreshUrl = "admin/fileSizeMap.jsp";
	boolean opRefreshFileSizeMap = getBooleanParameter("opRefreshFileSizeMap", false);
	QuotaManager mgr = QuotaManager.getInstance();
	WorkspaceFileSizeResult wfa = mgr.getGlobalFileAnalyzer(opRefreshFileSizeMap);

	if(mgr.isQuotaFeatureEnabled()){
%>
<div class="fileSizeMap ajax-refresh-div" data-jalios-ajax-refresh-url="<%=refreshUrl%>" data-jalios-ajax-refresh-periodical="<%=wfa ==null ? 3:0 %>">
<%
if(jcmsContext.isAjaxRequest()){
	if(wfa != null){
		ObjectLongTreeMap fileSizeMap = wfa.getFileSizeMap();
		ObjectLongTreeMap fileSizeMapWithSatellite = wfa.getFileSizeMapWithSatellite();
		String fileSizeMapLinkPrefix = "work/queryWork.jsp?allWorkspaceFilter=true&amp;types=com.jalios.jcms.FileDocument&amp;types=com.jalios.jcms.DBFileDocument&amp;mode=advanced&amp;text=";
		%><%@include file="/admin/doFileSizeMap.jspf" %><%
	}else{
    	int completeness = mgr.getCurrentChannelAnalyzerThread() == null?0: mgr.getCurrentChannelAnalyzerThread().getCompleteness();
    	%><%=glp("ui.adm.data-report.file-analyze-in-progress", completeness) %><%
   	}
}
else{
      jcmsContext.addJavaScript("js/jalios/core/components/jalios-loading-waves.js");
      jcmsContext.addCSSHeader("css/jalios/core/components/loading/jalios-loading-waves.css");
%>
    <jalios:javascript>
      jQuery(".file-size-loading").displayLoadingWaves();
    </jalios:javascript>
    <div class="file-size-loading" style="height: 200px; position: relative;"></div>
<%
}	
if(jcmsContext.isAjaxRequest()){
	%><%@ include file="/jcore/doAjaxFooter.jspf" %><%
}
%>
</div>
<%
	}
	else{
		 jcmsContext.addMsg(new JcmsMessage(JcmsMessage.Level.WARN,glp("ui.adm.quota-feature-disabled")));
	 	 %><%@ include file='/jcore/doMessageBox.jspf' %><%
 	}
	if(!jcmsContext.isAjaxRequest()){
		%><%@ include file="/admin/doAdminFooter.jspf" %><%
	}
%>
