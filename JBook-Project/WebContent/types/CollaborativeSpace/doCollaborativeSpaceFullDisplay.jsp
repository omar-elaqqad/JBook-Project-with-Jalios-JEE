<%@page import="com.jalios.jcmsplugin.collaborativespace.portal.CSSyncUtils"%>
<%@ page contentType="text/html; charset=UTF-8" %><% 
%><%@page import="com.jalios.jcms.a11y.A11YConstants"%><%
%><%@ page import="com.jalios.jcmsplugin.collaborativespace.*" %><%  
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/front/doOpenModal.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%
%><jalios:include jsp="plugins/CollaborativeSpacePlugin/jsp/doCSDisplayHandler.jsp" /><%
CSDisplayHandler csHandler = (CSDisplayHandler) request.getAttribute("csDisplayHandler");
csHandler.validate();
JPortal jportal = csHandler.getAssociatedJPortal();
if(jportal == null){ // Should never happen
  sendRedirect("index.jsp"); 
  return;
}
CollaborativeSpace cs = csHandler.getCollaborativeSpace();
%>
<%-- Render body before producing cs layout (For H1 / A11Y) --%>
<jalios:buffer name="csBodyContent">
  <% if (csHandler.displayMetas()) { %>
   <%@ include file="/plugins/CollaborativeSpacePlugin/jsp/metas/doMetas.jspf" %>
  <% } %>
  <% if (csHandler.isFullAccess()) { %>
   <% if (Util.notEmpty(csHandler.getJsp()) && csHandler.isAuthorizedJspPath()) { %>
     <jalios:include jsp="<%= csHandler.getJsp() %>"  />
   <% } else if (Util.notEmpty(csHandler.getDisplayedPublicationOrPortlet())) { %>
     <%-- Bufferize content to check if any avoidance link or article tag has already been added by a appBodyInclude tag --%>
     <%-- If there's an app body publication, do not add selection wrapper around the app --%>
     <jalios:buffer name="pubIncludeContent"><jalios:include pub='<%= csHandler.getDisplayedPublicationOrPortlet() %>' usage="full" /></jalios:buffer>
     <% if (csHandler.generateH1ForPortlet()) { %>
       <h1 class="sr-only"><%= csHandler.getH1TitleForPortlet() %></h1>
     <% } %>
     <% if (csHandler.isAppDisplayed() && csHandler.isAppArticleDisplayed()) { %>
       <%= pubIncludeContent %>
     <% } else { %>
       <% 
         Publication publication = csHandler.getDisplayedPublicationOrPortlet();
         Publication pub = csHandler.getDisplayedPublicationOrPortlet();
         jcmsContext.addAvoidanceLink(A11YConstants.AVOIDANCE_LINK_CONTENT_DOM_ID, glp("a11y.avoidance-link.content"));
       %>
       <%-- Do not display article wrapper if an app is used --%>
       <% if (!csHandler.isAppDisplayed()) { %><article class="cs-pub-include-wrapper selection-wrapper" id="<%= A11YConstants.AVOIDANCE_LINK_CONTENT_DOM_ID %>"><% } %>
         <div class="selection-wrapper pub-action-toggler-<%= csHandler.getDisplayedPublicationOrPortlet().getId() %> pub-pstatus-<%= csHandler.getDisplayedPublicationOrPortlet().getPstatus() %>" <% if (csHandler.isAppDisplayed() && !csHandler.isAppArticleDisplayed()) {%>id="<%= A11YConstants.AVOIDANCE_LINK_CONTENT_DOM_ID %>"<% } %>>
           <div class="selection-header">
             <%@ include file='/jcore/doDisplayHeader.jspf' %>
           </div>
           <div class="selection-body">
             <%= pubIncludeContent %>
             <% boolean displaySelectionSide = !isLogged || Util.toBoolean(request.getAttribute("jcms.publication.actions.hide"),false); %>
             <% if (!displaySelectionSide && !(pub instanceof PortalElement)) { %>
               <div class="selection-side">
                 <% request.setAttribute("publication", csHandler.getDisplayedPublicationOrPortlet()); %>
                 <jalios:include jsp="<%= ResourceHelper.getPublicationAction() %>" />
               </div>
             <% } %>
           </div>
         </div>
         <div class="selection-footer">
           <%@ include file='/jcore/doDisplayFooter.jspf' %>
         </div>
       <% if (!csHandler.isAppDisplayed()) { %></article><% } %>
     <% } %>
   <% } else { %>
    <% 
     Object previousPortal = request.getAttribute("Portal");
     request.setAttribute("Portal", jportal);
     request.setAttribute("cs-jportal", true);
     request.setAttribute("jportal.is-simple-edit-available", csHandler.canSimpleEditJPortal());
     request.setAttribute("jportal.wrapperTag", "div");
     %>
    <jalios:include jsp="types/JPortal/doJPortalFullDisplay.jsp" />
    <% 
     request.setAttribute("Portal", previousPortal);
    request.removeAttribute("jportal.wrapperTag");
     request.removeAttribute("cs-jportal");
     %>
   <% } %>
  <% } %>
</jalios:buffer>
<jalios:include jsp="plugins/CollaborativeSpacePlugin/front/doHeaderSettingsStyle.jsp" />
<jalios:include target="PLUGIN_COLLABORATIVESPACE_PORTAL_TOP" />
<div class="cs-portal <%= csHandler.getCollaborativeSpaceWrapperCSS() %>" data-jalios-data-id="<%= cs.getId() %>" data-jalios-jportal-id="<%= jportal.getId() %>">
  <%@ include file="/types/CollaborativeSpace/doCollaborativeSpaceHeader.jspf" %>
  <% if (Util.toBoolean(request.getAttribute("isAppDisplayed"), false)) { %>
    <div id="cs-body" class="cs-body">
      <%= csBodyContent %>
    </div>
  <% } else {
    jcmsContext.addAvoidanceLink(A11YConstants.AVOIDANCE_LINK_CONTENT_DOM_ID, glp("a11y.avoidance-link.content"));
    %>
    <main id="cs-body" role="main" class="cs-body">
      <div id="<%= A11YConstants.AVOIDANCE_LINK_CONTENT_DOM_ID %>">
        <%= csBodyContent %>
      </div>
    </main>
  <% } %>
  <footer id="cs-footer"><jalios:include target="PLUGIN_COLLABORATIVESPACE_PORTAL_FOOTER" /></footer>
</div>
<jalios:include target="PLUGIN_COLLABORATIVESPACE_PORTAL_BOTTOM" />

<% request.removeAttribute("isCollaborativeSpaceDashboard");	%>