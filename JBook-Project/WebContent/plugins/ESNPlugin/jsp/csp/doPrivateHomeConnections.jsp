<%@ include file="/jcore/doInitPage.jspf" %>
<%@ include file='/jcore/portal/doPortletParams.jspf' %>
<%@ page import="com.jalios.jcmsplugin.esn.*" %>

<%
Set<Member> memberSet = ESNManager.getInstance().getWorkspaceConnectionSet(loggedMember, workspace, true, 5);
%>
<% if (Util.notEmpty(memberSet)) { %>
<div class="meta-wrapper esn-connections">
  <div class="meta-label">
    <%= glp("jcmsplugin.esn.collaborativespace.private-home.connections") %>
  </div>
  <div class="meta-body">
    <div class="cs-member-list">
      <div class="row clearfix">
        <div class="col-xs-12 column">
          <ul class="item-list">
          <jalios:foreach collection="<%= memberSet %>" name="itMember" type="Member">
          <li>
            <jalios:memberphoto member="<%= itMember %>" size="<%= PhotoSize.ICON %>" />
            <jalios:link data="<%= itMember %>" />
          </li>
          </jalios:foreach>
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>
<% } %>