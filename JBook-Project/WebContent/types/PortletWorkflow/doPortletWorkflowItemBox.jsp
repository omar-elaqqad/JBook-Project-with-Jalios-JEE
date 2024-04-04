<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%
%><jsp:useBean id="handler" scope="page" class="com.jalios.jcms.handler.PortletWorkflowHandler"><%
  %><jsp:setProperty name="handler" property="request"  value="<%= request %>"/><%
  %><jsp:setProperty name="handler" property="response" value="<%= response %>"/><%
%></jsp:useBean><%
%><%
  if (!isLogged || !loggedMember.isWorker()) {
    request.setAttribute("ShowPortalElement", Boolean.FALSE);
    return;
  }

  PortletWorkflow box = (PortletWorkflow) portlet;
  String orderBy = box.getOrderBy();

  Set<Publication> allResultSet = handler.getPublicationSet(box.getQueries(), box.getMaximumItemsPerWorkspace(), orderBy);

  if (box.getHideWhenNoResults() && Util.isEmpty(allResultSet)) {
    request.setAttribute("ShowPortalElement", Boolean.FALSE);
    return;
  }
  ServletUtil.backupAttribute(pageContext, "skin.show-add");
  request.setAttribute("skin.show-add", false);
  try{
	  int[] boxPageSizes = box.getPageSizes();
	  int minPageSize = 10;
	  if(!Util.isEmpty(boxPageSizes)){
	    int[] pageSizes = Arrays.copyOf(boxPageSizes, boxPageSizes.length);
	    Arrays.sort(pageSizes);
		  minPageSize = pageSizes[0];
	  }
	%>
	
	
	<jalios:pager name='pagerHandler' 
	                declare='true' 
	                action='init' 
	                pageSize='<%=minPageSize %>' 
	                paramPrefix='<%= PortalManager.PORTAL_ACTION+"_"+box.getId()+"_" %>'
	                size='<%= allResultSet.size() %>' 
	                sizeAccurate='<%=  handler.isResultSizeAccurate() %>'/>
	<ul class="item-box">
	
	<jalios:foreach collection="<%= allResultSet %>" 
	                type="Publication" 
	                name="itPub"
	                max="<%= pagerHandler.getPageSize() %>"
	                skip="<%= pagerHandler.getStart() %>">
	  <li class="item">
	    <div class="item-icons-large">
	      <jalios:edit data="<%= itPub %>" />
	    </div>
	    <% Date itemDate = itPub.getDate(orderBy); %>
	    <%@ include file="/jcore/doItemBoxDate.jspf" %>  
	    <%= itPub.getWFStateLabelHtml(userLang) %>
	    <jalios:link data="<%= itPub %>" />
	  </li>
	</jalios:foreach>
	</ul>
	<jalios:pager name='pagerHandler' template='pqf' />
<%} 
  finally {
  	ServletUtil.restoreAttribute(pageContext, "skin.show-add");
  }  
  %>	
