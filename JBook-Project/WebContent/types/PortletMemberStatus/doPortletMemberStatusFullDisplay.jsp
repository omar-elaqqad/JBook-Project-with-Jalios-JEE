<%@ include file='/jcore/doInitPage.jspf' %>
<%@ include file='/jcore/portal/doPortletParams.jspf' %>
<%@ page import="com.jalios.jcmsplugin.esn.*" %>
<%@ page import="com.jalios.jcms.calendar.*" %><% 
ESNManager esnMgr = ESNManager.getInstance();

PortletMemberStatus box = (PortletMemberStatus)portlet;

Set<Member> memberSet = esnMgr.getPortletMemberStatusMemberSet(box.getWorkspaceMembers() ? workspace : null, loggedMember);

if (memberSet == null){
  return;
}

jcmsContext.addCSSHeader("plugins/ESNPlugin/css/esn.css");

Map<Integer, Set<Member>> statusMap = new HashMap<Integer, Set<Member>>();
for (Member mbr: memberSet) {
  int status = mbr.getStatus();
  Set<Member> set = statusMap.get(status);
  if (set == null) {
    set = new TreeSet<Member>(Member.getLastLoginDateComparator());
    statusMap.put(status, set);
  }
  set.add(mbr);
}

int mbrStatusTab = getIntParameter("mbrStatusTab", -1);

int[] statusArray = new int[] {Member.MEMBER_STATUS_ONLINE, Member.MEMBER_STATUS_AWAY, Member.MEMBER_STATUS_DND, Member.MEMBER_STATUS_OFFLINE};
%>

<div id="portlet-member-status" class="esn">

  <% if (Util.notEmpty(memberSet)) { %>
    <ul class="nav nav-tabs nav-tabs-underlined">
      <% for(int i = 0; i < statusArray.length; i++) { %>
      <% 
      int itStatus = statusArray[i]; 
      int size = Util.getSize(statusMap.get(itStatus));
      %>
      <%   if (size > 0) { %>
      <%     if (mbrStatusTab == -1) { mbrStatusTab = itStatus; } %>
      <li class="<%= mbrStatusTab == itStatus ? "active" : ""%>"><a class="ajax-refresh" href="types/PortletMemberStatus/doPortletMemberStatusFullDisplay.jsp?mbrStatusTab=<%= itStatus %>"><jalios:icon src='<%= "mbr-status-" + itStatus %>' title='<%= encodeForHTMLAttribute(glp("ui.com.alt.mbr.status." + itStatus)) %>' /> <%= glp("ui.com.alt.mbr.status." + itStatus) %> (<%= size %>)</a></li>
      <%   } %>
      <% } %>
    </ul>  
  <% } %>
  
  <% memberSet = statusMap.get(mbrStatusTab); %>
  
  <% if (Util.notEmpty(memberSet)) { %>
    <jalios:pager name='pagerHandler' declare='true' action='init' pageSize='10' size='<%= memberSet.size() %>'/>
   
    <div class="item-box-member">
      <ul class="item-box">
      <jalios:foreach collection="<%= memberSet %>" 
                      type="Member" 
                      name="itMember"
                      max='<%= pagerHandler.getPageSize() %>'
                      skip='<%= pagerHandler.getStart() %>'
                      >
                      <li>
      <%@ include file="/plugins/ESNPlugin/jsp/common/doMemberStatus.jspf" %></li>
      </jalios:foreach>
      </ul>
    </div>
  
    <jalios:pager name='pagerHandler' template='pqf' />
  <% } else { %>
    <%= glp("jcmsplugin.esn.portlet-mbr-status.no-mbr") %>
  <% } %>
</div>