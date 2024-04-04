<%@ include file='/jcore/doInitPage.jspf' %><% 
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%
%><%@ page import="com.jalios.jcms.taglib.ThumbnailTag" %><% 
PortletImage box = (PortletImage) portlet;  
String target = Util.notEmpty(box.getTargetWindow()) ? "target='" + box.getTargetWindow() + "'": "";

int imgWidth = box.getIntFieldValue(jcmsContext, "imgWidth");
int imgHeight = box.getIntFieldValue(jcmsContext, "imgHeight");

String image = (String) box.getFieldValue(jcmsContext, "image");
String link = (String) box.getFieldValue(jcmsContext, "link");

if (Util.isEmpty(image)) {
  return;
}
String htmlAlt = Util.getString(box.getFieldValue(jcmsContext, "alt"),"");
String htmlAttributes = "title=\""+htmlAlt+"\"";
String inlineStyle = "";
int    maxWidth  = (imgWidth  > ThumbnailTag.MIN_THUMB_SIZE && imgWidth < ThumbnailTag.MAX_THUMB_SIZE) ? imgWidth : (ThumbnailTag.MAX_THUMB_SIZE-1);
int    maxHeight = (imgHeight > ThumbnailTag.MIN_THUMB_SIZE && imgHeight < ThumbnailTag.MAX_THUMB_SIZE) ? imgHeight : (ThumbnailTag.MAX_THUMB_SIZE-1);
if ( maxWidth  != ThumbnailTag.MAX_THUMB_SIZE-1 ) {
  inlineStyle += "width:"+maxWidth + "px;";
}
if ( maxHeight != ThumbnailTag.MAX_THUMB_SIZE-1 ) {
  inlineStyle += "height:" + maxHeight + "px;";
}

%>
<% if (Util.notEmpty(link)) { %><a href='<%= link %>' <%= target %>><% } %><%
  if (maxWidth != ThumbnailTag.MAX_THUMB_SIZE-1 || maxHeight != ThumbnailTag.MAX_THUMB_SIZE-1) { %>
    <jalios:thumbnail css="portlet-image-thumbnail" path='<%= image %>' width="<%= maxWidth %>"  height="<%= maxHeight %>"  alt="<%= htmlAlt %>" htmlAttributes="<%= htmlAttributes %>"  />
  <% } else {%>
    <img class="portlet-image-img" src="<%= image %>" alt="<%= htmlAlt %>" <%= htmlAttributes %> style="<%= inlineStyle %>" />
  <% } %>
<% if(Util.notEmpty(link)) { %></a><% } %>
