<%@page import="com.jalios.jcms.tracking.*"%><%

// inform doInitPage to set the proper content type
request.setAttribute("ContentType", "text/csv; charset=" + channel.getProperty("csv.charset"));
%><%@ include file='/jcore/doInitPage.jspf' %><%

if (!isLogged) {
  sendForbidden(request, response);
  return;
}
ReaderTrackerManager readerMgr = ReaderTrackerManager.getInstance();
if (readerMgr.isReaderTrackerAnonymized()) {
  return;
}

%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.tracking.ReaderTrackerHandler'><%
  %><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
  %><jsp:setProperty name='formHandler' property='noRedirect' value='true'/><%
%></jsp:useBean><%
formHandler.validate();

Publication trackedPub = formHandler.getTrackedPub();
Set<ReaderTracker> accessSet = formHandler.getReaderTrackerSet();

formHandler.setAccessType(ReaderTracker.ACCESS_TYPE_DOWNLOAD);
Set<ReaderTracker> downloadSet = formHandler.getReaderTrackerSet();

Set<ReaderTracker> reportSet = new HashSet<ReaderTracker>();
reportSet.addAll(accessSet);
reportSet.addAll(downloadSet);

String csvDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
String csvFilename = csvDate + " - " + channel.getName() + " - " + trackedPub.getDataName(userLang) + " - reader-tracking.csv";
HttpUtil.addAttachmentHeader(response, csvFilename);

JcmsUtil.exportCSV(reportSet, userLang, out);
%>