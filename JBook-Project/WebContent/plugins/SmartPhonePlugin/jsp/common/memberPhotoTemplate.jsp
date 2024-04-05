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

boolean showStatus = Util.toBoolean(getIncludeObject("showStatus",null), true);
Size size = (Size) getIncludeObject("size", null);
String css = getIncludeString("css", "");
String htmlAttributes = getIncludeString("htmlAttributes", "");
Data linkData = (Data) getIncludeObject("linkData", null);
boolean link = Util.toBoolean(getIncludeObject("link",""),true);

boolean hasStatus = false;
int mbrStatus = -1;

PhotoSize photoSize = (PhotoSize) getIncludeObject("photoSize", null);
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

String title = "";
if(!photoMember.isPersisted()) {
  title = " title=\"" + encodeForHTMLAttribute(photoMember.getName() + " (" + photoMember.getEmail() + ")") + "\"";
}
request.setAttribute("member-photo.member", photoMember);
request.setAttribute("member-photo.photo-size", photoSize);
%>  
<div class="<%= classes %>" <%= link ? "data-jalios-link=\"" + SmartPhoneManager.getInstance().getDataUrl(photoMember) + "\"" : "" %>>
  <jalios:thumbnail css="photo" path='<%= Util.getString(photoMember.getPhoto(), "images/jalios/layout/silhouette.jpg") %>'
                      width='<%= photoSize.getWidth() %>'
                      height='<%= photoSize.getHeight() %>'
                      alt='<%= photoMember.getFullName() %>' />
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