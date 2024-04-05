<%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneManager"%><%
%><%@page import="com.jalios.util.Util"%><%
%><%@page import="com.jalios.jcms.Member"%><%
%><%@page import="com.jalios.jcms.JcmsConstants"%><%
%><%@page import="com.jalios.jcms.PhotoSize"%><%
%><%@page import="com.jalios.jcms.taglib.MemberPhotoTag"%><%
%><%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%
Member photoMember = (Member) getIncludeObject("member", null);

if (photoMember == null) {
  return;
}

boolean memberCanBeRead = photoMember.canBeReadBy(loggedMember);

boolean showStatus = Util.toBoolean(getIncludeObject("showStatus",null), true);
Size size = (Size) getIncludeObject("size", null);
String css = getIncludeString("css", "");
String htmlAttributes = getIncludeString("htmlAttributes", "");
Data linkData = (Data) getIncludeObject("linkData", null);
boolean link = Util.toBoolean(getIncludeObject("link",""),true);
String memberPhotoAlt = getIncludeString("alt", "");

//Size
PhotoSize photoSize = (PhotoSize) getIncludeObject("photoSize", null);
String sizeProperty = getIncludeString("sizeProperty", null);
int width = Util.toInt(getIncludeString("width",null),-1);
int height = Util.toInt(getIncludeString("height",null),-1);

int thumbnailWidth = size != null ? size.getWidth() : width;
int thumbnailHeight = size != null ? size.getHeight() : height;

boolean hasStatus = false;
int mbrStatus = -1;

String classes = "wrapper-photo photo " + photoSize.toString().toLowerCase() + "-photo";
// Add additional css classes
classes += Util.notEmpty(css) ? " " + css.trim() : "";
if (photoMember.isContact()) {
  classes += " contact";
} else if(photoMember.isPersisted()) {
  classes += " account";
  // Status
  hasStatus = true;
  mbrStatus = photoMember.getStatus();
  classes += " mbr-status mbr-status-" + mbrStatus;
} else {
  classes += " not-persisted";
}

if (link) {
  classes += " clickable";
}
String silouhettePath = "images/jalios/layout/silhouette.jpg";
String memberPhotoRelativePath = silouhettePath;
if (memberCanBeRead && Util.notEmpty(photoMember.getPhoto()) && (new File(channel.getRealPath(photoMember.getPhoto()))).exists()) {
  memberPhotoRelativePath = photoMember.getPhoto();
}
boolean hasPhoto = !silouhettePath.equals(Util.getString(memberPhotoRelativePath, ""));
boolean showInitialsPhoto = !hasPhoto;

String initials = "";
// Only if initials feature is enabled
if (showInitialsPhoto) {
  initials = photoMember.getInitials();
  // Only if we have initials
  showInitialsPhoto = Util.notEmpty(initials);
  if (showInitialsPhoto) {
    classes += " initials-photo";
  }
}

String title = "";
if(!photoMember.isPersisted()) {
  title = " title=\"" + encodeForHTMLAttribute(photoMember.getName() + " (" + photoMember.getEmail() + ")") + "\"";
}
request.setAttribute("member-photo.member", photoMember);
request.setAttribute("member-photo.photo-size", photoSize);
%>
<jalios:buffer name="photoThumbnail"><%
  String imgHtmlAttributes = "";
  if (showInitialsPhoto) {
    // Case: CSS Initials photo
    String bgColor = photoMember.getInitialsColor();
    StringBuilder initialsAttrBuilder = new StringBuilder();
    initialsAttrBuilder.append(" style='");
    if (Util.notEmpty(bgColor)) {
      initialsAttrBuilder.append("background-color:").append(encodeForHTMLAttribute(bgColor)).append(";");
    }
    if (photoSize == null) {
      initialsAttrBuilder.append("width:").append(width).append("px;");
      initialsAttrBuilder.append("height:").append(height).append("px;");
      initialsAttrBuilder.append("font-size:").append(Math.round(width/2)).append("px;");
    }
    initialsAttrBuilder.append("'");
    String initialsAttr = initialsAttrBuilder.toString();
    %><span class="initials photo"<%= initialsAttr %>><%
      %><%= initials %><%
    %></span><%
  } else {
    // Case: real image photo (member's one or default silhouette)
    %><jalios:thumbnail path='<%= memberPhotoRelativePath %>'
          width='<%= thumbnailWidth %>'
          height='<%= thumbnailHeight %>'
          alt='<%= memberPhotoAlt %>'
          htmlAttributes="<%= imgHtmlAttributes %>"
          css='photo profile-picture' /><%
  }
%></jalios:buffer>
<div class="<%= classes %>" <%= link ? "data-jalios-link=\"" + SmartPhoneManager.getInstance().getDataUrl(photoMember) + "\"" : "" %>>
  <%= photoThumbnail %>
  <%
  if (!PhotoSize.ICON.equals(photoSize)) {
  %><div class="photo-anchor"><%
    // Target
    %><jalios:include target="SMARTPHONE_MBR_PHOTO_ANCHOR" targetContext="inline" /><%
    
    // Status: account only + PhotoSize > TINY
    if (!PhotoSize.TINY.equals(photoSize) && hasStatus && showStatus) {
      %><jalios:icon src='<%= "mbr-status-" + mbrStatus %>' css="photo-icon-bottom-right mbr-status" title='<%= encodeForHTMLAttribute(glp("ui.com.alt.mbr.status." + mbrStatus)) %>' /><%
    }
  %></div><% 
  }
  %>                  
</div>