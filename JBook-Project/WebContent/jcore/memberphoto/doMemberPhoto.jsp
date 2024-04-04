<%@page import="com.jalios.jcms.member.MemberStatusManager"%><%
%><%@page import="com.jalios.util.Util"%><%
%><%@page import="com.jalios.jcms.Member"%><%
%><%@page import="com.jalios.jcms.JcmsConstants"%><%
%><%@page import="com.jalios.jcms.Size"%><%
%><%@page import="com.jalios.jcms.PhotoSize"%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%

Member photoMember = (Member) getIncludeObject("member", null);

if (photoMember == null) {
  return;
}

boolean memberCanBeRead = photoMember.canBeReadBy(loggedMember);

// Photo wrapper attributes
String css = getIncludeString("css", "");
String htmlAttributes = getIncludeString("htmlAttributes", "");
Data linkData = (Data) getIncludeObject("linkData", null);
String memberPhotoAlt = getIncludeString("alt", "");
if (Util.isEmpty(memberPhotoAlt) && Util.toBoolean(getIncludeObject("addFullNameAsAlt", false), false)) {
  memberPhotoAlt = memberCanBeRead ? photoMember.getFullName() : glp("ui.com.lbl.restricted-mbr");
}

// Size
Size size = (Size) getIncludeObject("size", null);
PhotoSize photoSize = (PhotoSize) getIncludeObject("photoSize", null);
String sizeProperty = getIncludeString("sizeProperty", null);
int width = Util.toInt(getIncludeString("width",null),-1);
int height = Util.toInt(getIncludeString("height",null),-1);

int thumbnailWidth = size != null ? size.getWidth() : width;
int thumbnailHeight = size != null ? size.getHeight() : height;

if (thumbnailWidth < 10 || thumbnailHeight < 10 || thumbnailWidth > 2000 || thumbnailHeight > 2000) {
  // The maximum width and maximum height attributes of the thumbnail tag cannot be below 10 pixel or above 2000.
  return;
}

boolean focusable = Util.toBoolean(getIncludeObject("focusable", true), true);

String title = "";
boolean hasStatus = false;
int mbrStatus = -1;
// Css
StringBuilder classes = new StringBuilder();
classes.append("wrapper-photo ");
classes.append(Util.notEmpty(sizeProperty) ? sizeProperty + "-photo" : Util.getString(photoSize,"custom").toLowerCase() +"-photo");
if (photoMember.isContact()) {
  classes.append(" contact");
} else {
  classes.append(" account");
  // Status
  if (photoMember.isPersisted()) {
    hasStatus = MemberStatusManager.getInstance().isStatusDisplayed();
    mbrStatus = photoMember.getStatus();
    classes.append(" mbr-status mbr-status-" + mbrStatus);
  }
}
// Add additional css classes
classes.append(Util.notEmpty(css) ? " " + css.trim() : "");

boolean link = Util.toBoolean(getIncludeObject("link",""),true);
boolean wrapWithLink = link && photoMember.isPersisted();

// Fix JCMS-4040 : invalid display of member photo if image file is missing from filesystem
String silouhettePath = channel.getProperty(JcmsConstants.DEFAULT_PHOTO_PROP);
String memberPhotoRelativePath = silouhettePath;
if (memberCanBeRead && Util.notEmpty(photoMember.getPhoto()) && (new File(channel.getRealPath(photoMember.getPhoto()))).exists()) {
  memberPhotoRelativePath = photoMember.getPhoto();
}
request.setAttribute("member-photo.member", photoMember);
request.setAttribute("member-photo.photo-size", photoSize);

boolean hasPhoto = !silouhettePath.equals(Util.getString(memberPhotoRelativePath, ""));
boolean showInitialsPhoto = !hasPhoto;

String initials = photoMember.getInitials();
// Only if initials feature is enabled
if (showInitialsPhoto) {
  // Only if we have initials
  showInitialsPhoto = Util.notEmpty(initials);
  if (showInitialsPhoto) {
    classes.append(" initials-photo");
  }
}
String linkHtmlAttributes = focusable ? "" : "tabindex=\"-1\"";
if (!focusable) {
  htmlAttributes += " aria-hidden=\"true\""; 
}
%><jalios:buffer name="photoThumbnail"><%
  String imgHtmlAttributes = "";
  %><jalios:buffer name="photoThumbnailInitials"><%
  if (Util.notEmpty(initials)) {
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
    %><span class="initials photo"<%= initialsAttr %><%= !memberCanBeRead ? " title=\""+encodeForHTMLAttribute(glp("ui.com.lbl.restricted-mbr"))+"\"":"" %>><%
      if (!memberCanBeRead) {
        %>?<%
      } else {
        %><%= initials %><%
      }
    %></span><%
  } %>
  </jalios:buffer><%
  if (showInitialsPhoto) {
    %><%= photoThumbnailInitials %><%
  } else {
    // Case: real image photo (member's one or default silhouette)
    %><jalios:thumbnail path='<%= memberPhotoRelativePath %>'
          width='<%= thumbnailWidth %>'
          height='<%= thumbnailHeight %>'
          alt='<%= memberPhotoAlt %>'
          htmlAttributes="<%= imgHtmlAttributes %>"
          css='photo profile-picture' ><%
          if (Util.notEmpty(initials)) {
            classes.append(" initials-photo");
            %><%= photoThumbnailInitials %><%
          } else { %><jalios:thumbnail path='<%= silouhettePath %>'
                width='<%= thumbnailWidth %>'
                height='<%= thumbnailHeight %>'
                alt='<%= memberPhotoAlt %>'
                htmlAttributes="<%= imgHtmlAttributes %>"
                css='photo profile-picture'/><%
          }
          %></jalios:thumbnail><%
  }
%></jalios:buffer><%

%><div class="<%= classes %>"<%= Util.notEmpty(title) ? " title=\"" + title + "\"" : "" %><%= Util.notEmpty(htmlAttributes) ? " " + htmlAttributes : "" %>><%
if (wrapWithLink && memberCanBeRead) {
  %><jalios:link htmlAttributes="<%= linkHtmlAttributes %>" data='<%= linkData != null ? linkData : photoMember %>'><%
    %><%= photoThumbnail %><%
  %></jalios:link><%
} else {
  %><%= photoThumbnail %><%
}
// Display additional image (contact icon, status icon) if the photo size isn't ICON
if (!PhotoSize.ICON.equals(photoSize)) {
  %><div class="photo-anchor"><%
    // Contact icon
    if (photoMember.isContact()) {
      %><jalios:icon css="jalios-icon contact-icon photo-icon-bottom-right" src='<%= PhotoSize.TINY.equals(photoSize) ? "mbr-contact" : "contact32" %>' title='ui.com.lbl.contact' /><%
    } else if (photoMember.isDisabled()) {
      %><jalios:icon css="jalios-icon disabled-icon photo-icon-bottom-right" src='disable-account-badge' title='ui.com.lbl.disabled' /><%
    }
    // Target
    %><jalios:include target="MBR_PHOTO_ANCHOR" targetContext="inline" /><%

    // Status: (enabled) account only + PhotoSize > TINY
    if (!photoMember.isDisabled() && !PhotoSize.TINY.equals(photoSize) && hasStatus && Util.toBoolean(getIncludeObject("showStatus",null),true)) {
      %><jalios:icon src='<%= "mbr-status-" + mbrStatus %>' css="photo-icon-bottom-right mbr-status" title='<%= "ui.com.alt.mbr.status." + mbrStatus %>' /><%
    }
  %></div><%
}
%></div><%
request.removeAttribute("member-photo.photo-size");
request.removeAttribute("member-photo.member");
%>