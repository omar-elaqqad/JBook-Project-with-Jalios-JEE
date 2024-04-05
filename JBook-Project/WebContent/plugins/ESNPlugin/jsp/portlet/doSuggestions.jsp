<%@ include file='/plugins/ESNPlugin/jsp/common/doCommonParams.jspf' %>
<% 
if (!isMyProfile) {
  request.setAttribute("ShowPortalElement" , Boolean.FALSE);
  return;
}

if (hasParameter("opDeleteSuggestion")) {
  String suggestionId = getDataIdParameter("suggestionId");
  esnMgr.deleteConnectionSuggestion(loggedMember, suggestionId);
}

if (hasParameter("opResetSuggestion")) {
  esnMgr.resetConnectionSuggestion(loggedMember);
}

Set<Member> suggestionSet = suggestionSet = esnMgr.findConnectionSuggestionSet(loggedMember, 5);


boolean showResetSuggestions = Util.toBoolean(request.getAttribute("jcmsplugin.esn.showResetSuggestion"), true);

request.setAttribute("skinTitle", glp("jcmsplugin.esn.lbl.connections.suggestions"));
%>

<% if (Util.notEmpty(suggestionSet)) { %>
<div class="connections suggestions">
  <div class="item-box item-box-member">
    <table class="items">
      <jalios:foreach collection="<%= suggestionSet %>" type="Member" name="itMember">
        <tr class="item">
          <td class="photo-part fit">
		        <jalios:memberphoto member="<%= itMember %>" size="<%= PhotoSize.TINY %>" />
          </td>
          <td class="info-part">
            <% if (dataWriteEnabled) { %>
            <div class="item-icons">            
              <a class="ajax-refresh ajax-action" onclick="return false;" href="<%= ServletUtil.getResourcePath(request) %>?mid=<%= loggedMember.getId() %>&amp;opDeleteSuggestion=true&amp;suggestionId=<%= itMember.getId() %>"><jalios:icon src="remove-small" title='<%= glp("jcmsplugin.esn.lbl.connections.suggestions.del") %>' css="hover-action" /></a>
            </div>
            <% } %>
            <jalios:link data="<%= itMember %>" css="name" /><br/>
            <% if (itMember.isContact()) { %>
            <%= Util.join(" - ", itMember.getOrganization(), itMember.getJobTitle()) %>
            <% } else { %>
            <%= Util.getString(itMember.getJobTitle(), "") %>
            <% } %>
          </td>
        </tr>
      </jalios:foreach>
    </table>
  </div>
</div>  
<% } else if (showResetSuggestions) { %>
<%
MemberData mbrData = esnMgr.getMemberData(loggedMember);
boolean hasRejected = mbrData != null && Util.notEmpty(mbrData.getRejectedSuggestionSet()); %>
<%   
  if (!hasRejected) {
    request.setAttribute("ShowPortalElement" , Boolean.FALSE);    
    return;
  } else { %>
<div class="connections suggestions">
  <div class="no-suggestion">
  <a class="ajax-refresh ajax-action confirm" data-jalios-text="<%= glp("msg.js.confirm") %>" onclick="return false;" href="plugins/ESNPlugin/jsp/portlet/doSuggestions.jsp?mid=<%= loggedMember.getId() %>&amp;opResetSuggestion=true"><%= glp("jcmsplugin.esn.lbl.connections.suggestions.reset") %></a>
  </div>
</div>    
<%   } %>
<% } %>
