<%@ include file='/jcore/doInitPage.jspf' %><%@ page import="com.jalios.jcms.search.QueryAppHandler" %><%
  int boxStatus = Util.toInt(request.getAttribute("query.facets.date"),0);
  if (boxStatus == 0){ return; }
  
  String FACET_PREFIX = (String) request.getAttribute("query.facets.prefix");
  String lblPrefix = true ? "ui.fo.refine.lbl." : "ui.work.search.tab.";
  QueryAppHandler qh = (QueryAppHandler) request.getAttribute("query.facets.handler");

  
  boolean dsdBeginEndDate = qh.getBeginDate() != null || qh.getEndDate() != null;
  
  int dsdDateSince = dsdBeginEndDate ? 0 : qh.getDateSinceInt();
  
  boolean check1Day    = dsdDateSince == 1;
  boolean check1Week   = dsdDateSince == 7;
  boolean check1Month  = dsdDateSince == 30;
  boolean check1Year   = dsdDateSince == 365;
  boolean checkAnytime = !(check1Day || check1Week || check1Month || check1Year || dsdBeginEndDate);
  
  if (!checkAnytime){
    boxStatus = 1;
  }

  String sidebarFilterId="filterDates";
  boolean collapsed =  boxStatus == 2;
  boolean showDateType = Util.toBoolean(request.getAttribute("query.facets.date.show-date-type"),true);
%>

<jalios:appSidebarSection icon="search-date" title='<%= glp(showDateType ? lblPrefix + "date" : "ui.fo.query.date") %>' name="date" collapsable="true" collapsed='<%= collapsed %>'>
  <%-- DATE SINCE --%>
  <jalios:field name="dateSince" resource="field-app" value="<%= dsdDateSince %>">
    <jalios:control settings='<%= qh.getDateSinceSettings() %>' />
  </jalios:field>
  <input type="hidden" name="prevDateSince" value="<%= qh.getDateSinceInt() %>" />
  
  <%-- DATE TYPE --%>
  <% if (showDateType) { %>
  <jalios:field  name='<%= "dateType" %>' required='<%= true %>' value='<%= qh.getDateType()  %>' resource="field-app">
    <jalios:control settings='<%= qh.getDateTypeSettings() %>' />
  </jalios:field>
  <% } %>
  
  <%-- BEGIN DATE --%>
  <jalios:field resource="field-app">
    <jalios:control settings='<%= qh.getBeginDateSettings() %>' />
  </jalios:field>
  
  <%-- END DATE --%>
  <jalios:field resource="field-app">
    <jalios:control settings='<%= qh.getEndDateSettings() %>' />
  </jalios:field>
</jalios:appSidebarSection>