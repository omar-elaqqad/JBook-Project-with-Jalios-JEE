<%@page import="com.jalios.jcms.jportal.JPortalStructure"%>
<%@page import="com.jalios.jcms.jportal.JPortalManager"%>
<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
jcmsContext.addBodyAttributes("class", "jportal-preview-active");
jcmsContext.addCSSHeader("css/jalios/core/jportal/jportal-edition.css");
jcmsContext.addCSSHeader("css/jalios/core/jportal/jportal-preview.css");
jcmsContext.addJavaScript("js/jalios/jportal/jalios-jportal-sync-preview.js");
%><%@ include file='/jcore/doEmptyHeader.jspf' %>

<div class="jportal-overlay hide">
  <div class="jportal-loading">
    <div class="jportal-loading-item jportal-loading-item-1"></div>
    <div class="jportal-loading-item jportal-loading-item-2"></div>
    <div class="jportal-loading-item jportal-loading-item-3"></div>
    <div class="jportal-loading-item jportal-loading-item-4"></div>
  </div>
</div>

<jalios:include jsp="jcore/jportal/preview/jportalPreview.jsp" />

<script id="topbar-preview-overlay" type="text/x-handlebars-template">
  <div style="position:absolute;width:100%;height:100%;z-index:2000"></div>
</script>
<%@ include file='/jcore/doEmptyFooter.jspf' %>