  <%@page import="com.jalios.jcms.uicomponent.indicator.IndicatorManager"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %><%
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
Set<String> metricSet = IndicatorManager.getInstance().getMetricSet();
String editMetricPage = Channel.getChannel().getProperty(formHandler.getAvailableMetric());
boolean fieldVertical = getBooleanParameter("fieldVertical", Util.toBoolean(request.getAttribute("fieldVertical"), false));
request.setAttribute("field-vertical", fieldVertical);

%>
<div class="ajax-refresh-div do-not-refresh" data-jalios-ajax-refresh-url="types/PortletIndicator/doPortletIndicatorMetricEditor.jsp">
  <%-- MetricList ------------------------------------------------------------ --%>
  <jalios:field name="metric" value="<%= formHandler.getAvailableMetric() %>" label="types.PortletIndicator.fields.metric.label">
    <jalios:control settings='<%= new EnumerateSettings().single().enumLabels(metricSet).enumValues(metricSet).select().dataAttribute("jalios-action", "ajax-refresh") %>'  />
  </jalios:field>
  
  <% if (editMetricPage != null) { %>
    <div class="metric-editor">
      <%-- Metric param page ----------------------------------------------------- --%>
      <jalios:include jsp="<%= editMetricPage %>" />
    </div>
  <% } %>
</div>
