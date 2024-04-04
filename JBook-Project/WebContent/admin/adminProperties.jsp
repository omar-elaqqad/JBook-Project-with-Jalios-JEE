<%--
  @Summary: Channel's properties editor
  @Category: Admin / Channel
  @Author: Oliver Dedieu
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-2.0
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="org.apache.oro.text.perl.Perl5Util" %><%

  if (!checkAccess("admin/operation/properties")) {
    sendForbidden(request, response);
    return;
  }

%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.handler.PropertiesHandler'><%
  %><jsp:setProperty name="formHandler" property="pageContext" value="<%= pageContext %>"/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
%></jsp:useBean><%

  if (formHandler.validate()) {
    return;
  }
 
request.setAttribute("title", glp("ui.adm.prop.title")); 
request.setAttribute("breadcrumbTitle", glp("ui.adm.prop.title")); 
request.setAttribute("propertiesSubAdminMenu", "true");  
request.setAttribute("formHandler", formHandler);
jcmsContext.addJavaScript("js/jalios/ux/jalios-admin-properties.js");
jcmsContext.addCSSHeader("css/jalios/core/admin/jalios-admin-properties.css");

%><%@ include file='/admin/doAdminHeader.jspf' %><%@ include file='/jcore/doMessageBox.jspf' %>

<form class="form-horizontal" action='<%= channel.getSecuredBaseUrl(request) %>admin/adminProperties.jsp' method='post' name='editForm' id='editForm'>
  
  
 <input type="hidden" name="redirect" value="<%= ServletUtil.getUrl(request) %>" /> 

<div class="" >
  <ul class="nav nav-tabs nav-tabs-underlined is-left-aligned">
	  <li class="active"><a href="#ch" onclick="return false;"><jalios:icon src='status' /> <span class="property-title"><%= glp("ui.adm.prop.tab.ch") %></span></a></li>
	  <li><a href="#db" onclick="return false;">    <jalios:icon src='db' />            <span class="property-title"><%= glp("ui.adm.prop.tab.db") %></span></a></li>
	  <li><a href="#mail" onclick="return false;">  <jalios:icon src='mail' />          <span class="property-title"><%= glp("ui.adm.prop.tab.mail") %></span></a></li>
	  <li><a href="#access" onclick="return false;"><jalios:icon src='login' />         <span class="property-title"><%= glp("ui.adm.prop.tab.access") %></span></a></li> 
	  <li><a href="#ldap" onclick="return false;">  <jalios:icon src='ldap' />          <span class="property-title"><%= glp("ui.adm.prop.tab.ldap") %></span></a></li>
	  <li><a href="#proxy" onclick="return false;"> <jalios:icon src='proxy' />         <span class="property-title"><%= glp("ui.adm.prop.tab.proxy") %></span></a></li>
	  <li><a href="#vote" onclick="return false;">  <jalios:icon src='thumb-up' />      <span class="property-title"><%= glp("ui.adm.prop.tab.vote") %></span></a></li>
	  <li><a href="#stat" onclick="return false;">  <jalios:icon src='stats' />         <span class="property-title"><%= glp("ui.adm.prop.tab.stat") %></span></a></li>
	  <li><a href="#portal" onclick="return false;"> <jalios:icon src='portal' />       <span class="property-title"><%= glp("ui.portalihm.title") %></span></a></li>
	  <li><a href="#srch" onclick="return false;">  <jalios:icon src='search' />        <span class="property-title"><%= glp("ui.adm.prop.tab.srch") %></span></a></li>
	  <li><a href="#mbr" onclick="return false;">   <jalios:icon src='group' />         <span class="property-title"><%= glp("ui.adm.prop.tab.mbr") %></span></a></li>
	  <li><a href="#jsync" onclick="return false;"> <jalios:icon src='server' />        <span class="property-title"><%= glp("ui.adm.prop.tab.jsync") %></span></a></li>
	  <li><a href="#mashup" onclick="return false;"><jalios:icon src='import-mgr' />    <span class="property-title"><%= glp("ui.adm.prop.tab.mashup") %></span></a></li>
    <li><a href="#a11y" onclick="return false;">   <jalios:icon src='a11y' />         <span class="property-title"><%= glp("ui.adm.prop.tab.a11y") %></span></a></li>
	  <li><a href="#adv" onclick="return false;">   <jalios:icon src='advanced-gray' /> <span class="property-title"><%= glp("ui.adm.prop.tab.adv") %></span></a></li>
	</ul>

  <div class="tab-content responsive">
    <div class="tab-pane fade in active" id="ch"><jalios:include jsp="admin/properties/siteProperties.jsp" /></div>
    <div class="tab-pane fade" id="db"><jalios:include jsp="admin/properties/dbProperties.jsp" /></div>
    <div class="tab-pane fade" id="mail"><jalios:include jsp="admin/properties/mailProperties.jsp" /></div>
    <div class="tab-pane fade" id="access"><jalios:include jsp="admin/properties/accessProperties.jsp" /></div>
    <div class="tab-pane fade" id="ldap"><jalios:include jsp="admin/properties/ldapProperties.jsp" /></div>
    <div class="tab-pane fade" id="proxy"><jalios:include jsp="admin/properties/proxyProperties.jsp" /></div>
    <div class="tab-pane fade" id="vote"><jalios:include jsp="admin/properties/voteProperties.jsp" /></div>
    <div class="tab-pane fade" id="stat"><jalios:include jsp="admin/properties/statProperties.jsp" /></div>
    <div class="tab-pane fade" id="portal"><jalios:include jsp="admin/properties/portalProperties.jsp" /></div>
    <div class="tab-pane fade" id="srch"><jalios:include jsp="admin/properties/searchProperties.jsp" /></div>
    <div class="tab-pane fade" id="mbr"><jalios:include jsp="admin/properties/userProperties.jsp" /></div>
    <div class="tab-pane fade" id="jsync"><jalios:include jsp="admin/properties/jsyncProperties.jsp" /></div>
    <div class="tab-pane fade" id="mashup"><jalios:include jsp="admin/properties/webServiceProperties.jsp" /></div>
    <div class="tab-pane fade" id="a11y"><jalios:include jsp="admin/properties/accessibilityProperties.jsp" /></div>
    <div class="tab-pane fade" id="adv"><jalios:include jsp="admin/properties/advancedProperties.jsp" /></div>
  </div>
</div>

<div class="buttons">
  <button name='opUpdate' value='true' type='submit' class="btn btn-primary"><%= glp("ui.com.btn.save") %></button>
  <% File jcmsLogFile = new File(channel.getDataPath("logs/jcms.log")); %>
  <% if (jcmsLogFile.exists() && channel.isFailSafeMode()) { %>
    <a href="admin/logsDownload.jsp?zip=true" class="btn btn-default" title="<%= glp("ui.adm.logs.download") %> - <%= encodeForHTMLAttribute(Util.formatFileSize(jcmsLogFile.length(), userLocale, false)) %>"><jalios:icon src="download"  /> <%= glp("ui.adm.logs.download")%></a>
  <% } %>
  <% if (isAdmin) { // real admin only %> 
    <a href="admin/properties/editor/propEditor.jsp" class="btn btn-default"><%= glp("ui.adm.prop.prop-editor-link.label") %></a>
  <% } %>
</div>

</form>
<%@ include file='/admin/doAdminFooter.jspf' %> 
