<%@ include file='/plugins/ESNPlugin/jsp/common/doCommonParams.jspf' %>
<%@ page import="com.jalios.jcms.calendar.*" %>
<% Set<AbstractCalendarEvent> eventSet = esnMgr.getContactCalendarEventSet(member, loggedMember); %>
<% if (Util.notEmpty(eventSet)) { %>
<div class="esn-component esn-component-contact-calendar">
	<h2 class="esn-component-header">
	  <%= glp("jcmsplugin.esn.lbl.calendar") %>
	</h2>
	<div class="esn-component-body">
	<ul class="item-box">
  <jalios:pager name='eventPagerHandler' 
                declare='true' 
                action='init' 
                pageSize='5' 
                size='<%= eventSet.size() %>'/>
  <jalios:foreach collection="<%= eventSet %>" 
                  name="event" 
                  type="AbstractCalendarEvent"
                  max="<%= eventPagerHandler.getPageSize() %>"
                  skip="<%= eventPagerHandler.getStart() %>">
			<li>
            <% Date itemDate = event.getStartDate(); %>
            <%@ include file="/jcore/doItemBoxDate.jspf" %>  
          <% if (!DateUtil.isSameDay(event.getStartDate(), event.getEndDate())) { %>
            - <% itemDate = event.getEndDate(); %>
            <%@ include file="/jcore/doItemBoxDate.jspf" %>  
      <% } %>          	
			<jalios:dataicon data="<%= event %>" /> <jalios:link data="<%= event %>" />
  </jalios:foreach>
  </div>
  <jalios:pager name='eventPagerHandler' />
</div>
<% } %>
