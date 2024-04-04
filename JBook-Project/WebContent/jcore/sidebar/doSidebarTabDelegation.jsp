<%@page import="com.jalios.jcms.authentication.handlers.DelegationAuthenticationHandler"%><%
%><%@page import="com.jalios.jcms.uicomponent.sidebar.MemberSidebarTab"%><%
%><%@page import="com.jalios.jcms.uicomponent.sidebar.SidebarHandler"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
SidebarHandler handler = (SidebarHandler) request.getAttribute("jcms.sidebar.formHandler");
if (handler == null) {
  return;
}

final Set<Member> delegationHolderSet = DelegationAuthenticationHandler.getInstance().getDelegationHolderSet(loggedMember);
if (Util.isEmpty(delegationHolderSet)) {
  return;
}
%>
<div class="sidebar-tab-content-workspace">
  <h2 class="sidebar-tab-title"><%= glp("ui.sidebar.delegation") %></h2>
  <div class="list-group list-group-bordered">
    <jalios:foreach collection="<%= delegationHolderSet %>" type="Member" name="itMember">
      <div class="list-group-item list-group-item-member media">
        <jalios:memberphoto css="pull-left" member="<%= itMember %>" size="<%= PhotoSize.TINY %>"/> 
        <div class="media-body">
          <div class="media-heading"><jalios:link data="<%= itMember %>"><%= itMember.getFullName() %></jalios:link></div>
          <% if (Util.notEmpty(itMember.getDepartment()) && Util.notEmpty(itMember.getJobTitle())) { %>
            <div class="media-description"><%= Util.notEmpty(itMember.getDepartment()) ? itMember.getDepartment() + " &middot;" : "" %> &middot; <%= itMember.getJobTitle() %></div>
          <% } %>
          <%
          String delegationConfirmMsg  = glp("ui.adm.mbr-list.login.msg", encodeForHTML(JcmsUtil.unescapeHtml(itMember.getFullName())));
          if (channel.getBooleanProperty("alert.name.security.auth-delegation.enabled", true)) {
            delegationConfirmMsg += "<p>" + glp("ui.adm.mbr-list.mbr-alerted", encodeForHTML(JcmsUtil.unescapeHtml(itMember.getFullName())));
          }
          %>
          <a class="btn btn-default btn-xs modal confirm" 
             href="<%= DelegationAuthenticationHandler.getSuLink(itMember) %>"
             data-jalios-text="<%= encodeForHTMLAttribute(delegationConfirmMsg) %>">
             <%= glp("ui.sidebar.delegation.btn") %>
          </a>
        </div>
      </div>
    </jalios:foreach>
  </div>
</div>