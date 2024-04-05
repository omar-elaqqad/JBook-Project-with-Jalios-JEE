<%@page import="com.jalios.jcmsplugin.esn.BirthdayManager"%>
<%@page import="com.jalios.jcmsplugin.esn.ESNManager"%>
<%@ include file='/jcore/doInitPage.jspf' %>
<%

if (!isLogged) {
  return;
}

ESNManager esnMgr = ESNManager.getInstance();
BirthdayManager birthdayMgr = BirthdayManager.getInstance();

if (!birthdayMgr.isBirthdayReminderEnabled()) {
  return;
}

Date myDayDate = (Date) request.getAttribute("jcms.sidebar.myday-date");
boolean isMyDayToday = DateUtil.isToday(myDayDate);

Set<Member> memberSet    = birthdayMgr.getBirthdayMemberSet(myDayDate, null, loggedMember);

if (Util.isEmpty(memberSet)) {
  return;
}
%>
<div class="sidebar-content">
  <div class="sidebar-content-header"><jalios:icon css="sidebar-content-header-icon" src="jcmsplugin-esn-sidebar-birthday-icon"/> <%= glp("jcmsplugin.esn.birthday-happy") %></div>
  <div class="sidebar-content-body">
    <div class="list-group">
      <jalios:foreach collection='<%= memberSet %>' type='Member' name='itMember'>
      <% MemberProfile profile = esnMgr.getMemberProfile(itMember); %>
      <a class="list-group-item list-group-item-member media" href="<%= itMember.getDisplayUrl(userLocale) %>">
        <jalios:memberphoto css="pull-left" link="false" member="<%= itMember %>" size="<%= PhotoSize.TINY %>"/> 
        <div class="media-body">
          <div class="media-heading"><%= itMember.getFullName() %></div>
          <% if (Util.notEmpty(itMember.getDepartment()) && Util.notEmpty(itMember.getJobTitle())) { %>
            <div class="media-description"><%= Util.notEmpty(itMember.getDepartment()) ? itMember.getDepartment() + " &middot;" : "" %> &middot; <%= itMember.getJobTitle() %></div>
          <% } %>          
        </div>
      </a>
      </jalios:foreach>
    </div>
  </div>
</div>