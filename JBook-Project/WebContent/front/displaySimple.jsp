<%@ include file='/jcore/doInitPage.jspf' %><%

  // -- Set the portal --------------------------------------------
  PortalInterface tmpPortal = getDataParameter("portal", PortalInterface.class);
  if (tmpPortal != null){
    displayPortal = tmpPortal;
    request.setAttribute(PortalManager.PORTAL_PORTAL,displayPortal);
  }
  
  if (displayPortal instanceof Portal){
    jcmsContext.addCSSHeader(((Portal)displayPortal).getCssFile());
  }
  
  // -- Set the cid -----------------------------------------------
  Category tmpCid = getCategoryParameter("cid");
    if (tmpCid != null){
    request.setAttribute(PortalManager.PORTAL_CURRENTCATEGORY,tmpCid);
    request.setAttribute(PortalManager.PORTAL_PORTALCATEGORY,tmpCid);
  }
  
  // -- Set the publication ---------------------------------------
  Publication publication = getPublicationParameter("id");
  if (publication == null) {
    return;
  }
  if (!publication.canBeReadBy(loggedMember)) {
    sendForbidden(request, response); 
    return;
  }
  
%><jalios:buffer name="displayBuffer"><%
  %><jalios:include pub='<%= publication %>'></jalios:include><%
%></jalios:buffer><%
%><%@ include file='/jcore/doEmptyHeader.jspf' %><%
%><div class="simpleDisplay"><%= displayBuffer %></div><%
%><%@ include file='/jcore/doEmptyFooter.jspf' %>