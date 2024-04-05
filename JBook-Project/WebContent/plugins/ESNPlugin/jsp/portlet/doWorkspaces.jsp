<%@ include file='/plugins/ESNPlugin/jsp/common/doCommonParams.jspf' %>
<% Map<String, Set<Workspace>> wsMap = esnMgr.getWorkspaceMap(member, loggedMember, userLang); %>
<% if (Util.notEmpty(wsMap)) { %>
<h2 id="profile-communities"><%= isMyProfile || isConnected ? glp("jcmsplugin.esn.lbl.communities") : glp("jcmsplugin.esn.lbl.common-communities") %></h2>
<div class="workspaces">
  <table class="logs">
    <jalios:foreach collection="<%= wsMap.entrySet() %>" 
                    name="entry" 
                    type="Map.Entry<String, Set<Workspace>>">
    <tr>
      <td class="log-date" valign="top" class="txt-right">
        <%= entry.getKey() %>
      </td>
      <td class="log-info" valign="top">
        <ul>
          <jalios:pager name='mbrWorkspacesPagerHandler' 
                        declare='true' 
                        action='init' 
                        size='<%= entry.getValue().size() %>'/>
          <jalios:foreach collection="<%= entry.getValue() %>" counter="itCounter2"
                          type="Workspace" 
                          name="itWorkspace" 
                          max="<%= mbrWorkspacesPagerHandler.getPageSize() %>"
                          skip="<%= mbrWorkspacesPagerHandler.getStart() %>">
          <% Publication collaborativeSpace = Util.getFirst(itWorkspace.getPublicationSet(channel.getClass("generated.CollaborativeSpace"))); %>
          <% if (collaborativeSpace != null) { %>
          <li class="workspace"><jalios:icon src="jcmsplugin-esn-commmunity" />
          <jalios:link data="<%= collaborativeSpace %>" css="ctxTooltipCard"/>
          <div class="wsInfo">
          <%= glp("jcmsplugin.esn.lbl.communities.info", JcmsUtil.getFriendlyDate(itWorkspace.getCdate(), DateFormat.SHORT, false, userLocale), Util.getSize(itWorkspace.getMemberSet()), Util.getSize(itWorkspace.getPublicationSet(Content.class))) %>
          </div>
          </li>
          <% } %>
        </jalios:foreach>
        </ul>
        <jalios:pager name='mbrWorkspacesPagerHandler' />
      </td>
    </tr>
    </jalios:foreach>
  </table>
</div>
<% } %>