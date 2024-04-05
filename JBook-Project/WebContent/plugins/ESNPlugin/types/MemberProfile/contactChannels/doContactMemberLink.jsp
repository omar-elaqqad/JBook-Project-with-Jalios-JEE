<%@page import="com.jalios.jcmsplugin.esn.ui.Link"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/contactChannels/doInitContactChannel.jspf' %><%

String contactChannelTitle = glp("jcmsplugin.esn.contact-by-other.title", contactChannelLabel);
%><jalios:buffer name="otherContactBtnContent"><%
%><img src='<%= contactChannelImage %>' alt="" /><%
  %><span class="profile-contact-channel-label"><%
    %><%= contactChannelLabel %><%
  %></span><%
%></jalios:buffer><%
out.print(new Link()
  .ariaLabel(glp("jcmsplugin.esn.contact-by-other.for-aria-label",
      contactChannelMember.getFullName(),
      contactChannelLabel))
  .css("btn btn-contact-other profile-contact-channel profile-contact-channel-member-link")
  .htmlContent(otherContactBtnContent.toString())
  .addRelNoReferrer()
  .addTargetBlank()
  .href(ui.getUrl())
  .title(contactChannelTitle)
  .html());
%>
