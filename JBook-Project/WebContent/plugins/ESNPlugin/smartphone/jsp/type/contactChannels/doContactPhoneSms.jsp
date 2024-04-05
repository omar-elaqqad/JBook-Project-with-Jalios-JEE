<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/contactChannels/doInitContactChannel.jspf' %><%

String contactChannelMobile = contactChannelMember.getMobile();
if (Util.isEmpty(contactChannelMobile)) {
  return;
}

PhoneNumber mobileNumber = PhoneNumberUtil.parseNumber(contactChannelMobile, contactChannelMember.getCountry());
if (mobileNumber == null) {
  return;
}
contactChannelMobile = mobileNumber.toInternationalString();
%>
<a href='sms:<%= encodeForHTMLAttribute(contactChannelMobile) %>' 
    class="profile-contact-channel profile-contact-sms"
    title='<%= encodeForHTMLAttribute(glp("jcmsplugin.esn.contact-by-sms.title")) %>'>
  <img src="<%= contactChannelImage %>" alt="<%= encodeForHTMLAttribute(contactChannelLabel) %>" />
  <span class="profile-contact-channel-label">
    <%= contactChannelLabel %>
  </span>
</a>