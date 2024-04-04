<%@ include file="/jcore/doInitPage.jspf" %><%

Member member = getMemberParameter("ttId");
if (member == null){
  return;
}
// Check member read right
if (!canRead(loggedMember, member)) {
  return;
}

jcmsContext.addWebAssets("jalios-truncate");

String organizationAndDepartement = member.getOrganizationAndDepartment();
String organization = member.getOrganization();
String department = member.getDepartment();
String jobTitle =  member.getJobTitle();

request.setAttribute("JCMS_TTCARD_MEMBER", member);

DataAttribute linkHtmlAttributes = new DataAttribute();
linkHtmlAttributes.addData("jalios-truncate", 2);

String memberTypeLabelProp = "";
boolean showMemberType = false;
if (member.isDisabled()) {
  memberTypeLabelProp = "ui.com.lbl.disabled";
} else if (member.isContact()) {
  memberTypeLabelProp = "ui.com.lbl.contact";
} else if (member.isGuest()) {
  memberTypeLabelProp = "ui.com.lbl.guest";
}

%>
<jalios:buffer name="contactChannelsBuffer"><%
  %><jalios:include resource="tt-card.Member-contact-channels" /><%
%></jalios:buffer><%
String contactChannelsDOM = contactChannelsBuffer.toString();
boolean showContactChannels = member != loggedMember && Util.notEmpty(contactChannelsDOM);
%>

<div class="tt-card tt-member tt-member2" data-jalios-dataid="<%= member.getId() %>" data-jalios-ttcard-class="tt-member2-card">
  <div class="popover-body tt-card-body">
    <div class="tt-card-row">
      <div class="avatar-container" title="<%= encodeForHTMLAttribute(glp("ui.com.lbl.display-profile-of", member.getFullName())) %>">
        <jalios:memberphoto member="<%= member %>" width="96" height="96" />
        <% if (Util.notEmpty(memberTypeLabelProp)) { %><span class="tt-member-type"><%= encodeForHTML(glp(memberTypeLabelProp)) %></span><% } %>
      </div>
      <div class="details-container">
        <div class="content">
          <jalios:link data="<%= member %>" 
              css="noTooltipCard tt-member-title" 
              htmlAttributes="<%= linkHtmlAttributes.toString() %>" />
          <% if (Util.notEmpty(jobTitle)) { %>
            <div class='tt-member-info jobTitle' title="<%= encodeForHTMLAttribute(glp("ui.adm.mbr-edit.lbl.job")) %>">
              <%= jobTitle %>
            </div>
          <% } %>
          <% if (Util.notEmpty(department)) { %>
            <div class='tt-member-info department' title="<%= encodeForHTMLAttribute(glp("ui.adm.mbr-edit.lbl.department")) %>">
              <%= department %>
            </div>
          <% } %>
          <% if (Util.notEmpty(organization)) { %>
            <div class='tt-member-info organization' title="<%= encodeForHTMLAttribute(glp("ui.adm.mbr-edit.lbl.organization")) %>">
              <%= organization %>
            </div>
          <% } %>

          <jalios:include target="MEMBER_TOOLTIP2_CONTENT" targetContext="bloc" />

        </div>
      </div>
    </div>
  </div>
  <% if (showContactChannels) { %>
  <div class='popover-footer tt-btn focus'><%
    %><%= contactChannelsDOM %><%
  %></div>
  <% } %>
</div>

<%
request.removeAttribute("JCMS_TTCARD_MEMBER");
%>