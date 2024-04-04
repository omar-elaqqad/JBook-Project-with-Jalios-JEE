<%@ page contentType="text/html; charset=UTF-8" %><%
%><%-- This file has been automatically generated. --%><%
%><%--
  @Summary: Glossary display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><% Glossary obj = (Glossary)request.getAttribute(PortalManager.PORTAL_PUBLICATION); %><%
%><%@ include file='/front/doFullDisplay.jspf' %>
<div class="fullDisplay Glossary <%= obj.canBeEditedFieldByField(loggedMember) ? "unitFieldEdition" : "" %>" itemscope="itemscope">
<%@ include file='/front/publication/doPublicationHeader.jspf' %>
<table class="fields">
  <tr class="field description textareaEditor abstract <%= Util.isEmpty(obj.getDescription(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Glossary.class, "description", userLang) %><jalios:edit pub='<%= obj %>' fields='description'/></td>
    <td class='field-data' <%= gfla(obj, "description") %>>
            <% if (Util.notEmpty(obj.getDescription(userLang))) { %>
            <jalios:wiki><%= obj.getDescription(userLang) %></jalios:wiki>
            <% } %>
    </td>
  </tr>
  <tr class="field displayFirstLetter booleanEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(Glossary.class, "displayFirstLetter", userLang) %><jalios:edit pub='<%= obj %>' fields='displayFirstLetter'/></td>
    <td class='field-data' >
            <%= obj.getDisplayFirstLetterLabel(userLang) %>
    </td>
  </tr>
 
</table>
<jsp:include page="/front/doFullDisplayCommonFields.jsp" />
</div><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- UNx1zY3IUIa8zcq6RS+0Rg== --%>