<%@ page contentType="text/html; charset=UTF-8" %><%
%><%-- This file has been automatically generated. --%><%
%><%--
  @Summary: PortletPortalRedirect display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%
%><% PortletPortalRedirect obj = (PortletPortalRedirect)portlet; %><%
%><%@ include file='/front/doFullDisplay.jspf' %>
<div class="fullDisplay PortletPortalRedirect <%= obj.canBeEditedFieldByField(loggedMember) ? "unitFieldEdition" : "" %>" itemscope="itemscope">
<%@ include file='/front/publication/doPublicationHeader.jspf' %>
<table class="fields">
  <tr class="field status textfieldEditor  <%= Util.isEmpty(obj.getStatus()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletPortalRedirect.class, "status", userLang) %><jalios:edit pub='<%= obj %>' fields='status'/></td>
    <td class='field-data' <%= gfla(obj, "status") %>>
            <% if (Util.notEmpty(obj.getStatus())) { %>
            <%= obj.getStatus() %>
            <% } %>
    </td>
  </tr>
  <tr class="field content linkEditor  <%= Util.isEmpty(obj.getContent()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletPortalRedirect.class, "content", userLang) %><jalios:edit pub='<%= obj %>' fields='content'/></td>
    <td class='field-data' >
            <% if (obj.getContent() != null && obj.getContent().canBeReadBy(loggedMember)) { %>
            <jalios:link data='<%= obj.getContent() %>'/>
            <% } %>
    </td>
  </tr>
  <tr class="field redirectForm enumerateEditor  <%= Util.isEmpty(obj.getRedirectForm()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletPortalRedirect.class, "redirectForm", userLang) %><jalios:edit pub='<%= obj %>' fields='redirectForm'/></td>
    <td class='field-data' <%= gfla(obj, "redirectForm") %>>
            <% if (Util.notEmpty(obj.getRedirectForm())) { %>
            <%= obj.getRedirectFormLabel(obj.getRedirectForm(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field url textfieldEditor  <%= Util.isEmpty(obj.getUrl(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletPortalRedirect.class, "url", userLang) %><jalios:edit pub='<%= obj %>' fields='url'/></td>
    <td class='field-data' <%= gfla(obj, "url") %>>
            <% if (Util.notEmpty(obj.getUrl(userLang))) { %>
            <%= obj.getUrl(userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field redirectPortlet linkEditor  <%= Util.isEmpty(obj.getRedirectPortlet()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletPortalRedirect.class, "redirectPortlet", userLang) %><jalios:edit pub='<%= obj %>' fields='redirectPortlet'/></td>
    <td class='field-data' >
            <% if (obj.getRedirectPortlet() != null && obj.getRedirectPortlet().canBeReadBy(loggedMember)) { %>
            <jalios:link data='<%= obj.getRedirectPortlet() %>'/>
            <% } %>
    </td>
  </tr>
  <tr class="field category textfieldEditor  <%= Util.isEmpty(obj.getCategory()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletPortalRedirect.class, "category", userLang) %><jalios:edit pub='<%= obj %>' fields='category'/></td>
    <td class='field-data' <%= gfla(obj, "category") %>>
            <% if (Util.notEmpty(obj.getCategory())) { %>
            <%= obj.getCategory() %>
            <% } %>
    </td>
  </tr>
  <tr class="field dispPortal linkEditor  <%= Util.isEmpty(obj.getDispPortal()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletPortalRedirect.class, "dispPortal", userLang) %><jalios:edit pub='<%= obj %>' fields='dispPortal'/></td>
    <td class='field-data' >
            <% if (obj.getDispPortal() != null && obj.getDispPortal().canBeReadBy(loggedMember)) { %>
            <jalios:link data='<%= obj.getDispPortal() %>'/>
            <% } %>
    </td>
  </tr>
  <tr class="field navCategories categoryEditor  <%= Util.isEmpty(obj.getNavCategories(loggedMember)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletPortalRedirect.class, "navCategories", userLang) %><jalios:edit pub='<%= obj %>' fields='navCategories'/></td>
    <td class='field-data' >
            <% if (Util.notEmpty(obj.getNavCategories(loggedMember))) { %>
            <ol>
            <jalios:foreach collection="<%= obj.getNavCategories(loggedMember) %>" type="Category" name="itCategory" >
              <li><% if (itCategory != null) { %><a href="<%= ResourceHelper.getQuery() %>?cids=<%= itCategory.getId() %>"><%= itCategory.getAncestorString(channel.getCategory("j_3"), " > ", true, userLang) %></a><% } %></li>
            </jalios:foreach>
            </ol>
            <% } %>
    </td>
  </tr>
  <tr class="field description textareaEditor abstract <%= Util.isEmpty(obj.getDescription(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletPortalRedirect.class, "description", userLang) %><jalios:edit pub='<%= obj %>' fields='description'/></td>
    <td class='field-data' <%= gfla(obj, "description") %>>
            <% if (Util.notEmpty(obj.getDescription(userLang))) { %>
            <jalios:wiki><%= obj.getDescription(userLang) %></jalios:wiki>
            <% } %>
    </td>
  </tr>
  <tr class="field portletImage imageEditor  <%= Util.isEmpty(obj.getPortletImage(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletPortalRedirect.class, "portletImage", userLang) %><jalios:edit pub='<%= obj %>' fields='portletImage'/></td>
    <td class='field-data' <%= gfla(obj, "portletImage") %>>
            <% if (Util.notEmpty(obj.getPortletImage(userLang))) { %>
            <img src='<%= Util.encodeUrl(obj.getPortletImage(userLang)) %>' alt='' />
            <% } %>
    </td>
  </tr>
  <tr class="field cacheType enumerateEditor  <%= Util.isEmpty(obj.getCacheType()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletPortalRedirect.class, "cacheType", userLang) %><jalios:edit pub='<%= obj %>' fields='cacheType'/></td>
    <td class='field-data' <%= gfla(obj, "cacheType") %>>
            <% if (Util.notEmpty(obj.getCacheType())) { %>
            <%= obj.getCacheTypeLabel(obj.getCacheType(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field cacheSensibility enumerateEditor  <%= Util.isEmpty(obj.getCacheSensibility()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletPortalRedirect.class, "cacheSensibility", userLang) %><jalios:edit pub='<%= obj %>' fields='cacheSensibility'/></td>
    <td class='field-data' <%= gfla(obj, "cacheSensibility") %>>
            <% if (Util.notEmpty(obj.getCacheSensibility())) { %>
            <%= obj.getCacheSensibilityLabel(obj.getCacheSensibility(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field invalidClass enumerateEditor  <%= Util.isEmpty(obj.getInvalidClass()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletPortalRedirect.class, "invalidClass", userLang) %><jalios:edit pub='<%= obj %>' fields='invalidClass'/></td>
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
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletPortalRedirect.class, "invalidTime", userLang) %><jalios:edit pub='<%= obj %>' fields='invalidTime'/></td>
    <td class='field-data' >
            <jalios:duration time='<%= obj.getInvalidTime() * 1000L %>'/>
    </td>
  </tr>
  <tr class="field behaviorCopy enumerateEditor  <%= Util.isEmpty(obj.getBehaviorCopy()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletPortalRedirect.class, "behaviorCopy", userLang) %><jalios:edit pub='<%= obj %>' fields='behaviorCopy'/></td>
    <td class='field-data' <%= gfla(obj, "behaviorCopy") %>>
            <% if (Util.notEmpty(obj.getBehaviorCopy())) { %>
            <%= obj.getBehaviorCopyLabel(obj.getBehaviorCopy(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field cssId textfieldEditor  <%= Util.isEmpty(obj.getCssId()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletPortalRedirect.class, "cssId", userLang) %><jalios:edit pub='<%= obj %>' fields='cssId'/></td>
    <td class='field-data' <%= gfla(obj, "cssId") %>>
            <% if (Util.notEmpty(obj.getCssId())) { %>
            <%= obj.getCssId() %>
            <% } %>
    </td>
  </tr>
  <tr class="field cssClasses textfieldEditor  <%= Util.isEmpty(obj.getCssClasses()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletPortalRedirect.class, "cssClasses", userLang) %><jalios:edit pub='<%= obj %>' fields='cssClasses'/></td>
    <td class='field-data' <%= gfla(obj, "cssClasses") %>>
            <% if (Util.notEmpty(obj.getCssClasses())) { %>
            <%= obj.getCssClasses() %>
            <% } %>
    </td>
  </tr>
  <tr class="field exactCategory booleanEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletPortalRedirect.class, "exactCategory", userLang) %><jalios:edit pub='<%= obj %>' fields='exactCategory'/></td>
    <td class='field-data' >
            <%= obj.getExactCategoryLabel(userLang) %>
    </td>
  </tr>
 
</table>
<jsp:include page="/front/doFullDisplayCommonFields.jsp" />
</div><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- C4Vwz+meCC67cW+TmsADxA== --%>