<%@ include file='/jcore/doInitPage.jspf' %>
<%@ include file="/jcore/portal/doPortletParams.jspf" %>
<% 
  PortletQueryForeachCards box = (PortletQueryForeachCards) portlet; 
%> 
<%@ include file="/types/PortletQueryForeach/doQuery.jspf" %>
<%@ include file="/types/PortletQueryForeach/doSort.jspf" %>
<% 
  List<Publication> publications = new ArrayList<Publication>(); 
  Map<Publication, Map<String, String[]>> displayUrlParamsPubMap = new HashMap<Publication, Map<String, String[]>>();
%> 
<%@ include file="/types/PortletQueryForeach/doForeachHeader.jspf" %>
<% 
  publications.add(itPub); 
  displayUrlParamsPubMap.put(itPub, displayUrlParamsMap);
%>
<%@ include file="/types/PortletQueryForeach/doForeachFooter.jspf" %>
<%
  request.setAttribute("displayUrlParamsPubMap", displayUrlParamsPubMap);  
  request.setAttribute("enableDropdown", Boolean.valueOf(true));
%>
<jalios:cardsData collection="<%= publications %>" resource="cardsdata.jnews.dynamic" />
<% 
  request.removeAttribute("enableDropdown"); 
  request.removeAttribute("displayUrlParamsPubMap");
%>

<%@ include file="/types/PortletQueryForeach/doPager.jspf" %>