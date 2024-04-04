<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><jsp:useBean id='formHandler' scope='page' class='generated.EditPortletQueryForeachHandler'><%
%><jsp:setProperty name='formHandler' property='request' value='<%=request%>' /><%
%><jsp:setProperty name='formHandler' property='response' value='<%=response%>' /><%
%><jsp:setProperty name='formHandler' property='*' /><%
%><jsp:setProperty name='formHandler' property='noRedirect' value='<%= true %>' /><%
%></jsp:useBean>

<% if(formHandler.validate()) { %>
<script>
jQuery.jalios.AjaxRefresh.refreshPortlet("<%= formHandler.getPublication().getId() %>");
jQuery.jalios.ui.Modal.close(false);
</script>
<% } %>

<jalios:modal title="types.PortletQueryForeach.fields.queries.label"
              url="types/PortletQueryForeach/editQuery.jsp"
              css="modal-lg edit-query"
              op="opUpdate"
              button="ui.com.btn.save">


  <!-- Nav tabs -->
  <ul class="nav nav-tabs nav-tabs-underlined is-left-aligned" role="tablist">
    <li class="active"><a href="#query" role="tab" data-toggle="tab" onclick="return false;"><%= formHandler.getTabLabel("query") %></a></li>
    <li><a href="#sort" role="tab" data-toggle="tab" onclick="return false;"><%= formHandler.getTabLabel("sort") %></a></li>
    <li><a href="#pager" role="tab" data-toggle="tab" onclick="return false;"><%= formHandler.getTabLabel("pager") %></a></li>
  </ul>
  
  <!-- Tab panes -->
  <div class="tab-content">
    <div class="tab-pane active" id="query">
      <%-- Queries ------------------------------------------------------------ --%>
      <jalios:field name="queries" formHandler="<%= formHandler %>" mv="1">
        <jalios:control />
      </jalios:field>
       
      <%-- RefineQueries ------------------------------------------------------------ --%>
      <jalios:field name="refineQueries" formHandler="<%= formHandler %>">
        <jalios:control />
      </jalios:field>
       
      <%-- RefineWithContextualCategories ------------------------------------------------------------ --%>
      <jalios:field name="refineWithContextualCategories" formHandler="<%= formHandler %>">
        <jalios:control />
      </jalios:field>
    </div>
    <div class="tab-pane" id="sort">
      <%-- OrderBy ------------------------------------------------------------ --%>
      <jalios:field name="orderBy" formHandler="<%= formHandler %>">
        <jalios:control />
      </jalios:field>
       
      <%-- ReverseOrder ------------------------------------------------------------ --%>
      <jalios:field name="reverseOrder" formHandler="<%= formHandler %>">
        <jalios:control />
      </jalios:field>
    </div>
    <div class="tab-pane" id="pager">
      <%-- ShowPager ------------------------------------------------------------ --%>
      <jalios:field name="showPager" formHandler="<%= formHandler %>">
        <jalios:control />
      </jalios:field>
       
      <%-- PagerLabel ------------------------------------------------------------ --%>
      <jalios:field name="pagerLabel" formHandler="<%= formHandler %>">
        <jalios:control />
      </jalios:field>
       
      <%-- PageSizes ------------------------------------------------------------ --%>
      <jalios:field name="pageSizes" formHandler="<%= formHandler %>" mv="1">
        <jalios:control />
      </jalios:field>
       
      <%-- PagerAllLimit ------------------------------------------------------------ --%>
      <jalios:field name="pagerAllLimit" formHandler="<%= formHandler %>">
        <jalios:control />
      </jalios:field>
       
       <%-- MaxResults ------------------------------------------------------------ --%>
      <jalios:field name="maxResults" formHandler="<%= formHandler %>">
        <jalios:control />
      </jalios:field>
       
      <%-- SkipFirstResults ------------------------------------------------------------ --%>
      <jalios:field name="skipFirstResults" formHandler="<%= formHandler %>">
        <jalios:control />
      </jalios:field>
       
      <%-- SkipDisplayedPublications ------------------------------------------------------------ --%>
      <jalios:field name="skipDisplayedPublications" formHandler="<%= formHandler %>">
        <jalios:control />
      </jalios:field>
    </div>
  </div>
  <jalios:control settings='<%= new HiddenSettings().name("id").value(formHandler.getId()) %>' />
</jalios:modal>