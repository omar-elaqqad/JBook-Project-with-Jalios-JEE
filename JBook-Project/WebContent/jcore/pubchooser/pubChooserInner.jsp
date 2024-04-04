<%@page import="com.jalios.jcms.handler.PubChooserHandler"%>
<%@page import="com.jalios.jcms.unifiedinsert.InsertionContext"%>
<%@ include file='/jcore/doInitPage.jspf' %><%
PubChooserHandler formHandler = (PubChooserHandler) request.getAttribute("pubChooserHandler");

if (formHandler == null) { %>
  <jalios:include jsp="jcore/pubchooser/pubChooserHandlers.jsp" />
<% }
formHandler = (PubChooserHandler) request.getAttribute("pubChooserHandler");
%>
<div class="pub-chooser-results ajax-refresh-div" data-jalios-ajax-refresh-url="jcore/pubchooser/pubChooserInner.jsp">
  <jalios:include jsp="jcore/pubchooser/pubChooserNavbar.jsp" />
  <div class="no-result-wrapper hide">
    <jalios:icon src="no-result" />
    <p><%= glp("ui.com.lbl.sorry-no-result") %></p>
  </div>
  
  <table class="table table-data table-chooser">
    <caption class="sr-only"><%= glp("pubchooser.table-caption") %></caption>
    <thead>
    <tr>
      <% if (formHandler.isMultivalue()) { %>
        <th></th>
      <% } %>
      <th></th>
      <th scope="col"><%= glp("ui.com.lbl.title") %></th>
      <th scope="col"><%= glp("ui.com.lbl.status") %></th>
      <th scope="col"><%= glp("ui.com.lbl.author") %></th>
      <th scope="col"><%= glp("ui.com.lbl.type") %></th>
      <th scope="col"><%= glp("ui.com.lbl.mdate") %></th>
    </tr>
    </thead>
    <tbody class="js-table-chooser-body">
      <jalios:include jsp="jcore/pubchooser/pubChooserItems.jsp" />
    </tbody>
  </table>
  <div class="bottom-bar-placeholder"></div>
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>