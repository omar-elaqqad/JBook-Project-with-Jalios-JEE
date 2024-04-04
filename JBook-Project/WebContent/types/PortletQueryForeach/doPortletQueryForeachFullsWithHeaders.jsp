<%@ include file="/jcore/doInitPage.jspf" %>
<%@ include file="/jcore/portal/doPortletParams.jspf" %>
<% PortletQueryForeach box = (PortletQueryForeach) portlet;  %>

<%@ include file="/types/PortletQueryForeach/doQuery.jspf" %>
<%@ include file="/types/PortletQueryForeach/doSort.jspf" %>


<% 
Publication displayedPub = null; 
%>
<%@ include file="/types/PortletQueryForeach/doForeachHeader.jspf" %>
  <% 
  boolean hasParent = itPub.getTreeParent() != null;
  
  if (itPub instanceof com.jalios.jcms.portlet.PortalElement) {
    %><jalios:include pub="<%= itPub %>" /><hr /><%
  } else if (!hasParent) {
    displayedPub = itPub;
    request.setAttribute("isInContentFullDisplay", Boolean.TRUE);
    Publication publication = itPub;
    Publication pub = itPub;
    boolean hideSelectionSide = false;
  %>
    <div class="selection-wrapper pub-action-toggler-<%= publication.getId() %> pub-pstatus-<%= publication.getPstatus() %>">
      <% { %>
      <div class="selection-header"> 
        <%@ include file="/jcore/doDisplayHeader.jspf" %> 
      </div> 
      <% 
        hideSelectionSide = Util.toBoolean(request.getAttribute("jcms.publication.actions.hide"),false);
        String selectionMainClasses = hideSelectionSide ? " wide" : ""; 
      %>      
      <div class="selection-body"> 
        
        <% if(isLogged) { %>
          <div class="selection-side"> 
            <jalios:include jsp="<%= ResourceHelper.getPublicationAction() %>" />
          </div>
        <% } %>  
        
        <div class="selection-main<%= selectionMainClasses %>">
          <jsp:include page='<%= "/"+itPub.getTemplatePath(jcmsContext) %>' flush="true" />
        </div>
      </div>
      <% } %>
      <div class="selection-footer"> 
        <% { %><%@ include file="/jcore/doDisplayFooter.jspf" %><% } %>
      </div>
    </div>
    <hr />
    <% request.removeAttribute("isInContentFullDisplay"); %>
  <% } else {  %>
    <jalios:include pub="<%= itPub %>" usage="query"/>
  <% } %>
<%@ include file="/types/PortletQueryForeach/doForeachFooter.jspf" %>
<% request.setAttribute("doPortletQueryForeachFulls.publication", displayedPub); %>
<%@ include file="/types/PortletQueryForeach/doPager.jspf" %>