<%@page import="com.jalios.jcms.taglib.list.DataListItemTag"%><%
%><%@page import="com.jalios.jcms.taglib.list.ListItemTag"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%

if (!isLogged || !loggedMember.isWorker()) {
  request.setAttribute("ShowPortalElement", Boolean.FALSE);
  return;
}

%><jsp:useBean id="handler" scope="page" class="com.jalios.jcms.handler.PortletWorkflowHandler"><%
  %><jsp:setProperty name="handler" property="request"  value="<%= request %>"/><%
  %><jsp:setProperty name="handler" property="response" value="<%= response %>"/><%
%></jsp:useBean><%
if(portlet == null){
  String portletId =getAlphaNumParameter("portlet", "");
  portlet= (PortalElement) channel.getData(portletId);
}
%><div class="ajax-refresh-div ajax-lazy" data-jalios-ajax-refresh-url="types/PortletWorkflow/doPortletWorkflowFullDisplay.jsp?portlet=<%=portlet.getId() %>"><%
if (!jcmsContext.isAjaxRequest()) {
  jcmsContext.addJavaScript("js/jalios/core/components/jalios-loading-waves.js");
  jcmsContext.addCSSHeader("css/jalios/core/components/loading/jalios-loading-waves.css");
 %>
 <jalios:javascript>
  jQuery(".ajax-loading-elt").displayLoadingWaves();
 </jalios:javascript>
 <div class="ajax-loading-elt" style="height: 200px; position: relative;"></div><%
}
else {
	PortletWorkflow box = (PortletWorkflow) portlet;
	String orderBy = (String) box.getFieldValue(jcmsContext, "orderBy");
	
	Set<Publication> allResultSet = handler.getPublicationSet(box.getQueries(), box.getMaximumItemsPerWorkspace(), orderBy);
	
	if (box.getHideWhenNoResults() && Util.isEmpty(allResultSet)) {
	  request.setAttribute("ShowPortalElement", Boolean.FALSE);
	  return;
	}
	
	ServletUtil.backupAttribute(pageContext, "skin.show-add");
	request.setAttribute("skin.show-add", false);
	try{
		int[] boxPageSizes = (int[]) box.getFieldValue(jcmsContext, "pageSizes");
		int minPageSize = 10;
		if(!Util.isEmpty(boxPageSizes)){
		  int[] pageSizes = Arrays.copyOf(boxPageSizes, boxPageSizes.length);
		  Arrays.sort(pageSizes);
		  minPageSize = pageSizes[0];
		}
		if (Util.isEmpty(allResultSet)) { 
	    	%><jalios:portletBoxNoResult text="types.PortletWorkflow.no-result" icon="portlet-workflow-no-result"/><%
	  	} else {
		  	%><jalios:pager name='pagerHandler' 
		  	                declare='true' 
		  	                action='init' 
		  	                pageSize='<%=minPageSize %>' 
		  	                paramPrefix='<%= PortalManager.PORTAL_ACTION+"_"+box.getId()+"_" %>'
		  	                size='<%= allResultSet.size() %>' 
		  	                sizeAccurate='<%=  handler.isResultSizeAccurate() %>'/>
		  	
		  	<jalios:list>
		  	<jalios:foreach collection="<%= allResultSet %>" 
		  	                type="Publication" 
		  	                name="itPub"
		  	                max="<%= pagerHandler.getPageSize() %>"
		  	                skip="<%= pagerHandler.getStart() %>">
		  	    <jalios:dataListItem template="default" data="<%= itPub %>" dataDate="<%= itPub.getDate(orderBy) %>">
		  	      <jalios:buffer name='LIST_ITEM_META_PREPEND'>
		  	        <%= itPub.getWFStateLabelHtml(userLang) %>
		  	      </jalios:buffer>
		  	    </jalios:dataListItem>
		  	  </jalios:foreach>
		  	  <jalios:pager name='pagerHandler' template='pqf' />
		  	</jalios:list><%
   		}
	} finally {
		ServletUtil.restoreAttribute(pageContext, "skin.show-add");
	}
}%>
<%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>