<%@ page contentType="text/html; charset=UTF-8" %><%
%><%-- This file has been automatically generated. --%><%
%><%--
  @Summary: DBComment display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><% DBComment obj = (DBComment)request.getAttribute(PortalManager.PORTAL_PUBLICATION); %><%
%><%@ include file='/front/doFullDisplay.jspf' %>
<div class="fullDisplay DBComment <%= obj.canBeEditedFieldByField(loggedMember) ? "unitFieldEdition" : "" %>" itemscope="itemscope">
<%@ include file='/front/publication/doPublicationHeader.jspf' %>
<table class="fields">
  <tr class="field name textfieldEditor  <%= Util.isEmpty(obj.getName()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(DBComment.class, "name", userLang) %><jalios:edit pub='<%= obj %>' fields='name'/></td>
    <td class='field-data' <%= gfla(obj, "name") %>>
            <% if (Util.notEmpty(obj.getName())) { %>
            <%= obj.getName() %>
            <% } %>
    </td>
  </tr>
  <tr class="field email emailEditor  <%= Util.isEmpty(obj.getEmail()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(DBComment.class, "email", userLang) %><jalios:edit pub='<%= obj %>' fields='email'/></td>
    <td class='field-data' <%= gfla(obj, "email") %>>
            <% if (Util.notEmpty(obj.getEmail())) { %>
            <a href='mailto:<%= obj.getEmail() %>'><%= obj.getEmail()%></a>
            <% } %>
    </td>
  </tr>
  <tr class="field webSite urlEditor  <%= Util.isEmpty(obj.getWebSite()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(DBComment.class, "webSite", userLang) %><jalios:edit pub='<%= obj %>' fields='webSite'/></td>
    <td class='field-data' <%= gfla(obj, "webSite") %>>
            <% if (Util.notEmpty(obj.getWebSite())) { %>
            <a href='<%= obj.getWebSite() %>' ><%= obj.getWebSite()%></a>
            <% } %>
    </td>
  </tr>
  <tr class="field description textareaEditor abstract <%= Util.isEmpty(obj.getDescription()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(DBComment.class, "description", userLang) %><jalios:edit pub='<%= obj %>' fields='description'/></td>
    <td class='field-data' <%= gfla(obj, "description") %>>
            <% if (Util.notEmpty(obj.getDescription())) { %>
            <jalios:wiki><%= obj.getDescription() %></jalios:wiki>
            <% } %>
    </td>
  </tr>
  <tr class="field targetContent linkEditor  <%= Util.isEmpty(obj.getTargetContent()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(DBComment.class, "targetContent", userLang) %><jalios:edit pub='<%= obj %>' fields='targetContent'/></td>
    <td class='field-data' >
            <% if (obj.getTargetContent() != null && obj.getTargetContent().canBeReadBy(loggedMember)) { %>
            <jalios:link data='<%= obj.getTargetContent() %>'/>
            <% } %>
    </td>
  </tr>
  <tr class="field privateComment booleanEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(DBComment.class, "privateComment", userLang) %><jalios:edit pub='<%= obj %>' fields='privateComment'/></td>
    <td class='field-data' >
            <%= obj.getPrivateCommentLabel(userLang) %>
    </td>
  </tr>
 
</table>
<jsp:include page="/front/doFullDisplayCommonFields.jsp" />
</div><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- HVFO7v4UITouqokREltEOA== --%>