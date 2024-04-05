<%@ page contentType="text/html; charset=UTF-8" %><%
%><%-- This file has been automatically generated. --%><%
%><%--
  @Summary: Blog display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><% Blog obj = (Blog)request.getAttribute(PortalManager.PORTAL_PUBLICATION); %><%
%><%@ include file='/front/doFullDisplay.jspf' %>
<div class="fullDisplay Blog <%= obj.canBeEditedFieldByField(loggedMember) ? "unitFieldEdition" : "" %>" itemscope="itemscope">
<%@ include file='/front/publication/doPublicationHeader.jspf' %>
<table class="fields">
  <tr class="field description textareaEditor abstract <%= Util.isEmpty(obj.getDescription()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Blog.class, "description", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "description") %>>
            <% if (Util.notEmpty(obj.getDescription())) { %>
            <jalios:wiki><%= obj.getDescription() %></jalios:wiki>
            <% } %>
    </td>
  </tr>
  <tr class="field bloggerGroup groupEditor  <%= Util.isEmpty(obj.getBloggerGroup()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Blog.class, "bloggerGroup", userLang) %></td>
    <td class='field-data' >
            <% if (obj.getBloggerGroup() != null) { %>
            <jalios:link data='<%= obj.getBloggerGroup() %>'/>
            <% } %>
    </td>
  </tr>
 
</table>
<jsp:include page="/front/doFullDisplayCommonFields.jsp" />
</div><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- 9ZHHHo1difqPxhG0vHyAVQ== --%>