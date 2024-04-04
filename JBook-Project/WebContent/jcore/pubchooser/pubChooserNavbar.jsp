<%@page import="com.jalios.jcms.taglib.settings.impl.MemberSettings.MemberFilter"%>
<%@page import="com.jalios.jcms.handler.PubChooserHandler"%>
<%@page import="com.jalios.jcms.handler.PubChooserHandler.FilterMode"%>
<%@ include file='/jcore/doInitPage.jspf' %><%
WorkspaceQueryHandler workspaceQueryHandler = (WorkspaceQueryHandler) request.getAttribute("workspaceQueryHandler");
PubChooserHandler formHandler = (PubChooserHandler) request.getAttribute("pubChooserHandler");
if (Util.isEmpty(workspaceQueryHandler) || Util.isEmpty(formHandler)) { %>
<jalios:include jsp="jcore/pubchooser/pubChooserHandlers.jsp" />
<% } %>
<%
workspaceQueryHandler = (WorkspaceQueryHandler) request.getAttribute("workspaceQueryHandler");
formHandler = (PubChooserHandler) request.getAttribute("pubChooserHandler");

WorkspaceResult result = workspaceQueryHandler.getResults();
%>
<div class="chooser-navbar">
  <div class="chooser-navbar-top">
    <div class="chooser-navbar-filters">
      <jalios:include jsp="jcore/pubchooser/pubChooserAddButton.jsp" />
      <% if (Util.notEmpty(result.getOtherWorkspaceSet()) || Util.notEmpty(result.getRecentWorkspaceSet())) { %>
        <div class="select2-noinput">
          <select class="select2-enumerate hide js-chooser-filter" name="chooserWorkspace" data-jalios-action="ajax-refresh">
            <% if (formHandler.showAllWorkspaceFilter()) { %>
              <option <%= formHandler.isAllWorkspace() ? "selected=\"selected\"" : "" %> value="ALL_WORKSPACES"><%= glp("ui.work.mn.allworkspaces") %></option>
            <% } %>
            <option <%= formHandler.isAllMyWorkspace() ? "selected=\"selected\"" : "" %> value="ALL_MY_WORKSPACES"><%= glp("ui.work.mn.allworkspace") %></option>
            <% if (Util.notEmpty(result.getRecentWorkspaceSet())) { %>
              <optgroup label="<%= glp("ui.workspace.workspace-recently-visited") %>">
                <% for (Workspace itWorkspace : result.getRecentWorkspaceSet()) { %>
                  <option <%= formHandler.getWorkspaceSet().contains(itWorkspace) ? "selected=\"selected\"" : "" %> value="<%= itWorkspace.getId() %>"><%= itWorkspace.getTitle(userLang) %></option>
                <% } %>
              </optgroup>
            <% } %>
            <% if (Util.notEmpty(result.getOtherWorkspaceSet())) { %>
              <optgroup label="<%= glp("ui.workspace.workspace-others") %>">
                <% for (Workspace itWorkspace : result.getOtherWorkspaceSet()) { %>
                  <option <%= formHandler.getWorkspaceSet().contains(itWorkspace) ? "selected=\"selected\"" : "" %> value="<%= itWorkspace.getId() %>"><%= itWorkspace.getTitle(userLang) %></option>
                <% } %>
              </optgroup>
            <% } %>
          </select>
        </div>
      <% } %>
      <% if (formHandler.showTypeChooser()) { %>
        <div class="select2-noinput">
          <select class="select2-enumerate hide" name="types" data-jalios-action="ajax-refresh">
            <% if (formHandler.showPublicationInChooser()) { %>
            <option <%= Util.arrayContains(formHandler.getTypes(), "Publication") ? "selected=\"selected\"" : "" %> value="Publication"><%= glp("pubchooser.all-publications") %></option>
            <% } %>
            <% if (formHandler.showContentInChooser()) { %>
              <optgroup label="<%= glp("pubchooser.contents") %>">
                <option <%= Util.arrayContains(formHandler.getTypes(), "Content") ? "selected=\"selected\"" : "" %> value="Content"><%= glp("pubchooser.all-contents") %></option>
              <% for (Class itClass : formHandler.getSubTypes(Content.class, true)) { %>
                <option <%= Util.arrayContains(formHandler.getTypes(), itClass.getSimpleName()) ? "selected=\"selected\"" : "" %> value="<%= itClass.getSimpleName() %>"><%= channel.getTypeEntry(itClass).getLabel(userLang) %></option>
              <% } %>
              </optgroup>
            <% } %>
            <% if (formHandler.showUserContentInChooser()) { %>
              <optgroup label="<%= glp("pubchooser.user-contents") %>">
                <option <%= Util.arrayContains(formHandler.getTypes(), "UserContent") ? "selected=\"selected\"" : "" %> value="UserContent"><%= glp("pubchooser.all-user-contents") %></option>
              <% for (Class itClass : formHandler.getSubTypes(UserContent.class, true)) { %>
                <option <%= Util.arrayContains(formHandler.getTypes(), itClass.getSimpleName()) ? "selected=\"selected\"" : "" %> value="<%= itClass.getSimpleName() %>"><%= channel.getTypeEntry(itClass).getLabel(userLang) %></option>
              <% } %>
              </optgroup>
            <% } %>
            <% if (formHandler.showFormInChooser()) { %>
              <optgroup label="<%= glp("pubchooser.forms") %>">
                <option <%= Util.arrayContains(formHandler.getTypes(), "Form") ? "selected=\"selected\"" : "" %> value="Form"><%= glp("pubchooser.all-forms") %></option>
                <% for (Class itClass : formHandler.getSubTypes(Form.class, true)) { %>
                  <option <%= Util.arrayContains(formHandler.getTypes(), itClass.getSimpleName()) ? "selected=\"selected\"" : "" %> value="<%= itClass.getSimpleName() %>"><%= channel.getTypeEntry(itClass).getLabel(userLang) %></option>
                <% } %>
              </optgroup>
            <% } %>
            <% if (formHandler.showPortletInChooser()) { %>
              <optgroup label="<%= glp("pubchooser.portlets") %>">
                <option <%= Util.arrayContains(formHandler.getTypes(), "PortalElement") ? "selected=\"selected\"" : "" %> value="PortalElement"><%= glp("pubchooser.all-portlets") %></option>
                <% for (Class itClass : formHandler.getSubTypes(PortalElement.class, true)) { %>
                  <option <%= Util.arrayContains(formHandler.getTypes(), itClass.getSimpleName()) ? "selected=\"selected\"" : "" %> value="<%= itClass.getSimpleName() %>"><%= channel.getTypeEntry(itClass).getLabel(userLang) %></option>
                <% } %>
              </optgroup>
            <% } %>
          </select>
        </div>
      <% } else if (formHandler.showSubTypeChooser()){ %>
        <div class="select2-noinput">
          <select class="select2-enumerate hide" name="types" data-jalios-action="ajax-refresh">
            <option value=""><%= glp("pubchooser.all-types") %></option>
            <% for (Class itClass : formHandler.getSubTypeSet()) { %>
              <option <%= Util.arrayContains(formHandler.getTypes(), itClass.getSimpleName()) ? "selected=\"selected\"" : "" %> value="<%= itClass.getSimpleName() %>"><%= channel.getTypeEntry(itClass).getLabel(userLang) %></option>
            <% } %>
          </select>
        </div>
      <% } else { %>
        <% for (String itSuperType : formHandler.getSuperTypes()) { %>
          <input type="hidden" name="super" value="<%= itSuperType %>" />
        <% } %>
      <% } %>
      <div class="filter-mode-input">
        <label><input class="js-chooser-filter" <%= formHandler.getAvailableFilterMode() == FilterMode.MINE ? "checked=\"checked\"" : "" %> data-jalios-action="ajax-refresh" type="checkbox" value="<%= FilterMode.MINE.toString() %>" name="filterMode" /> <%= glp("pubchooser.my-content-only") %></label>
      </div>
      <% if (formHandler.showAdditionalFilters()) { %>
        <a class="show-more-filter" data-jalios-chooser-action="toggleFilters">
          <%= glp("pubchooser.show-more-filters") %> <jalios:icon src="caret" />
        </a>
      <% } %>
  
    </div>
    <div class="chooser-navbar-search">
      <jalios:field name='text' resource="field-light" css="app-sidebar-field" value="<%= formHandler.getText() %>">
        <jalios:control settings='<%= formHandler.getSearchFieldSettings() %>' />
        <span class="input-group-btn">
          <button class="btn btn-default js-chooser-filter" name="opSearch" type="submit" data-jalios-action="ajax-refresh"><jalios:icon src="app-search"/></button>
          <button type="submit" data-jalios-chooser-action="resetSearch" aria-label='<%= glp("ui.com.btn.reset")%>' class="js-chooser-filter btn btn-default btn-remove" title='<%= glp("ui.com.btn.reset") %>'>
            <jalios:icon src="remove" alt="ui.com.btn.reset" />
          </button>
        </span>
      </jalios:field>
    </div>
  </div>
  <% if (formHandler.showAdditionalFilters()) { %>
    <div class="chooser-navbar-bottom no-focus">
      <div class="chooser-navbar-filters">
        <% if (formHandler.showAuthorAndGroupFilters()) { %>
        <div class="data-chooser">
          <label><%= glp("ui.com.lbl.author") %></label>
          <jalios:field resource="field-light" label="ui.work.pub.lbl.filter.member" name='mids' value="<%= formHandler.getMids() %>" mv="0">
            <jalios:control settings='<%= new MemberSettings().dataAttribute("jalios-event", "change").dataAttribute("data-jalios-action", "ajax-refresh").filter(MemberFilter.ACCOUNT) %>' />
          </jalios:field>
        </div>
        <div class="data-chooser">
          <label><%= glp("ui.com.lbl.group") %></label>
          <jalios:field resource="field-light" label="ui.work.pub.lbl.filter.group" name='gids' value="<%= formHandler.getGids() %>" mv="0">
            <jalios:control settings='<%= new GroupSettings().dataAttribute("jalios-event", "change").dataAttribute("data-jalios-action", "ajax-refresh").filter(com.jalios.jcms.taglib.settings.impl.GroupSettings.MemberFilter.ACCOUNT) %>' />
          </jalios:field>    
        </div>
        <% } %>
        <% if (formHandler.showPStatusFilter()) { %>
          <div class="select2-noinput">
            <select class="select2-enumerate hide js-chooser-filter" name="pstatus" data-jalios-action="ajax-refresh" >
              <option value=""><%= glp("ui.work.pub.lbl.all-pstatus") %></option>
              <% for (WFState itState : formHandler.getWFStates()) { %>
                <option <%= Util.arrayContains(formHandler.getPstatus(), Util.toString(itState.getPstatus(), "")) ? "selected=\"selected\"" : "" %> value="<%= itState.getPstatus() %>"><%= itState.getLabel(userLang) %></option>
              <% } %>
            </select>
          </div>
        <% } %>
      </div>
    </div>
  <% } %>
</div>