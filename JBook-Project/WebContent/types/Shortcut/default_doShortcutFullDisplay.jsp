<%@ page contentType="text/html; charset=UTF-8" %><%
%><%-- This file has been automatically generated. --%><%
%><%--
  @Summary: Shortcut display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><% Shortcut obj = (Shortcut)request.getAttribute(PortalManager.PORTAL_PUBLICATION); %><%
%><%@ include file='/front/doFullDisplay.jspf' %>
<div class="fullDisplay Shortcut <%= obj.canBeEditedFieldByField(loggedMember) ? "unitFieldEdition" : "" %>" itemscope="itemscope">
<%@ include file='/front/publication/doPublicationHeader.jspf' %>
<table class="fields">
  <tr class="field image imageEditor  <%= Util.isEmpty(obj.getImage(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Shortcut.class, "image", userLang) %><jalios:edit pub='<%= obj %>' fields='image'/></td>
    <td class='field-data' <%= gfla(obj, "image") %>>
            <% if (Util.notEmpty(obj.getImage(userLang))) { %>
            <img src='<%= Util.encodeUrl(obj.getImage(userLang)) %>' alt='' />
            <% } %>
    </td>
  </tr>
  <tr class="field icon imageEditor  <%= Util.isEmpty(obj.getIcon()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Shortcut.class, "icon", userLang) %><jalios:edit pub='<%= obj %>' fields='icon'/></td>
    <td class='field-data' <%= gfla(obj, "icon") %>>
            <% if (Util.notEmpty(obj.getIcon())) { %>
            <img src='<%= Util.encodeUrl(obj.getIcon()) %>' alt='' />
            <% } %>
    </td>
  </tr>
  <tr class="field text textareaEditor abstract <%= Util.isEmpty(obj.getText(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Shortcut.class, "text", userLang) %><jalios:edit pub='<%= obj %>' fields='text'/></td>
    <td class='field-data' <%= gfla(obj, "text") %>>
            <% if (Util.notEmpty(obj.getText(userLang))) { %>
            <jalios:wiki><%= obj.getText(userLang) %></jalios:wiki>
            <% } %>
    </td>
  </tr>
  <tr class="field link urlEditor  <%= Util.isEmpty(obj.getLink()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Shortcut.class, "link", userLang) %><jalios:edit pub='<%= obj %>' fields='link'/></td>
    <td class='field-data' <%= gfla(obj, "link") %>>
            <% if (Util.notEmpty(obj.getLink())) { %>
            <a href='<%= obj.getLink() %>' ><%= obj.getLink()%></a>
            <% } %>
    </td>
  </tr>
  <tr class="field pub linkEditor  <%= Util.isEmpty(obj.getPub()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Shortcut.class, "pub", userLang) %><jalios:edit pub='<%= obj %>' fields='pub'/></td>
    <td class='field-data' >
            <% if (obj.getPub() != null && obj.getPub().canBeReadBy(loggedMember)) { %>
            <jalios:link data='<%= obj.getPub() %>'/>
            <% } %>
    </td>
  </tr>
  <tr class="field parameters textfieldEditor  <%= Util.isEmpty(obj.getParameters()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Shortcut.class, "parameters", userLang) %><jalios:edit pub='<%= obj %>' fields='parameters'/></td>
    <td class='field-data' <%= gfla(obj, "parameters") %>>
            <% if (Util.notEmpty(obj.getParameters())) { %>
            <%= obj.getParameters() %>
            <% } %>
    </td>
  </tr>
  <tr class="field keywords textfieldEditor  <%= Util.isEmpty(obj.getKeywords(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Shortcut.class, "keywords", userLang) %><jalios:edit pub='<%= obj %>' fields='keywords'/></td>
    <td class='field-data' <%= gfla(obj, "keywords") %>>
            <% if (Util.notEmpty(obj.getKeywords(userLang))) { %>
            <%= obj.getKeywords(userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field openMode enumerateEditor  <%= Util.isEmpty(obj.getOpenMode()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Shortcut.class, "openMode", userLang) %><jalios:edit pub='<%= obj %>' fields='openMode'/></td>
    <td class='field-data' <%= gfla(obj, "openMode") %>>
            <% if (Util.notEmpty(obj.getOpenMode())) { %>
            <%= obj.getOpenModeLabel(obj.getOpenMode(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field showInToolsPage booleanEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(Shortcut.class, "showInToolsPage", userLang) %><jalios:edit pub='<%= obj %>' fields='showInToolsPage'/></td>
    <td class='field-data' >
            <%= obj.getShowInToolsPageLabel(userLang) %>
    </td>
  </tr>
  <tr class="field type categoryEditor  <%= Util.isEmpty(obj.getType(loggedMember)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Shortcut.class, "type", userLang) %><jalios:edit pub='<%= obj %>' fields='type'/></td>
    <td class='field-data' >
            <% if (Util.notEmpty(obj.getType(loggedMember))) { %>
            <ol>
            <jalios:foreach collection="<%= obj.getType(loggedMember) %>" type="Category" name="itCategory" >
              <li><% if (itCategory != null) { %><a href="<%= ResourceHelper.getQuery() %>?cids=<%= itCategory.getId() %>"><%= itCategory.getAncestorString(channel.getCategory("$id.application.shortcut.category"), " > ", true, userLang) %></a><% } %></li>
            </jalios:foreach>
            </ol>
            <% } %>
    </td>
  </tr>
 
</table>
<jsp:include page="/front/doFullDisplayCommonFields.jsp" />
</div><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- QbqNb9wZAa2h4xVdCihxOQ== --%>