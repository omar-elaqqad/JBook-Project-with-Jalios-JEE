<%@ page contentType="text/html; charset=UTF-8" %><%
%><%-- This file has been automatically generated. --%><%
%><%--
  @Summary: PortletIndicator display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%
%><% PortletIndicator obj = (PortletIndicator)portlet; %><%
%><%@ include file='/front/doFullDisplay.jspf' %>
<div class="fullDisplay PortletIndicator <%= obj.canBeEditedFieldByField(loggedMember) ? "unitFieldEdition" : "" %>" itemscope="itemscope">
<%@ include file='/front/publication/doPublicationHeader.jspf' %>
<table class="fields">
  <tr class="field indicatorType enumerateEditor  <%= Util.isEmpty(obj.getIndicatorType()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "indicatorType", userLang) %><jalios:edit pub='<%= obj %>' fields='indicatorType'/></td>
    <td class='field-data' <%= gfla(obj, "indicatorType") %>>
            <% if (Util.notEmpty(obj.getIndicatorType())) { %>
            <%= obj.getIndicatorTypeLabel(obj.getIndicatorType(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field value doubleEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "value", userLang) %><jalios:edit pub='<%= obj %>' fields='value'/></td>
    <td class='field-data' >
            <% /* %>123456789<% */ %><%= (new DecimalFormat("#.##")).format(obj.getValue()) %>
    </td>
  </tr>
  <tr class="field targetValue doubleEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "targetValue", userLang) %><jalios:edit pub='<%= obj %>' fields='targetValue'/></td>
    <td class='field-data' >
            <% /* %>123456789<% */ %><%= (new DecimalFormat("#.##")).format(obj.getTargetValue()) %>
    </td>
  </tr>
  <tr class="field percentage booleanEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "percentage", userLang) %><jalios:edit pub='<%= obj %>' fields='percentage'/></td>
    <td class='field-data' >
            <%= obj.getPercentageLabel(userLang) %>
    </td>
  </tr>
  <tr class="field label textfieldEditor  <%= Util.isEmpty(obj.getLabel(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "label", userLang) %><jalios:edit pub='<%= obj %>' fields='label'/></td>
    <td class='field-data' <%= gfla(obj, "label") %>>
            <% if (Util.notEmpty(obj.getLabel(userLang))) { %>
            <%= obj.getLabel(userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field unit textfieldEditor  <%= Util.isEmpty(obj.getUnit()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "unit", userLang) %><jalios:edit pub='<%= obj %>' fields='unit'/></td>
    <td class='field-data' <%= gfla(obj, "unit") %>>
            <% if (Util.notEmpty(obj.getUnit())) { %>
            <%= obj.getUnit() %>
            <% } %>
    </td>
  </tr>
  <tr class="field primaryColor colorEditor  <%= Util.isEmpty(obj.getPrimaryColor()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "primaryColor", userLang) %><jalios:edit pub='<%= obj %>' fields='primaryColor'/></td>
    <td class='field-data' <%= gfla(obj, "primaryColor") %>>
            <% if (Util.notEmpty(obj.getPrimaryColor())) { %>
            <%= obj.getPrimaryColor() %>
            <% } %>
    </td>
  </tr>
  <tr class="field secondaryColor colorEditor  <%= Util.isEmpty(obj.getSecondaryColor()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "secondaryColor", userLang) %><jalios:edit pub='<%= obj %>' fields='secondaryColor'/></td>
    <td class='field-data' <%= gfla(obj, "secondaryColor") %>>
            <% if (Util.notEmpty(obj.getSecondaryColor())) { %>
            <%= obj.getSecondaryColor() %>
            <% } %>
    </td>
  </tr>
  <tr class="field animation booleanEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "animation", userLang) %><jalios:edit pub='<%= obj %>' fields='animation'/></td>
    <td class='field-data' >
            <%= obj.getAnimationLabel(userLang) %>
    </td>
  </tr>
  <tr class="field briefText textfieldEditor  <%= Util.isEmpty(obj.getBriefText(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "briefText", userLang) %><jalios:edit pub='<%= obj %>' fields='briefText'/></td>
    <td class='field-data' <%= gfla(obj, "briefText") %>>
            <% if (Util.notEmpty(obj.getBriefText(userLang))) { %>
            <%= obj.getBriefText(userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field metric textfieldEditor  <%= Util.isEmpty(obj.getMetric()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "metric", userLang) %><jalios:edit pub='<%= obj %>' fields='metric'/></td>
    <td class='field-data' <%= gfla(obj, "metric") %>>
            <% if (Util.notEmpty(obj.getMetric())) { %>
            <%= obj.getMetric() %>
            <% } %>
    </td>
  </tr>
  <tr class="field metricParameters textfieldEditor  <%= Util.isEmpty(obj.getMetricParameters()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "metricParameters", userLang) %><jalios:edit pub='<%= obj %>' fields='metricParameters'/></td>
    <td class='field-data' <%= gfla(obj, "metricParameters") %>>
            <% if (Util.notEmpty(obj.getMetricParameters())) { %>
            <%= obj.getMetricParameters() %>
            <% } %>
    </td>
  </tr>
  <tr class="field linkType enumerateEditor  <%= Util.isEmpty(obj.getLinkType()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "linkType", userLang) %><jalios:edit pub='<%= obj %>' fields='linkType'/></td>
    <td class='field-data' <%= gfla(obj, "linkType") %>>
            <% if (Util.notEmpty(obj.getLinkType())) { %>
            <%= obj.getLinkTypeLabel(obj.getLinkType(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field publicationLink linkEditor  <%= Util.isEmpty(obj.getPublicationLink()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "publicationLink", userLang) %><jalios:edit pub='<%= obj %>' fields='publicationLink'/></td>
    <td class='field-data' >
            <% if (obj.getPublicationLink() != null && obj.getPublicationLink().canBeReadBy(loggedMember)) { %>
            <jalios:link data='<%= obj.getPublicationLink() %>'/>
            <% } %>
    </td>
  </tr>
  <tr class="field categorylink categoryEditor  <%= Util.isEmpty(obj.getCategorylink(loggedMember)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "categorylink", userLang) %><jalios:edit pub='<%= obj %>' fields='categorylink'/></td>
    <td class='field-data' >
            <% if (Util.notEmpty(obj.getCategorylink(loggedMember))) { %>
            <ol>
            <jalios:foreach collection="<%= obj.getCategorylink(loggedMember) %>" type="Category" name="itCategory" >
              <li><% if (itCategory != null) { %><a href="<%= ResourceHelper.getQuery() %>?cids=<%= itCategory.getId() %>"><%= itCategory.getAncestorString(channel.getCategory("j_5"), " > ", true, userLang) %></a><% } %></li>
            </jalios:foreach>
            </ol>
            <% } %>
    </td>
  </tr>
  <tr class="field linkLabel textfieldEditor  <%= Util.isEmpty(obj.getLinkLabel(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "linkLabel", userLang) %><jalios:edit pub='<%= obj %>' fields='linkLabel'/></td>
    <td class='field-data' <%= gfla(obj, "linkLabel") %>>
            <% if (Util.notEmpty(obj.getLinkLabel(userLang))) { %>
            <%= obj.getLinkLabel(userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field picture imageEditor  <%= Util.isEmpty(obj.getPicture()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "picture", userLang) %><jalios:edit pub='<%= obj %>' fields='picture'/></td>
    <td class='field-data' <%= gfla(obj, "picture") %>>
            <% if (Util.notEmpty(obj.getPicture())) { %>
            <img src='<%= Util.encodeUrl(obj.getPicture()) %>' alt='' />
            <% } %>
    </td>
  </tr>
  <tr class="field description textareaEditor abstract <%= Util.isEmpty(obj.getDescription(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "description", userLang) %><jalios:edit pub='<%= obj %>' fields='description'/></td>
    <td class='field-data' <%= gfla(obj, "description") %>>
            <% if (Util.notEmpty(obj.getDescription(userLang))) { %>
            <jalios:wiki><%= obj.getDescription(userLang) %></jalios:wiki>
            <% } %>
    </td>
  </tr>
  <tr class="field portletImage imageEditor  <%= Util.isEmpty(obj.getPortletImage(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "portletImage", userLang) %><jalios:edit pub='<%= obj %>' fields='portletImage'/></td>
    <td class='field-data' <%= gfla(obj, "portletImage") %>>
            <% if (Util.notEmpty(obj.getPortletImage(userLang))) { %>
            <img src='<%= Util.encodeUrl(obj.getPortletImage(userLang)) %>' alt='' />
            <% } %>
    </td>
  </tr>
  <tr class="field cacheType enumerateEditor  <%= Util.isEmpty(obj.getCacheType()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "cacheType", userLang) %><jalios:edit pub='<%= obj %>' fields='cacheType'/></td>
    <td class='field-data' <%= gfla(obj, "cacheType") %>>
            <% if (Util.notEmpty(obj.getCacheType())) { %>
            <%= obj.getCacheTypeLabel(obj.getCacheType(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field cacheSensibility enumerateEditor  <%= Util.isEmpty(obj.getCacheSensibility()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "cacheSensibility", userLang) %><jalios:edit pub='<%= obj %>' fields='cacheSensibility'/></td>
    <td class='field-data' <%= gfla(obj, "cacheSensibility") %>>
            <% if (Util.notEmpty(obj.getCacheSensibility())) { %>
            <%= obj.getCacheSensibilityLabel(obj.getCacheSensibility(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field invalidClass enumerateEditor  <%= Util.isEmpty(obj.getInvalidClass()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "invalidClass", userLang) %><jalios:edit pub='<%= obj %>' fields='invalidClass'/></td>
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
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "invalidTime", userLang) %><jalios:edit pub='<%= obj %>' fields='invalidTime'/></td>
    <td class='field-data' >
            <jalios:duration time='<%= obj.getInvalidTime() * 1000L %>'/>
    </td>
  </tr>
  <tr class="field displayCSS enumerateEditor  <%= Util.isEmpty(obj.getDisplayCSS()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "displayCSS", userLang) %><jalios:edit pub='<%= obj %>' fields='displayCSS'/></td>
    <td class='field-data' <%= gfla(obj, "displayCSS") %>>
            <% if (Util.notEmpty(obj.getDisplayCSS())) { %>
            <%= obj.getDisplayCSSLabel(obj.getDisplayCSS(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field width textfieldEditor  <%= Util.isEmpty(obj.getWidth()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "width", userLang) %><jalios:edit pub='<%= obj %>' fields='width'/></td>
    <td class='field-data' <%= gfla(obj, "width") %>>
            <% if (Util.notEmpty(obj.getWidth())) { %>
            <%= obj.getWidth() %>
            <% } %>
    </td>
  </tr>
  <tr class="field insetLeft intEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "insetLeft", userLang) %><jalios:edit pub='<%= obj %>' fields='insetLeft'/></td>
    <td class='field-data' >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(obj.getInsetLeft()) %>px
    </td>
  </tr>
  <tr class="field insetRight intEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "insetRight", userLang) %><jalios:edit pub='<%= obj %>' fields='insetRight'/></td>
    <td class='field-data' >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(obj.getInsetRight()) %>px
    </td>
  </tr>
  <tr class="field insetTop intEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "insetTop", userLang) %><jalios:edit pub='<%= obj %>' fields='insetTop'/></td>
    <td class='field-data' >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(obj.getInsetTop()) %>px
    </td>
  </tr>
  <tr class="field insetBottom intEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "insetBottom", userLang) %><jalios:edit pub='<%= obj %>' fields='insetBottom'/></td>
    <td class='field-data' >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(obj.getInsetBottom()) %>px
    </td>
  </tr>
  <tr class="field cellPadding intEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "cellPadding", userLang) %><jalios:edit pub='<%= obj %>' fields='cellPadding'/></td>
    <td class='field-data' >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(obj.getCellPadding()) %>px
    </td>
  </tr>
  <tr class="field alignH enumerateEditor  <%= Util.isEmpty(obj.getAlignH()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "alignH", userLang) %><jalios:edit pub='<%= obj %>' fields='alignH'/></td>
    <td class='field-data' <%= gfla(obj, "alignH") %>>
            <% if (Util.notEmpty(obj.getAlignH())) { %>
            <%= obj.getAlignHLabel(obj.getAlignH(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field alignV enumerateEditor  <%= Util.isEmpty(obj.getAlignV()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "alignV", userLang) %><jalios:edit pub='<%= obj %>' fields='alignV'/></td>
    <td class='field-data' <%= gfla(obj, "alignV") %>>
            <% if (Util.notEmpty(obj.getAlignV())) { %>
            <%= obj.getAlignVLabel(obj.getAlignV(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field alignTable enumerateEditor  <%= Util.isEmpty(obj.getAlignTable()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "alignTable", userLang) %><jalios:edit pub='<%= obj %>' fields='alignTable'/></td>
    <td class='field-data' <%= gfla(obj, "alignTable") %>>
            <% if (Util.notEmpty(obj.getAlignTable())) { %>
            <%= obj.getAlignTableLabel(obj.getAlignTable(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field border intEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "border", userLang) %><jalios:edit pub='<%= obj %>' fields='border'/></td>
    <td class='field-data' >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(obj.getBorder()) %>px
    </td>
  </tr>
  <tr class="field borderColor colorEditor  <%= Util.isEmpty(obj.getBorderColor()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "borderColor", userLang) %><jalios:edit pub='<%= obj %>' fields='borderColor'/></td>
    <td class='field-data' <%= gfla(obj, "borderColor") %>>
            <% if (Util.notEmpty(obj.getBorderColor())) { %>
            <%= obj.getBorderColor() %>
            <% } %>
    </td>
  </tr>
  <tr class="field backColor colorEditor  <%= Util.isEmpty(obj.getBackColor()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "backColor", userLang) %><jalios:edit pub='<%= obj %>' fields='backColor'/></td>
    <td class='field-data' <%= gfla(obj, "backColor") %>>
            <% if (Util.notEmpty(obj.getBackColor())) { %>
            <%= obj.getBackColor() %>
            <% } %>
    </td>
  </tr>
  <tr class="field backImage imageEditor  <%= Util.isEmpty(obj.getBackImage()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "backImage", userLang) %><jalios:edit pub='<%= obj %>' fields='backImage'/></td>
    <td class='field-data' <%= gfla(obj, "backImage") %>>
            <% if (Util.notEmpty(obj.getBackImage())) { %>
            <img src='<%= Util.encodeUrl(obj.getBackImage()) %>' alt='' />
            <% } %>
    </td>
  </tr>
  <tr class="field displayTitle textfieldEditor  <%= Util.isEmpty(obj.getDisplayTitle(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "displayTitle", userLang) %><jalios:edit pub='<%= obj %>' fields='displayTitle'/></td>
    <td class='field-data' <%= gfla(obj, "displayTitle") %>>
            <% if (Util.notEmpty(obj.getDisplayTitle(userLang))) { %>
            <%= obj.getDisplayTitle(userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field skins textfieldEditor  <%= Util.isEmpty(obj.getSkins()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "skins", userLang) %><jalios:edit pub='<%= obj %>' fields='skins'/></td>
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
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "skinCSS", userLang) %><jalios:edit pub='<%= obj %>' fields='skinCSS'/></td>
    <td class='field-data' <%= gfla(obj, "skinCSS") %>>
            <% if (Util.notEmpty(obj.getSkinCSS())) { %>
            <%= obj.getSkinCSSLabel(obj.getSkinCSS(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field popupState enumerateEditor  <%= Util.isEmpty(obj.getPopupState()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "popupState", userLang) %><jalios:edit pub='<%= obj %>' fields='popupState'/></td>
    <td class='field-data' <%= gfla(obj, "popupState") %>>
            <% if (Util.notEmpty(obj.getPopupState())) { %>
            <%= obj.getPopupStateLabel(obj.getPopupState(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field expandState enumerateEditor  <%= Util.isEmpty(obj.getExpandState()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "expandState", userLang) %><jalios:edit pub='<%= obj %>' fields='expandState'/></td>
    <td class='field-data' <%= gfla(obj, "expandState") %>>
            <% if (Util.notEmpty(obj.getExpandState())) { %>
            <%= obj.getExpandStateLabel(obj.getExpandState(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field behaviorCopy enumerateEditor  <%= Util.isEmpty(obj.getBehaviorCopy()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "behaviorCopy", userLang) %><jalios:edit pub='<%= obj %>' fields='behaviorCopy'/></td>
    <td class='field-data' <%= gfla(obj, "behaviorCopy") %>>
            <% if (Util.notEmpty(obj.getBehaviorCopy())) { %>
            <%= obj.getBehaviorCopyLabel(obj.getBehaviorCopy(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field originalPortlet linkEditor  <%= Util.isEmpty(obj.getOriginalPortlet()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "originalPortlet", userLang) %><jalios:edit pub='<%= obj %>' fields='originalPortlet'/></td>
    <td class='field-data' >
            <% if (obj.getOriginalPortlet() != null && obj.getOriginalPortlet().canBeReadBy(loggedMember)) { %>
            <jalios:link data='<%= obj.getOriginalPortlet() %>'/>
            <% } %>
    </td>
  </tr>
  <tr class="field condition enumerateEditor  <%= Util.isEmpty(obj.getCondition()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "condition", userLang) %><jalios:edit pub='<%= obj %>' fields='condition'/></td>
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
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "cssId", userLang) %><jalios:edit pub='<%= obj %>' fields='cssId'/></td>
    <td class='field-data' <%= gfla(obj, "cssId") %>>
            <% if (Util.notEmpty(obj.getCssId())) { %>
            <%= obj.getCssId() %>
            <% } %>
    </td>
  </tr>
  <tr class="field cssClasses textfieldEditor  <%= Util.isEmpty(obj.getCssClasses()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "cssClasses", userLang) %><jalios:edit pub='<%= obj %>' fields='cssClasses'/></td>
    <td class='field-data' <%= gfla(obj, "cssClasses") %>>
            <% if (Util.notEmpty(obj.getCssClasses())) { %>
            <%= obj.getCssClasses() %>
            <% } %>
    </td>
  </tr>
  <tr class="field skinClasses textfieldEditor  <%= Util.isEmpty(obj.getSkinClasses()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "skinClasses", userLang) %><jalios:edit pub='<%= obj %>' fields='skinClasses'/></td>
    <td class='field-data' <%= gfla(obj, "skinClasses") %>>
            <% if (Util.notEmpty(obj.getSkinClasses())) { %>
            <%= obj.getSkinClasses() %>
            <% } %>
    </td>
  </tr>
  <tr class="field skinFooter wysiwygEditor  <%= Util.isEmpty(obj.getSkinFooter(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "skinFooter", userLang) %><jalios:edit pub='<%= obj %>' fields='skinFooter'/></td>
    <td class='field-data' <%= gfla(obj, "skinFooter") %>>
            <% if (Util.notEmpty(obj.getSkinFooter(userLang))) { %>
            <jalios:wysiwyg data='<%= obj %>' field='skinFooter'><%= obj.getSkinFooter(userLang) %></jalios:wysiwyg>            
            <% } %>
    </td>
  </tr>
  <tr class="field skinHeaderIcon textfieldEditor  <%= Util.isEmpty(obj.getSkinHeaderIcon()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "skinHeaderIcon", userLang) %><jalios:edit pub='<%= obj %>' fields='skinHeaderIcon'/></td>
    <td class='field-data' <%= gfla(obj, "skinHeaderIcon") %>>
            <% if (Util.notEmpty(obj.getSkinHeaderIcon())) { %>
            <%= obj.getSkinHeaderIcon() %>
            <% } %>
    </td>
  </tr>
  <tr class="field skinHeaderIconColor textfieldEditor  <%= Util.isEmpty(obj.getSkinHeaderIconColor()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "skinHeaderIconColor", userLang) %><jalios:edit pub='<%= obj %>' fields='skinHeaderIconColor'/></td>
    <td class='field-data' <%= gfla(obj, "skinHeaderIconColor") %>>
            <% if (Util.notEmpty(obj.getSkinHeaderIconColor())) { %>
            <%= obj.getSkinHeaderIconColor() %>
            <% } %>
    </td>
  </tr>
  <tr class="field skinFooterButtonLabel textfieldEditor  <%= Util.isEmpty(obj.getSkinFooterButtonLabel(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "skinFooterButtonLabel", userLang) %><jalios:edit pub='<%= obj %>' fields='skinFooterButtonLabel'/></td>
    <td class='field-data' <%= gfla(obj, "skinFooterButtonLabel") %>>
            <% if (Util.notEmpty(obj.getSkinFooterButtonLabel(userLang))) { %>
            <%= obj.getSkinFooterButtonLabel(userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field skinFooterButtonLink urlEditor  <%= Util.isEmpty(obj.getSkinFooterButtonLink()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "skinFooterButtonLink", userLang) %><jalios:edit pub='<%= obj %>' fields='skinFooterButtonLink'/></td>
    <td class='field-data' <%= gfla(obj, "skinFooterButtonLink") %>>
            <% if (Util.notEmpty(obj.getSkinFooterButtonLink())) { %>
            <a href='<%= obj.getSkinFooterButtonLink() %>' ><%= obj.getSkinFooterButtonLink()%></a>
            <% } %>
    </td>
  </tr>
  <tr class="field skinFooterButtonAlign enumerateEditor  <%= Util.isEmpty(obj.getSkinFooterButtonAlign()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "skinFooterButtonAlign", userLang) %><jalios:edit pub='<%= obj %>' fields='skinFooterButtonAlign'/></td>
    <td class='field-data' <%= gfla(obj, "skinFooterButtonAlign") %>>
            <% if (Util.notEmpty(obj.getSkinFooterButtonAlign())) { %>
            <%= obj.getSkinFooterButtonAlignLabel(obj.getSkinFooterButtonAlign(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field skinHeaderButtonLabel textfieldEditor  <%= Util.isEmpty(obj.getSkinHeaderButtonLabel(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "skinHeaderButtonLabel", userLang) %><jalios:edit pub='<%= obj %>' fields='skinHeaderButtonLabel'/></td>
    <td class='field-data' <%= gfla(obj, "skinHeaderButtonLabel") %>>
            <% if (Util.notEmpty(obj.getSkinHeaderButtonLabel(userLang))) { %>
            <%= obj.getSkinHeaderButtonLabel(userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field skinHeaderButtonLink urlEditor  <%= Util.isEmpty(obj.getSkinHeaderButtonLink()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "skinHeaderButtonLink", userLang) %><jalios:edit pub='<%= obj %>' fields='skinHeaderButtonLink'/></td>
    <td class='field-data' <%= gfla(obj, "skinHeaderButtonLink") %>>
            <% if (Util.notEmpty(obj.getSkinHeaderButtonLink())) { %>
            <a href='<%= obj.getSkinHeaderButtonLink() %>' ><%= obj.getSkinHeaderButtonLink()%></a>
            <% } %>
    </td>
  </tr>
  <tr class="field skinHeaderSubText textfieldEditor  <%= Util.isEmpty(obj.getSkinHeaderSubText(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletIndicator.class, "skinHeaderSubText", userLang) %><jalios:edit pub='<%= obj %>' fields='skinHeaderSubText'/></td>
    <td class='field-data' <%= gfla(obj, "skinHeaderSubText") %>>
            <% if (Util.notEmpty(obj.getSkinHeaderSubText(userLang))) { %>
            <%= obj.getSkinHeaderSubText(userLang) %>
            <% } %>
    </td>
  </tr>
 
</table>
<jsp:include page="/front/doFullDisplayCommonFields.jsp" />
</div><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- iYUUS7tpn5bi/Q+4djgFTg== --%>