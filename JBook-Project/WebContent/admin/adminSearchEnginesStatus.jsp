<%@ page import="com.jalios.jcms.search.LuceneDataSearchEngine" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%

  if (!checkAccess("admin/operation/search-engines")) {
    sendForbidden(request, response);
    return;
  }

  final LuceneDataSearchEngine se;
  String seName = getAlphaNumParameter("se", null);
  if ("cat".equals(seName)) {
    se = (LuceneDataSearchEngine) channel.getQueryManager().getCategorySearchEngine();
  } else { //if ("pub".equals(se)) {
    se = (LuceneDataSearchEngine) channel.getQueryManager().getPublicationSearchEngine();
  } 
  
  boolean isOperationRunning = se.isOperationRunning();
  int operationPercent = se.getProgressState();
  long elapsedTime = System.currentTimeMillis() - se.getOperationStartTime();
  long timeRemaining = (operationPercent <= 0) ? 0 : (((elapsedTime * 100) / operationPercent) - elapsedTime);
  
  long freeMemory = Runtime.getRuntime().freeMemory();
  long totalMemory = Runtime.getRuntime().totalMemory();
  String usedMemoryStr = Util.formatFileSize(totalMemory-freeMemory, userLocale); 
  String totalMemoryStr = Util.formatFileSize(totalMemory, userLocale); 
  int percentMemory = (int)((totalMemory-freeMemory) * 100 / totalMemory);
  
%><% if (!jcmsContext.isAjaxRequest()) { %>
<%@ include file='/jcore/doEmptyHeader.jspf' %> 
<%}%>
<div class="ajax-refresh-div ajax-lazy searchEngineStatus well" 
     data-jalios-ajax-refresh-url="admin/adminSearchEnginesStatus.jsp?se=<%=encodeForURL(seName)%>"
     data-jalios-ajax-refresh-periodical="5">
	<div class='container-fluid'>
		<div class='row'>
			<div class="col-md-12">
				<strong><%= glp(isOperationRunning ? "ui.adm.search.lucene.op-running" : "ui.adm.search.lucene.op-finished") %></strong>        	
			</div>
		</div>
  <% if (isOperationRunning) { %>
		<div class='row'>
      <div class="col-md-12">
	      <div class="progress">        	
				  <div class="progress-bar" role="progressbar" aria-valuenow="<%=operationPercent%>" aria-valuemin="0" aria-valuemax="100" style="min-width: 2em; width: <%=operationPercent%>%;">
				    <%=operationPercent%>%
				  </div>
				</div>			
			</div>   
    </div>
    <div class='row'>
      <div class="col-md-12">		
	          <%= glp("ui.profiler.results.memory") %>: <%= usedMemoryStr %> / <%= totalMemoryStr %> (<%= percentMemory %>%)
	          <% if (timeRemaining != 0 ) { %>
	          <br /><%= glp("ui.analytics.lbl.remain") %>: <jalios:duration time='<%= timeRemaining %>' />
	          <% } %>
			</div>
		</div>
  <% } else {%>
  <jalios:javascript>setTimeout(jQuery.jalios.Browser.reload, 5000);</jalios:javascript>
  <% } %>
  </div>
 <%@ include file='/jcore/doAjaxFooter.jspf' %>  
</div>
<% if (!jcmsContext.isAjaxRequest()) { %>
<%@ include file='/jcore/doEmptyFooter.jspf' %> 
<%}%>