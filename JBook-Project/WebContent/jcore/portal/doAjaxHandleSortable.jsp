<%@page import="generated.AbstractCollection"%>
<%
  // Check if there is a sort action 
  if (!com.jalios.jcms.HttpUtil.hasParameter(request, "dnd-sortable")) {
    return;
  }

%><% request.setAttribute("CheckCSRF", Boolean.TRUE); %><%
%><%@ page contentType="text/html; charset=UTF-8"  %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
  
Publication collection = (Publication) request.getAttribute(PortalManager.PORTAL_PORTALELEMENT);

// Check rights
if (!isLogged || !loggedMember.canWorkOn(collection)){
  jcmsContext.sendForbidden();
  return;
}

if (collection instanceof PortalJspCollection) {
  PortalJspCollection portalJspCollection = (PortalJspCollection) collection;
  ControllerStatus status = portalJspCollection.handleSortable(jcmsContext);
  if (status.hasFailed()){
    logger.warn(status.getMessage(userLang));
  }
} else if (collection instanceof PortletJspCollection) {
  ControllerStatus status = ((PortletJspCollection)collection).handleSortable(jcmsContext);
  if (status.hasFailed()){
    logger.warn(status.getMessage(userLang));
  }
}

%>