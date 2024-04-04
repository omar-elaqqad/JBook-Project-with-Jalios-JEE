<%@page import="com.jalios.jcms.uicomponent.icon.Icon"%><%
%><%@page import="com.jalios.jcms.uicomponent.icon.IconChooserModalHandler"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><jalios:include jsp="jcore/field/control/iconChooserModalHandler.jsp" /><%
IconChooserModalHandler formHandler = (IconChooserModalHandler) request.getAttribute("iconChooserModalHandler");
List<Icon> icons = formHandler.getIcons();
%>

<div class="icon-chooser-wrapper">
  <% if (Util.isEmpty(icons)) { %>
    <jalios:portletBoxNoResult icon="no-result" text="ui.com.lbl.sorry-no-result" />
  <% } else { %>
    <% for (Icon icon : icons) { %>
      <div role="button" tabindex="0" class="icon-chooser-option" data-jalios-icon-key="<%= icon.getSrc() %>">
        <jalios:icon src="<%= icon.getSrc() %>" />
        <div class="icon-chooser-option-value"><%= icon.getLabel(userLang) %></div>
      </div>
    <% } %>
  <% } %>
  <input type="hidden" class="js-icon-chooser-value" name="iconSrc" value="" />
</div>