<%@page import="com.jalios.jcms.media.MediaProgressionManager"%>
<%@page import="com.jalios.jcms.memberpreference.*"%>
<% request.setAttribute("CheckCSRF", Boolean.TRUE); %>
<%@ include file='/jcore/doInitPage.jspf' %>

<% 
if(!isLogged){
  return;
}
FileDocument fileDocument = getDataParameter("fileDocumentId", FileDocument.class);
MediaProgressionManager.getInstance().completeMediaProgression(fileDocument, loggedMember);
%>