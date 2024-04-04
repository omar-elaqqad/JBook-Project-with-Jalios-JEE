<%@page import="com.jalios.jcms.uicomponent.contactchannel.MemberContactChannel"%><%
%><%@page import="com.jalios.jcms.uicomponent.contactchannel.MemberContactChannelsManager"%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%!
/**
 * Replace default PhoneTag DOM by custom one for tTCard.
 */
public String rewritePhoneTag(String dom, String css, String body) {
  String newDom = dom;
  newDom = newDom.replaceAll("class=\"(invalid-)?tel\"", "class=\"tel profile-contact-channel profile-contact-telephone "+css+"\"");
  newDom = newDom.replaceAll("</a>", body + "</a>");
  return newDom;
}
%><%

  Member member = (Member) request.getAttribute("JCMS_TTCARD_MEMBER");
  if (member == null){
    return;
  }
  
  String email = member.getEmail();
  String phone = member.getPhone();
  String mobile = member.getMobile();
  
  boolean showEmail = Util.notEmpty(email) && isLogged && (member.isEmailVisible() || isAdmin);
  
  boolean hasPhone = Util.notEmpty(phone);
  boolean hasValidPhone = hasPhone;
  boolean hasMobile = Util.notEmpty(mobile);
  boolean hasValidMobile = hasMobile;
  PhoneNumber phoneNumber = hasPhone ? PhoneNumberUtil.parseNumber(phone, member.getCountry()) : null;
  if (hasPhone && phoneNumber == null) {
    hasValidPhone = false;
  }
  PhoneNumber mobileNumber = hasMobile ? PhoneNumberUtil.parseNumber(mobile, member.getCountry()) : null;
  if (hasMobile && mobileNumber == null) {
    hasValidMobile = false;
  }

  String phoneLabel = glp("ui.adm.mbr-edit.lbl.phone");
  String mobileLabel = glp("ui.adm.mbr-edit.lbl.mobile");

  boolean hasOnlyMobile = !hasPhone && hasMobile;
  boolean hasOnlyPhone = hasPhone && !hasMobile;
  boolean hasPhoneAndMobile = hasPhone && hasMobile;
  boolean isSingleLink = hasOnlyMobile || hasOnlyPhone;

  String contactPhoneLabel = phoneLabel;
  if (hasOnlyMobile) {
    contactPhoneLabel = mobileLabel;
  }
%>

<jalios:buffer name="phoneBuffer"><%
if (hasPhone) {
  if (hasValidPhone) {
    %><a href="<%= phoneNumber.toRFC3966String() %>" <%
      %> aria-label='<%= encodeForHTMLAttribute(phoneLabel) %>' <%
      %> title='<%= encodeForHTMLAttribute(glp("ui.phone.title.call-number", phoneNumber.toInternationalString())) %>' <%
      %> class="tel"><%
  } else {
    %><a href="#" <%
        %> aria-label='<%= encodeForHTMLAttribute(phoneLabel) %>' <%
        %> title='<%= encodeForHTMLAttribute(phoneLabel) + " - " + encodeForHTMLAttribute(phone) %>' <%
        %> class="invalid-tel" onclick="return false;"><%
  }
  %><jalios:icon src="telephone" /><%
  if (hasMobile) {
    if (hasValidPhone) {
      %><%= phoneNumber.toInternationalString() %><%
    } else {
      %><%= phone %><%
    }
  }
  %></a><%
}
%></jalios:buffer>

<jalios:buffer name="mobileBuffer"><%
if (hasMobile) {
  if (hasValidMobile) {
    %><a href="<%= mobileNumber.toRFC3966String() %>" <%
      %> aria-label='<%= encodeForHTMLAttribute(mobileLabel) %>' <%
      %> title='<%= encodeForHTMLAttribute(glp("ui.phone.title.call-number", mobileNumber.toInternationalString())) %>' <%
      %> class="tel"><%
  } else {
    %><a href="#" <%
      %> aria-label='<%= encodeForHTMLAttribute(mobileLabel) %>' <%
      %> title='<%= encodeForHTMLAttribute(mobileLabel) + " - " + encodeForHTMLAttribute(mobile) %>' <%
      %> class="invalid-tel" onclick="return false;"><%
  }
  %><jalios:icon src="phone" /><%
  if (hasPhone) {
    if (hasValidMobile) {
      %><%= mobileNumber.toInternationalString() %><%
    } else {
      %><%= mobile %><%
    }
  }
  %></a><%
}
%></jalios:buffer>

<jalios:buffer name="phoneWrapperBuffer">
  <% if (isSingleLink) { %>
    <%-- Only display image when in "Only one link" case --%>
    <%-- When there are 2 links, image will be in parent, on UL dropdown LIs won't have repeated images --%>
    <jalios:icon src="mbr-contact-phone" />
  <% } %>
  <%
  if (hasPhoneAndMobile) {
    phoneLabel = contactPhoneLabel;
  } else if (hasOnlyMobile) {
    phoneLabel = mobileLabel;
  }
  %>
  <% if (Util.notEmpty(phoneLabel)) { %>
    <span class="profile-contact-channel-label"><%= phoneLabel %></span>
  <% } %>
