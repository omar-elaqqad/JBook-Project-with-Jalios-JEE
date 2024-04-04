<%-- 
  @Deprecated: False
  @Customizable: False
  @Requestable: True
  @Summary: Generic display page
  @Category: Internal
--%><%

  request.setAttribute(JcmsConstants.IS_IN_FRONT_OFFICE, Boolean.TRUE);

%><%@page import="com.jalios.jcms.uicomponent.topbar.TopbarHandler"%><% 
%><%@ include file='/jcore/doInitPage.jspf' %><%

  // ------------------------------------------------
  //  Descriptive URL - permanent redirect
  // ------------------------------------------------
  
  // If Descriptive URLs are enabled but this request does not use Descriptive URL,
  // ==> permanently redirect to the corresponding descriptive URL
  if (DescriptiveURLs.isEnabled() &&
      !com.jalios.jcms.servlet.DisplayServlet.isDisplayServletRequest(request)) {
    Data data = getDataParameter("id");
    String redirect = ServletUtil.getBaseUrl(request) +
                      JcmsUtil.getDisplayUrlWithAddedParam(data, userLocale, request, null, null, false);
    response.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);
    response.setHeader("Location", redirect); 
    return;
  }

  // ------------------------------------------------
  //  COMPUTE HISTORY 
  // ------------------------------------------------
  
  DisplayContext displayCtxt  = PortalManager.getDisplayContext(jcmsContext);
  
  // ------------------------------------------------
  //  HANDLE ERRORS / REDIRECT
  // ------------------------------------------------
  
  PortalPolicyManager.getInstance().checkDisplayContext(displayCtxt);
  
  if (displayCtxt == null || displayCtxt.isEmpty()){
    sendForbidden(request, response); 
    return;
  }
  
  if (displayCtxt.getRedirect() != null){
    sendRedirect(displayCtxt.getRedirect(), request, response);
    return;
  }
  
  // ------------------------------------------------
  //  HANDLE REQUEST ATTRIBUTES
  // ------------------------------------------------
  
  PortalManager.handleDisplayRequest(jcmsContext,displayCtxt,startPageRequest);


  // ------------------------------------------------
  //  HANDLE REDIRECT
  // ------------------------------------------------

  PortalInterface portal = jcmsContext.getPortal();
  if (portal instanceof PortalRedirect){
    request.setAttribute("title",portal.getTitle(userLang));
    AnalyticsManager.appendPageEvent(request, startPageRequest);
    String redirectUrl = ((PortalRedirect)portal).getRedirectURL(loggedMember,displayCtxt);
           redirectUrl = PortalPolicyManager.getInstance().checkRedirect(redirectUrl, (PortalRedirect)portal, displayCtxt, loggedMember);

    if (Util.isEmpty(redirectUrl)){
      logger.warn("RedirectURL is null with " + ((PortalRedirect)portal).getId());
      sendForbidden(request, response);
    }
    else {
      // Fix bug JCMS-2803 : PortletRedirect does not allow redirection to an external url 
      // Consider that all the redirect value specified in a Portlet Redirect are safe,
      // and use method sendRedirect() without security check
      // Improvement JCMS-3078 : Allow configuration of HTTP status code used for redirect
      int portletRedirectStatusCode = channel.getIntegerProperty("channel.redirect.portlet-redirect", HttpServletResponse.SC_MOVED_TEMPORARILY);
      request.setAttribute("force-redirect-status-code", portletRedirectStatusCode);
      JcmsContext.sendRedirect(redirectUrl, false, request, response);
    }
    return;
  }

  // ------------------------------------------------
  //  HANDLE DISPLAY
  // ------------------------------------------------

  displayPortal  = jcmsContext.getPortal();
  
  //Test JPortal disable of topbar
  if (displayPortal != null && displayPortal instanceof JPortal && !((JPortal)displayPortal).getDisplayTopbar()) {
    request.setAttribute(TopbarHandler.JCMS_TOPBAR_DISPLAY_REQUEST_ATTR, false);
  }
  
  displayPortlet = (PortalElement) jcmsContext.getPortal();
  workspace      = jcmsContext.getWorkspace();
  
  // Retrieve Portal Title
  String displayPortalTitle =  displayPortal.getTitle(userLang);
  if (displayPortal instanceof AbstractPortal){
    AbstractPortal absPortal = (AbstractPortal) displayPortal;
    if (Util.notEmpty(absPortal.getPageTitle())){
      displayPortalTitle = absPortal.getPageTitle();
    }
  }
  
  // PortalMode will force BO Workspace to FO Workspace to help all choosers
  if (isPortalMode){
    Workspace.setSessionWorkspace(session , workspace);
  }
  
  String pageTitle;
  // JCMS-8203: page title: get it from name of current category if any
  if (jcmsContext.getCurrentCategory() != null) {
    pageTitle = jcmsContext.getCurrentCategory().getName(userLang);
  } else {
    // And default to portal title
    pageTitle = displayPortalTitle;
  }
  request.setAttribute("title", pageTitle);
  request.setAttribute("storeBufferForContainer", Boolean.TRUE);
  
  %><jalios:include target="DISPLAY_BEFORE_RENDER" targetContext="empty" /><%
  %><%@ include file='/jcore/portal/doIncludePortlet.jspf' %><%
  Object storeBufferForContainer = request.getAttribute("storeBufferForContainer");
  if (storeBufferForContainer == Boolean.TRUE){ 
    jcmsContext.sendForbidden();
    return;
  }
  %><jalios:include target="DISPLAY_AFTER_RENDER" targetContext="empty" /><%
      
  String theBodyContent = Util.getString(storeBufferForContainer, "");
  request.removeAttribute("storeBufferForContainer");
  
%><%--
--%><jalios:buffer name="topbarBuffer"><jalios:include jsp="<%= TopbarHandler.getTopbarResource(TopbarHandler.Zone.FrontArea) %>" /></jalios:buffer><%--
--%><jalios:buffer name="sidebarBuffer"><jalios:include jsp='<%= ResourceHelper.getSidebar() %>' /></jalios:buffer><%--
--%><%@ include file='/jcore/doDisplayBuffer.jspf' %><%--  
--%><%@ include file='/jcore/doEmptyHeader.jspf' %><%--  
--%><%= topbarBuffer %><%--
--%><%= sidebarBuffer %><%--  
--%><%= theBodyContent %><%--  
--%><%@ include file='/jcore/profiler/doEndProfiler.jspf' %><%--  
--%><%@ include file='/jcore/doEmptyFooter.jspf' %>