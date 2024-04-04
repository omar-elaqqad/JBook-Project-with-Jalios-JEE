<%--
  @Deprecated: False
  @Customizable: False
  @Requestable: True
  @Summary: Generic display page for working publication
  @Category: Internal
--%><%@ include file='/jcore/doInitPage.jspf' %><%

  Publication publication = getPublicationParameter("id");

  if (publication == null) {
    sendRedirect("work/pubBrowser.jsp", request, response);
    return;
  }
  
  if (WorkflowManager.getInstance().previewInFO(publication)) { 
    Map<String, String[]> paramMap = new HashMap<String, String[]>(ServletUtil.getOrderedParameterMap(request)); 
    paramMap.put("preview", new String[]{"true"}); 
    sendRedirect(URLUtils.buildUrl(publication.getDisplayUrl(userLocale), paramMap));
    return;
  }
  
  if (!publication.canBeReadBy(loggedMember)) {
    sendForbidden(request, response);
    return;
  }
  
  // Set the right workspace for the given publication
  workspace = publication.getWorkspace();
  Workspace.setSessionWorkspace(request.getSession(), workspace);
  Workspace.setRequestWorkspace(request, workspace);
  
  jcmsContext.addJavaScript("js/jalios/core/jalios-admin-displaywork.js");
  
  String iframeURL = "work/displayWorkIframe.jsp?id=" + publication.getId() + "&amp;basetarget=_top";
%><%@ include file='/work/doWorkHeader.jspf' %><% request.setAttribute("JALIOS_STATTHISPAGE","false"); %>
<h1 class='boTitle icon iconPreview'>
  <%= glp("ui.work.dpl.title", publication.getTitle(userLang)) %>
</h1>
<%-- Work Header --%>
<%@ include file='/work/doDisplayHeaderWork.jspf' %>
<%-- Content iframe --%>
<jalios:message css="display-work-iframe-msg" level="<%= MessageLevel.INFO %>">
  <jalios:icon src="waitsmall" alt='loading' /> <%= glp("ui.work.dpl.loading") %>
</jalios:message>
<iframe id="displayWorkIframe" src="<%= iframeURL %>" class="invisible"></iframe>
<%@ include file='/work/doDisplayFooterWork.jsp' %> 
<%@ include file='/work/doWorkFooter.jspf' %>