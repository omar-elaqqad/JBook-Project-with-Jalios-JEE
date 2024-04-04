<%@page import="com.jalios.jcms.handler.PubChooserHandler"%>
<%@page import="com.jalios.jcms.unifiedinsert.InsertionContext"%>
<%@ include file='/jcore/doInitPage.jspf' %>
<%

if (!isLogged) {
  sendForbidden(request, response);
  return;
}

WorkspaceQueryHandler workspaceQueryHandler = (WorkspaceQueryHandler) request.getAttribute("workspaceQueryHandler");
PubChooserHandler formHandler = (PubChooserHandler) request.getAttribute("pubChooserHandler");
if (Util.isEmpty(workspaceQueryHandler) || Util.isEmpty(formHandler)) { %>
<jalios:include jsp="jcore/pubchooser/pubChooserHandlers.jsp" />
<% } %>
<%
workspaceQueryHandler = (WorkspaceQueryHandler) request.getAttribute("workspaceQueryHandler");
formHandler = (PubChooserHandler) request.getAttribute("pubChooserHandler");

formHandler.validate();
%>
<jalios:pager name='pagerHandler' declare='true' action='init' size='<%= formHandler.getResultSet().getResultSize() %>' pageSize="40"/>
<jalios:foreach collection="<%= formHandler.getSortedSet() %>" name="itPublication" type="Publication" skip="<%= pagerHandler.getStart() %>"  max="<%= pagerHandler.getPageSize() %>">
  <tr class="is-selectable" data-jalios-chooser-action="<%= formHandler.getItemAction() %>" data-jalios-data-id="<%= itPublication.getId() %>">
    <% if (formHandler.isMultivalue()) { %>
      <td><input class="multiple-check" type="checkbox" name="selectMultiple" value="<%= itPublication.getId() %>" data-jalios-chooser-action="pubChooserMultipleInsertCheckbox" /></td>
    <% } %>
    <td class="numeric"><%= pagerHandler.getStart() + itCounter %></td>
    <td><jalios:link data="<%= itPublication %>" css="js-dataurl" htmlAttributes="target=\"_blank\"" ><jalios:dataicon data="<%= itPublication %>" /> <span class="js-label"><%= itPublication.getTitle(userLang) %></span></jalios:link></td>
    <td class="nowrap"><%= itPublication.getWFStateLabelHtml(userLang) %></td>
    <td class="nowrap"><jalios:link css="pub-chooser-author" data="<%= itPublication.getAuthor() %>" /></td>
    <td class="nowrap"><%= itPublication.getTypeLabel(userLang) %></td>
    <td class="date-time"><jalios:date date="<%= itPublication.getMdate() %>" format="dateOrTime" /></td>
  </tr>
</jalios:foreach>
<% if (formHandler.getResultSet().getResultSize() > pagerHandler.getStart() + pagerHandler.getPageSize()) { %>
<tr class="show-more-row">
  <td colspan="6">
    <input type="hidden" name="pageSize" value="<%= pagerHandler.getPageSize() %>" />
    <input class="js-chooser-pager-start" type="hidden" name="start" value="<%= pagerHandler.getStart() + pagerHandler.getPageSize() %>" />
    <button class="btn btn-default btn-block btn-show-more" data-jalios-action="ajax-refresh" data-jalios-ajax-refresh-url="jcore/pubchooser/pubChooserItems.jsp" data-jalios-ajax-refresh="noscroll" data-jalios-ajax-refresh-inner=".show-more-row">Show more</button>
  </td>
</tr>
<% } %>
