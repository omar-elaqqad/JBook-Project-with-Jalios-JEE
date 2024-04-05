<%@ page contentType="text/html; charset=UTF-8" %><%
%><%-- This file has been automatically generated. --%><%
%><%--
  @Summary: CSSignupRequest display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><% CSSignupRequest obj = (CSSignupRequest)request.getAttribute(PortalManager.PORTAL_PUBLICATION); %><%
%><%@ include file='/front/doFullDisplay.jspf' %>
<div class="fullDisplay CSSignupRequest <%= obj.canBeEditedFieldByField(loggedMember) ? "unitFieldEdition" : "" %>" itemscope="itemscope">
<%@ include file='/front/publication/doPublicationHeader.jspf' %>
<table class="fields">
  <tr class="field name textfieldEditor  <%= Util.isEmpty(obj.getName()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(CSSignupRequest.class, "name", userLang) %><jalios:edit pub='<%= obj %>' fields='name'/></td>
    <td class='field-data' <%= gfla(obj, "name") %>>
            <% if (Util.notEmpty(obj.getName())) { %>
            <%= obj.getName() %>
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
%><%-- J46YUEWlxIEbXba1TwJJgQ== --%>