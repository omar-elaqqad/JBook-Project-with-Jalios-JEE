<%@ include file='/plugins/ESNPlugin/jsp/common/doCommonParams.jspf' %>
<%
boolean show = isMyProfile || isConnected;
if (!show) {
  request.setAttribute("ShowPortalElement" , Boolean.FALSE);    
  return;
}
String tab = getStringEnumParameter("esnSkinTab", "all", new String[] {"all", "account", "contact"});

boolean allConn = "all".equals(tab);
boolean accountConn = "account".equals(tab);
boolean contactConn = "contact".equals(tab);

SortedSet<Member> allSet = esnMgr.getSortedOtherConnectionSet(member, loggedMember, true, true);
if (!isMyProfile && Util.isEmpty(allSet)) {
  request.setAttribute("ShowPortalElement" , Boolean.FALSE);    
  return;
}

SortedSet<Member> accountSet = esnMgr.getSortedOtherConnectionSet(member, loggedMember, true, false);
SortedSet<Member> contactSet = esnMgr.getSortedOtherConnectionSet(member, loggedMember, false, true);

SortedSet<Member> sortedConnectionSet = allConn ? allSet : (accountConn ? accountSet : contactSet); 


String title = null;
if (isMyProfile) {
  title = glp("jcmsplugin.esn.lbl.connections.me");
} else {
  title = glp("jcmsplugin.esn.lbl.connections.other", friendlyName);
}

String countUrl = ServletUtil.getUrlWithUpdatedParam(request, "esnProfileTab", "contact");

request.setAttribute("skinTitle", title);
String linkTitle = isMyProfile ? glp("jcmsplugin.esn.lbl.connections.show.me") : glp("jcmsplugin.esn.lbl.connections.show.other", friendlyName);
request.setAttribute("defaultSkin.info", Util.getString(request.getAttribute("defaultSkin.info"), "") + "<a href='" + countUrl + "' title=\"" + linkTitle+ "\" class='badge badge-info'>" + Util.getSize(allSet) + "</a>");

if (isMyProfile && esnMgr.canCreateExternalContacts(member) && dataWriteEnabled) {
  String footerUrl = "<a class='modal contact-creation-link' onclick='return false;' href='plugins/ESNPlugin/jsp/form/addContact.jsp'>" + JcmsUtil.getHtmlIcon("add") + " " + glp("jcmsplugin.esn.lbl.connections.new-contact") + "</a>";
  request.setAttribute("defaultSkin.footer", footerUrl);
}

boolean showAccountTab = Util.notEmpty(accountSet);
boolean showContactTab = Util.notEmpty(contactSet);
boolean showAllTab = showAccountTab && showContactTab;
%>

<div class="connections otherConnections">

  <% if (showAccountTab || showContactTab) { %>
    <ul class="nav nav-tabs br">
      <% if (showAllTab) { %>
      <li <%= allConn ? "class='active'" : "" %>><a class="ajax-refresh" href="<%= ServletUtil.getUrlWithUpdatedParam(request, "esnSkinTab", "all") %>"><%= glp("jcmsplugin.esn.lbl.connections.all") %></a></li>
      <% } %>
      
      <% if (showAccountTab) { %>
      <li <%= accountConn || !showAllTab ? "class='active'" : "" %>><a class="ajax-refresh" href="<%= ServletUtil.getUrlWithUpdatedParam(request, "esnSkinTab", "account") %>"><%= glp("jcmsplugin.esn.lbl.connections.internal") %></a></li>
      <% } %>
      
      <% if (showContactTab) { %>
      <li <%= contactConn || !showAllTab ? "class='active'" : "" %>><a class="ajax-refresh" href="<%= ServletUtil.getUrlWithUpdatedParam(request, "esnSkinTab", "contact") %>"><%= glp("jcmsplugin.esn.lbl.connections.external") %></a></li>
      <% } %>
    </ul>
  <% } %>
  <div class="item-box item-box-member">
    <table class="items">
    <jalios:pager name='connectionsPagerHandler' 
                  declare='true' 
                  action='init' 
                  pageSize='5' 
                  size='<%= sortedConnectionSet.size() %>' />
    <jalios:foreach collection="<%= sortedConnectionSet %>" 
                    type="Member" 
                    name="itMember"
                    max="<%= connectionsPagerHandler.getPageSize() %>"
                    skip="<%= connectionsPagerHandler.getStart() %>">
      <% boolean showDisconnect = loggedMember == member; %>
      <%@ include file="/plugins/ESNPlugin/jsp/common/doConnectionRow.jspf" %>
    </jalios:foreach>
    </table>
    <jalios:pager name='connectionsPagerHandler' template='pqf' />
  </div>
</div>
