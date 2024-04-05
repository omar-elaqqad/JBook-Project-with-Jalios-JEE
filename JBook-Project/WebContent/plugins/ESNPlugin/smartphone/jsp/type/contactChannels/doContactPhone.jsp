<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/contactChannels/doInitContactChannel.jspf' %><%
%><%!
/**
 * Replace default PhoneTag DOM by custom one for profile.
 */
public String rewritePhoneTag(String dom, String css, String body, Logger logger) {
  String newDom = dom;
  //logger.info("dom: " + dom);
  //logger.info("body: " + body);
  newDom = newDom.replaceAll("class=\"(invalid-)?tel\"", "class=\"tel profile-contact-channel profile-contact-telephone "+css+"\"");
  //logger.info("newDom1: " + newDom);
  newDom = newDom.replaceAll("</a>", body + "</a>");
  //logger.info("newDom2: " + newDom);
  return newDom;
}
%><%

// Could be improved with Java class UITelList
String contactChannelPhone = contactChannelMember.getPhone();
String contactChannelMobile = contactChannelMember.getMobile();

boolean hasPhone = Util.notEmpty(contactChannelPhone);
boolean hasValidPhone = hasPhone;
boolean hasMobile = Util.notEmpty(contactChannelMobile);
boolean hasValidMobile = hasMobile;
PhoneNumber phoneNumber = hasPhone ? PhoneNumberUtil.parseNumber(contactChannelPhone, contactChannelMember.getCountry()) : null;
if (hasPhone && phoneNumber == null) {
  hasValidPhone = false;
}
PhoneNumber mobileNumber = hasMobile ? PhoneNumberUtil.parseNumber(contactChannelMobile, contactChannelMember.getCountry()) : null;
if (hasMobile && mobileNumber == null) {
  hasValidMobile = false;
}
if (!hasPhone && !hasMobile) {
  return;
}
String phoneLabel = glp("ui.adm.mbr-edit.lbl.phone");
String mobileLabel = glp("ui.adm.mbr-edit.lbl.mobile");
boolean hasOnlyMobile = !hasPhone && hasMobile;
boolean hasOnlyPhone = hasPhone && !hasMobile;
boolean hasPhoneAndMobile = hasPhone && hasMobile;
boolean isSingleLink = hasOnlyMobile || hasOnlyPhone;
boolean hasChildrens = hasPhoneAndMobile;

if (hasOnlyMobile) {
  contactChannelLabel = mobileLabel;
} else {
  contactChannelLabel = phoneLabel;
}
%>
<jalios:buffer name="phoneBuffer"><%
if (hasPhone) {
  if (hasValidPhone) {
    %><a href="<%= phoneNumber.toRFC3966String() %>" <%
      %> aria-label='<%= encodeForHTMLAttribute(phoneLabel) %>' <%
      %> title='<%= encodeForHTMLAttribute(glp("jcmsplugin.esn.call-at-number.title", phoneNumber.toInternationalString())) %>' <%
      %> class="tel"><%
  } else {
    %><a href="#" <%
        %> aria-label='<%= encodeForHTMLAttribute(phoneLabel) %>' <%
        %> title='<%= encodeForHTMLAttribute(phoneLabel) + " - " + encodeForHTMLAttribute(contactChannelPhone) %>' <%
        %> class="invalid-tel" onclick="return false;"><%
  }
  %><jalios:icon src="telephone" /><%
  if (hasMobile) {
    if (hasValidPhone) {
      %><%= phoneNumber.toInternationalString() %><%
    } else {
      %><%= contactChannelPhone %><%
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
      %> title='<%= encodeForHTMLAttribute(glp("jcmsplugin.esn.call-at-number.title", mobileNumber.toInternationalString())) %>' <%
      %> class="tel"><%
  } else {
    %><a href="#" <%
      %> aria-label='<%= encodeForHTMLAttribute(mobileLabel) %>' <%
      %> title='<%= encodeForHTMLAttribute(mobileLabel) + " - " + encodeForHTMLAttribute(contactChannelMobile) %>' <%
      %> class="invalid-tel" onclick="return false;"><%
  }
  %><jalios:icon src="phone" /><%
  if (hasPhone) {
    if (hasValidMobile) {
      %><%= mobileNumber.toInternationalString() %><%
    } else {
      %><%= contactChannelMobile %><%
    }
  }
  %></a><%
}
%></jalios:buffer>

<jalios:buffer name="esnProfileDom">
  <% if (isSingleLink) { %>
  <%-- Only display image when in "Only one link" case --%>
  <%-- When there are 2 links, image will be in parent, on UL dropdown LIs won't have repeated images --%>
  <img src="<%= contactChannelImage %>" alt="<%= encodeForHTMLAttribute(contactChannelLabel) %>" />
  <% } %>
  <%
  if (hasPhoneAndMobile) {
    phoneLabel = contactChannelLabel;
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
  phoneDom = rewritePhoneTag(phoneBuffer.toString(), "profile-contact-phone", esnProfileDom.toString(), logger);
} else {
  phoneDom = esnProfileDom.toString();
}
String mobileDom = null;
if (hasMobile && hasOnlyMobile) {
  mobileDom = rewritePhoneTag(mobileBuffer.toString(), "profile-contact-mobile", esnProfileDom.toString(), logger);
} else {
  mobileDom = esnProfileDom.toString();
}
%>
<% if (hasOnlyMobile || hasOnlyPhone) { %>
  <% if (hasOnlyMobile) { %>
    <%= mobileDom %>
  <% } else { %>
    <%= phoneDom %>
  <% } %>
<% } else { %>
  <%
  String uniqueId = ServletUtil.generateUniqueDOMId(request, "MemberContactPhone"); 
  %>
  <div class="dropdown profile-contact-channel-wrapper">
    <div class="topbar-item open-panel">
      <a href="#<%= uniqueId %>" data-rel="popup" data-toggle="collapse" data-transition="slideup" class="profile-contact-channel profile-contact-channel-skypedropdown-toggle">
        <img src="<%= contactChannelImage %>" alt="<%= encodeForHTMLAttribute(contactChannelLabel) %>" />
        <span class="profile-contact-channel-label">
          <%= contactChannelLabel %>
          &nbsp;<jalios:icon src="caret" />
        </span>
      </a>
    </div>
    <div data-role="popup" id="<%= uniqueId %>" data-theme="a">
      <ul data-role="listview" data-inset="true" style="min-width:210px;" class="dropdown-menu skype-profil-dropdown">
        <li><%= phoneBuffer.toString() %></li>
        <li><%= mobileBuffer.toString() %></li>
      </ul>
    </div>
  </div>
<% } %>
