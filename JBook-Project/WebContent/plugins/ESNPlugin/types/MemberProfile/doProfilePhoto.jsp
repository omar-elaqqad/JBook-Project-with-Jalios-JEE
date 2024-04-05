<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/doInitMemberProfile.jspf' %><%

%>
<div class="profile-header-photo-wrapper">
  <div class="profile-header-photo">
    <jalios:memberphoto member="<%= member %>" resource="memberphoto-member-profile" />
  </div>
</div>