<%@page import="com.jalios.jcms.HttpUtil"%>
<%@ include file="/docs/jcms/common/doInitSection.jspf" %>
<div class="ajax-refresh-div" data-jalios-ajax-refresh-url="docs/jcms/forms/forms_section_date_ajaxrefresh.jsp">
  <% Date date1 = HttpUtil.getDateParameter(request, "dateAjax1", userLang, null); %>
  <% String dateDescription1 = date1 != null ? "<span class='label label-info'>Selected date: " + date1 + "</span>" : null; %>
  <jalios:field name="dateAjax1" label="Date with change event" value="<%= date1 %>" description="<%= dateDescription1 %>">
    <jalios:control settings='<%= new DateSettings().onChange("ajax-refresh") %>' />
  </jalios:field>
  <% Date date2 = HttpUtil.getDateTimeParameter(request, "dateAjax2", userLang, null); %>
  <% String dateDescription2 = date2 != null ? "<span class='label label-info'>Selected date: " + date2 + "</span>" : null; %>
  <jalios:field name="dateAjax2" label="Date and time with change event" value="<%= date2 %>" description="<%= dateDescription2 %>">
    <jalios:control settings='<%= new DateSettings().displayTime().onChange("ajax-refresh") %>' />
  </jalios:field>
</div>
