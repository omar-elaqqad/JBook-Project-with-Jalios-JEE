<%@ page contentType="text/html; charset=UTF-8" %><%
%><%-- This file has been automatically generated. --%><%
%><%--
  @Summary: PortletWorkflow display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%
%><% PortletWorkflow obj = (PortletWorkflow)portlet; %><%
%><%@ include file='/front/doFullDisplay.jspf' %>
<div class="fullDisplay PortletWorkflow <%= obj.canBeEditedFieldByField(loggedMember) ? "unitFieldEdition" : "" %>" itemscope="itemscope">
<%@ include file='/front/publication/doPublicationHeader.jspf' %>
<table class="fields">
  <tr class="field queries queryEditor  <%= Util.isEmpty(obj.getQueries()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletWorkflow.class, "queries", userLang) %></td>
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
  <tr class="field maximumItemsPerWorkspace intEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletWorkflow.class, "maximumItemsPerWorkspace", userLang) %></td>
    <td class='field-data' >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(obj.getMaximumItemsPerWorkspace()) %>
    </td>
  </tr>
  <tr class="field orderBy enumerateEditor  <%= Util.isEmpty(obj.getOrderBy()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletWorkflow.class, "orderBy", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "orderBy") %>>
            <% if (Util.notEmpty(obj.getOrderBy())) { %>
            <%= obj.getOrderByLabel(obj.getOrderBy(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field hideWhenNoResults booleanEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletWorkflow.class, "hideWhenNoResults", userLang) %></td>
    <td class='field-data' >
            <%= obj.getHideWhenNoResultsLabel(userLang) %>
    </td>
  </tr>
  <tr class="field pageSizes intEditor  <%= Util.isEmpty(obj.getPageSizes()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletWorkflow.class, "pageSizes", userLang) %></td>
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
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletWorkflow.class, "pagerAllLimit", userLang) %></td>
    <td class='field-data' >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(obj.getPagerAllLimit()) %>
    </td>
  </tr>
  <tr class="field displayCSWorkspacePublication booleanEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletWorkflow.class, "displayCSWorkspacePublication", userLang) %></td>
    <td class='field-data' >
            <%= obj.getDisplayCSWorkspacePublicationLabel(userLang) %>
    </td>
  </tr>
  <tr class="field description textareaEditor abstract <%= Util.isEmpty(obj.getDescription(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletWorkflow.class, "description", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "description") %>>
            <% if (Util.notEmpty(obj.getDescription(userLang))) { %>
            <jalios:wiki><%= obj.getDescription(userLang) %></jalios:wiki>
            <% } %>
    </td>
  </tr>
  <tr class="field portletImage imageEditor  <%= Util.isEmpty(obj.getPortletImage(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletWorkflow.class, "portletImage", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "portletImage") %>>
            <% if (Util.notEmpty(obj.getPortletImage(userLang))) { %>
            <img src='<%= Util.encodeUrl(obj.getPortletImage(userLang)) %>' alt='' />
            <% } %>
    </td>
  </tr>
  <tr class="field cacheType enumerateEditor  <%= Util.isEmpty(obj.getCacheType()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletWorkflow.class, "cacheType", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "cacheType") %>>
            <% if (Util.notEmpty(obj.getCacheType())) { %>
            <%= obj.getCacheTypeLabel(obj.getCacheType(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field cacheSensibility enumerateEditor  <%= Util.isEmpty(obj.getCacheSensibility()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletWorkflow.class, "cacheSensibility", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "cacheSensibility") %>>
            <% if (Util.notEmpty(obj.getCacheSensibility())) { %>
            <%= obj.getCacheSensibilityLabel(obj.getCacheSensibility(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field invalidClass enumerateEditor  <%= Util.isEmpty(obj.getInvalidClass()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletWorkflow.class, "invalidClass", userLang) %></td>
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
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletWorkflow.class, "invalidTime", userLang) %></td>
    <td class='field-data' >
            <jalios:duration time='<%= obj.getInvalidTime() * 1000L %>'/>
    </td>
  </tr>
  <tr class="field displayCSS enumerateEditor  <%= Util.isEmpty(obj.getDisplayCSS()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletWorkflow.class, "displayCSS", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "displayCSS") %>>
            <% if (Util.notEmpty(obj.getDisplayCSS())) { %>
            <%= obj.getDisplayCSSLabel(obj.getDisplayCSS(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field width textfieldEditor  <%= Util.isEmpty(obj.getWidth()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletWorkflow.class, "width", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "width") %>>
            <% if (Util.notEmpty(obj.getWidth())) { %>
            <%= obj.getWidth() %>
            <% } %>
    </td>
  </tr>
  <tr class="field insetLeft intEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletWorkflow.class, "insetLeft", userLang) %></td>
    <td class='field-data' >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(obj.getInsetLeft()) %>px
    </td>
  </tr>
  <tr class="field insetRight intEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletWorkflow.class, "insetRight", userLang) %></td>
    <td class='field-data' >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(obj.getInsetRight()) %>px
    </td>
  </tr>
  <tr class="field insetTop intEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletWorkflow.class, "insetTop", userLang) %></td>
    <td class='field-data' >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(obj.getInsetTop()) %>px
    </td>
  </tr>
  <tr class="field insetBottom intEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletWorkflow.class, "insetBottom", userLang) %></td>
    <td class='field-data' >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(obj.getInsetBottom()) %>px
    </td>
  </tr>
  <tr class="field cellPadding intEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletWorkflow.class, "cellPadding", userLang) %></td>
    <td class='field-data' >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(obj.getCellPadding()) %>px
    </td>
  </tr>
  <tr class="field alignH enumerateEditor  <%= Util.isEmpty(obj.getAlignH()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletWorkflow.class, "alignH", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "alignH") %>>
            <% if (Util.notEmpty(obj.getAlignH())) { %>
            <%= obj.getAlignHLabel(obj.getAlignH(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field alignV enumerateEditor  <%= Util.isEmpty(obj.getAlignV()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletWorkflow.class, "alignV", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "alignV") %>>
            <% if (Util.notEmpty(obj.getAlignV())) { %>
            <%= obj.getAlignVLabel(obj.getAlignV(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field alignTable enumerateEditor  <%= Util.isEmpty(obj.getAlignTable()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletWorkflow.class, "alignTable", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "alignTable") %>>
            <% if (Util.notEmpty(obj.getAlignTable())) { %>
            <%= obj.getAlignTableLabel(obj.getAlignTable(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field border intEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletWorkflow.class, "border", userLang) %></td>
    <td class='field-data' >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(obj.getBorder()) %>px
    </td>
  </tr>
  <tr class="field borderColor colorEditor  <%= Util.isEmpty(obj.getBorderColor()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletWorkflow.class, "borderColor", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "borderColor") %>>
            <% if (Util.notEmpty(obj.getBorderColor())) { %>
            <%= obj.getBorderColor() %>
            <% } %>
    </td>
  </tr>
  <tr class="field backColor colorEditor  <%= Util.isEmpty(obj.getBackColor()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletWorkflow.class, "backColor", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "backColor") %>>
            <% if (Util.notEmpty(obj.getBackColor())) { %>
            <%= obj.getBackColor() %>
            <% } %>
    </td>
  </tr>
  <tr class="field backImage imageEditor  <%= Util.isEmpty(obj.getBackImage()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletWorkflow.class, "backImage", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "backImage") %>>
            <% if (Util.notEmpty(obj.getBackImage())) { %>
            <img src='<%= Util.encodeUrl(obj.getBackImage()) %>' alt='' />
            <% } %>
    </td>
  </tr>
  <tr class="field displayTitle textfieldEditor  <%= Util.isEmpty(obj.getDisplayTitle(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletWorkflow.class, "displayTitle", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "displayTitle") %>>
            <% if (Util.notEmpty(obj.getDisplayTitle(userLang))) { %>
            <%= obj.getDisplayTitle(userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field skins textfieldEditor  <%= Util.isEmpty(obj.getSkins()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletWorkflow.class, "skins", userLang) %></td>
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
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletWorkflow.class, "skinCSS", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "skinCSS") %>>
            <% if (Util.notEmpty(obj.getSkinCSS())) { %>
            <%= obj.getSkinCSSLabel(obj.getSkinCSS(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field popupState enumerateEditor  <%= Util.isEmpty(obj.getPopupState()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletWorkflow.class, "popupState", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "popupState") %>>
            <% if (Util.notEmpty(obj.getPopupState())) { %>
            <%= obj.getPopupStateLabel(obj.getPopupState(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field expandState enumerateEditor  <%= Util.isEmpty(obj.getExpandState()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletWorkflow.class, "expandState", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "expandState") %>>
            <% if (Util.notEmpty(obj.getExpandState())) { %>
            <%= obj.getExpandStateLabel(obj.getExpandState(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field behaviorCopy enumerateEditor  <%= Util.isEmpty(obj.getBehaviorCopy()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletWorkflow.class, "behaviorCopy", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "behaviorCopy") %>>
            <% if (Util.notEmpty(obj.getBehaviorCopy())) { %>
            <%= obj.getBehaviorCopyLabel(obj.getBehaviorCopy(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field originalPortlet linkEditor  <%= Util.isEmpty(obj.getOriginalPortlet()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletWorkflow.class, "originalPortlet", userLang) %></td>
    <td class='field-data' >
            <% if (obj.getOriginalPortlet() != null && obj.getOriginalPortlet().canBeReadBy(loggedMember)) { %>
            <jalios:link data='<%= obj.getOriginalPortlet() %>'/>
            <% } %>
    </td>
  </tr>
  <tr class="field condition enumerateEditor  <%= Util.isEmpty(obj.getCondition()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletWorkflow.class, "condition", userLang) %></td>
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
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletWorkflow.class, "cssId", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "cssId") %>>
            <% if (Util.notEmpty(obj.getCssId())) { %>
            <%= obj.getCssId() %>
            <% } %>
    </td>
  </tr>
  <tr class="field cssClasses textfieldEditor  <%= Util.isEmpty(obj.getCssClasses()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletWorkflow.class, "cssClasses", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "cssClasses") %>>
            <% if (Util.notEmpty(obj.getCssClasses())) { %>
            <%= obj.getCssClasses() %>
            <% } %>
    </td>
  </tr>
  <tr class="field skinClasses textfieldEditor  <%= Util.isEmpty(obj.getSkinClasses()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletWorkflow.class, "skinClasses", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "skinClasses") %>>
            <% if (Util.notEmpty(obj.getSkinClasses())) { %>
            <%= obj.getSkinClasses() %>
            <% } %>
    </td>
  </tr>
  <tr class="field skinFooter wysiwygEditor  <%= Util.isEmpty(obj.getSkinFooter(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletWorkflow.class, "skinFooter", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "skinFooter") %>>
            <% if (Util.notEmpty(obj.getSkinFooter(userLang))) { %>
            <jalios:wysiwyg data='<%= obj %>' field='skinFooter'><%= obj.getSkinFooter(userLang) %></jalios:wysiwyg>            
            <% } %>
    </td>
  </tr>
  <tr class="field skinHeaderIcon textfieldEditor  <%= Util.isEmpty(obj.getSkinHeaderIcon()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletWorkflow.class, "skinHeaderIcon", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "skinHeaderIcon") %>>
            <% if (Util.notEmpty(obj.getSkinHeaderIcon())) { %>
            <%= obj.getSkinHeaderIcon() %>
            <% } %>
    </td>
  </tr>
  <tr class="field skinHeaderIconColor textfieldEditor  <%= Util.isEmpty(obj.getSkinHeaderIconColor()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletWorkflow.class, "skinHeaderIconColor", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "skinHeaderIconColor") %>>
            <% if (Util.notEmpty(obj.getSkinHeaderIconColor())) { %>
            <%= obj.getSkinHeaderIconColor() %>
            <% } %>
    </td>
  </tr>
  <tr class="field skinFooterButtonLabel textfieldEditor  <%= Util.isEmpty(obj.getSkinFooterButtonLabel(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletWorkflow.class, "skinFooterButtonLabel", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "skinFooterButtonLabel") %>>
            <% if (Util.notEmpty(obj.getSkinFooterButtonLabel(userLang))) { %>
            <%= obj.getSkinFooterButtonLabel(userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field skinFooterButtonLink urlEditor  <%= Util.isEmpty(obj.getSkinFooterButtonLink()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletWorkflow.class, "skinFooterButtonLink", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "skinFooterButtonLink") %>>
            <% if (Util.notEmpty(obj.getSkinFooterButtonLink())) { %>
            <a href='<%= obj.getSkinFooterButtonLink() %>' ><%= obj.getSkinFooterButtonLink()%></a>
            <% } %>
    </td>
  </tr>
  <tr class="field skinFooterButtonAlign enumerateEditor  <%= Util.isEmpty(obj.getSkinFooterButtonAlign()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletWorkflow.class, "skinFooterButtonAlign", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "skinFooterButtonAlign") %>>
            <% if (Util.notEmpty(obj.getSkinFooterButtonAlign())) { %>
            <%= obj.getSkinFooterButtonAlignLabel(obj.getSkinFooterButtonAlign(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field skinHeaderButtonLabel textfieldEditor  <%= Util.isEmpty(obj.getSkinHeaderButtonLabel(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletWorkflow.class, "skinHeaderButtonLabel", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "skinHeaderButtonLabel") %>>
            <% if (Util.notEmpty(obj.getSkinHeaderButtonLabel(userLang))) { %>
            <%= obj.getSkinHeaderButtonLabel(userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field skinHeaderButtonLink urlEditor  <%= Util.isEmpty(obj.getSkinHeaderButtonLink()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletWorkflow.class, "skinHeaderButtonLink", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "skinHeaderButtonLink") %>>
            <% if (Util.notEmpty(obj.getSkinHeaderButtonLink())) { %>
            <a href='<%= obj.getSkinHeaderButtonLink() %>' ><%= obj.getSkinHeaderButtonLink()%></a>
            <% } %>
    </td>
  </tr>
  <tr class="field skinHeaderSubText textfieldEditor  <%= Util.isEmpty(obj.getSkinHeaderSubText(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletWorkflow.class, "skinHeaderSubText", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "skinHeaderSubText") %>>
            <% if (Util.notEmpty(obj.getSkinHeaderSubText(userLang))) { %>
            <%= obj.getSkinHeaderSubText(userLang) %>
            <% } %>
    </td>
  </tr>
 
</table>
<jsp:include page="/front/doFullDisplayCommonFields.jsp" />
</div><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- MWtYQgUkA6FEytRqQBS/kw== --%>