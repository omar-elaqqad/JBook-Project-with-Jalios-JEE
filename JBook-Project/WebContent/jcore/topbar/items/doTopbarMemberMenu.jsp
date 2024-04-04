<%@ include file='/jcore/topbar/items/doInitTopbarItem.jspf' %><%

if (topbarHandler.showMemberMenu()) { %>

  <a href="<%= ResourceHelper.getMemberProfile() %>"
      id="main-sidebar-opener"
      data-jalios-sidebar-action="open"
      aria-haspopup="dialog"
      aria-expanded="false"
      role="button"
      tabindex="0"
      title="<%= encodeForHTMLAttribute(glp("ui.topbar.photo-link.title", loggedMember.getFullName())) %>"
      data-jalios-sidebar-target=".site-sidebar"
      class="topbar-member-menu member-photo-container<%= channel.getCurrentDelegateMember() != null ? " is-delegated" : "" %>">
    <jalios:memberphoto resource="memberphoto-topbar"
          alt='<%= glp("ui.topbar.photo-link.title", loggedMember.getFullName()) %>'
          css="member-photo sidebar-opener"
          member="<%= loggedMember %>"
          size="<%= PhotoSize.TINY %>"
          showStatus="false"
          link="<%= false %>" />
  </a>
<% } %>