<%@ page contentType="text/html; charset=UTF-8" %><%
%><%-- This file has been automatically generated. --%><%
%><%--
  @Summary: Book display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><% Book obj = (Book)request.getAttribute(PortalManager.PORTAL_PUBLICATION); %><%
%><%@ include file='/front/doFullDisplay.jspf' %>
<div class="fullDisplay Book <%= obj.canBeEditedFieldByField(loggedMember) ? "unitFieldEdition" : "" %>" itemscope="itemscope">
<%@ include file='/front/publication/doPublicationHeader.jspf' %>
<table class="fields">
  <tr class="field description wysiwygEditor abstract <%= Util.isEmpty(obj.getDescription(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Book.class, "description", userLang) %><jalios:edit pub='<%= obj %>' fields='description'/></td>
    <td class='field-data' <%= gfla(obj, "description") %>>
            <% if (Util.notEmpty(obj.getDescription(userLang))) { %>
            <jalios:wysiwyg data='<%= obj %>' field='description'><%= obj.getDescription(userLang) %></jalios:wysiwyg>            
            <% } %>
    </td>
  </tr>
  <tr class="field image imageEditor  <%= Util.isEmpty(obj.getImage()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Book.class, "image", userLang) %><jalios:edit pub='<%= obj %>' fields='image'/></td>
    <td class='field-data' <%= gfla(obj, "image") %>>
            <% if (Util.notEmpty(obj.getImage())) { %>
            <img src='<%= Util.encodeUrl(obj.getImage()) %>' alt='' />
            <% } %>
    </td>
  </tr>
  <tr class="field topics categoryEditor  <%= Util.isEmpty(obj.getTopics(loggedMember)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Book.class, "topics", userLang) %><jalios:edit pub='<%= obj %>' fields='topics'/></td>
    <td class='field-data' >
            <% if (Util.notEmpty(obj.getTopics(loggedMember))) { %>
            <ol>
            <jalios:foreach collection="<%= obj.getTopics(loggedMember) %>" type="Category" name="itCategory" >
              <li><% if (itCategory != null) { %><a href="<%= ResourceHelper.getQuery() %>?cids=<%= itCategory.getId() %>"><%= itCategory.getAncestorString(channel.getCategory("$id.jcmsplugin.jbook.catalog.topic-root"), " > ", true, userLang) %></a><% } %></li>
            </jalios:foreach>
            </ol>
            <% } %>
    </td>
  </tr>
  <tr class="field isbn textfieldEditor  <%= Util.isEmpty(obj.getIsbn()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Book.class, "isbn", userLang) %><jalios:edit pub='<%= obj %>' fields='isbn'/></td>
    <td class='field-data' <%= gfla(obj, "isbn") %>>
            <% if (Util.notEmpty(obj.getIsbn())) { %>
            <%= obj.getIsbn() %>
            <% } %>
    </td>
  </tr>
 
</table>
<jsp:include page="/front/doFullDisplayCommonFields.jsp" />
</div><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- dayLJJhmqV0vLJ+l4mlUtw== --%>