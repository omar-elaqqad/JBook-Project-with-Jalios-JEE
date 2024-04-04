<%@ include file="/jcore/doInitPage.jspf" %>
<%@ include file="/jcore/portal/doPortletParams.jspf" %>
<% PortletQueryForeach box = (PortletQueryForeach) portlet;  %>

<%@ include file="/types/PortletQueryForeach/doQuery.jspf" %>
<%@ include file="/types/PortletQueryForeach/doSort.jspf" %>

<% Publication displayedPub = null; %>
<%@ include file="/types/PortletQueryForeach/doForeachHeader.jspf" %>
  <%     
  boolean hasParent = itPub.getTreeParent() != null;
  if (itPub instanceof com.jalios.jcms.portlet.PortalElement) {
    %><jalios:include pub="<%= itPub %>" /><hr /><%
  } else if (!hasParent) {
    displayedPub = itPub;
    request.setAttribute("isInContentFullDisplay", Boolean.TRUE);
    %><jsp:include page='<%= "/"+itPub.getTemplatePath(jcmsContext) %>' flush="true" /><hr /><%
    request.removeAttribute("isInContentFullDisplay");
  } else { %>
		<jalios:include pub="<%= itPub %>" usage="query"/>
  <% } %>
<%@ include file="/types/PortletQueryForeach/doForeachFooter.jspf" %>
<%
request.setAttribute("doPortletQueryForeachFulls.publication", displayedPub); 
%>
<%@ include file="/types/PortletQueryForeach/doPager.jspf" %>
