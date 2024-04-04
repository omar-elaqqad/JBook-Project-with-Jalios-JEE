<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.jcms.handler.PagerHandler" %><%

  boolean isSpan = getBooleanParameter("span",false);
  if (isSpan){ 
    out.println("&nbsp;");  return; // No links because there is no link's name
  }

  String qs = getUntrustedStringParameter("params",null); // ENCODE !!
  if (Util.isEmpty(qs)){
    return;
  }
  
  int pageSize = Math.min(getIntParameter("max", PagerHandler.DEFAULT_PAGE_SIZE), PagerHandler.PAGER_ALL_LIMIT);
  
  com.jalios.jcms.handler.QueryHandler handler = new com.jalios.jcms.handler.QueryHandler(qs, request);
  handler.setAttribute(QueryFilter.PORTLET_QUERY, Boolean.TRUE); 
  handler.setLoggedMember(loggedMember);
  handler.setResponse(response);
  handler.setPageSize(pageSize);
  QueryResultSet qrSet = handler.getResultSet();
  if (qrSet == null){
    return;
  }
  
  boolean hasMoreThanPage = pageSize < qrSet.getTotalSize();
  
  Set<Publication> resultSet = qrSet;
  String sort = getAlphaNumParameter("sort", null);
  if (sort != null){
    resultSet = qrSet.getAsSortedSet(sort, false);
  }

  String cssClass = getUntrustedStringParameter("class", null);
  String cssStyle = getUntrustedStringParameter("style", null);
  
  cssClass = cssClass != null ? "class=\"query "+encodeForHTMLAttribute(cssClass)+"\""   : "class=\"query\"";
  cssStyle = cssStyle != null ? "style=\""+encodeForHTMLAttribute(cssStyle)+"\""   : "";
%>
<ul <%= cssClass %> <%= cssStyle %>><%
  int qfeIdx = handler.getPageSize();
  for (Iterator<Publication> it = resultSet.iterator() ; it.hasNext() && qfeIdx > 0; qfeIdx--) {
    Publication itPub = it.next();
%><li><jalios:dataicon data="<%= itPub %>"/> <jalios:link data="<%= itPub  %>"/></li>
<% if (qfeIdx == 1 && hasMoreThanPage) { %><li class="list-unstyled"><a href="<%= ResourceHelper.getQuery() %>?<%= handler.getQueryString() %>"><jalios:icon src="search"/> <%= glp("ui.com.txt.more") %></a></li><% } %>
<% } %>
</ul>