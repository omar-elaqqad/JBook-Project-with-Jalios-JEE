<%@ page contentType="text/html; charset=UTF-8" %><%
%><%-- This file has been automatically generated. --%><%
%><%--
  @Summary: MemberJob display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><% MemberJob obj = (MemberJob)request.getAttribute(PortalManager.PORTAL_PUBLICATION); %><%
%><%@ include file='/front/doFullDisplay.jspf' %>
<div class="fullDisplay MemberJob <%= obj.canBeEditedFieldByField(loggedMember) ? "unitFieldEdition" : "" %>" itemscope="itemscope">
<%@ include file='/front/publication/doPublicationHeader.jspf' %>
<table class="fields">
  <tr class="field organization textfieldEditor  <%= Util.isEmpty(obj.getOrganization()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(MemberJob.class, "organization", userLang) %><jalios:edit pub='<%= obj %>' fields='organization'/></td>
    <td class='field-data' <%= gfla(obj, "organization") %>>
            <% if (Util.notEmpty(obj.getOrganization())) { %>
            <%= obj.getOrganization() %>
            <% } %>
    </td>
  </tr>
  <tr class="field description textareaEditor abstract <%= Util.isEmpty(obj.getDescription()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(MemberJob.class, "description", userLang) %><jalios:edit pub='<%= obj %>' fields='description'/></td>
    <td class='field-data' <%= gfla(obj, "description") %>>
            <% if (Util.notEmpty(obj.getDescription())) { %>
            <jalios:wiki><%= obj.getDescription() %></jalios:wiki>
            <% } %>
    </td>
  </tr>
  <tr class="field place textfieldEditor  <%= Util.isEmpty(obj.getPlace()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(MemberJob.class, "place", userLang) %><jalios:edit pub='<%= obj %>' fields='place'/></td>
    <td class='field-data' <%= gfla(obj, "place") %>>
            <% if (Util.notEmpty(obj.getPlace())) { %>
            <%= obj.getPlace() %>
            <% } %>
    </td>
  </tr>
  <tr class="field site urlEditor  <%= Util.isEmpty(obj.getSite()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(MemberJob.class, "site", userLang) %><jalios:edit pub='<%= obj %>' fields='site'/></td>
    <td class='field-data' <%= gfla(obj, "site") %>>
            <% if (Util.notEmpty(obj.getSite())) { %>
            <a href='<%= obj.getSite() %>' ><%= obj.getSite()%></a>
            <% } %>
    </td>
  </tr>
  <tr class="field startDate dateEditor  <%= Util.isEmpty(obj.getStartDate()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(MemberJob.class, "startDate", userLang) %><jalios:edit pub='<%= obj %>' fields='startDate'/></td>
    <td class='field-data' >
            <%  if (obj.getStartDate() != null) { %>
            <jalios:date date='<%= obj.getStartDate() %>' format='<%= "short" %>'/>
            <% } %>
    </td>
  </tr>
  <tr class="field endDate dateEditor  <%= Util.isEmpty(obj.getEndDate()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(MemberJob.class, "endDate", userLang) %><jalios:edit pub='<%= obj %>' fields='endDate'/></td>
    <td class='field-data' >
            <%  if (obj.getEndDate() != null) { %>
            <jalios:date date='<%= obj.getEndDate() %>' format='<%= "short" %>'/>
            <% } %>
    </td>
  </tr>
 
</table>
<jsp:include page="/front/doFullDisplayCommonFields.jsp" />
</div><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- Ue0+GBJNMD3xlKUG/yoI2g== --%>