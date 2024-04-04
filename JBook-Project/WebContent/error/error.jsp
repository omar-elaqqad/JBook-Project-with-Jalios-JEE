<%@ page contentType="text/html; charset=UTF-8"%><%
%><%@page import="com.jalios.jcms.uicomponent.topbar.TopbarHandler"%><%
try {
  Channel.getChannel().setCurrentServletRequest(request);
  Channel.getChannel().setCurrentServletResponse(response);
  
  request.setAttribute(JcmsConstants.IS_IN_FRONT_OFFICE, true);
  
  %><%@ include file="/jcore/doInitPage.jspf" %><%
  
  if (jcmsContext.isAjaxRequest()) { %><%
    %><jsp:include page="/error/defaultRaw.jsp" /><%
  %><% } else {    
      
  Object errorCode = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
  
  String pageTitle = JcmsUtil.glpNoDefault(userLang, "error." + errorCode + ".page-title");
  jcmsContext.setPageTitle(pageTitle != null ? pageTitle : glp("error.page-title"));
  
  jcmsContext.setPageZone(channel.getProperty("error." + errorCode + ".zone", channel.getProperty("error.zone", "Public")));
  
  String pageCss = channel.getProperty("error." + errorCode + ".page-css", channel.getProperty("error.page-css", null));  
  if (Util.notEmpty(pageCss)) {
    jcmsContext.addCSSHeader(pageCss);
  }
  
  %><%@ include file="/jcore/doEmptyHeader.jspf" %><%
  
  File f = new File(channel.getRealPath(channel.getProperty("error." + errorCode + ".jsp", "/error/" + errorCode + ".jsp")));
  String jsp = f.exists() ? "/" + channel.getRelativePath(f) : "/error/default.jsp";
  
  %><jalios:include jsp="<%= TopbarHandler.getTopbarResource(null) %>" /><%
  %><jalios:include jsp="<%= ResourceHelper.getSidebar() %>" /><%
  %><jsp:include page="<%= jsp %>" /><%

  %><%@ include file="/jcore/doEmptyFooter.jspf" %><%
  }
} catch(Throwable t) {
  %><jsp:include page="/error/default.jsp" /><%
}
finally{
  Channel.getChannel().clearCurrentServletRequest();
  Channel.getChannel().clearCurrentServletResponse();  
}   
%>