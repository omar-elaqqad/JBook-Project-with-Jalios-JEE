<%@ page contentType="text/html; charset=UTF-8" %><%
if (HttpUtil.hasParameter(request, "opClearHistory") || HttpUtil.hasParameter(request, "opHistoryDelete")) {
  request.setAttribute("CheckCSRF", Boolean.TRUE);
}
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%
%><%@ page import="com.jalios.jcms.recenthistory.*" %><%
%><%
	if (!isLogged) {
		request.setAttribute("ShowPortalElement",Boolean.FALSE); //hide the box
		return;
	} 
	
	PortletRecentHistory historyBox = (PortletRecentHistory) portlet;
	int pagerSize = historyBox.getPageSize();
	int historySize = historyBox.getHistorySize();
	boolean isFilterByWorkspace = Util.toBoolean(historyBox.getFilterOnCurrentWorkspace(), false);
	
	RecentHistoryManager rhMgr = RecentHistoryManager.getInstance();
	
	String recentHistoryWsId = isFilterByWorkspace && workspace != null ? workspace.getId() : null;
	boolean opClearHistory = getBooleanParameter("opClearHistory",false);
	
	if (opClearHistory) {
		rhMgr.clearHistory(loggedMember,recentHistoryWsId);
	}
	
	Publication recentPubToDelete = getPublicationParameter("recentPubId");
	if (getBooleanParameter("opHistoryDelete",false) && recentPubToDelete != null) {
		rhMgr.removeHistory(loggedMember,recentPubToDelete.getWorkspace().getId(),recentPubToDelete.getId());
	}
	
	Collection recentMemberPubCollection = rhMgr.getPubRecentHistory(loggedMember,recentHistoryWsId,historySize);

%>
<% if (opClearHistory) { %>
	<jalios:message msg="ui.recenthistory.msg.remove-all.info" title="" />
<% } %>
<% if (Util.notEmpty(recentMemberPubCollection)) { %>
	<jalios:pager name="pager" declare='true' action="init" size='<%=recentMemberPubCollection.size()%>' pageSize='<%= pagerSize %>' />
  <jalios:list>
		<jalios:foreach collection='<%= recentMemberPubCollection %>' type='Publication' name='itPub' max='<%= pager.getPageSize() %>' skip='<%= pager.getStart() %>' >
		  <% if (itPub != null) { %>
		    <jalios:dataListItem data="<%= itPub %>" css="has-action">
				  <jalios:buffer name='LIST_ITEM_META'>&nbsp;</jalios:buffer>
			    <jalios:buffer name='LIST_ITEM_ACTIONS'>
			      <div class="itemlist-item-actions">
					    <% if (loggedMember.canWorkOn(itPub)) { %>
					      <jalios:edit css="itemlist-item-actions ctx-caret-white" data="<%= itPub %>" ctxEdit="true"><jalios:icon src="glyph:icomoon-pencil" /></jalios:edit>
					    <% } %>
              <a class="ajax-refresh" data-jalios-ajax-refresh="nohistory" href='<%= com.jalios.util.ServletUtil.getResourcePath(request) %>?opHistoryDelete=true&amp;recentPubId=<%= itPub.getId() %>' title='<%= encodeForHTMLAttribute(glp("ui.com.alt.remove")) %>'><jalios:icon src="remove-small"/></a>
			      </div>
			    </jalios:buffer>
		    </jalios:dataListItem>
	    <% } %>
	  </jalios:foreach>
  </jalios:list>
  <jalios:pager name="pager" />
  <% 
    String suppressWarningMsg = glp("ui.recenthistory.msg.remove-all");
    String actionUrl = HttpUtil.getUrlWithCSRFToken(com.jalios.util.ServletUtil.getResourcePath(request) + "?opClearHistory=true", request, true);
  %>
  <a class="btn btn-default itemlist-action confirm ajax-refresh ajax-action" data-jalios-ajax-refresh="nohistory" data-jalios-text="<%= encodeForHTMLAttribute(suppressWarningMsg) %>" href='<%= actionUrl %>' ><%= glp("ui.recenthistory.lbl.clear") %></a>
<% } %>