<%@page import="com.jalios.jcmsplugin.smartphone.portal.SmartPhonePortalManager"%>
<%@page import="com.jalios.jcmsplugin.smartphone.portal.SmartPhonePortalStructure"%>
<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %> 
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.smartphone.portal.SmartPhonePortalEditorHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
</jsp:useBean><%
SmartPhonePortal smartphonePortal = (SmartPhonePortal) formHandler.getPortal();

if (smartphonePortal == null) {
  smartphonePortal = (SmartPhonePortal) jcmsContext.getAjaxRequestAttribute("portal");
}

if (smartphonePortal == null) {
  return;
}

int start = getIntParameter("start", 0);
List<SmartPhonePortalStructure> structures = SmartPhonePortalManager.getInstance().getPortalStructures(smartphonePortal, start, 51);

boolean hasMore = Util.getSize(structures) > 50;

SmartPhonePortalStructure lastStructure = structures.get(0);

%>
<div class="ajax-refresh-div" data-jalios-ajax-refresh-url="plugins/SmartPhonePlugin/jsp/portalEditor/doSmartphonePortalHistoryResult.jsp">
	<% for(SmartPhonePortalStructure structure : structures){ %>
	  <a class="list-group-item portal-history-item" 
	  	data-smartphone-portal-action="load-history-item" data-jalios-portal-url="plugins/SmartPhonePlugin/jsp/index-portal.jsp?portalId=<%= smartphonePortal.getId() %>&amp;structure=<%= structure.getId() %>" data-jalios-structure-id="<%= structure.getId() %>">
      <% if(structure.getPublished()){ %>
	      <% String publishedTitle = glp("portal.edition.history.published-by.label", JcmsUtil.getFriendlyDate(getZonedDateTime(structure.getMdate()), java.time.format.FormatStyle.SHORT, true, loggedMember.getLocale())); %>
	      <span class="portal-state published-state" title='<%= publishedTitle %>'></span>
      <% } else { %>
        <span class="portal-state saved-state"></span>
      <% } %>
	    <% if (structure.getAuthor() != null) { %>
	    <div class="portal-history-item-meta">
	      <jalios:memberphoto member="<%= structure.getAuthor() %>"  link="false" size="<%= PhotoSize.ICON %>"/>
	      <% if (structure.getPublished()) { %>
		      <%= glp("portal.edition.history.published-by.label", structure.getAuthor().getFullName()) %>
	      <% } else { %>
          <%= glp("portal.edition.history.save-by.label", structure.getAuthor().getFullName()) %>
	      <% } %>
	    </div>
	    <% } %>
	    <div class="portal-history-item-meta portal-history-item-title">
	      <%= structure.getCustomTitle()==null?"":structure.getCustomTitle() %>
	    </div>
      <div class="portal-history-item-date"><jalios:date format='<%= glp("date-time-format") %>' date="<%= structure.getCdate() %>"/></div>
      <jalios:icon src="glyph: icomoon-arrow-right4" css="right-arrow" />
	  </a>
	<% } %>
	<% if (hasMore) { %>
		<a class="btn btn-default btn-show-more-history btn-block" data-jalios-ajax-refresh="noscroll" data-jalios-ajax-refresh-inner=".btn-show-more-history" data-jalios-action="ajax-refresh" 
			 data-jalios-options='{"params" : {"start":<%= start + 50 %>, "smartphonePortalId":"<%= smartphonePortal.getId()%>"}}'><%= glp("portal.edition.history.show-more") %></a>
	<% } %>
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>