<%@page import="com.jalios.jcms.chart.PieChart"%><%
%><%@page import="com.jalios.jcms.uicomponent.Button.ButtonType"%><% 
%><%@page import="com.jalios.jcms.uicomponent.indicator.Indicator"%><%
%><%@page import="com.jalios.jcms.uicomponent.indicator.IndicatorPolicy"%><%
%><%@page import="com.jalios.jcms.uicomponent.indicator.IndicatorManager"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.uicomponent.indicator.PortletIndicatorDisplayHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
  <jsp:setProperty name='formHandler' property='portletIndicator' value='<%= portlet.getId() %>' />
</jsp:useBean>
<%
formHandler.addFrontEndDependencies();
PortletIndicator portletIndicator = (PortletIndicator) portlet;
Indicator indicator = formHandler.getIndicator();
if (indicator == null) {
  return;
}
boolean showEdit = isLogged && loggedMember.canWorkOn(portlet);
PieChart chart = formHandler.getChart();
String indicatorUpdateTitle = glp("indicator.action.donut.update-indicator", new DecimalFormat("#.##").format(indicator.getValue()) + " " + formHandler.getUnit());
%>
<div class="indicator-donut" <% if (Util.notEmpty(portletIndicator.getBriefText())) { %> title="<%= encodeForHTMLAttribute(portletIndicator.getBriefText()) %>"<% } %>>
  <div class="indicator-chart">
    <jalios:chart chart='<%= chart  %>' >
      {
        options: {
          tooltips: {
            enabled: false
          },
          hover: {mode: null},
          cutoutPercentage : 70,
          <% if (!chart.isAnimate()) { %>
          animation: false,
          <% } %>
          animationSteps : 75,
          animateRotate : false,
          responsive: true,
          maintainAspectRatio: true
        }
      }
    </jalios:chart>
    <div class="indicator-number">
      <% if (showEdit) { %>
	      <jalios:buttonModal buttonType="<%= ButtonType.A %>" url='<%= "types/PortletIndicator/editIndicator.jsp?id=" + portlet.getId() %>' title="<%= indicatorUpdateTitle %>">
		      <%= new DecimalFormat("#.##").format(indicator.getValue()) %><span class="indicator-unit"><%= formHandler.getUnit() %></span>
        </jalios:buttonModal>
      <% } else { %>
	      <%= new DecimalFormat("#.##").format(indicator.getValue()) %><span class="indicator-unit"><%= formHandler.getUnit() %></span>
      <% } %>
    </div>
  </div>
  <div class="indicator-text">
    <%= formHandler.getLabel() %>
  </div>
  <%if (Util.notEmpty(indicator.getLink())) { %>
    <div class="indicator-text">
      <a href="<%= indicator.getLink() %>"><%= formHandler.getLinkLabel(indicator.getLinkLabel()) %></a>
    </div>
  <%}%>
</div>