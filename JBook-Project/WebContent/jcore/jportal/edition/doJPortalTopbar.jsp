<%@page import="com.jalios.jcms.jportal.JPortalStructure"%>
<%@page import="com.jalios.jcms.jportal.JPortalManager"%>
<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/jportal/edition/doInitJPortalEditorComponent.jspf' %>
<% 
JPortal jPortal = (JPortal) jportalEditorHandler.getAvailableJPortal();

if (jPortal == null) {
  jPortal = (JPortal) jcmsContext.getAjaxRequestAttribute("jPortal");
}

if (jPortal == null) {
  return;
} 

JPortalStructure jportalStructure = JPortalManager.getInstance().getJPortalStructure(jPortal, true);

jcmsContext.setAjaxRequestAttribute("jPortal", jPortal);
%>
<% if (jportalEditorHandler.validate()) {%>
  <jalios:javascript>
  setTimeout(function(){
    jQuery.jalios.Browser.redirect("<%= jportalEditorHandler.getAvailableJPortal().getDisplayUrl(userLocale) %>", false, false);
  },500);
  </jalios:javascript>
<% } %>

<div class="jportal-topbar ajax-refresh-div" data-jalios-ajax-refresh-url="jcore/jportal/edition/doJPortalTopbar.jsp">
  <div class="jportal-navigation">
    <div class="jportal-name"><%= jPortal.getTitle(userLang) %> - <%= workspace %></div>
  </div>
  <form method="POST" class="jportal-publish-form jportal-topbar-right">

	  <a href="#" class="btn btn-default <% if(jportalStructure.getCdate() == null){ %>hide<% } %> jportal-topbar-item jportal-history-link jportal-last-save-date" data-toggle="tooltip" data-placement="bottom" title="<%= encodeForHTMLAttribute(glp("jportal.edition.topbar.history.tooltip")) %>">
	    <jalios:date format='<%= glp("date-time-format") %>' date="<%= jportalStructure.getCdate() %>"/>
	  </a>

    <a class="btn btn-default jportal-topbar-item jportal-duplicate-link modal" href="jcore/jportal/doJPortalDuplicateModal.jsp?id=<%= jPortal.getId() %>">
      <%= glp("jportal.edition.topbar.duplicate.label") %>
    </a>    
    <a class="jportal-topbar-item btn btn-success jportal-save" data-toggle="tooltip" data-placement="bottom" title="<%= encodeForHTMLAttribute(glp("jportal.edition.topbar.save.tooltip")) %>" disabled="disabled" id="saveJPortal">
      <%= glp("jportal.edition.topbar.save.label") %>
    </a>
    <a class="jportal-topbar-item js-jportal-show-content jportal-action-show-content btn btn-default" href="#">
     <span><jalios:icon src="jportal-show-content" /></span>
     <span class="hide"><jalios:icon src="jportal-hide-content" /></span>
    </a>

    <a class="jportal-topbar-item jportal-show-preview btn btn-default" data-toggle="tooltip" data-placement="bottom" title="<%= encodeForHTMLAttribute(glp("jportal.edition.topbar.preview.tooltip")) %>"  href="jcore/jportal/preview/doJPortalPreview.jsp?jPortal=<%= jPortal.getId() %>">
      <%= glp("jportal.edition.topbar.show-preview.label") %>
    </a>
    <a class="jportal-topbar-item jportal-show-preview-new-window btn btn-default" data-toggle="tooltip" data-placement="bottom" title="<%= encodeForHTMLAttribute(glp("jportal.edition.topbar.preview.new-window.tooltip")) %>" target=_blank href="jcore/jportal/preview/doJPortalPreview.jsp?jPortal=<%= jPortal.getId() %>">
      <jalios:icon src="jportal-show-preview" />
    </a>
    <a href="<%= jportalEditorHandler.getPublishModalUrl() %>" data-toggle="tooltip" data-placement="bottom" title="<%= encodeForHTMLAttribute(glp("jportal.edition.topbar.publish.tooltip")) %>" class="jportal-topbar-item btn btn-primary btn-jportal-publish modal">
      <%= glp("jportal.edition.topbar.publish.label") %>
    </a>
    <a href="<%= jportalEditorHandler.getCloseUrl() %>" data-toggle="tooltip" data-placement="bottom" title="<%= glp("jportal.edition.topbar.close.tooltip") %>" class="btn btn-default jportal-topbar-item jportal-close-link">
      ╳
    </a>
    <input type="hidden" name="jPortal" value="<%= jPortal.getId() %>" />
  </form>
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>