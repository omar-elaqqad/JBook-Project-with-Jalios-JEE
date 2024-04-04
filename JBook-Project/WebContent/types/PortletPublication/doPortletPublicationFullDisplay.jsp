<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%
%><% 
  PortletPublication obj = (PortletPublication)portlet; 
  Publication pub = (Publication) obj.getFieldValue(jcmsContext, "pub");
  
  if (pub == null || !pub.canBeReadBy(loggedMember)  || !pub.isInVisibleState()) {  
    request.setAttribute("ShowPortalElement", Boolean.FALSE);
    return;
  }
  
  Publication publication = pub; //variable used in /jcore/doDisplayHeader.jspf
  String template = (String) obj.getFieldValue(jcmsContext, "template");
  boolean displayHeader = obj.getBooleanFieldValue(jcmsContext, "showDisplayHeader");
  boolean displayFooter = obj.getBooleanFieldValue(jcmsContext, "showDisplayFooter");

  ServletUtil.backupAttribute(pageContext, PortalManager.PORTAL_PUBLICATION);  
  request.setAttribute(PortalManager.PORTAL_PUBLICATION, pub);                  
%>
<div class="selection-wrapper pub-action-toggler-<%= publication.getId() %> pub-pstatus-<%= publication.getPstatus() %>">
  <% if (displayHeader) { %>
    <div class="selection-header"> 
      <%@ include file="/jcore/doDisplayHeader.jspf" %> 
    </div>  
  <% } %>  
  <div class="selection-body">     
    <% if(isLogged && displayHeader) { %>
      <div class="selection-side"> 
        <jalios:include jsp="<%= ResourceHelper.getPublicationAction() %>" />
      </div>
    <% } %>  
    <div class="selection-main">
      <%
        String templatePath = pub.getTemplatePath(jcmsContext);
        if (Util.notEmpty(template)) {
          TypeEntry typeEntry = channel.getTypeEntry(pub.getClass());
          for (TypeTemplateEntry itTemplateEntry : typeEntry.getTemplateEntrySet()) {
            boolean rule1 = itTemplateEntry.getUsage().equals(TypeTemplateEntry.USAGE_DISPLAY_FULL);
            boolean rule2 = itTemplateEntry.getName().equals(template);
            if (rule1 && rule2) {
              templatePath = itTemplateEntry.getPath();
              break;
            }
          }
        }
      %>
      <jsp:include page='<%= "/"+templatePath %>' flush="true" />
    </div>
  </div>
  <% if (displayFooter) { %>
    <div class="selection-footer"> 
      <% { %><%@ include file="/jcore/doDisplayFooter.jspf" %><% } %>
    </div>
  <% } %>  
</div>

<% 
  // Add ReaderTracker
  if (Util.isEmpty(request.getAttribute("redirect")) && ReaderTrackerManager.getInstance().isPerformTrack(jcmsContext.getBrowser())) {
    publication.trackReader(loggedMember);
  }  
%>
<% ServletUtil.restoreAttribute(pageContext, PortalManager.PORTAL_PUBLICATION); %>