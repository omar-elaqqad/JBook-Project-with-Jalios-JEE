<%@ include file='/jcore/doInitPage.jspf' %>
<%@ include file="/jcore/portal/doPortletParams.jspf" %>
<% 
  PortletQueryForeachCards box = (PortletQueryForeachCards) portlet;
%> 
<%@ include file="/types/PortletQueryForeach/doQuery.jspf" %>
<%@ include file="/types/PortletQueryForeach/doSort.jspf" %>
<% 
  List<Publication> publications = new ArrayList<Publication>(); 
  if ("ShowMore".equals(box.getShowPager()) && isDynamicPubList) {
    box.setMaxResults(25); // 5 sections (2+3) of 5 items 
  }  
  Map<Publication, Map<String, String[]>> displayUrlParamsPubMap = new HashMap<Publication, Map<String, String[]>>();
%> 
<%@ include file="/types/PortletQueryForeach/doForeachHeader.jspf" %>
<% 
  publications.add(itPub); 
  displayUrlParamsPubMap.put(itPub, displayUrlParamsMap);
%>
<%@ include file="/types/PortletQueryForeach/doForeachFooter.jspf" %>
<% 
  request.setAttribute("enableDropdown", Boolean.valueOf(true));
  String layoutModel = "model3";
  request.setAttribute("layoutModel", layoutModel);
  request.setAttribute("displayUrlParamsPubMap", displayUrlParamsPubMap);
%>
<jalios:cardsData collection="<%= publications %>" resource="cardsdata.jnews.predictive" />
<% 
  request.removeAttribute("enableDropdown"); 
  request.removeAttribute("layoutModel"); 
  request.removeAttribute("displayUrlParamsPubMap");
%>

<%@ include file="/types/PortletQueryForeach/doPager.jspf" %>