<%@ page contentType="text/html; charset=UTF-8" %><%
%><%-- This file has been automatically generated. --%><%
%><%--
  @Summary: PortletQueryForeach display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%
%><% PortletQueryForeach obj = (PortletQueryForeach)portlet; %><%
%><%@ include file='/front/doFullDisplay.jspf' %>
<div class="fullDisplay PortletQueryForeach <%= obj.canBeEditedFieldByField(loggedMember) ? "unitFieldEdition" : "" %>" itemscope="itemscope">
<%@ include file='/front/publication/doPublicationHeader.jspf' %>
<table class="fields">
  <tr class="field searchInDB booleanEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "searchInDB", userLang) %></td>
    <td class='field-data' >
            <%= obj.getSearchInDBLabel(userLang) %>
    </td>
  </tr>
  <tr class="field queries queryEditor  <%= Util.isEmpty(obj.getQueries()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "queries", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "queries") %>>
        <% if (Util.notEmpty(obj.getQueries())) { %>
            <ol>
            <jalios:foreach name="itString" type="String" array="<%= obj.getQueries() %>">
            <% if (Util.notEmpty(itString)) { %>
              <li>
              <%= itString %>
              <ul style="list-style-type: none; padding: 0">
              <jalios:query name='queriesResultSet' queryString='<%= itString %>' />
              <jalios:pager name="queriesPager" declare='true' action="init" size="<%= queriesResultSet.size() %>"/>
              <jalios:foreach counter='itCounter2'
                               collection='<%= queriesResultSet %>' 
                               type='Publication' 
                               name='itPub' 
                               max='<%= queriesPager.getPageSize() %>'
                               skip='<%= queriesPager.getStart() %>'
                               >
              <li><%= itCounter2.intValue() + queriesPager.getStart() %>. <jalios:link data='<%= itPub %>'/></li>
              </jalios:foreach>
              </ul>
              <jalios:pager name="queriesPager" /> 
              </li>
            <% } %>
            </jalios:foreach>
            </ol>
        <% } %>
    </td>
  </tr>
  <tr class="field refineQueries enumerateEditor  <%= Util.isEmpty(obj.getRefineQueries()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "refineQueries", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "refineQueries") %>>
            <% if (Util.notEmpty(obj.getRefineQueries())) { %>
            <%= obj.getRefineQueriesLabel(obj.getRefineQueries(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field refineWithContextualCategories booleanEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "refineWithContextualCategories", userLang) %></td>
    <td class='field-data' >
            <%= obj.getRefineWithContextualCategoriesLabel(userLang) %>
    </td>
  </tr>
  <tr class="field displayMode enumerateEditor  <%= Util.isEmpty(obj.getDisplayMode()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "displayMode", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "displayMode") %>>
            <% if (Util.notEmpty(obj.getDisplayMode())) { %>
            <%= obj.getDisplayModeLabel(obj.getDisplayMode(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field orderBy enumerateEditor  <%= Util.isEmpty(obj.getOrderBy()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "orderBy", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "orderBy") %>>
            <% if (Util.notEmpty(obj.getOrderBy())) { %>
            <%= obj.getOrderByLabel(obj.getOrderBy(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field reverseOrder enumerateEditor  <%= Util.isEmpty(obj.getReverseOrder()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "reverseOrder", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "reverseOrder") %>>
            <% if (Util.notEmpty(obj.getReverseOrder())) { %>
            <%= obj.getReverseOrderLabel(obj.getReverseOrder(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field maxResults intEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "maxResults", userLang) %></td>
    <td class='field-data' >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(obj.getMaxResults()) %>
    </td>
  </tr>
  <tr class="field skipFirstResults intEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "skipFirstResults", userLang) %></td>
    <td class='field-data' >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(obj.getSkipFirstResults()) %>
    </td>
  </tr>
  <tr class="field skipDisplayedPublications booleanEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "skipDisplayedPublications", userLang) %></td>
    <td class='field-data' >
            <%= obj.getSkipDisplayedPublicationsLabel(userLang) %>
    </td>
  </tr>
  <tr class="field showPager enumerateEditor  <%= Util.isEmpty(obj.getShowPager()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "showPager", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "showPager") %>>
            <% if (Util.notEmpty(obj.getShowPager())) { %>
            <%= obj.getShowPagerLabel(obj.getShowPager(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field pagerLabel textfieldEditor  <%= Util.isEmpty(obj.getPagerLabel(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "pagerLabel", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "pagerLabel") %>>
            <% if (Util.notEmpty(obj.getPagerLabel(userLang))) { %>
            <%= obj.getPagerLabel(userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field pageSizes intEditor  <%= Util.isEmpty(obj.getPageSizes()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "pageSizes", userLang) %></td>
    <td class='field-data' >
            <% if (Util.notEmpty(obj.getPageSizes())) { %>
            <ol>
              <% for(int value: obj.getPageSizes()) { %>
              <li><% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(value) %></li>
              <% } %>
            </ol>
            <% } %>
    </td>
  </tr>
  <tr class="field pagerAllLimit intEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "pagerAllLimit", userLang) %></td>
    <td class='field-data' >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(obj.getPagerAllLimit()) %>
    </td>
  </tr>
  <tr class="field hideWhenNoResults booleanEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "hideWhenNoResults", userLang) %></td>
    <td class='field-data' >
            <%= obj.getHideWhenNoResultsLabel(userLang) %>
    </td>
  </tr>
  <tr class="field firstPublications linkEditor  <%= Util.isEmpty(obj.getFirstPublications()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "firstPublications", userLang) %></td>
    <td class='field-data' >
            <% if (Util.notEmpty(obj.getFirstPublications())) { %>
            <ol>
              <jalios:foreach name="itData" type="com.jalios.jcms.Content" array="<%= obj.getFirstPublications() %>">
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
  <tr class="field showInCurrentPortal booleanEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "showInCurrentPortal", userLang) %></td>
    <td class='field-data' >
            <%= obj.getShowInCurrentPortalLabel(userLang) %>
    </td>
  </tr>
  <tr class="field contextCategory booleanEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "contextCategory", userLang) %></td>
    <td class='field-data' >
            <%= obj.getContextCategoryLabel(userLang) %>
    </td>
  </tr>
  <tr class="field publications linkEditor  <%= Util.isEmpty(obj.getPublications()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "publications", userLang) %></td>
    <td class='field-data' >
            <% if (Util.notEmpty(obj.getPublications())) { %>
            <ol>
              <jalios:foreach name="itData" type="com.jalios.jcms.Publication" array="<%= obj.getPublications() %>">
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
  <tr class="field description textareaEditor abstract <%= Util.isEmpty(obj.getDescription(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "description", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "description") %>>
            <% if (Util.notEmpty(obj.getDescription(userLang))) { %>
            <jalios:wiki><%= obj.getDescription(userLang) %></jalios:wiki>
            <% } %>
    </td>
  </tr>
  <tr class="field portletImage imageEditor  <%= Util.isEmpty(obj.getPortletImage(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "portletImage", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "portletImage") %>>
            <% if (Util.notEmpty(obj.getPortletImage(userLang))) { %>
            <img src='<%= Util.encodeUrl(obj.getPortletImage(userLang)) %>' alt='' />
            <% } %>
    </td>
  </tr>
  <tr class="field cacheType enumerateEditor  <%= Util.isEmpty(obj.getCacheType()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "cacheType", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "cacheType") %>>
            <% if (Util.notEmpty(obj.getCacheType())) { %>
            <%= obj.getCacheTypeLabel(obj.getCacheType(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field cacheSensibility enumerateEditor  <%= Util.isEmpty(obj.getCacheSensibility()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "cacheSensibility", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "cacheSensibility") %>>
            <% if (Util.notEmpty(obj.getCacheSensibility())) { %>
            <%= obj.getCacheSensibilityLabel(obj.getCacheSensibility(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field invalidClass enumerateEditor  <%= Util.isEmpty(obj.getInvalidClass()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "invalidClass", userLang) %></td>
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
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "invalidTime", userLang) %></td>
    <td class='field-data' >
            <jalios:duration time='<%= obj.getInvalidTime() * 1000L %>'/>
    </td>
  </tr>
  <tr class="field displayCSS enumerateEditor  <%= Util.isEmpty(obj.getDisplayCSS()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "displayCSS", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "displayCSS") %>>
            <% if (Util.notEmpty(obj.getDisplayCSS())) { %>
            <%= obj.getDisplayCSSLabel(obj.getDisplayCSS(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field width textfieldEditor  <%= Util.isEmpty(obj.getWidth()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "width", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "width") %>>
            <% if (Util.notEmpty(obj.getWidth())) { %>
            <%= obj.getWidth() %>
            <% } %>
    </td>
  </tr>
  <tr class="field insetLeft intEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "insetLeft", userLang) %></td>
    <td class='field-data' >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(obj.getInsetLeft()) %>px
    </td>
  </tr>
  <tr class="field insetRight intEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "insetRight", userLang) %></td>
    <td class='field-data' >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(obj.getInsetRight()) %>px
    </td>
  </tr>
  <tr class="field insetTop intEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "insetTop", userLang) %></td>
    <td class='field-data' >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(obj.getInsetTop()) %>px
    </td>
  </tr>
  <tr class="field insetBottom intEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "insetBottom", userLang) %></td>
    <td class='field-data' >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(obj.getInsetBottom()) %>px
    </td>
  </tr>
  <tr class="field cellPadding intEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "cellPadding", userLang) %></td>
    <td class='field-data' >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(obj.getCellPadding()) %>px
    </td>
  </tr>
  <tr class="field alignH enumerateEditor  <%= Util.isEmpty(obj.getAlignH()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "alignH", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "alignH") %>>
            <% if (Util.notEmpty(obj.getAlignH())) { %>
            <%= obj.getAlignHLabel(obj.getAlignH(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field alignV enumerateEditor  <%= Util.isEmpty(obj.getAlignV()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "alignV", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "alignV") %>>
            <% if (Util.notEmpty(obj.getAlignV())) { %>
            <%= obj.getAlignVLabel(obj.getAlignV(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field alignTable enumerateEditor  <%= Util.isEmpty(obj.getAlignTable()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "alignTable", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "alignTable") %>>
            <% if (Util.notEmpty(obj.getAlignTable())) { %>
            <%= obj.getAlignTableLabel(obj.getAlignTable(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field border intEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "border", userLang) %></td>
    <td class='field-data' >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(obj.getBorder()) %>px
    </td>
  </tr>
  <tr class="field borderColor colorEditor  <%= Util.isEmpty(obj.getBorderColor()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "borderColor", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "borderColor") %>>
            <% if (Util.notEmpty(obj.getBorderColor())) { %>
            <%= obj.getBorderColor() %>
            <% } %>
    </td>
  </tr>
  <tr class="field backColor colorEditor  <%= Util.isEmpty(obj.getBackColor()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "backColor", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "backColor") %>>
            <% if (Util.notEmpty(obj.getBackColor())) { %>
            <%= obj.getBackColor() %>
            <% } %>
    </td>
  </tr>
  <tr class="field backImage imageEditor  <%= Util.isEmpty(obj.getBackImage()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "backImage", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "backImage") %>>
            <% if (Util.notEmpty(obj.getBackImage())) { %>
            <img src='<%= Util.encodeUrl(obj.getBackImage()) %>' alt='' />
            <% } %>
    </td>
  </tr>
  <tr class="field displayTitle textfieldEditor  <%= Util.isEmpty(obj.getDisplayTitle(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "displayTitle", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "displayTitle") %>>
            <% if (Util.notEmpty(obj.getDisplayTitle(userLang))) { %>
            <%= obj.getDisplayTitle(userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field skins textfieldEditor  <%= Util.isEmpty(obj.getSkins()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "skins", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "skins") %>>
        <% if (Util.notEmpty(obj.getSkins())) { %>
            <ol>
            <jalios:foreach name="itString" type="String" array="<%= obj.getSkins() %>">
            <% if (Util.notEmpty(itString)) { %>
              <li>
              <%= itString %>
              </li>
            <% } %>
            </jalios:foreach>
            </ol>
        <% } %>
    </td>
  </tr>
  <tr class="field skinCSS enumerateEditor  <%= Util.isEmpty(obj.getSkinCSS()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "skinCSS", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "skinCSS") %>>
            <% if (Util.notEmpty(obj.getSkinCSS())) { %>
            <%= obj.getSkinCSSLabel(obj.getSkinCSS(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field popupState enumerateEditor  <%= Util.isEmpty(obj.getPopupState()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "popupState", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "popupState") %>>
            <% if (Util.notEmpty(obj.getPopupState())) { %>
            <%= obj.getPopupStateLabel(obj.getPopupState(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field expandState enumerateEditor  <%= Util.isEmpty(obj.getExpandState()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "expandState", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "expandState") %>>
            <% if (Util.notEmpty(obj.getExpandState())) { %>
            <%= obj.getExpandStateLabel(obj.getExpandState(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field behaviorCopy enumerateEditor  <%= Util.isEmpty(obj.getBehaviorCopy()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "behaviorCopy", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "behaviorCopy") %>>
            <% if (Util.notEmpty(obj.getBehaviorCopy())) { %>
            <%= obj.getBehaviorCopyLabel(obj.getBehaviorCopy(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field originalPortlet linkEditor  <%= Util.isEmpty(obj.getOriginalPortlet()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "originalPortlet", userLang) %></td>
    <td class='field-data' >
            <% if (obj.getOriginalPortlet() != null && obj.getOriginalPortlet().canBeReadBy(loggedMember)) { %>
            <jalios:link data='<%= obj.getOriginalPortlet() %>'/>
            <% } %>
    </td>
  </tr>
  <tr class="field condition enumerateEditor  <%= Util.isEmpty(obj.getCondition()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "condition", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "condition") %>>
        <% if (Util.notEmpty(obj.getCondition())) { %>
            <ol>
            <jalios:foreach name="itString" type="String" array="<%= obj.getCondition() %>">
            <% if (Util.notEmpty(itString)) { %>
              <li>
            <%= obj.getConditionLabel(itString, userLang) %>
              </li>
            <% } %>
            </jalios:foreach>
            </ol>
        <% } %>
    </td>
  </tr>
  <tr class="field cssId textfieldEditor  <%= Util.isEmpty(obj.getCssId()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "cssId", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "cssId") %>>
            <% if (Util.notEmpty(obj.getCssId())) { %>
            <%= obj.getCssId() %>
            <% } %>
    </td>
  </tr>
  <tr class="field cssClasses textfieldEditor  <%= Util.isEmpty(obj.getCssClasses()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "cssClasses", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "cssClasses") %>>
            <% if (Util.notEmpty(obj.getCssClasses())) { %>
            <%= obj.getCssClasses() %>
            <% } %>
    </td>
  </tr>
  <tr class="field skinClasses textfieldEditor  <%= Util.isEmpty(obj.getSkinClasses()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "skinClasses", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "skinClasses") %>>
            <% if (Util.notEmpty(obj.getSkinClasses())) { %>
            <%= obj.getSkinClasses() %>
            <% } %>
    </td>
  </tr>
  <tr class="field skinFooter wysiwygEditor  <%= Util.isEmpty(obj.getSkinFooter(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "skinFooter", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "skinFooter") %>>
            <% if (Util.notEmpty(obj.getSkinFooter(userLang))) { %>
            <jalios:wysiwyg data='<%= obj %>' field='skinFooter'><%= obj.getSkinFooter(userLang) %></jalios:wysiwyg>            
            <% } %>
    </td>
  </tr>
  <tr class="field skinHeaderIcon textfieldEditor  <%= Util.isEmpty(obj.getSkinHeaderIcon()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "skinHeaderIcon", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "skinHeaderIcon") %>>
            <% if (Util.notEmpty(obj.getSkinHeaderIcon())) { %>
            <%= obj.getSkinHeaderIcon() %>
            <% } %>
    </td>
  </tr>
  <tr class="field skinHeaderIconColor textfieldEditor  <%= Util.isEmpty(obj.getSkinHeaderIconColor()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "skinHeaderIconColor", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "skinHeaderIconColor") %>>
            <% if (Util.notEmpty(obj.getSkinHeaderIconColor())) { %>
            <%= obj.getSkinHeaderIconColor() %>
            <% } %>
    </td>
  </tr>
  <tr class="field skinFooterButtonLabel textfieldEditor  <%= Util.isEmpty(obj.getSkinFooterButtonLabel(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "skinFooterButtonLabel", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "skinFooterButtonLabel") %>>
            <% if (Util.notEmpty(obj.getSkinFooterButtonLabel(userLang))) { %>
            <%= obj.getSkinFooterButtonLabel(userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field skinFooterButtonLink urlEditor  <%= Util.isEmpty(obj.getSkinFooterButtonLink()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "skinFooterButtonLink", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "skinFooterButtonLink") %>>
            <% if (Util.notEmpty(obj.getSkinFooterButtonLink())) { %>
            <a href='<%= obj.getSkinFooterButtonLink() %>' ><%= obj.getSkinFooterButtonLink()%></a>
            <% } %>
    </td>
  </tr>
  <tr class="field skinFooterButtonAlign enumerateEditor  <%= Util.isEmpty(obj.getSkinFooterButtonAlign()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "skinFooterButtonAlign", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "skinFooterButtonAlign") %>>
            <% if (Util.notEmpty(obj.getSkinFooterButtonAlign())) { %>
            <%= obj.getSkinFooterButtonAlignLabel(obj.getSkinFooterButtonAlign(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field skinHeaderButtonLabel textfieldEditor  <%= Util.isEmpty(obj.getSkinHeaderButtonLabel(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "skinHeaderButtonLabel", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "skinHeaderButtonLabel") %>>
            <% if (Util.notEmpty(obj.getSkinHeaderButtonLabel(userLang))) { %>
            <%= obj.getSkinHeaderButtonLabel(userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field skinHeaderButtonLink urlEditor  <%= Util.isEmpty(obj.getSkinHeaderButtonLink()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "skinHeaderButtonLink", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "skinHeaderButtonLink") %>>
            <% if (Util.notEmpty(obj.getSkinHeaderButtonLink())) { %>
            <a href='<%= obj.getSkinHeaderButtonLink() %>' ><%= obj.getSkinHeaderButtonLink()%></a>
            <% } %>
    </td>
  </tr>
  <tr class="field skinHeaderSubText textfieldEditor  <%= Util.isEmpty(obj.getSkinHeaderSubText(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletQueryForeach.class, "skinHeaderSubText", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "skinHeaderSubText") %>>
            <% if (Util.notEmpty(obj.getSkinHeaderSubText(userLang))) { %>
            <%= obj.getSkinHeaderSubText(userLang) %>
            <% } %>
    </td>
  </tr>
 
</table>
<jsp:include page="/front/doFullDisplayCommonFields.jsp" />
</div><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- 2MUpFR8om6qTnLdvmR1/kQ== --%>