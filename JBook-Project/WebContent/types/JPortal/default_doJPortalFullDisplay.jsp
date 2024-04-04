<%@ page contentType="text/html; charset=UTF-8" %><%
%><%-- This file has been automatically generated. --%><%
%><%--
  @Summary: JPortal display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%
%><% JPortal obj = (JPortal)portlet; %><%
%><%@ include file='/front/doFullDisplay.jspf' %>
<div class="fullDisplay JPortal <%= obj.canBeEditedFieldByField(loggedMember) ? "unitFieldEdition" : "" %>" itemscope="itemscope">
<%@ include file='/front/publication/doPublicationHeader.jspf' %>
<table class="fields">
  <tr class="field pageTitle textfieldEditor  <%= Util.isEmpty(obj.getPageTitle(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(JPortal.class, "pageTitle", userLang) %><jalios:edit pub='<%= obj %>' fields='pageTitle'/></td>
    <td class='field-data' <%= gfla(obj, "pageTitle") %>>
            <% if (Util.notEmpty(obj.getPageTitle(userLang))) { %>
            <%= obj.getPageTitle(userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field description textareaEditor abstract <%= Util.isEmpty(obj.getDescription(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(JPortal.class, "description", userLang) %><jalios:edit pub='<%= obj %>' fields='description'/></td>
    <td class='field-data' <%= gfla(obj, "description") %>>
            <% if (Util.notEmpty(obj.getDescription(userLang))) { %>
            <%= obj.getDescription(userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field keywords textareaEditor  <%= Util.isEmpty(obj.getKeywords(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(JPortal.class, "keywords", userLang) %><jalios:edit pub='<%= obj %>' fields='keywords'/></td>
    <td class='field-data' <%= gfla(obj, "keywords") %>>
            <% if (Util.notEmpty(obj.getKeywords(userLang))) { %>
            <%= obj.getKeywords(userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field portletImage imageEditor  <%= Util.isEmpty(obj.getPortletImage(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(JPortal.class, "portletImage", userLang) %><jalios:edit pub='<%= obj %>' fields='portletImage'/></td>
    <td class='field-data' <%= gfla(obj, "portletImage") %>>
            <% if (Util.notEmpty(obj.getPortletImage(userLang))) { %>
            <img src='<%= Util.encodeUrl(obj.getPortletImage(userLang)) %>' alt='' />
            <% } %>
    </td>
  </tr>
  <tr class="field behaviorCopy enumerateEditor  <%= Util.isEmpty(obj.getBehaviorCopy()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(JPortal.class, "behaviorCopy", userLang) %><jalios:edit pub='<%= obj %>' fields='behaviorCopy'/></td>
    <td class='field-data' <%= gfla(obj, "behaviorCopy") %>>
            <% if (Util.notEmpty(obj.getBehaviorCopy())) { %>
            <%= obj.getBehaviorCopyLabel(obj.getBehaviorCopy(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field cssId textfieldEditor  <%= Util.isEmpty(obj.getCssId()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(JPortal.class, "cssId", userLang) %><jalios:edit pub='<%= obj %>' fields='cssId'/></td>
    <td class='field-data' <%= gfla(obj, "cssId") %>>
            <% if (Util.notEmpty(obj.getCssId())) { %>
            <%= obj.getCssId() %>
            <% } %>
    </td>
  </tr>
  <tr class="field cssClasses textfieldEditor  <%= Util.isEmpty(obj.getCssClasses()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(JPortal.class, "cssClasses", userLang) %><jalios:edit pub='<%= obj %>' fields='cssClasses'/></td>
    <td class='field-data' <%= gfla(obj, "cssClasses") %>>
            <% if (Util.notEmpty(obj.getCssClasses())) { %>
            <%= obj.getCssClasses() %>
            <% } %>
    </td>
  </tr>
  <tr class="field cacheType enumerateEditor  <%= Util.isEmpty(obj.getCacheType()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(JPortal.class, "cacheType", userLang) %><jalios:edit pub='<%= obj %>' fields='cacheType'/></td>
    <td class='field-data' <%= gfla(obj, "cacheType") %>>
            <% if (Util.notEmpty(obj.getCacheType())) { %>
            <%= obj.getCacheTypeLabel(obj.getCacheType(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field cacheSensibility enumerateEditor  <%= Util.isEmpty(obj.getCacheSensibility()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(JPortal.class, "cacheSensibility", userLang) %><jalios:edit pub='<%= obj %>' fields='cacheSensibility'/></td>
    <td class='field-data' <%= gfla(obj, "cacheSensibility") %>>
            <% if (Util.notEmpty(obj.getCacheSensibility())) { %>
            <%= obj.getCacheSensibilityLabel(obj.getCacheSensibility(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field invalidClass enumerateEditor  <%= Util.isEmpty(obj.getInvalidClass()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(JPortal.class, "invalidClass", userLang) %><jalios:edit pub='<%= obj %>' fields='invalidClass'/></td>
    <td class='field-data' <%= gfla(obj, "invalidClass") %>>
        <% if (Util.notEmpty(obj.getInvalidClass())) { %>
            <ol>
            <jalios:foreach name="itString" type="String" array="<%= obj.getInvalidClass() %>">
            <% if (Util.notEmpty(itString)) { %>
              <li>
            <%= obj.getInvalidClassLabel(itString, userLang) %>
              </li>
            <% } %>
            </jalios:foreach>
            </ol>
        <% } %>
    </td>
  </tr>
  <tr class="field invalidTime durationEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(JPortal.class, "invalidTime", userLang) %><jalios:edit pub='<%= obj %>' fields='invalidTime'/></td>
    <td class='field-data' >
            <jalios:duration time='<%= obj.getInvalidTime() * 1000L %>'/>
    </td>
  </tr>
  <tr class="field exactCategory booleanEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(JPortal.class, "exactCategory", userLang) %><jalios:edit pub='<%= obj %>' fields='exactCategory'/></td>
    <td class='field-data' >
            <%= obj.getExactCategoryLabel(userLang) %>
    </td>
  </tr>
  <tr class="field displayTopbar booleanEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(JPortal.class, "displayTopbar", userLang) %><jalios:edit pub='<%= obj %>' fields='displayTopbar'/></td>
    <td class='field-data' >
            <%= obj.getDisplayTopbarLabel(userLang) %>
    </td>
  </tr>
  <tr class="field displayScrollToTop booleanEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(JPortal.class, "displayScrollToTop", userLang) %><jalios:edit pub='<%= obj %>' fields='displayScrollToTop'/></td>
    <td class='field-data' >
            <%= obj.getDisplayScrollToTopLabel(userLang) %>
    </td>
  </tr>
 
</table>
<jsp:include page="/front/doFullDisplayCommonFields.jsp" />
</div><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- lgJ6j9Ka9hKebltg34lP4Q== --%>