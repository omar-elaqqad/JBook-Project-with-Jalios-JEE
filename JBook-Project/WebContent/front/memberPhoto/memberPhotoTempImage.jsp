<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.io.IOUtil" %><%
%><%@ page import="com.jalios.jcms.servlet.BinaryFileServlet" %><%
%><%@ page import="com.jalios.jcms.handler.EditMemberPhotoHandler" %><%
%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.handler.EditMemberPhotoHandler"><%
 %><jsp:setProperty name="formHandler" property="pageContext" value="<%= pageContext %>"/><%
 %><jsp:setProperty name="formHandler" property="*" /><%
 %><jsp:setProperty name='formHandler' property="noRedirect" value="true" /><%
 %><jsp:setProperty name='formHandler' property='member' value='<%= getMemberParameter("mbrId") %>' /><%
%></jsp:useBean><% 

if (formHandler.validate()) {
  return;
}

// Create a download ticket to the work file (which may be the current member photo, or a temporary file previously saved during upload)
File workFile = formHandler.getWorkFile();
if (workFile == null) {
  return;
}

String workFileExtension = IOUtil.getExtension(workFile);
String workFileContentType = channel.getProperty("file-document.ext." + workFileExtension, "image/jpeg");
String deliveredFilename = "mbr_photo_" + formHandler.getMember().getId() + "." + workFileExtension;

BinaryFileServlet.DownloadTicket ticket = new BinaryFileServlet.DownloadTicket(workFile, workFileContentType, deliveredFilename);
ticket.setDeleteFileAfterDelivery(false);
ticket.setUsePragmaNoCache(true);
ticket.sendToDownloadUrl(request, response);

%>