<%@ page contentType="text/html; charset=UTF-8" %><%
%><%-- This file has been automatically generated. --%><%
%><%--
  @Summary: SmartPhonePortal display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%
%><% SmartPhonePortal obj = (SmartPhonePortal)portlet; %><%
%><%@ include file='/front/doFullDisplay.jspf' %>
<div class="fullDisplay SmartPhonePortal <%= obj.canBeEditedFieldByField(loggedMember) ? "unitFieldEdition" : "" %>" itemscope="itemscope">
<%@ include file='/front/publication/doPublicationHeader.jspf' %>
<table class="fields">
  <tr class="field description wysiwygEditor abstract <%= Util.isEmpty(obj.getDescription(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(SmartPhonePortal.class, "description", userLang) %><jalios:edit pub='<%= obj %>' fields='description'/></td>
    <td class='field-data' <%= gfla(obj, "description") %>>
            <% if (Util.notEmpty(obj.getDescription(userLang))) { %>
            <jalios:wysiwyg data='<%= obj %>' field='description'><%= obj.getDescription(userLang) %></jalios:wysiwyg>            
            <% } %>
    </td>
  </tr>
  <tr class="field structure textareaEditor  <%= Util.isEmpty(obj.getStructure()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(SmartPhonePortal.class, "structure", userLang) %><jalios:edit pub='<%= obj %>' fields='structure'/></td>
    <td class='field-data' <%= gfla(obj, "structure") %>>
            <% if (Util.notEmpty(obj.getStructure())) { %>
            <%= obj.getStructure() %>
            <% } %>
    </td>
  </tr>
  <tr class="field portlets linkEditor  <%= Util.isEmpty(obj.getPortlets()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(SmartPhonePortal.class, "portlets", userLang) %><jalios:edit pub='<%= obj %>' fields='portlets'/></td>
    <td class='field-data' >
            <% if (Util.notEmpty(obj.getPortlets())) { %>
            <ol>
              <jalios:foreach name="itData" type="com.jalios.jcms.portlet.PortalElement" array="<%= obj.getPortlets() %>">
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
  <tr class="field displayScrollToTop booleanEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(SmartPhonePortal.class, "displayScrollToTop", userLang) %><jalios:edit pub='<%= obj %>' fields='displayScrollToTop'/></td>
    <td class='field-data' >
            <%= obj.getDisplayScrollToTopLabel(userLang) %>
    </td>
  </tr>
  <tr class="field pageTitle textfieldEditor  <%= Util.isEmpty(obj.getPageTitle(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(SmartPhonePortal.class, "pageTitle", userLang) %><jalios:edit pub='<%= obj %>' fields='pageTitle'/></td>
    <td class='field-data' <%= gfla(obj, "pageTitle") %>>
            <% if (Util.notEmpty(obj.getPageTitle(userLang))) { %>
            <%= obj.getPageTitle(userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field image textfieldEditor  <%= Util.isEmpty(obj.getImage()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(SmartPhonePortal.class, "image", userLang) %><jalios:edit pub='<%= obj %>' fields='image'/></td>
    <td class='field-data' <%= gfla(obj, "image") %>>
            <% if (Util.notEmpty(obj.getImage())) { %>
            <%= obj.getImage() %>
            <% } %>
    </td>
  </tr>
  <tr class="field css textareaEditor  <%= Util.isEmpty(obj.getCss()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(SmartPhonePortal.class, "css", userLang) %><jalios:edit pub='<%= obj %>' fields='css'/></td>
    <td class='field-data' <%= gfla(obj, "css") %>>
            <% if (Util.notEmpty(obj.getCss())) { %>
            <%= obj.getCss() %>
            <% } %>
    </td>
  </tr>
 
</table>
<jsp:include page="/front/doFullDisplayCommonFields.jsp" />
</div><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- B00TaVgGzKkvPuEC18QFmQ== --%>