<%@ page contentType="text/html; charset=UTF-8" %><%
%><%-- This file has been automatically generated. --%><%
%><%--
  @Summary: BlogPost display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><% BlogPost obj = (BlogPost)request.getAttribute(PortalManager.PORTAL_PUBLICATION); %><%
%><%@ include file='/front/doFullDisplay.jspf' %>
<div class="fullDisplay BlogPost <%= obj.canBeEditedFieldByField(loggedMember) ? "unitFieldEdition" : "" %>" itemscope="itemscope">
<%@ include file='/front/publication/doPublicationHeader.jspf' %>
<table class="fields">
  <tr class="field content wysiwygEditor  <%= Util.isEmpty(obj.getContent(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(BlogPost.class, "content", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "content") %>>
            <% if (Util.notEmpty(obj.getContent(userLang))) { %>
            <jalios:wysiwyg data='<%= obj %>' field='content'><%= obj.getContent(userLang) %></jalios:wysiwyg>            
            <% } %>
    </td>
  </tr>
  <tr class="field summary textareaEditor  <%= Util.isEmpty(obj.getSummary(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(BlogPost.class, "summary", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "summary") %>>
            <% if (Util.notEmpty(obj.getSummary(userLang))) { %>
            <jalios:wiki><%= obj.getSummary(userLang) %></jalios:wiki>
            <% } %>
    </td>
  </tr>
  <tr class="field blog linkEditor  <%= Util.isEmpty(obj.getBlog()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(BlogPost.class, "blog", userLang) %></td>
    <td class='field-data' >
            <% if (obj.getBlog() != null && obj.getBlog().canBeReadBy(loggedMember)) { %>
            <jalios:link data='<%= obj.getBlog() %>'/>
            <% } %>
    </td>
  </tr>
  <tr class="field category categoryEditor  <%= Util.isEmpty(obj.getCategory(loggedMember)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(BlogPost.class, "category", userLang) %></td>
    <td class='field-data' >
            <% if (Util.notEmpty(obj.getCategory(loggedMember))) { %>
            <ol>
            <jalios:foreach collection="<%= obj.getCategory(loggedMember) %>" type="Category" name="itCategory" >
              <li><% if (itCategory != null) { %><a href="<%= ResourceHelper.getQuery() %>?cids=<%= itCategory.getId() %>"><%= itCategory.getAncestorString(channel.getCategory("j_3"), " > ", true, userLang) %></a><% } %></li>
            </jalios:foreach>
            </ol>
            <% } %>
    </td>
  </tr>
  <tr class="field featuredImage imageEditor  <%= Util.isEmpty(obj.getFeaturedImage()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(BlogPost.class, "featuredImage", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "featuredImage") %>>
            <% if (Util.notEmpty(obj.getFeaturedImage())) { %>
            <img src='<%= Util.encodeUrl(obj.getFeaturedImage()) %>' alt='' />
            <% } %>
    </td>
  </tr>
  <tr class="field featuredImageAlt textfieldEditor  <%= Util.isEmpty(obj.getFeaturedImageAlt(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(BlogPost.class, "featuredImageAlt", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "featuredImageAlt") %>>
            <% if (Util.notEmpty(obj.getFeaturedImageAlt(userLang))) { %>
            <%= obj.getFeaturedImageAlt(userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field thumbnailImage imageEditor  <%= Util.isEmpty(obj.getThumbnailImage()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(BlogPost.class, "thumbnailImage", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "thumbnailImage") %>>
            <% if (Util.notEmpty(obj.getThumbnailImage())) { %>
            <img src='<%= Util.encodeUrl(obj.getThumbnailImage()) %>' alt='' />
            <% } %>
    </td>
  </tr>
  <tr class="field thumbnailImageAlt textfieldEditor  <%= Util.isEmpty(obj.getThumbnailImageAlt(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(BlogPost.class, "thumbnailImageAlt", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "thumbnailImageAlt") %>>
            <% if (Util.notEmpty(obj.getThumbnailImageAlt(userLang))) { %>
            <%= obj.getThumbnailImageAlt(userLang) %>
            <% } %>
    </td>
  </tr>
 
</table>
<jsp:include page="/front/doFullDisplayCommonFields.jsp" />
</div><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- Q7qAa2NMVSpm6w3yUblFJA== --%>