<%@ page contentType="text/html; charset=UTF-8" %><%
%><%-- This file has been automatically generated. --%><%
%><%--
  @Summary: GuestCrea display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><% GuestCrea obj = (GuestCrea)request.getAttribute(PortalManager.PORTAL_PUBLICATION); %><%
%><%@ include file='/front/doFullDisplay.jspf' %>
<div class="fullDisplay GuestCrea <%= obj.canBeEditedFieldByField(loggedMember) ? "unitFieldEdition" : "" %>" itemscope="itemscope">
<%@ include file='/front/publication/doPublicationHeader.jspf' %>
<table class="fields">
  <tr class="field name textfieldEditor  <%= Util.isEmpty(obj.getName()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(GuestCrea.class, "name", userLang) %><jalios:edit pub='<%= obj %>' fields='name'/></td>
    <td class='field-data' <%= gfla(obj, "name") %>>
            <% if (Util.notEmpty(obj.getName())) { %>
            <%= obj.getName() %>
            <% } %>
    </td>
  </tr>
  <tr class="field firstname textfieldEditor  <%= Util.isEmpty(obj.getFirstname()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(GuestCrea.class, "firstname", userLang) %><jalios:edit pub='<%= obj %>' fields='firstname'/></td>
    <td class='field-data' <%= gfla(obj, "firstname") %>>
            <% if (Util.notEmpty(obj.getFirstname())) { %>
            <%= obj.getFirstname() %>
            <% } %>
    </td>
  </tr>
  <tr class="field email emailEditor  <%= Util.isEmpty(obj.getEmail()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(GuestCrea.class, "email", userLang) %><jalios:edit pub='<%= obj %>' fields='email'/></td>
    <td class='field-data' <%= gfla(obj, "email") %>>
            <% if (Util.notEmpty(obj.getEmail())) { %>
            <a href='mailto:<%= obj.getEmail() %>'><%= obj.getEmail()%></a>
            <% } %>
    </td>
  </tr>
  <tr class="field organization textfieldEditor  <%= Util.isEmpty(obj.getOrganization()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(GuestCrea.class, "organization", userLang) %><jalios:edit pub='<%= obj %>' fields='organization'/></td>
    <td class='field-data' <%= gfla(obj, "organization") %>>
            <% if (Util.notEmpty(obj.getOrganization())) { %>
            <%= obj.getOrganization() %>
            <% } %>
    </td>
  </tr>
  <tr class="field language textfieldEditor  <%= Util.isEmpty(obj.getLanguage()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(GuestCrea.class, "language", userLang) %><jalios:edit pub='<%= obj %>' fields='language'/></td>
    <td class='field-data' <%= gfla(obj, "language") %>>
            <% if (Util.notEmpty(obj.getLanguage())) { %>
            <%= obj.getLanguage() %>
            <% } %>
    </td>
  </tr>
  <tr class="field country textfieldEditor  <%= Util.isEmpty(obj.getCountry()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(GuestCrea.class, "country", userLang) %><jalios:edit pub='<%= obj %>' fields='country'/></td>
    <td class='field-data' <%= gfla(obj, "country") %>>
            <% if (Util.notEmpty(obj.getCountry())) { %>
            <%= obj.getCountry() %>
            <% } %>
    </td>
  </tr>
  <tr class="field groups groupEditor  <%= Util.isEmpty(obj.getGroups()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(GuestCrea.class, "groups", userLang) %><jalios:edit pub='<%= obj %>' fields='groups'/></td>
    <td class='field-data' >
            <% if (Util.notEmpty(obj.getGroups())) { %>
            <ol>
              <jalios:foreach name="itData" type="com.jalios.jcms.Group" collection="<%= obj.getGroups() %>">
              <% if (itData != null ) { %>
              <li><jalios:link data='<%= itData %>'/></li>
              <% } %>
              </jalios:foreach>
            </ol>
            <% } %>
    </td>
  </tr>
 
  <tr class="field submit-member member <%=  obj.getSubmitMember() != null ? "" : "empty" %>">
    <td class='field-label'>
      <% /* %>Submit member<% */ %><%= glp("ui.work.forms.lbl.submit-mbr") %>
    </td>
    <td class='field-data'>
      <% if (obj.getSubmitMember() != null) { %>
      <a href="<%= ResourceHelper.getQuery() %>?mids=<%=  obj.getSubmitMember().getId() %>"><% /* %>John Smith<% */ %><%= obj.getSubmitMember() %></a>
      <% } %>
    </td>
  </tr>
  <tr class="field submit-remote-addr <%=  obj.getSubmitRemoteAddr() != null ? "" : "empty" %>">
    <td class='field-label'>
      <% /* %>IP address<% */ %><%= glp("ui.work.forms.lbl.submit-ip") %>
    </td>
    <td class='field-data'>
      <% /* %>10.10.10.10<% */ %><%= obj.getSubmitRemoteAddr() %>
    </td>
  </tr>
</table>
<jsp:include page="/front/doFullDisplayCommonFields.jsp" />
</div><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- 4J6lgwCcNxIN67FKNBMNzw== --%>