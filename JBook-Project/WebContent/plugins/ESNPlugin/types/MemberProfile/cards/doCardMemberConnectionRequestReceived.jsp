<%@page import="com.jalios.jcmsplugin.esn.MemberConnectionRequest"%><%
%><%@ page contentType="text/html; charset=UTF-8"%><%
%><%@ include file="/front/card/data/doInitCardData.jspf" %><%
// Replace MemberConnectionRequest link to Member link
MemberConnectionRequest mcr = (MemberConnectionRequest) data;
Member member = mcr.getAuthor();
if (member == null) {
  logger.warn("no member retrieved");
  return;
}
boolean memberCanBeRead = member.canBeReadBy(loggedMember);
boolean dataWriteEnabled = channel.isDataWriteEnabled();
jcmsContext.addCSSHeader("css/jalios/core/components/card/jalios-card-member-small.css");

dataAttribute.addData("jalios-data-id", member.getId());
dataAttribute.addData("jalios-action", "clickable");
link = member.getDisplayUrl(userLocale);
dataAttribute.addData("jalios-url", link);

String jobTitle = member.getJobTitle();
String organization = member.getOrganization();
boolean showTitleOrganizationBlock = memberCanBeRead && (Util.notEmpty(jobTitle) || Util.notEmpty(organization));
request.setAttribute("card.member", member);

// Remove card
String removeLabel = glp("jcmsplugin.esn.lbl.connections.requests.edit");
boolean showRemoveCard = dataWriteEnabled;
css += " card-member card-member-small card-member-esn card-member-connection-request card-connection-request-received";
String cardAttributes = dataAttribute != null ? " " + dataAttribute.toString() : "";
%>
<div class="<%= css %>"<%= cardAttributes %>>
  <jalios:cardFront>
    <% if (showRemoveCard) { %>
      <%
      String removeUrl = MessageFormat.format("{0}?{1}={2}&amp;redirect={3}", 
          /* 0 */ "plugins/ESNPlugin/jsp/form/validateConnectionRequest.jsp", 
          /* 1 */ "id", 
          /* 2 */ mcr.getId(),
          /* 3 */ encodeForURL(member.getDisplayUrl(userLocale)));
      LinkOptions cardCloseLinkOptions = new LinkOptions().add("mode", "modal");
      %>
      <span class="card-close-action card-action-item"
        title="<%= encodeForHTMLAttribute(removeLabel) %>"
        data-jalios-action="clickable" 
        data-jalios-url="<%= removeUrl %>"
        data-jalios-options='<%= encodeForHTMLAttribute(cardCloseLinkOptions.toJSON()) %>'><jalios:icon src="jcmsplugin-esn-member-card-close" /></span>
      </span>
    <% } %>
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