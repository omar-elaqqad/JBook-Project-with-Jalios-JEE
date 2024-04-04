<%@ include file='/jcore/doInitPage.jspf' %><%

  if (loggedMember == null) {
    sendForbidden(request, response);
    return;
  }

  request.setAttribute("title",glp("ui.com.alt.wkspc-chooser"));
  request.setAttribute("zone","InternalUI");
  
  boolean multiple = getBooleanParameter("multivalue", false);
  
  boolean   showRadioInsert  = !multiple;
  boolean   showCheckInsert  = multiple;

  String redirect = ServletUtil.getUrl(request);

  Workspace selectedWorkspace = getWorkspaceParameter(Workspace.PARENT_WORKSPACE_PARAMNAME);
  boolean   guiShowTree       = channel.getBooleanProperty("hierarchical-ws.workworkspacechooser.guishowtree", selectedWorkspace != null);
  Workspace mbrWorkspace      = null;
  boolean showTree = getBooleanParameter("showTree", guiShowTree);  

  Set unsortedWorkspaceSet;
  if (Util.isEmpty(selectedWorkspace)) {
    unsortedWorkspaceSet = Workspace.getAllWorkspaceSet(loggedMember);
  } else { 
    unsortedWorkspaceSet = selectedWorkspace.getSubWorkspaces(loggedMember);
  }

  String textFilter = getUntrustedStringParameter("text",""); // ENCODE !!
  if (Util.notEmpty(textFilter)) {
    DataSelector titleSelector = new Workspace.TitleSelector(textFilter, userLang);
    unsortedWorkspaceSet = JcmsUtil.select(unsortedWorkspaceSet, titleSelector, null);
  }
  
%><%@ include file='/jcore/doEmptyHeader.jspf' %><%
 %><%@ include file='/work/doInsertLinkParams.jspf' %><%
 %><%@ include file='/work/doInsertLinkPopup.jspf' %>
 
<jalios:query name="workspaceSet" dataset="<%= unsortedWorkspaceSet %>" comparator='<%= Workspace.getNameComparator(userLang) %>'/> 
<jalios:pager name='wcPagerHandler' declare='true' action='init' size='<%= workspaceSet.size() %>'/>

<div id='mainDiv' style='border-bottom: 1px solid #000000;'>
  <form name='editForm' action="<%= ServletUtil.getResourcePath(request) %>"> 
    <table class='layout spliter'>
      <tr>
      
        <%-- *** TREE ******************************************* --%>
        <td class="sidebar animated slideInLeft sidebar-toggler<%= showTree ? "" : " hide"%>">
         <div class="overflowing-panel">
           <% TreeHelper.printWorkspacesTree(mbrWorkspace, false, "gid", out, userLang, jcmsContext, loggedMember); %>
         </div>
        </td>
        
        <%-- *** VERTICAL SEPARATOR ******************************************* --%>
        <td class="split">
          <a href='<%= ServletUtil.getUrlWithUpdatedParam(request, "showTree", String.valueOf(!showTree)) %>'>
            <jalios:icon src='<%= showTree ? "chevron-left" : "chevron-right" %>' />
          </a>
        </td>
        
        <td class='vTop'>
          <div class="AdminArea WorkArea">
            <div class="page-header">
              <h1><%= glp("ui.com.lbl.workspaces") %></h1>
            </div>
          
            <%@ include file='/jcore/doMessageBox.jspf' %>
          
            <%-- Filters --%>
            <div class="navbar navbar-default navbar-table-header">
              <div class="container-fluid">
                <%-- Filter FORM: text refinement --%>
                <form action='<%= ServletUtil.getResourcePath(request) %>' name='wsForm' class='noSingleSubmitButton form-inline'>
                  <div class="navbar-right navbar-form">
                    <%-- Text filter (JCMS-5384) --%>
                    <div class="form-group">
                      <jalios:field name="text" value="<%= textFilter %>" resource="field-light">
                        <jalios:control settings='<%= new TextFieldSettings().placeholder("ui.com.placeholder.search") %>' />
                        <span class="input-group-btn">
                          <button class="btn btn-default" type="submit"><jalios:icon src="search"/></button>
                        </span>
                      </jalios:field>
                    </div>
                  </div>
                  <input type='hidden' name='redirect' value='<%= redirect %>' />
                  <% if (selectedWorkspace != null) { %>
                    <input type='hidden' name='<%= Workspace.PARENT_WORKSPACE_PARAMNAME %>' value='<%= selectedWorkspace.getId() %>' />
                  <% } %>
                </form>
              </div>
            </div>
          
            <%-- Workspace list --%>
            <table id='wsTable' class="table-data table-condensed">
              <tr>
                <% if (showRadioInsert ) { %>
                  <th>&nbsp;</th>
                <% } else if(showCheckInsert) { %>
                  <th class="text-center">
                    <input type="checkbox" title="<%= encodeForHTMLAttribute(glp("ui.adm.mbr-list.btn.select-all")) %>" onclick='checkAll(document.editForm, "workspaces", this);' />
                  </th>
                <% } %>
                <th>&nbsp;</th>
               <th width='100%'>
                  <% /* %>Name<% */ %><%= glp("ui.com.lbl.name") %>
                </th>
              </tr>
              <jalios:foreach name="itWorkspace" type="Workspace" collection="<%= workspaceSet %>"
                              max="<%= wcPagerHandler.getPageSize() %>"
                              skip="<%= wcPagerHandler.getStart() %>"> 
              <tr> 
                <% String label = HttpUtil.encodeForJavaScript(itWorkspace.getTitle(userLang)); %>
                <% if (showRadioInsert ) { %>
                  <td class="text-center" nowrap="nowrap"><%= WidgetUtil.getRadioInsert(itWorkspace, userLocale) %></td>
                <% } else if(showCheckInsert) { %>
                  <td class="text-center" nowrap="nowrap">
                    <input type="checkbox" name="workspaces" value="<%= itWorkspace.getId() %>" />
                  </td>
                <% } %>
                <td class="text-right"><%= wcPagerHandler.getStart() + itCounter.intValue() %>.</td>
                <td><jalios:icon src='<%= itWorkspace.getIcon() %>'   /> <%= itWorkspace.getTitle(userLang) %></td>
              </tr>
            </jalios:foreach>
            </table>
            
            <jalios:pager name='wcPagerHandler'/>
            
          </div>
    
        </td>
      </tr>
    </table>
  </form>
</div>
<jalios:javascript>
  Popup.autoResize("#mainDiv");
</jalios:javascript>
<%@ include file='/jcore/doEmptyFooter.jspf' %>