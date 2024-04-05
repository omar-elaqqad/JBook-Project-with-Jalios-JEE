<%@ include file='/plugins/ESNPlugin/jsp/common/doCommonParams.jspf' %>
<%
if (isMyProfile) {
  request.setAttribute("ShowPortalElement" , Boolean.FALSE);    
  return;
}

String tab = getStringEnumParameter("esnSkinTab", "all", new String[] {"all", "account", "contact"});

boolean allConn = "all".equals(tab);
boolean accountConn = "account".equals(tab);
boolean contactConn = "contact".equals(tab);

SortedSet<Member> allSet = esnMgr.getSortedCommonConnectionSet(member, loggedMember, true, true);
if (Util.isEmpty(allSet)) {
  request.setAttribute("ShowPortalElement" , Boolean.FALSE);    
  return;
}

SortedSet<Member> accountSet = esnMgr.getSortedCommonConnectionSet(member, loggedMember, true, false);
SortedSet<Member> contactSet = esnMgr.getSortedCommonConnectionSet(member, loggedMember, false, true);

SortedSet<Member> sortedConnectionSet = allConn ? allSet : (accountConn ? accountSet : contactSet); 

String countUrl = ServletUtil.getUrlWithUpdatedParam(request, "esnProfileTab", "contact");

request.setAttribute("skinTitle", glp("jcmsplugin.esn.lbl.connections.common"));
request.setAttribute("defaultSkin.info", Util.getString(request.getAttribute("defaultSkin.info"), "") + "<a href='" + countUrl + "' title=\"" + glp("jcmsplugin.esn.lbl.connections.show.other", friendlyName) + "\" class='count badge badge-info'>" + Util.getSize(allSet) + "</a>");

boolean showAccountTab = Util.notEmpty(accountSet);
boolean showContactTab = Util.notEmpty(contactSet);
boolean showAllTab = showAccountTab && showContactTab;
%>

<div class="connections common-connections">

    <ul class="nav nav-tabs">
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
  
  <div class="item-box">
    <table class="connection-list items item-box-member">
    <jalios:pager name='commonConnectionsPagerHandler' 
                  declare='true' 
                  action='init' 
                  pageSize='5' 
                  size='<%= sortedConnectionSet.size() %>'/>
    <jalios:foreach collection="<%= sortedConnectionSet %>" 
                    type="Member" 
                    name="itMember"
                    max="<%= commonConnectionsPagerHandler.getPageSize() %>"
                    skip="<%= commonConnectionsPagerHandler.getStart() %>">
      <% boolean showDisconnect = isContact && isConnected ; %>
      <%@ include file="/plugins/ESNPlugin/jsp/common/doConnectionRow.jspf" %>
    </jalios:foreach>
    </table>
  </div>
  <jalios:pager name='commonConnectionsPagerHandler' template='pqf' />  
</div>
