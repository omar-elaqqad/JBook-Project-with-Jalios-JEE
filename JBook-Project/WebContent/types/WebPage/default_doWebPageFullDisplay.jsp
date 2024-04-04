<%@ page contentType="text/html; charset=UTF-8" %><%
%><%-- This file has been automatically generated. --%><%
%><%--
  @Summary: WebPage display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><% WebPage obj = (WebPage)request.getAttribute(PortalManager.PORTAL_PUBLICATION); %><%
%><%@ include file='/front/doFullDisplay.jspf' %>
<div class="fullDisplay WebPage <%= obj.canBeEditedFieldByField(loggedMember) ? "unitFieldEdition" : "" %>" itemscope="itemscope">
<%@ include file='/front/publication/doPublicationHeader.jspf' %>
<table class="fields">
  <tr class="field url urlEditor  <%= Util.isEmpty(obj.getUrl()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(WebPage.class, "url", userLang) %><jalios:edit pub='<%= obj %>' fields='url'/></td>
    <td class='field-data' <%= gfla(obj, "url") %>>
            <% if (Util.notEmpty(obj.getUrl())) { %>
            <a href='<%= obj.getUrl() %>' ><%= obj.getUrl()%></a>
            <% } %>
    </td>
  </tr>
  <tr class="field urlToShot urlEditor  <%= Util.isEmpty(obj.getUrlToShot()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(WebPage.class, "urlToShot", userLang) %><jalios:edit pub='<%= obj %>' fields='urlToShot'/></td>
    <td class='field-data' <%= gfla(obj, "urlToShot") %>>
            <% if (Util.notEmpty(obj.getUrlToShot())) { %>
            <a href='<%= obj.getUrlToShot() %>' ><%= obj.getUrlToShot()%></a>
            <% } %>
    </td>
  </tr>
  <tr class="field description textareaEditor abstract <%= Util.isEmpty(obj.getDescription(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(WebPage.class, "description", userLang) %><jalios:edit pub='<%= obj %>' fields='description'/></td>
    <td class='field-data' <%= gfla(obj, "description") %>>
            <% if (Util.notEmpty(obj.getDescription(userLang))) { %>
            <jalios:wiki><%= obj.getDescription(userLang) %></jalios:wiki>
            <% } %>
    </td>
  </tr>
 
</table>
<jsp:include page="/front/doFullDisplayCommonFields.jsp" />
</div><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- Lmwe/Sg3y3AMQQOpdmz9yA== --%>