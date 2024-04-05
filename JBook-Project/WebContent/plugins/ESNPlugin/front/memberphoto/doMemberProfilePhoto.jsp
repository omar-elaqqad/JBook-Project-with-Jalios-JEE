<%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/doInitMemberProfile.jspf' %><%
String photoHtmlAttributes = " role=\"button\" tabindex=\"0\" aria-label=\"" + encodeForHTMLAttribute(glp("jcmsplugin.esn.profile.see-photo")) + "\" title=\""+ encodeForHTMLAttribute(glp("jcmsplugin.esn.profile.see-photo")) + "\"";
%>
<jalios:memberphoto showStatus="false" link="false" htmlAttributes="<%= photoHtmlAttributes %>" member="<%= member %>" size="<%= PhotoSize.LARGE %>" css="br media-object member-profile-photo" />
<% if (Util.notEmpty(member.getPhoto())) { %>
  <jalios:thumbnail path="<%= member.getPhoto() %>" width="1600" height="1600" css="photo-lightbox-img hide" />
<% } %>
<%
if (esnProfileDisplayHandler.canUpdatePhoto()) {
  String changeProfilePhotoLabel = isMyProfile 
    ? glp("jcmsplugin.esn.profile.action.change-photo.me")
    : glp("jcmsplugin.esn.profile.action.change-photo");
  String changePhotoUrl = MessageFormat.format(
      "front/memberPhoto/editPhoto.jsp?modalRedirect={0}&amp;mbrId={1}",
      encodeForURL(loggedMember.getDisplayUrl(userLocale)),
      member.getId());
  %><div class="change-photo">
    <a data-jalios-action="modal" class="change-photo-label" href="<%= changePhotoUrl %>" aria-label="<%= encodeForHTMLAttribute(changeProfilePhotoLabel) %>" title='<%= encodeForHTMLAttribute(changeProfilePhotoLabel) %>'>
      <span class="change-photo-label"><jalios:icon src='jcmsplugin-esn-profile-change-photo' alt="<%= changeProfilePhotoLabel %>" /></span>
    </a>
  </div>
<% } %>