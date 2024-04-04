<%@page import="com.jalios.jcms.uicomponent.indicator.IndicatorManager"%>
<%@ include file="/jcore/doInitPage.jspf" %><%
EditPortletIndicatorHandler formHandler = (EditPortletIndicatorHandler)request.getAttribute("formHandler");
if (formHandler == null) {
%>
<jalios:include jsp="types/PortletIndicator/doPortletIndicatorFormHandler.jsp" />
<%
formHandler = (EditPortletIndicatorHandler)request.getAttribute("PortletIndicator.formHandler");
} 
if (formHandler == null) { 
  return;
}
Map<String,Object> metricParameters = IndicatorManager.getInstance().getMetricParametersMap(formHandler.getAvailableMetricParameters());
List<Class> classList = new ArrayList<Class>();
classList.addAll(channel.getSubTypeList(Content.class, userLang));
classList.addAll(channel.getSubTypeList(UserContent.class, userLang));
Map<String,String> contentMap = new TreeMap<String,String>();
for (Class clazz : classList) {
  contentMap.put(channel.getTypeLabel(clazz,channel.getCurrentUserLang()),clazz.getName());
}
%>
<jalios:field name="type" value='<%=metricParameters.get("type") %>' label="indicator.metric.core.query-count.edit.type">
  <jalios:control settings='<%=new EnumerateSettings().select().enumValues(contentMap.values()).enumLabels(contentMap.keySet())%>'  />
</jalios:field>

<jalios:field name="currentWS" value='<%=Util.toBoolean(metricParameters.get("currentWS"),false) %>' label="indicator.metric.core.query-count.edit.currentWS">
  <jalios:control settings='<%=new BooleanSettings()%>' />
</jalios:field>

<jalios:field name="cid" value='<%=metricParameters.get("cid") %>' label="indicator.metric.core.query-count.edit.cid">
  <jalios:control settings='<%= new CategorySettings().chooser().root(channel.getRootCategory()) %>' />
</jalios:field>

<jalios:field name="period" value='<%=metricParameters.get("period") %>' label="indicator.metric.core.query-count.edit.period">
  <jalios:control settings='<%=new NumberSettings().numberType(Integer.class)%>' />
</jalios:field>

