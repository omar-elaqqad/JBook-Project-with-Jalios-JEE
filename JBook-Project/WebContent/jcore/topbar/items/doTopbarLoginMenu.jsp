<%@ include file='/jcore/topbar/items/doInitTopbarItem.jspf' %>
<% if (topbarHandler.showLoginMenu()) { %>
  <jalios:login css=" btn btn-default topbar-login-menu"  displayLinkText="true" loginIcon="topbar-login" />
<% } %>