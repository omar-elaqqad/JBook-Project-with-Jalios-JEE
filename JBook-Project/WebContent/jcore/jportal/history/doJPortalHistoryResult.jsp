<%@page import="com.jalios.jcms.jportal.JPortalStructure"%>
<%@page import="com.jalios.jcms.jportal.JPortalManager"%>
<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %> 
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.jportal.JPortalEditorHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
</jsp:useBean><%
JPortal jPortal = (JPortal) formHandler.getAvailableJPortal();

if (jPortal == null) {
  jPortal = (JPortal) jcmsContext.getAjaxRequestAttribute("jPortal");
}

if (jPortal == null) {
  return;
}

int start = getIntParameter("start", 0);
List<JPortalStructure> structures = JPortalManager.getInstance().getJPortalStructures(jPortal, start, 51);

boolean hasMore = Util.getSize(structures) > 50;

JPortalStructure lastStructure = structures.get(0);
String displayUrl = jPortal.getDisplayUrl(userLocale);

%>
<div class="ajax-refresh-div" data-jalios-ajax-refresh-url="jcore/jportal/history/doJPortalHistoryResult.jsp">
	<% for(JPortalStructure structure : structures){ %>
	  <a class="list-group-item jportal-history-item" data-jalios-jportal-url="<%= displayUrl %>" data-jalios-structure-id="<%= structure.getId() %>">
      <% if(structure.isPublished()){ %>
	      <% String publishedTitle = glp("jportal.edition.history.published-by.label",JcmsUtil.getFriendlyDate(getZonedDateTime(structure.getMdate()), java.time.format.FormatStyle.SHORT, true, loggedMember.getLocale())); %>
	      <span class="jportal-state published-state" title='<%= publishedTitle %>'></span>
      <% } else { %>
        <span class="jportal-state saved-state"></span>
      <% } %>
	    <% if (structure.getAuthor() != null) { %>
	    <div class="jportal-history-item-meta">
	      <jalios:memberphoto member="<%= structure.getAuthor() %>"  link="false" size="<%= PhotoSize.ICON %>"/>
	      <% if (structure.isPublished()) { %>
		      <%= glp("jportal.edition.history.published-by.label", structure.getAuthor().getFullName()) %>
	      <% } else { %>
          <%= glp("jportal.edition.history.save-by.label", structure.getAuthor().getFullName()) %>
	      <% } %>
	    </div>
	    <% } %>
	    <div class="jportal-history-item-meta jportal-history-item-title">
	      <%= structure.getCustomTitle()==null?"":structure.getCustomTitle() %>
	    </div>
      <div class="jportal-history-item-date"><jalios:date format='<%= glp("date-time-format") %>' date="<%= structure.getCdate() %>"/></div>
      <jalios:icon src="glyph: icomoon-arrow-right4" css="right-arrow" />
	  </a>
	<% } %>
	<% if (hasMore) { %>
		<a class="btn btn-default btn-show-more-history btn-block" data-jalios-ajax-refresh="noscroll" data-jalios-ajax-refresh-inner=".btn-show-more-history" data-jalios-action="ajax-refresh" data-jalios-options='{"params" : {"start":<%= start + 50 %>}}'><%= glp("jportal.edition.history.show-more") %></a>
	<% } %>
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>