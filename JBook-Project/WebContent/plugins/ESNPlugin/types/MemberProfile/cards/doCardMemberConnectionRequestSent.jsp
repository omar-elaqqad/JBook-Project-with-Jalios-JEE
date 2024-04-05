<%@page import="com.jalios.jcmsplugin.esn.MemberConnectionHandler"%><%
%><%@ page contentType="text/html; charset=UTF-8"%><%
%><%@ include file="/front/card/data/doInitCardData.jspf" %><%
Member member = (Member) data;
if (member == null) {
  logger.warn("no member retrieved");
  return;
}
boolean memberCanBeRead = member.canBeReadBy(loggedMember);
boolean dataWriteEnabled = channel.isDataWriteEnabled();

jcmsContext.addCSSHeader("css/jalios/core/components/card/jalios-card-member-small.css");
String linkAttributes = "";
if (link != null) {
  linkAttributes = " data-jalios-url=\"" + link + "\""; 
  linkAttributes += linkOptions != null ? " data-jalios-options='" + HttpUtil.encodeForHTMLAttribute(linkOptions.toJSON()) + "'" : "";
}

String jobTitle = member.getJobTitle();
String organization = member.getOrganization();

boolean showTitleOrganizationBlock = memberCanBeRead && (Util.notEmpty(jobTitle) || Util.notEmpty(organization));
request.setAttribute("card.member", member);

css += " card-member card-member-small card-member-esn card-member-connection-request card-connection-request-sent";
String cardAttributes = dataAttribute != null ? (" " + dataAttribute.toString()) : "";
%>
<div class="<%= css %>" <%= linkAttributes %> data-jalios-dataid="<%= member.getId() %>"<%= cardAttributes %>>
  <jalios:cardFront>
  <div class="card-block">
    <jalios:memberphoto link="false" showStatus="false" member="<%= member %>" size="<%= PhotoSize.TINY %>"/>
    <div class="card-block-item card-block-item-title">
      <div class="card-title member-name">
        <%= memberCanBeRead ? member.getFullName() : glp("ui.com.lbl.restricted-mbr") %>
      </div>
    </div>
    <% if (showTitleOrganizationBlock) { %>
    <div class="card-block-item">
      <% if (Util.notEmpty(jobTitle)) { %>
        <div class="member-job-title"><%= member.getJobTitle() %></div>
      <% } %>
      <% if (Util.notEmpty(organization)) { %>
        <div class="member-organization"><%= member.getOrganization() %></div>
      <% } %>
    </div>
    <% } %>
  </div>
  </jalios:cardFront>
</div>
<% request.removeAttribute("card.member"); %>