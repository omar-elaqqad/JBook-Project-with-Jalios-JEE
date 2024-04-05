<%@ page contentType="text/html; charset=UTF-8"%><%
%><%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/doInitMemberProfile.jspf' %><%

if (isMyProfile) {
  return;
}

List<IUIContactChannel> contactChannels = esnProfileDisplayHandler.getContactChannels();

StringBuilder domBuilder = new StringBuilder();

if (Util.notEmpty(contactChannels)) {
  for (IUIContactChannel ui : contactChannels) {
    
    // Hook to prevent a contact channel on mobile
    AbstractPropertyUI propertyUI = (AbstractPropertyUI) ui;
    boolean isActive = ((AbstractPropertyUI)ui).getBooleanPropertyValue("mobile.enabled", true);
    boolean skipItem = !isActive;
    if (skipItem) {
      continue;
    }
    // Override default desktop ".jsp" template by mobile one ".jsp.mobile" 
    String desktopTemplate = ui.getJsp();
    String mobileTemplate = ((AbstractPropertyUI)ui).getPropertyValue("jsp.mobile", desktopTemplate);
    if (Util.isEmpty(mobileTemplate)) {
      continue;
    }
    boolean isLegalFile = Util.notEmpty(mobileTemplate) && JcmsUtil.isLegalFile(mobileTemplate);
    if (!isLegalFile) {
      continue;
    }
    request.setAttribute(ProfileDisplayHandler.CONTACT_CHANNEL_REQUEST_ATTR, ui);
    request.setAttribute(ProfileDisplayHandler.CONTACT_CHANNEL_REQUEST_ATTR + "-mid", ui.getMember().getId());
    request.setAttribute(ProfileDisplayHandler.CONTACT_CHANNEL_REQUEST_ATTR + "-label", ui.getLabel(userLang));
    request.setAttribute(ProfileDisplayHandler.CONTACT_CHANNEL_REQUEST_ATTR + "-image", ui.getImage());
    %><jalios:buffer name="itDomBuilder"><%
      %><jalios:include jsp='<%= mobileTemplate %>' /><%
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