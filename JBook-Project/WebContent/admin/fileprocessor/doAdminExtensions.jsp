<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.jcms.fileprocessor.*" %><%
%><%@ page import="com.jalios.jcms.fileprocessor.processingmanagement.*" %><%
%><%@ page import="com.jalios.jcms.fileprocessor.repository.*" %><%
%><%@ page import="com.jalios.jcms.fileprocessor.ui.*" %><%
%><%@ page import="com.jalios.jcms.handler.*"%><%
%><%@include file="fpUImethods.jspf" %><%

  if (!checkAccess("admin/operation/file-processor") || !FileProcessorManager.isEnabled()) { 
    sendForbidden(request, response);
    return;
  }

%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.fileprocessor.ui.FileProcessorAdminHandler'><%
  %><jsp:setProperty name="formHandler" property="pageContext" value="<%= pageContext %>"/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
 %></jsp:useBean><% 

  if (formHandler.validate()) {
    return;
  }
 
 FileProcessorManager fileProcessorManager = FileProcessorManager.getInstance();
 RepositoryManager repositoryManager = RepositoryManager.getInstance();
 Repository repository = formHandler.getRepository();

 if ( repository != null ) {
   // Variables relative to the current repository
   final RepositoryIndexer indexer = repository.getIndexer();
   final FileProcessingLog lastProcessingLog = getLastProcessingLog(repository); // DB query
   final int allPersistedFilesSetNbr = getAllPersistedFilesCount(repository); // DB query
%>
<jalios:cache id='<%= "FP-ExtensionsStats-" + (lastProcessingLog != null ? lastProcessingLog.getId() : "0") %>'>
<%    
    SortedSet<String> processorExtensionSet = repository.getFileProcessorExtensionSet();
    SortedSet<String> parserExtensionSet = repository.getFileParserExtensionSet();

    String percent;
    Map<String,Integer> extToCountMap = new HashMap<String,Integer>();
    
    SortedSet<String> indexableExtensionsWithFiles = new TreeSet<String>();
    indexableExtensionsWithFiles.addAll(processorExtensionSet);
    indexableExtensionsWithFiles.addAll(parserExtensionSet);
    for (Iterator<String> itExt = indexableExtensionsWithFiles.iterator(); itExt.hasNext(); ) {
      String extension = itExt.next();
      int count = getExtensionProcessedFileCount(repository, extension);
      extToCountMap.put(extension, count);
      // Filters "zero file" extension, but only when at least one file has been processed globally
      if (count == 0 && allPersistedFilesSetNbr != 0) {
        itExt.remove();
      }
    }
%>
<div id="FP-ExtensionsStats" class='tabinfo extensions ajax-refresh-div'>
<table class="table-data table-condensed">
  <thead>
    <tr>
      <th class='fit'>&nbsp;</th>
      <th class=''><%= glp("fileprocessor.adm.processorset.extensions") %></th>
      <th class='fit'><%= glp("fileprocessor.adm.processorset.statistics.processedfiles") %></th>
      <th class='fit'><%= glp("fileprocessor.adm.processorset.statistics.errorfiles") %></th>
      <th class='fit'><%= glp("fileprocessor.adm.processorset.statistics.blacklistedfiles") %></th>
    </tr>
  </thead>
  <tbody>
  <jalios:foreach collection="<%= indexableExtensionsWithFiles %>" 
                  name="itExtension" 
                  type="String" 
                  counter='itCounter' >
<%
    Integer extensionProcessedFileCountInteger = extToCountMap.get(itExtension);
    int extensionProcessedFileCount   = extensionProcessedFileCountInteger != null ? extensionProcessedFileCountInteger : 0; //getExtensionProcessedFileCount(repository, itExtension);
    int extensionErrorFileCount       = getExtensionErrorFileCount(repository, itExtension);
    int extensionBlackListedFileCount = getExtensionBlackListedFileCount(repository, itExtension);
%>
   <tr>
     <td class="fit text-right"><%= itCounter.intValue() %>.</td>
     <td>
      <%= getFileTypeIconFromExtension(itExtension) %> <%= itExtension %> 
     </td>
     <td>
      <%= extensionProcessedFileCount %>
      <%
        if (extensionProcessedFileCount != 0) {
          percent = FileProcessorUIUtil.getDisplayPercent(extensionProcessedFileCount, allPersistedFilesSetNbr);
      %>
        <%= (percent != null) ? "(" + percent + ")" : "" %>
      <% } /* extensionProcessedFileCount */ %>
     </td>
     <td>
        <%
          if (extensionErrorFileCount != 0) {
            percent = FileProcessorUIUtil.getDisplayPercent(extensionErrorFileCount, extensionProcessedFileCount); 
        %>
            <%= extensionErrorFileCount %>
            <%= (percent != null) ? "(" + percent + ")" : "" %>
        <% } /* extensionErrorFileCount */ %>
     </td>
     <td>
        <%
          if (extensionBlackListedFileCount != 0) {
            percent = FileProcessorUIUtil.getDisplayPercent(extensionBlackListedFileCount, extensionProcessedFileCount); 
        %>
            <%= extensionBlackListedFileCount %>
            <%= (percent != null) ? "(" + percent + ")" : "" %>
        <% } /* extensionBlackListedFileCount */ %>
     </td>
   </tr>
   </jalios:foreach>
  </tbody>
</table>
</div>
</jalios:cache>
<% } /* showExtensionsTab */ %>