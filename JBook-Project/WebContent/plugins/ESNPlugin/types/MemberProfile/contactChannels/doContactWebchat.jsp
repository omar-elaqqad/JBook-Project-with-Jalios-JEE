<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/contactChannels/doInitContactChannel.jspf' %><%

String contactChannelEmail = contactChannelMember.getEmail();
if (Util.isEmpty(contactChannelEmail)) {
  return;
}

Plugin plugin = PluginManager.getInstance().getPlugin("WebChatPlugin");
if (!plugin.isActive()) {
  return;
}
%>
<a href="#" class="profile-contact-channel profile-contact-channel-webchat converse-chat-window webchat-window-search-link" 
  data-jalios-member-login="<%= encodeForHTMLAttribute(contactChannelEmail) %>">
  <img src="<%= contactChannelImage %>" alt="<%= encodeForHTMLAttribute(contactChannelLabel) %>" />
  <span class="profile-contact-channel-label">
    <%= contactChannelLabel %>
  </span>
</a>
