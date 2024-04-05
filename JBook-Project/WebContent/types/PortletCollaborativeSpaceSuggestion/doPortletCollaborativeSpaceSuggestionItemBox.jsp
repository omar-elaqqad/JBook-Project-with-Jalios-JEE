<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%
%><%@ page import="com.jalios.jcmsplugin.collaborativespace.*" %><%
%><% 

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

%>

<div class="cs-suggestion">
  <% if (Util.isEmpty(suggestionSet)) { %>
  <p><%= glp("jcmsplugin.collaborativespace.suggestion.none") %></p>
  
  <% } else { %>
  <jalios:pager name='pagerHandler' declare='true' action='init' pageSize='<%= box.getMaxItems() %>' size='<%= suggestionSet.size() %>'/>
   
  <ul class="item-box">
  <jalios:foreach collection="<%= suggestionSet %>" 
                  type="CollaborativeSpace" 
                  name="itCS"
                  max='<%= pagerHandler.getPageSize() %>'
                  skip='<%= pagerHandler.getStart() %>'
                  >
  <li>
  
  <% if (channel.isDataWriteEnabled()) { %>
  <div class="item-icons">            
    <% if (!CSHelper.isAdminSignup(itCS)) { %>
    <a class="btn btn-default btn-sm modal" href="plugins/CollaborativeSpacePlugin/jsp/signup.jsp?wsId=<%= itCS.getWorkspace().getId() %>">
      <%= glp("jcmsplugin.collaborativespace.lbl.signup-action") %>
    </a>
    <% } %>
  
    <a class="ajax-refresh ajax-action" onclick="return false;" href="<%= ServletUtil.getResourcePath(request) %>?opIgnoreSuggestion=true&amp;suggestionId=<%= itCS.getId() %>"  title="<%= glp("ui.com.btn.delete") %>" alt=""><jalios:icon src="remove-small" /></a>
  </div>
  <% } %>
  
  <span title='<%= encodeForHTMLAttribute(glp("types.CollaborativeSpace.fields.accessPolicy.label")) %>'>
    <% CollaborativeSpace csBadge = itCS; %>
    <%@ include file="/plugins/CollaborativeSpacePlugin/jsp/doCSBadge.jspf" %>
  </span>
  <jalios:icon src="collaborative-space" /> <jalios:link data="<%= itCS %>" />

  <jalios:wiki><jalios:truncate length="400" suffix="..."><%= itCS.getDescription(userLang) %></jalios:truncate></jalios:wiki>
  </li>
  </jalios:foreach>
  </ul>
  
  <jalios:pager name='pagerHandler' template='pqf' />
  <% } %>

  <div class="item-box-footer">
    <a class="ajax-refresh ajax-action confirm" href="<%= ServletUtil.getResourcePath(request) %>?opResetSuggestions=true" ><%= glp("jcmsplugin.collaborativespace.suggestion.reset") %></a>
  </div>

</div>