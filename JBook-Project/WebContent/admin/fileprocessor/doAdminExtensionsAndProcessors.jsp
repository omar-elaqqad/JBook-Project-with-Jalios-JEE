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

   Map processorClassAndRelatedRegisteredExtensionMap = repository.getComponentClassToExtensionSetMap();
   String percent;
%>
<jalios:cache id='<%= "FP-ProcessorsStats-" + (lastProcessingLog != null ? lastProcessingLog.getId() : "0")  %>'>
<div id="FP-ProcessorsStats" class='tabinfo extensionsandprocessors ajax-refresh-div'>
<table class="table-data table-condensed">
  <thead>
    <tr>
      <th class='fit'>&nbsp;</th>
      <th class='fit'><%= glp("fileprocessor.adm.processorset.processors") %></th>
      <th class=''><%= glp("fileprocessor.adm.processorset.extensions") %></th>
      <th class='fit'><%= glp("fileprocessor.adm.processorset.statistics.processedfiles") %></th>
      <th class='fit'><%= glp("fileprocessor.adm.processorset.statistics.errorfiles") %></th>
      <th class='fit'><%= glp("fileprocessor.adm.processorset.statistics.blacklistedfiles") %></th>
    </tr>
  </thead>
  <tbody>
<% if (Util.notEmpty(processorClassAndRelatedRegisteredExtensionMap)) { %>
  <jalios:foreach collection="<%= processorClassAndRelatedRegisteredExtensionMap.entrySet() %>" 
                  name="itProcessorClassAndExtension" 
                  type="Map.Entry" 
                  counter='itCounter' >
<%
	  Class itProcessorClass        = (Class)itProcessorClassAndExtension.getKey();
	  Set itExtensions              = (Set) itProcessorClassAndExtension.getValue();
	  FileActionComponent itProcessor = repository.getActionComponent(itProcessorClass);
    String componentClassname     = itProcessor != null ? itProcessorClass.getName() : itProcessorClass.getSimpleName();
	  int processorProcessedFileCount   = getComponentProcessedFileCount(repository, componentClassname);
	  int processorErrorFileCount         = getComponentErrorFileCount(repository, componentClassname);
	  int processorBlackListedFileCount = getComponentBlackListedFileCount(repository, componentClassname);
%>
   <tr>
     <td class="text-right"><%= itCounter.intValue() %>.</td>
     <td>
      <%= componentClassname %>
      <% if (itProcessor != null) { %>
      <jalios:icon src="help"  title='<%= itProcessor.getDescription() %>' alt='<%= glp("ui.com.lbl.hlp") %>' />
      <% } %> 
     </td>
     <td><%--
     --%><jalios:foreach collection="<%= itExtensions %>" name="itExtension" type="String" counter="itCounter2" ><%--
     --%><% if ( itCounter2.intValue() != 1 ) { %>&nbsp;&middot; <% } %>
        <%= getFileTypeIconFromExtension(itExtension) %>&nbsp;<%= itExtension %><%-- 
     --%></jalios:foreach>
     </td>
     <td>
      <%= processorProcessedFileCount %>
      <%
        if (processorProcessedFileCount != 0) {
          percent = FileProcessorUIUtil.getDisplayPercent(processorProcessedFileCount, allPersistedFilesSetNbr);
      %>
        <%= (percent != null) ? "(" + percent + ")" : "" %>
      <% } /* processorProcessedFileCount */ %>
     </td>
     <td class="text-right">
        <%
          if (processorErrorFileCount != 0) {
            percent = FileProcessorUIUtil.getDisplayPercent(processorErrorFileCount, processorProcessedFileCount); 
        %>
            <%= processorErrorFileCount %>
			      <%= (percent != null) ? "(" + percent + ")" : "" %>
        <% } /* processorErrorFileCount */ %>
     </td>
     <td>
        <%
          if (processorBlackListedFileCount != 0) {
            percent = FileProcessorUIUtil.getDisplayPercent(processorBlackListedFileCount, processorProcessedFileCount); 
        %>
			      <%= processorBlackListedFileCount %>
	          <%= (percent != null) ? "(" + percent + ")" : "" %>
        <% } /* processorBlackListedFileCount */ %>
     </td>
   </tr>
   </jalios:foreach>
<% } /* end of if processorMap not empty */ %>
  </tbody>
</table>
</div>
</jalios:cache>
<% } %>