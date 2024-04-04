<%@page import="com.jalios.jcms.handler.PagerHandler"%>
<%@ page contentType="text/html; charset=UTF-8" %><%
%><%--
  @Summary: PortletMyLocks display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%
%><% 

boolean unlock = getBooleanParameter("opUnlock", false);
if (unlock) {
  Publication unlockedPub = getPublicationParameter("id");
  if (loggedMember.canWorkOn(unlockedPub) && unlockedPub.isStrongLocked()) {
    unlockedPub.releaseStrongLock(loggedMember);
    HibernateUtil.commitTransaction();
    HibernateUtil.beginTransaction();
  }
}

PortletMyLocks box = (PortletMyLocks)portlet;
Set<Content> lockSet = StrongLockManager.getInstance().getLockedDataSet(Content.class, loggedMember);

DataSelector selector = null;
if (box.getRefineWorkspace()) {
  selector = Publication.getWorkspaceSelector(workspace);
}
lockSet = JcmsUtil.select(lockSet, selector, new ReverseComparator(Publication.getMdateComparator()));

String paramPrefix = PortalManager.PORTAL_ACTION+"_"+box.getId()+"_";
%>

<div class="my-locks">
  <% if (Util.isEmpty(lockSet)) { %>
  <%= glp("ui.adm.data-report.doc.no-lock") %>
  <% } else { %>
  <jalios:pager name='pagerHandler' 
                  declare='true' 
                  action='init' 
                  pageSize='10' 
                  paramPrefix='<%= paramPrefix %>'
                  size='<%= lockSet.size() %>'/>
  
  <jalios:list>
	  <jalios:foreach collection="<%= lockSet %>" type="Publication" name="itPub" max="<%= pagerHandler.getPageSize() %>" skip="<%= pagerHandler.getStart() %>">
		  <jalios:dataListItem data="<%= itPub %>">
		    <jalios:buffer name='LIST_ITEM_META'>
		      <span class="itemlist-item-date"><jalios:date date="<%= itPub.getStrongLockDate() %>" format="short"/></span>                      
		    </jalios:buffer>
        <jalios:buffer name='LIST_ITEM_ACTIONS'>
          <div class="dropdown itemlist-item-actions">
            <a data-jalios-options='{"nohistory":true, "noscroll" : true, "params": {"<%= paramPrefix %>pageSize": <%= pagerHandler.getPageSize() %>,"<%= paramPrefix %>start" : "<%= pagerHandler.getStart() %>", "opUnlock": true, "id": "<%= itPub.getId() %>"}}' data-jalios-action="ajax-refresh" class="btn btn-default btn-sm" type="button"><%= glp("ui.com.alt.unlock") %></a>
          </div>                  
        </jalios:buffer>	    
		  </jalios:dataListItem>
	  </jalios:foreach>
  </jalios:list>
  <jalios:pager name='pagerHandler' template='pqf' />
  <% } %>
</div>
