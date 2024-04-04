<%@ page contentType="text/html; charset=UTF-8" %><%
%><%-- This file has been automatically generated. --%><%
%><%--
  @Summary: PortletColumn display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%
%><% PortletColumn obj = (PortletColumn)portlet; %><%
%><%@ include file='/front/doFullDisplay.jspf' %>
<div class="fullDisplay PortletColumn <%= obj.canBeEditedFieldByField(loggedMember) ? "unitFieldEdition" : "" %>" itemscope="itemscope">
<%@ include file='/front/publication/doPublicationHeader.jspf' %>
<table class="fields">
  <tr class="field colSpacing intEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletColumn.class, "colSpacing", userLang) %></td>
    <td class='field-data' >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(obj.getColSpacing()) %>px
    </td>
  </tr>
  <tr class="field alignHorizontal enumerateEditor  <%= Util.isEmpty(obj.getAlignHorizontal()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletColumn.class, "alignHorizontal", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "alignHorizontal") %>>
        <% if (Util.notEmpty(obj.getAlignHorizontal())) { %>
            <ol>
            <jalios:foreach name="itString" type="String" array="<%= obj.getAlignHorizontal() %>">
            <% if (Util.notEmpty(itString)) { %>
              <li>
            <%= obj.getAlignHorizontalLabel(itString, userLang) %>
              </li>
            <% } %>
            </jalios:foreach>
            </ol>
        <% } %>
    </td>
  </tr>
  <tr class="field alignVertical enumerateEditor  <%= Util.isEmpty(obj.getAlignVertical()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletColumn.class, "alignVertical", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "alignVertical") %>>
        <% if (Util.notEmpty(obj.getAlignVertical())) { %>
            <ol>
            <jalios:foreach name="itString" type="String" array="<%= obj.getAlignVertical() %>">
            <% if (Util.notEmpty(itString)) { %>
              <li>
            <%= obj.getAlignVerticalLabel(itString, userLang) %>
              </li>
            <% } %>
            </jalios:foreach>
            </ol>
        <% } %>
    </td>
  </tr>
  <tr class="field backgroundColor colorEditor  <%= Util.isEmpty(obj.getBackgroundColor()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletColumn.class, "backgroundColor", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "backgroundColor") %>>
        <% if (Util.notEmpty(obj.getBackgroundColor())) { %>
            <ol>
            <jalios:foreach name="itString" type="String" array="<%= obj.getBackgroundColor() %>">
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
  <tr class="field backgroundImage imageEditor  <%= Util.isEmpty(obj.getBackgroundImage()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletColumn.class, "backgroundImage", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "backgroundImage") %>>
        <% if (Util.notEmpty(obj.getBackgroundImage())) { %>
            <ol>
            <jalios:foreach name="itString" type="String" array="<%= obj.getBackgroundImage() %>">
            <% if (Util.notEmpty(itString)) { %>
              <li>
              <p><img src='<%= Util.encodeUrl(itString) %>' alt='' /></p>
              </li>
            <% } %>
            </jalios:foreach>
            </ol>
        <% } %>
    </td>
  </tr>
  <tr class="field backgroundRepeat enumerateEditor  <%= Util.isEmpty(obj.getBackgroundRepeat()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletColumn.class, "backgroundRepeat", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "backgroundRepeat") %>>
        <% if (Util.notEmpty(obj.getBackgroundRepeat())) { %>
            <ol>
            <jalios:foreach name="itString" type="String" array="<%= obj.getBackgroundRepeat() %>">
            <% if (Util.notEmpty(itString)) { %>
              <li>
            <%= obj.getBackgroundRepeatLabel(itString, userLang) %>
              </li>
            <% } %>
            </jalios:foreach>
            </ol>
        <% } %>
    </td>
  </tr>
  <tr class="field children linkEditor  <%= Util.isEmpty(obj.getChildren()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletColumn.class, "children", userLang) %></td>
    <td class='field-data' >
            <% if (Util.notEmpty(obj.getChildren())) { %>
            <ol>
              <jalios:foreach name="itData" type="com.jalios.jcms.portlet.PortalElement" array="<%= obj.getChildren() %>">
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
  <tr class="field childrenBindings textfieldEditor  <%= Util.isEmpty(obj.getChildrenBindings()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletColumn.class, "childrenBindings", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "childrenBindings") %>>
        <% if (Util.notEmpty(obj.getChildrenBindings())) { %>
            <ol>
            <jalios:foreach name="itString" type="String" array="<%= obj.getChildrenBindings() %>">
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
  <tr class="field description textareaEditor abstract <%= Util.isEmpty(obj.getDescription(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletColumn.class, "description", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "description") %>>
            <% if (Util.notEmpty(obj.getDescription(userLang))) { %>
            <jalios:wiki><%= obj.getDescription(userLang) %></jalios:wiki>
            <% } %>
    </td>
  </tr>
  <tr class="field portletImage imageEditor  <%= Util.isEmpty(obj.getPortletImage(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletColumn.class, "portletImage", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "portletImage") %>>
            <% if (Util.notEmpty(obj.getPortletImage(userLang))) { %>
            <img src='<%= Util.encodeUrl(obj.getPortletImage(userLang)) %>' alt='' />
            <% } %>
    </td>
  </tr>
  <tr class="field cacheType enumerateEditor  <%= Util.isEmpty(obj.getCacheType()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletColumn.class, "cacheType", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "cacheType") %>>
            <% if (Util.notEmpty(obj.getCacheType())) { %>
            <%= obj.getCacheTypeLabel(obj.getCacheType(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field cacheSensibility enumerateEditor  <%= Util.isEmpty(obj.getCacheSensibility()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletColumn.class, "cacheSensibility", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "cacheSensibility") %>>
            <% if (Util.notEmpty(obj.getCacheSensibility())) { %>
            <%= obj.getCacheSensibilityLabel(obj.getCacheSensibility(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field invalidClass enumerateEditor  <%= Util.isEmpty(obj.getInvalidClass()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletColumn.class, "invalidClass", userLang) %></td>
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
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletColumn.class, "invalidTime", userLang) %></td>
    <td class='field-data' >
            <jalios:duration time='<%= obj.getInvalidTime() * 1000L %>'/>
    </td>
  </tr>
  <tr class="field displayCSS enumerateEditor  <%= Util.isEmpty(obj.getDisplayCSS()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletColumn.class, "displayCSS", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "displayCSS") %>>
            <% if (Util.notEmpty(obj.getDisplayCSS())) { %>
            <%= obj.getDisplayCSSLabel(obj.getDisplayCSS(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field width textfieldEditor  <%= Util.isEmpty(obj.getWidth()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletColumn.class, "width", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "width") %>>
            <% if (Util.notEmpty(obj.getWidth())) { %>
            <%= obj.getWidth() %>
            <% } %>
    </td>
  </tr>
  <tr class="field insetLeft intEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletColumn.class, "insetLeft", userLang) %></td>
    <td class='field-data' >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(obj.getInsetLeft()) %>px
    </td>
  </tr>
  <tr class="field insetRight intEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletColumn.class, "insetRight", userLang) %></td>
    <td class='field-data' >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(obj.getInsetRight()) %>px
    </td>
  </tr>
  <tr class="field insetTop intEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletColumn.class, "insetTop", userLang) %></td>
    <td class='field-data' >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(obj.getInsetTop()) %>px
    </td>
  </tr>
  <tr class="field insetBottom intEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletColumn.class, "insetBottom", userLang) %></td>
    <td class='field-data' >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(obj.getInsetBottom()) %>px
    </td>
  </tr>
  <tr class="field cellPadding intEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletColumn.class, "cellPadding", userLang) %></td>
    <td class='field-data' >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(obj.getCellPadding()) %>px
    </td>
  </tr>
  <tr class="field alignH enumerateEditor  <%= Util.isEmpty(obj.getAlignH()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletColumn.class, "alignH", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "alignH") %>>
            <% if (Util.notEmpty(obj.getAlignH())) { %>
            <%= obj.getAlignHLabel(obj.getAlignH(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field alignV enumerateEditor  <%= Util.isEmpty(obj.getAlignV()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletColumn.class, "alignV", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "alignV") %>>
            <% if (Util.notEmpty(obj.getAlignV())) { %>
            <%= obj.getAlignVLabel(obj.getAlignV(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field alignTable enumerateEditor  <%= Util.isEmpty(obj.getAlignTable()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletColumn.class, "alignTable", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "alignTable") %>>
            <% if (Util.notEmpty(obj.getAlignTable())) { %>
            <%= obj.getAlignTableLabel(obj.getAlignTable(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field border intEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletColumn.class, "border", userLang) %></td>
    <td class='field-data' >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(obj.getBorder()) %>px
    </td>
  </tr>
  <tr class="field borderColor colorEditor  <%= Util.isEmpty(obj.getBorderColor()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletColumn.class, "borderColor", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "borderColor") %>>
            <% if (Util.notEmpty(obj.getBorderColor())) { %>
            <%= obj.getBorderColor() %>
            <% } %>
    </td>
  </tr>
  <tr class="field backColor colorEditor  <%= Util.isEmpty(obj.getBackColor()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletColumn.class, "backColor", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "backColor") %>>
            <% if (Util.notEmpty(obj.getBackColor())) { %>
            <%= obj.getBackColor() %>
            <% } %>
    </td>
  </tr>
  <tr class="field backImage imageEditor  <%= Util.isEmpty(obj.getBackImage()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletColumn.class, "backImage", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "backImage") %>>
            <% if (Util.notEmpty(obj.getBackImage())) { %>
            <img src='<%= Util.encodeUrl(obj.getBackImage()) %>' alt='' />
            <% } %>
    </td>
  </tr>
  <tr class="field behaviorCopy enumerateEditor  <%= Util.isEmpty(obj.getBehaviorCopy()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletColumn.class, "behaviorCopy", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "behaviorCopy") %>>
            <% if (Util.notEmpty(obj.getBehaviorCopy())) { %>
            <%= obj.getBehaviorCopyLabel(obj.getBehaviorCopy(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field originalPortlet linkEditor  <%= Util.isEmpty(obj.getOriginalPortlet()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletColumn.class, "originalPortlet", userLang) %></td>
    <td class='field-data' >
            <% if (obj.getOriginalPortlet() != null && obj.getOriginalPortlet().canBeReadBy(loggedMember)) { %>
            <jalios:link data='<%= obj.getOriginalPortlet() %>'/>
            <% } %>
    </td>
  </tr>
  <tr class="field condition enumerateEditor  <%= Util.isEmpty(obj.getCondition()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletColumn.class, "condition", userLang) %></td>
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
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletColumn.class, "cssId", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "cssId") %>>
            <% if (Util.notEmpty(obj.getCssId())) { %>
            <%= obj.getCssId() %>
            <% } %>
    </td>
  </tr>
  <tr class="field cssClasses textfieldEditor  <%= Util.isEmpty(obj.getCssClasses()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletColumn.class, "cssClasses", userLang) %></td>
    <td class='field-data' <%= gfla(obj, "cssClasses") %>>
            <% if (Util.notEmpty(obj.getCssClasses())) { %>
            <%= obj.getCssClasses() %>
            <% } %>
    </td>
  </tr>
 
</table>
<jsp:include page="/front/doFullDisplayCommonFields.jsp" />
</div><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- yZ0w95DGYd4bAtXvMHfhBA== --%>