<%@page import="com.jalios.jcms.i18n.PhoneNumber" %><%
%><%@page import="org.apache.commons.io.FileUtils"%><%
%><%@page import="java.util.Base64"%><%
%><%@page import="java.util.Base64.Encoder"%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%

Member member = getMemberParameter("mid");
response.setHeader("Content-Type","text/x-vcard; charset=ISO-8859-1");
response.setHeader("Content-Disposition","attachment; filename=\"" + member.getFullName().replace(" ", "_") + ".vcf\"");
request.setCharacterEncoding("ISO-8859-1");
PhoneNumber phoneNumber = member.getPhoneNumber();
PhoneNumber mobilePhoneNumber = member.getMobilePhoneNumber();

String photoBase64 = null;
String photoType = null;
if (member.hasPhoto()) {
  String photoPathname = member.getPhoto();
  File photoFile = new File(channel.getRealPath(photoPathname));
  byte[] photoContents = FileUtils.readFileToByteArray(photoFile);
  if (Util.notEmpty(photoContents)) {
    photoBase64 = Base64.getEncoder().encodeToString(photoContents).trim();
    String photoExtension = photoPathname.substring(photoPathname.lastIndexOf('.') + 1).toLowerCase();
    if ("jpg".equals(photoExtension) || "jpeg".equals(photoExtension)) {
      photoType = "JPEG";
    } else if ("gif".equals(photoExtension)) {
      photoType = "GIF";
    } else if ("png".equals(photoExtension)) {
      photoType = "PNG";
    }
  }
}


%><%-- 
--%>BEGIN:VCARD
VERSION:3.0
N:<%= member.getName() %>;<%= Util.getString(member.getFirstName(), "") %>
FN:<%= member.getFullName() %>
TEL;WORK;VOICE:<%= (phoneNumber != null) ? phoneNumber.toInternationalString() : Util.getString(member.getPhone(), "") %>
TEL;CELL:<%= (mobilePhoneNumber != null) ? mobilePhoneNumber.toInternationalString() : Util.getString(member.getMobile(), "") %>
TITLE:<%= Util.getString(member.getJobTitle(), "") %>
ORG:<%= Util.getString(member.getOrganization(), "") %>
<% if (isAdmin || member.isEmailVisible()) { %>EMAIL;INTERNET:<%= Util.getString(member.getEmail(), "") %><% } %>
ADR;TYPE=WORK:;;<%= Util.getString(member.getAddress(), "").replaceAll("\\s", " ") %>
<% if (photoBase64 != null && photoType != null) { %>PHOTO;ENCODING=BASE64;TYPE=<%= photoType %>:<%= photoBase64 %><% } %>
END:VCARD