<%@page import="com.jalios.jcms.uicomponent.indicator.Indicator"%><% 
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.uicomponent.indicator.PortletIndicatorDisplayHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
  <jsp:setProperty name='formHandler' property='portletIndicator' value='<%= portlet.getId() %>' />
</jsp:useBean><%
formHandler.addFrontEndDependencies();
PortletIndicator portletIndicator = (PortletIndicator) portlet;
Indicator indicator = formHandler.getIndicator();
if (indicator == null) {
  return;
}
boolean showEdit = isLogged && loggedMember.canWorkOn(portlet);
  
double number = Util.toDouble(indicator.getValue(), 0.0);
String roundedNumber = new DecimalFormat("#.#").format(number);

String title = "title=\"" + encodeForHTMLAttribute(portletIndicator.getBriefText(userLang)) + "\"";
%>
<jalios:indicatorCard htmlAttributes="<%= title %>" resource="indicator-card.vertical"  text="<%= formHandler.getLabel() %>" >
   <jalios:buffer name="INDICATOR_NUMBER">
     <span class="indicator-number">
       <jalios:icon src="<%= portletIndicator.getPicture()  %>" />
       <% if (showEdit) { %>
	       <jalios:buttonModal url='<%= "types/PortletIndicator/editIndicator.jsp?id=" + portlet.getId() %>'>
		       <%= roundedNumber %><span class="indicator-unit"><%= formHandler.getUnit() %></span>
	       </jalios:buttonModal>
       <% } else { %>
	       <%= roundedNumber %><span class="indicator-unit"><%= formHandler.getUnit() %></span>
       <% } %>
     </span>
   </jalios:buffer>
  <jalios:buffer name="INDICATOR_BOTTOM">
    <% if (Util.notEmpty(indicator.getLink())) { %>
    <div class="indicator-link">
      <a href="<%= indicator.getLink() %>"><%= formHandler.getLinkLabel(indicator.getLinkLabel()) %></a>
    </div>
    <% } %>
  </jalios:buffer>
</jalios:indicatorCard>