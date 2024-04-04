<%@page import="com.jalios.jcms.media.MediaProgressionManager"%>
<%@page import="com.jalios.jcms.memberpreference.*"%>
<% request.setAttribute("CheckCSRF", Boolean.TRUE); %>
<%@ include file='/jcore/doInitPage.jspf' %>

<% 
if(!isLogged){
  return;
}
int progression = getIntParameter("progression", 0);
FileDocument fileDocument = getDataParameter("fileDocumentId", FileDocument.class);
MediaProgressionManager.getInstance().saveMediaProgression(fileDocument, loggedMember, progression);
%>