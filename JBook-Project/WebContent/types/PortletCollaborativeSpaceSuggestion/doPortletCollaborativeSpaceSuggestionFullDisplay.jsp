<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%
%><%@ page import="com.jalios.jcmsplugin.collaborativespace.*" %><%

PortletCollaborativeSpaceSuggestion box = (PortletCollaborativeSpaceSuggestion)portlet; 

CSSuggestionManager suggestionMgr = CSSuggestionManager.getInstance();

if (hasParameter("opIgnoreSuggestion")) {
  CollaborativeSpace cs = getDataParameter("suggestionId", CollaborativeSpace.class);
  suggestionMgr.ignoreSuggestion(loggedMember, cs);
}

if (hasParameter("opResetSuggestions")) {
  suggestionMgr.resetSuggestions(loggedMember);
}

Set<CollaborativeSpace> suggestionSet = suggestionMgr.getSuggestionSet(loggedMember, box.getThreshold(), box.getTypology(loggedMember));

if (box.getHideWhenNoResults() && Util.isEmpty(suggestionSet)) {
  request.setAttribute("ShowPortalElement" , Boolean.FALSE);
  return;
}

jcmsContext.addCSSHeader("plugins/CollaborativeSpacePlugin/css/collaborativeSpace.css");
jcmsContext.addCSSHeader("plugins/CollaborativeSpacePlugin/css/cs-portlet-suggestions.css");
%>

<div class="cs-suggestion">
  <% if (Util.isEmpty(suggestionSet)) { %>
    <p><%= glp("jcmsplugin.collaborativespace.suggestion.none") %></p>
  <% } else { %>
    <jalios:pager name='pagerHandler' declare='true' action='init' pageSize='<%= box.getMaxItems() %>' size='<%= suggestionSet.size() %>'/>
     <jalios:list>
    <jalios:foreach collection="<%= suggestionSet %>" 
                  type="CollaborativeSpace" 
                  name="itCS"
                  max='<%= pagerHandler.getPageSize() %>'
                  skip='<%= pagerHandler.getStart() %>'>
    <jalios:listItem css="has-action" link="<%= itCS.getDisplayUrl(userLocale) %>" text="<%= itCS.getTitle(userLang) %>">
      <jalios:buffer name='LIST_ITEM_IMAGE'>
        <span class="itemlist-item-icon"><jalios:dataicon data="<%= itCS %>" /></span>
      </jalios:buffer>
      <jalios:buffer name='LIST_ITEM_META'>
        <span title='<%= encodeForHTMLAttribute(glp("types.CollaborativeSpace.fields.accessPolicy.label")) %>'>
          <% CollaborativeSpace csBadge = itCS; %>
          <%@ include file="/plugins/CollaborativeSpacePlugin/jsp/doCSBadge.jspf" %>
        </span>      
      </jalios:buffer>
      <jalios:buffer name='LIST_ITEM_ACTIONS'>
        <% if (channel.isDataWriteEnabled()) { %>
          <div class="itemlist-item-actions">
            <a class="ajax-refresh ajax-action" onclick="return false;" href="<%= ServletUtil.getResourcePath(request) %>?opIgnoreSuggestion=true&amp;suggestionId=<%= itCS.getId() %>" title="<%= encodeForHTMLAttribute(glp("ui.com.btn.delete")) %>" alt=""><jalios:icon src="remove-small" /></a>
          </div>
        <% } %>
      </jalios:buffer>     
    </jalios:listItem>
  </jalios:foreach>
  </jalios:list>
  
  <jalios:pager name='pagerHandler' template='pqf' />
  <% } %>
  <a class="btn btn-default itemlist-action ajax-refresh ajax-action confirm reset-cs-suggestions" href="<%= ServletUtil.getResourcePath(request) %>?opResetSuggestions=true"><%= glp("jcmsplugin.collaborativespace.suggestion.reset") %></a>
</div>