<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/doInitMemberProfile.jspf' %><%

// Fix JCMS-4040 : invalid display of member photo if image file is missing from filesystem
String memberPhotoRelativePath = "images/jalios/layout/silhouette.jpg";
if (Util.notEmpty(member.getPhoto()) && (new File(channel.getRealPath(member.getPhoto()))).exists()) {
  memberPhotoRelativePath = member.getPhoto();
}

// Css
StringBuilder classes = new StringBuilder();
classes.append("wrapper-photo br media-object large-photo");
if (member.isContact()) {
  classes.append(" contact");
} else {
  classes.append(" account");
}
{
%>
<div class="profile-header-photo-wrapper">
  <div class="profile-header-photo">
    <jalios:memberphoto css='<%= "img-polaroid member-header-photo " + classes %>' 
        link="false" 
        resource="memberphoto-phone" 
        member="<%= member %>" 
        showStatus="false"
        size="<%= PhotoSize.LARGE %>" />
  </div>
</div>
<% } %>