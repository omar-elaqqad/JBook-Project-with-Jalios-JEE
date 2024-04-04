<%--
  @Summary: ACL list page (no header/footer)
  @Since: jcms-10.0.6 
--%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ include file="/admin/accessManager/doInitAclList.jspf" %><%
String aclListUrl = "admin/accessManager/aclList.jsp";
String refreshUrl = Util.getString(jcmsContext.getAjaxRequestAttribute("acl-list-ajax-refresh-url"), aclListUrl);

jcmsContext.addCSSHeader("css/jalios/acl.css");
%>
 
<%-- --- Title --------------------------- --%>
<% if (showTitle) { %>
  <div class="page-header"><h1><%= glp("acl.acl-chooser.title") %> (<%= aclSet.size() %>)</h1></div>
<% } %>

<%-- --- ACL Navbar --------------------------- --%>
<div class="navbar navbar-default navbar-table-header">
  <div class="container-fluid">
  
    <%-- CREATE NEW ACL --%>
    <% if (showEditAcl) { %>
    <form action='admin/editAcl.jsp' method='get' name='addAclForm' class="navbar-form navbar-left">
      <input type="hidden" name="redirect" value="<%= ServletUtil.getUrl(request) %>" />      
      <button class='btn btn-primary' type='submit'><jalios:icon src="add" /> <%= glp("accesscontrol.acl-list.btn.add") %></button>
    </form>
     <% } %>
    
    <%-- SEARCH --%>
    <form class="navbar-form navbar-right" role="search">
      <div class="form-group">
        <jalios:field name="text" value="<%= text %>" resource="field-light">
          <jalios:control settings='<%= new TextFieldSettings().placeholder("ui.com.placeholder.search") %>' />
          <span class="input-group-btn">
            <button class="btn btn-default ajax-refresh" name="opSearch" type="submit"><jalios:icon src="search" /></button>
          </span>               
        </jalios:field>
      </div>
      <% List removedParams = new ArrayList(); removedParams.add("opSearch"); removedParams.add("text"); %>
      <%= printHiddenParams(request, removedParams, true) %>
    </form>     
  </div>
</div>

<%-- --- ACL LIST --------------------------- --%>
<jalios:pager name='aclPagerHandler' declare="true" action='init' size='<%= aclSet.size() %>' />
 <form name='editForm' action="<%= refreshUrl %>">
 <table id='aclTable'  class="table-data table-condensed">
   <thead>
    <tr>      
     <% if (showRadioInsert ) { %>
      <th>&nbsp;</th>
     <% } %>
      <th colspan="<%= showEditAcl ? 2 : 1 %>">&nbsp;</th>
      <th class="nowrap"><%= glp("ui.com.lbl.name") %></th>
     <% if (showWorkspaceAclState) { %>
      <th class="nowrap"><%= glp("accesscontrol.acl-list.ws") %></th>
     <% } %>
     <% if (showGroupCount) { %>
      <th class="nowrap">
        <%= glp("accesscontrol.acl-list.grp-nbr") %>
        <jalios:tooltip property="accesscontrol.acl-list.grp-nbr.h" />
      </th>
     <% } %>
     <% if (showMemberCount) { %>
      <th class="nowrap">
        <%= glp("accesscontrol.acl-list.mbr-nbr") %>
        <jalios:tooltip property="accesscontrol.acl-list.mbr-nbr.h" />
      </th>
     <% } %>
     <% if (showDelete) { %>
      <th class="nowrap">&nbsp;</th>
     <% } %>
    </tr>
   </thead>
   
   <tbody>
   <% if (Util.isEmpty(aclSet)) { %>
    <tr>
     <td class="empty" colspan="7"><%= glp("accesscontrol.acl-list.empty-list") %></td>
    </tr>
   <% } %>
    <jalios:foreach name='acl' type='AccessControlList' collection='<%= aclSet %>' counter='aclCounter'
                    max='<%= aclPagerHandler.getPageSize() %>' skip='<%= aclPagerHandler.getStart() %>'>
    <%
    String aclUrl = refreshUrl + "?id=" + acl.getId();
    %>
    <tr> 
     <%-- --- ACL / Radio Button Chooser --------------------- --%>
     <% if (showRadioInsert ) { %>
      <td class="nowrap fit">
        <%= WidgetUtil.getRadioInsert(acl, userLocale) %>
      </td>
     <% } %>
     <%-- --- ACL / Edit & Counter --------------------------- --%>
     <% if (showEditAcl) { %>
      <td class="nowrap fit">
        <jalios:edit data='<%= acl %>' css="btn btn-rounded"/>
      </td>
     <% } %>
      <td class="nowrap fit numeric">
        <%= aclPagerHandler.getStart() + aclCounter.intValue() %>.
      </td> 
     <%-- --- ACL / Name --------------------------- --%>
      <td class="nowrap">
        <% if (aclLinkEnabled) { %><a href="<%= aclUrl %>" data-jalios-action="ajax-refresh"><% } %>
        <%= acl.getName() %>
        <% if (aclLinkEnabled) { %></a><% } %>
     <%-- --- ACL / Workspace ACL --------------------------- --%>
     <% if (showWorkspaceAclState) { %>
      <td class="nowrap fit">
        <%= glp("ui.com.lbl." + (acl.isWorkspaceACL() ? "true" : "false")) %>
      </td>
     <% } %>
     <%-- --- ACL / Group Count --------------------------- --%>
     <% if (showGroupCount) { %>
      <td class="nowrap fit numeric">
        <% if (aclLinkEnabled) { %><a href="<%= aclUrl %>" data-jalios-action="ajax-refresh"><% } %>
        <%= acl.getGroupSet().size() %>
        <% if (aclLinkEnabled) { %></a><% } %>
      </td>
     <% } %>
     <%-- --- ACL / Member Count --------------------------- --%>
     <% if (showMemberCount) { %>
      <td class="nowrap fit numeric">
        <%
        Set<Member> mbrSet = new TreeSet<Member>(); 
        for (Group group : acl.getGroupSet()) {
          mbrSet.addAll(group.getMemberSet());
        }
        %>
        <% if (aclLinkEnabled) { %><a href="<%= aclUrl %>" data-jalios-action="ajax-refresh"><% } %>
        <%= mbrSet.size() %>
        <% if (aclLinkEnabled) { %></a><% } %>
      </td>
     <% } %>
     <%-- --- ACL / Delete --------------------------- --%>
     <% if (showDelete) { %>
      <td class="nowrap fit">
       <jalios:delete data='<%= acl %>' />
      </td>
     <% } %>
     </tr>         
    </jalios:foreach>
   </tbody>
  </table>
 </form>
<jalios:pager name='aclPagerHandler'/>