</jalios:buffer>
<%
String phoneDom = null;
if (hasOnlyPhone) {
  phoneDom = rewritePhoneTag(phoneBuffer.toString(), "profile-contact-phone", phoneWrapperBuffer.toString());
} else {
  phoneDom = phoneWrapperBuffer.toString();
}

String mobileDom = null;
if (hasMobile && hasOnlyMobile) {
  mobileDom = rewritePhoneTag(mobileBuffer.toString(), "profile-contact-mobile", phoneWrapperBuffer.toString());
} else {
  mobileDom = phoneWrapperBuffer.toString();
}
%>

<%-- DOM for phone/mobile numbers --%>
<jalios:buffer name="contactPhonesBuffer">
  <% if (hasOnlyMobile || hasOnlyPhone) { %>
    <% if (hasOnlyMobile) { %>
      <%= mobileDom %>
    <% } else { %>
      <%= phoneDom %>
    <% } %>
  <% } else if (hasPhoneAndMobile) { %>
    <div class="dropdown profile-contact-channel-wrapper profile-contact-channel-telephone-wrapper">
      <a href="#" class="profile-contact-channel profile-contact-channel-telephone-toggle profile-contact-channel-skypedropdown-toggle" <%
        %> title="<%= encodeForHTMLAttribute(glp("ui.com.lbl.contact-phone")) %>" <%
        %> aria-label="<%= encodeForHTMLAttribute(phoneLabel) %>" <%
        %> data-toggle="dropdown">
        <jalios:icon src="mbr-contact-phone" />
        <span class="profile-contact-channel-label">
          <%= contactPhoneLabel %>&nbsp;<jalios:icon src="caret" />
        </span>
      </a>
      <ul class="dropdown-menu profile-contact-channel-telephone-dropdown skype-profil-dropdown" role="menu">
        <li><%= phoneBuffer.toString() %></li>
        <li><%= mobileBuffer.toString() %></li>
      </ul>
    </div>
  <% } %>
</jalios:buffer>

<%-- Rendering --%>
<%
String contactPhonesDOM = contactPhonesBuffer.toString();
if (showEmail || Util.notEmpty(contactPhonesDOM)) {
%><div class="profile-contact-channels"><%

  if (showEmail) {
    String contactChannelLabel = glp("ui.com.lbl.email");
    String contactChannelTitle = glp("ui.com.lbl.contact-email2", email);
  %><a href='mailto:<%= encodeForHTMLAttribute(email) %>' <%
    %> itemprop="email" class="profile-contact-channel profile-contact-email" <%
    %> aria-label='<%= encodeForHTMLAttribute(contactChannelLabel) %>'<%
    %> title='<%= encodeForHTMLAttribute(contactChannelTitle) %>'><%
    %><jalios:icon src="mbr-contact-mail" /><%
    %><span class="profile-contact-channel-label"><%
      %><%= contactChannelLabel %><%
    %></span><%
  %></a><%
  }
  
  if (Util.notEmpty(contactPhonesDOM)) {
    %><%= contactPhonesDOM %><%
  }
  
  // JCMS-8481 - Other contact channels declared by properties
  Collection<MemberContactChannel> contactChannels = MemberContactChannelsManager.getInstance().getContactChannels();

  for (MemberContactChannel itContactChannel : contactChannels) {
    // Set the infos as a request attributes
    request.setAttribute("esn-profile-ui-contact-channel-mid", member.getId());
    String labelProperty = MemberContactChannelsManager.PROP_PREFIX + itContactChannel.getId();
    request.setAttribute("esn-profile-ui-contact-channel-label", glp(labelProperty));
    request.setAttribute("esn-profile-ui-contact-channel-image", itContactChannel.getImage());
    
    // In comparison in ESN > doContactChannels.jsp:
    // request.setAttribute(ProfileDisplayHandler.CONTACT_CHANNEL_REQUEST_ATTR, ui);
    // request.setAttribute(ProfileDisplayHandler.CONTACT_CHANNEL_REQUEST_ATTR + "-mid", ui.getMember().getId());
    // request.setAttribute(ProfileDisplayHandler.CONTACT_CHANNEL_REQUEST_ATTR + "-label", ui.getLabel(userLang));
    // request.setAttribute(ProfileDisplayHandler.CONTACT_CHANNEL_REQUEST_ATTR + "-image", ui.getImage());
    String contactChannelJsp = itContactChannel.getJsp();
    if (JcmsUtil.isLegalFile(contactChannelJsp)) {
      %><jalios:include jsp='<%= contactChannelJsp %>' /><%
    }
  }
%></div><%
}
%><jalios:include target="MEMBER_TOOLTIP2_FOOTER" targetContext="inline" />