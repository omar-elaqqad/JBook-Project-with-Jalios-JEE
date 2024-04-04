<%@ include file='/jcore/doInitPage.jspf' %><%@ page import="com.jalios.jcms.handler.QueryHandler" %><%
  int boxStatus = Util.toInt(request.getAttribute("query.facets.pstatus"),0);
  if (boxStatus == 0){ return; }
  
  String FACET_PREFIX = (String) request.getAttribute("query.facets.prefix");
  String lblPrefix = true ? "ui.fo.refine.lbl." : "ui.work.search.tab.";
  QueryHandler qh = (QueryHandler) request.getAttribute("query.facets.handler");
  
  int[] dspPstatus = Util.toIntArray(qh.getPstatus(),0);
  if (dspPstatus != null) { 
    Arrays.sort(dspPstatus); // Required before calling Arrays.binarySearch() 
  } 
  Workflow wf = workspace.getWorkflow(Content.class); 
  
  List<Object> values = new ArrayList<Object>();
  List<String> labels = new ArrayList<String>();
  
  for(WFState itState: wf.getStateSet()) {
    values.add(itState.getPstatus());
    labels.add(itState.getLabel(userLang));
  }
  
  if (Util.notEmpty(qh.getPstatus())) {
    boxStatus = 1;
  }
  
  String sidebarFilterId="filterPstatus";
  boolean collapsed =  boxStatus == 2;
%>
<jalios:appSidebarSection icon="search-status" title='<%= glp("ui.work.search.tab.state") %>' name="pstatus" collapsable="true" collapsed='<%= collapsed %>'>
  <jalios:field name="pstatus" resource="field-light" value="<%= dspPstatus %>">
    <jalios:control settings='<%= 
    new EnumerateSettings().checkbox()
    .enumValues(values)
    .enumLabels(labels)
    .dataAttribute("jalios-action", "ajax-refresh") %>' />
  </jalios:field>
</jalios:appSidebarSection>
