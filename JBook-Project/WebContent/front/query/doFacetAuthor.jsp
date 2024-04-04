<%@ include file='/jcore/doInitPage.jspf' %><%@ page import="com.jalios.jcms.handler.QueryHandler" %><%
  int boxStatus = Util.toInt(request.getAttribute("query.facets.author"),0);
  if (boxStatus == 0){ return; }
  if (loggedMember == null){ return; }
  
  String FACET_PREFIX = (String) request.getAttribute("query.facets.prefix");
  String lblPrefix = true ? "ui.fo.refine.lbl." : "ui.work.search.tab.";
  QueryHandler qh = (QueryHandler) request.getAttribute("query.facets.handler");
  
  String[] mids=  qh.getMids();
  String[] gids=  qh.getGids();
  if (Util.notEmpty(mids) || Util.notEmpty(gids)){
    boxStatus = 1;
  }
  String sidebarFilterId="filterAuthor";
  boolean collapsed =  boxStatus == 2;
%>
<jalios:appSidebarSection icon="search-author" title='<%= glp(lblPrefix + "group") %>' name="author" collapsable="true" collapsed='<%= collapsed %>'>
  
  <% String authorHtmlAttributes = "title=\"" + glp("ui.com.placeholder.member") + "\""; %>
  <jalios:field name="mids"  label="" css="nodnd accountOnly" value="<%= mids %>" resource="field-app"> 
    <jalios:control settings='<%= 
    new MemberSettings()
    .dataAttribute("jalios-event", "change")
    .dataAttribute("jalios-action", "ajax-refresh")
    .aria("label", glp("ui.com.placeholder.member"))
    .htmlAttributes(authorHtmlAttributes)
    .filter(MemberSettings.MemberFilter.ACCOUNT)
    .addOption(BasicSettings.CLEAR_BUTTON, Util.notEmpty(qh.getMids()))
    .placeholder("ui.com.placeholder.member") %>' />
  </jalios:field>

  <% String groupHtmlAttributes = "title=\"" + glp("ui.com.placeholder.group") + "\""; %>
  <jalios:field name="gids"  label="" css="nodnd" value="<%= qh.getGids() %>" resource="field-app"> 
	  <jalios:control settings='<%= new 
    GroupSettings()
    .dataAttribute("jalios-event", "change")
    .dataAttribute("jalios-action", "ajax-refresh")
    .aria("label", glp("ui.com.placeholder.group"))
    .htmlAttributes(groupHtmlAttributes)
    .addOption(BasicSettings.CLEAR_BUTTON, Util.notEmpty(qh.getGids()))
    .placeholder("ui.com.placeholder.group") %>' />
	</jalios:field>
</jalios:appSidebarSection>
