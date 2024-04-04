<%@ page contentType="text/html; charset=UTF-8" %><%
%><%-- This file has been automatically generated. --%><%
%><%--
  @Summary: Article display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><% Article obj = (Article)request.getAttribute(PortalManager.PORTAL_PUBLICATION); %><%
%><%@ include file='/front/doFullDisplay.jspf' %>
<div class="fullDisplay Article <%= obj.canBeEditedFieldByField(loggedMember) ? "unitFieldEdition" : "" %>" itemscope="itemscope">
<%@ include file='/front/publication/doPublicationHeader.jspf' %>
<table class="fields">
  <tr class="field summary textareaEditor abstract <%= Util.isEmpty(obj.getSummary(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Article.class, "summary", userLang) %><jalios:edit pub='<%= obj %>' fields='summary'/></td>
    <td class='field-data' <%= gfla(obj, "summary") %>>
            <% if (Util.notEmpty(obj.getSummary(userLang))) { %>
            <jalios:wiki><%= obj.getSummary(userLang) %></jalios:wiki>
            <% } %>
    </td>
  </tr>
  <tr class="field intro textareaEditor  <%= Util.isEmpty(obj.getIntro(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Article.class, "intro", userLang) %><jalios:edit pub='<%= obj %>' fields='intro'/></td>
    <td class='field-data' <%= gfla(obj, "intro") %>>
            <% if (Util.notEmpty(obj.getIntro(userLang))) { %>
            <jalios:wiki><%= obj.getIntro(userLang) %></jalios:wiki>
            <% } %>
    </td>
  </tr>
  <tr class="field picture imageEditor  <%= Util.isEmpty(obj.getPicture(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Article.class, "picture", userLang) %><jalios:edit pub='<%= obj %>' fields='picture'/></td>
    <td class='field-data' <%= gfla(obj, "picture") %>>
            <% if (Util.notEmpty(obj.getPicture(userLang))) { %>
              <p><jalios:thumbnail path='<%= Util.encodeUrl(obj.getPicture(userLang)) %>' width='300' height='200' /></p>
            <% } %>
    </td>
  </tr>
  <tr class="field pictureAlt textfieldEditor  <%= Util.isEmpty(obj.getPictureAlt(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Article.class, "pictureAlt", userLang) %><jalios:edit pub='<%= obj %>' fields='pictureAlt'/></td>
    <td class='field-data' <%= gfla(obj, "pictureAlt") %>>
            <% if (Util.notEmpty(obj.getPictureAlt(userLang))) { %>
            <%= obj.getPictureAlt(userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field content wysiwygEditor  <%= Util.isEmpty(obj.getContent(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Article.class, "content", userLang) %><jalios:edit pub='<%= obj %>' fields='content'/></td>
    <td class='field-data' <%= gfla(obj, "content") %>>
            <% if (Util.notEmpty(obj.getContent(userLang))) { %>
            <jalios:wysiwyg data='<%= obj %>' field='content'><%= obj.getContent(userLang) %></jalios:wysiwyg>            
            <% } %>
    </td>
  </tr>
  <tr class="field relatedContents linkEditor  <%= Util.isEmpty(obj.getRelatedContents()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Article.class, "relatedContents", userLang) %><jalios:edit pub='<%= obj %>' fields='relatedContents'/></td>
    <td class='field-data' >
            <% if (Util.notEmpty(obj.getRelatedContents())) { %>
            <ol>
              <jalios:foreach name="itData" type="com.jalios.jcms.Content" array="<%= obj.getRelatedContents() %>">
              <% if (itData != null && itData.canBeReadBy(loggedMember)) { %>
              <li>
              <jalios:link data='<%= itData %>'/>
              </li>
              <% } %>
              </jalios:foreach>
            </ol>
            <% } %>
    </td>
  </tr>
 
</table>
<jsp:include page="/front/doFullDisplayCommonFields.jsp" />
</div><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- 5tXuMpqgmsCNX7PKFG6DQw== --%>