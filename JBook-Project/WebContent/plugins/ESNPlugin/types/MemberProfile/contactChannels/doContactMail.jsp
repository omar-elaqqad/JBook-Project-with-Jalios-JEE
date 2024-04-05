<%@page import="com.jalios.jcmsplugin.esn.ui.HTMLAttributes"%><%
%><%@page import="com.jalios.jcmsplugin.esn.ui.Link"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/contactChannels/doInitContactChannel.jspf' %><%

String contactChannelEmail = contactChannelMember.getEmail();
if (Util.isEmpty(contactChannelEmail)) {
  return;
}
// Hide email if not visible, but for admin
if (!isAdmin && !contactChannelMember.isEmailVisible()) {
  return;
}
contactChannelLabel = glp("ui.com.lbl.email");
String contactChannelTitle = glp("jcmsplugin.esn.contact-by-email.title2", contactChannelMember.getFullName(), contactChannelEmail);
%><jalios:buffer name="mailContactBtnContent"><%
  %><img src="<%= contactChannelImage %>" alt="" /><%
  %><span class="profile-contact-channel-label"><%
    %><%= contactChannelLabel %><%
  %></span><%
%></jalios:buffer><%
out.print(new Link()
  .ariaLabel(glp("jcmsplugin.esn.contact-by-email.for-aria-label", contactChannelMember.getFullName()))
  .css("btn btn-contact-email profile-contact-channel profile-contact-email")
  .htmlAttributes(new HTMLAttributes().addAttribute("itemprop", "email"))
  .htmlContent(mailContactBtnContent.toString())
  .href("mailto:" +contactChannelEmail) // Link.java will encode attr!
  .title(contactChannelTitle)
  .html());
%>