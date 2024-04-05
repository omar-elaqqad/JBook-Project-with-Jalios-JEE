<%@page import="com.jalios.jcmsplugin.esn.tooltip.MemberTooltipDisplayHandler"%><%
%><%@page import="com.jalios.jcmsplugin.esn.profile.ProfileDisplayHandler"%><%
%><%@page import="com.jalios.jcmsplugin.esn.profile.ui.IUIContactChannel"%><%
%><%@ page contentType="text/html; charset=UTF-8"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

Member member = (Member) request.getAttribute("JCMS_TTCARD_MEMBER");
if (member == null) {
  return;
}
%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.esn.tooltip.MemberTooltipDisplayHandler'><%
  %><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
%></jsp:useBean><%

formHandler.setMember(member);

List<IUIContactChannel> contactChannels = formHandler.getContactChannels();

StringBuilder domBuilder = new StringBuilder();

if (Util.notEmpty(contactChannels)) {
  for (IUIContactChannel ui : contactChannels) {
    String jsp = ui.getJsp();
    boolean isLegalFile = Util.notEmpty(jsp) && JcmsUtil.isLegalFile(jsp);
    if (!isLegalFile) {
      continue;
    }
    if (ui.getMember() == null) {
      continue;
    }
    request.setAttribute(ProfileDisplayHandler.CONTACT_CHANNEL_REQUEST_ATTR, ui);
    request.setAttribute(ProfileDisplayHandler.CONTACT_CHANNEL_REQUEST_ATTR + "-mid", ui.getMember().getId());
    request.setAttribute(ProfileDisplayHandler.CONTACT_CHANNEL_REQUEST_ATTR + "-label", ui.getLabel(userLang));
    request.setAttribute(ProfileDisplayHandler.CONTACT_CHANNEL_REQUEST_ATTR + "-image", ui.getImage());
    %><jalios:buffer name="itDomBuilder"><%
      %><jalios:include jsp='<%= jsp %>' /><%
    %></jalios:buffer><%
    String dom = itDomBuilder.toString().trim();
    domBuilder.append(dom);
  }
  request.removeAttribute(ProfileDisplayHandler.CONTACT_CHANNEL_REQUEST_ATTR);
  request.removeAttribute(ProfileDisplayHandler.CONTACT_CHANNEL_REQUEST_ATTR + "-mid");
  request.removeAttribute(ProfileDisplayHandler.CONTACT_CHANNEL_REQUEST_ATTR + "-label");
  request.removeAttribute(ProfileDisplayHandler.CONTACT_CHANNEL_REQUEST_ATTR + "-image");
}
if (Util.notEmpty(domBuilder.toString())) {
  %><div class="profile-contact-channels"><%
    %><%= domBuilder.toString() %><%
  %></div><%
}
%>