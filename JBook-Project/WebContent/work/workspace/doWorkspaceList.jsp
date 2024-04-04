<%@ include file='/jcore/doInitPage.jspf' %><%

String redirect = Util.getString(jcmsContext.getAjaxRequestAttribute("redirect"), "work/workspace/wsWorkspaceList.jsp");
Set<Workspace> unsortedWorkspaceSet = (Set<Workspace>)jcmsContext.getAjaxRequestAttribute("workspaceSet");
if (unsortedWorkspaceSet == null) {
  sendRedirect(redirect, request, response);
  return;
}
%><jsp:useBean id='workspaceQueryHandler' scope='page' class='com.jalios.jcms.workspace.WorkspaceQueryHandler'><%
  %><jsp:setProperty name='workspaceQueryHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='workspaceQueryHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='workspaceQueryHandler' property='*' /><%
  %><jsp:setProperty name='workspaceQueryHandler' property='workspaceQuery' value='<%= getUntrustedStringParameter("text","") %>' /><%
%></jsp:useBean><%

String additionalWSTitle = Util.getString((String) jcmsContext.getAjaxRequestAttribute("additionalWSTitle"), "");
boolean canCreateWorkspace = channel.getLimitController().checkWorkspaceLimit(true).isOK();
%>
<div class="ajax-refresh-div" id='doWorkspaceList'>
  <a href="work/workspace/doWorkspaceList.jsp" class="ajax-refresh-url" style="display:none;"></a>
  <jalios:pager name='wlPagerHandler' declare='true' action='init' />
  <%
  Comparator wsComparator = ComparatorManager.getComparator(Workspace.class, wlPagerHandler.getSort(), wlPagerHandler.isReverse());
  workspaceQueryHandler.setDataSet(unsortedWorkspaceSet);
  Set<Workspace> workspaceSet = workspaceQueryHandler.getResultSet(wsComparator);
  %>
  <jalios:pager name='wlPagerHandler' action='compute' size='<%= workspaceSet.size() %>'/>
  <div class="page-header">
  	<h1><jalios:icon src="workspace48"/> <%= glp("ui.adm.wrkspc-list.title") %> <%= additionalWSTitle %> (<%= workspaceSet.size() %>)</h1>
  </div>
  
  <%@ include file='/jcore/doMessageBox.jspf' %>
  
  <%@ include file='/work/workspace/doWorkspaceListNavbar.jspf' %>

  <table id='groupTable' class="table-data table-condensed">
    <thead>
      <tr>
        <th class="fit">
          <% if (isAdmin || checkAccess("admin/work/workspace")) { 
            String exportCsvUrl = "admin/exportCSVWorkspace.jsp?" + workspaceQueryHandler.getQueryString();
            if (Util.notEmpty(wlPagerHandler.getSort())) {
              exportCsvUrl += "sort=" + wlPagerHandler.getSort();
            }
            if (wlPagerHandler.isReverse()) {
              exportCsvUrl += "reverse=true";
            }
            Workspace parentWorkspace = getWorkspaceParameter(Workspace.PARENT_WORKSPACE_PARAMNAME);
            if (parentWorkspace != null) {
              exportCsvUrl += Workspace.PARENT_WORKSPACE_PARAMNAME + "=" + parentWorkspace.getId();
            }
          %>
            <jalios:caddy action='add' workspaceQueryString='<%= workspaceQueryHandler.getQueryString() %>' checkPstatus='false' css="btn btn-rounded"/>
            <a href='<%= exportCsvUrl %>' title='<%= encodeForHTMLAttribute(glp("ui.com.btn.csv")) %>'  class="btn btn-rounded"><jalios:icon src="csv" /></a>
          <% } %>
        </th>
        <th><% /* %>Title<% */ %><%= glp("ui.com.lbl.title") %> <jalios:pager name='wlPagerHandler' action='showSort' sort='name'/></th>
        <th><% /* %>Administrators<% */ %><%= glp("ui.wrkspc-edit.lbl.admin") %></th>
        <th class="fit"><% /* %>Order<% */ %><%= glp("ui.adm.wrkspc-list.lbl.order") %> <jalios:pager name='wlPagerHandler' action='showSort' sort='order'/></th>
        <th class="fit"><% /* %>#Groups<% */ %><%= glp("ui.adm.wrkspc-list.lbl.grp-cnt") %> <jalios:pager name='wlPagerHandler' action='showSort' sort='grpsize'/></th>
        <th class="fit"><% /* %>#Members<% */ %><%= glp("ui.adm.wrkspc-list.lbl.mbr-cnt") %> <jalios:pager name='wlPagerHandler' action='showSort' sort='mbrsize'/></th>
        <th class="fit"><% /* %>Created<% */ %><%= glp("ui.com.lbl.cdate") %> <jalios:pager name='wlPagerHandler' action='showSort' sort='date'/></th>
        <th class="fit"><% /* %>Ext.<% */ %><%= glp("ui.adm.wrkspc-list.lbl.ext") %></th>
        <th class="fit"><% /* %>ID<% */ %><%= glp("ui.com.lbl.id") %> <jalios:pager name='wlPagerHandler' action='showSort' sort='id'/></th>
        <th class="fit">&nbsp;</th>
      </tr>
    </thead>

    <jalios:foreach name="itWorkspace" 
                    type="Workspace"
                    collection="<%= workspaceSet %>"
                    max="<%= wlPagerHandler.getPageSize() %>"
                    skip="<%= wlPagerHandler.getStart() %>"> 
  
      <tr>
        <td class="text-right text-overflow">
          <%= wlPagerHandler.getStart() + itCounter.intValue() %>.
          <jalios:edit data='<%= itWorkspace %>' redirect='<%= redirect %>' css="btn btn-rounded"/>
        </td>
        <td class="text-overflow">
          <jalios:dataicon data="<%= itWorkspace %>" />
          <% if (isAdmin || itWorkspace.isAdmin(loggedMember)) { %>
            <a href='work/workspace/adminWorkspace.jsp?ws=<%= itWorkspace.getId() %>'><%= itWorkspace.getTitle(userLang) %></a>
          <% } else { %>
            <%= itWorkspace.getTitle(userLang) %>
          <% } %>
          <jalios:checkIntegrity data='<%= itWorkspace %>' />      
        </td>
        <td class="text-overflow">
          <ul>
            <jalios:foreach collection="<%= itWorkspace.getAdministrators() %>" name="itMember" type="Member" counter="adminCounter">
              <li><jalios:link data="<%= itMember %>" /></li>
            </jalios:foreach>
          </ul>
        </td>
        <td class="text-right"><%= itWorkspace.getOrder() %></td>
        <td class="text-right">
          <% if (Util.notEmpty(itWorkspace.getGroupSet())) { %>
            <a href="admin/groupList.jsp?ws=<%= itWorkspace.getId() %>"><%= itWorkspace.getGroupSet().size() %></a>
          <% } else { %>
            <%= itWorkspace.getGroupSet().size() %>
          <% } %>
        </td>
        <td class="text-right"><%= itWorkspace.getMemberCount(true) %></td>
        <td class="text-right"><jalios:date date='<%= itWorkspace.getCdate() %>' format='<%= "short" %>'/></td>
        <td class="text-center"><%= itWorkspace.getExtension() != null ? channel.getProperty("list.boolean.on", "X") : channel.getProperty("list.boolean.off", "&nbsp;") %></td>
        <td><%= itWorkspace.getId() %></td>
        <td class="text-overflow">
          <jalios:caddy data='<%= itWorkspace %>' css="btn btn-rounded"/>
          <% if (Util.isEmpty(itWorkspace.getPubSet())) { %>
            <jalios:delete data='<%= itWorkspace %>' redirect='<%= redirect %>' />
          <% } %>
          <% if (channel.isDataWriteEnabled() && (!itWorkspace.isCollaborativeSpace() && itWorkspace.isModel() && canCreateWorkspace) && (isAdmin || checkAccess("admin/work/workspace"))) { %>
            <%
            String duplicateUrl = "work/workspace/workspaceWizard.jsp?id=" + itWorkspace.getId();
            Workspace parentWS = itWorkspace.getParent();
            if (parentWS != null) {
              // Indicate the parent workspace if any
              duplicateUrl += "&amp;" + Workspace.PARENT_WORKSPACE_PARAMNAME + "=" + parentWS.getId();
            }
            duplicateUrl += "&amp;redirect=" + ServletUtil.getUrl(request);
            %>
            <a href="<%= duplicateUrl %>" title="<%= encodeForHTMLAttribute(glp("ui.adm.wrkspc-list.lbl.wizard")) %>"><jalios:icon src='wizard' /></a>
          <% } %>
        </td>
      </tr>
    </jalios:foreach>
  </table>
  
  <jalios:pager name='wlPagerHandler'/>
</div> <%-- end of ajax-refresh-div --%>