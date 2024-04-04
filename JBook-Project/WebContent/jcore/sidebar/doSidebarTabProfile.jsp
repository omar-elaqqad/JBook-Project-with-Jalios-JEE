<%@ include file='/jcore/doInitPage.jspf' %><% 

if (!isLogged) {
  return;
}

Member member = loggedMember;

String email = member.getEmail();
String jobTitle = Util.getString(member.getJobTitle(), "");
String department = Util.getString(member.getDepartment(), "");
String organization = Util.getString(member.getOrganization(), "");
%>

<div class="sidebar-tab-content-profile">
  <h2 class="sidebar-tab-title"><%= member.getFullName() %></h2>

  <%-- Job title - Organization - Department --%>
  <jalios:buffer name="profileCompanyBuffer"><%
  if (Util.notEmpty(jobTitle)) {
    %><span class="profil-fonction"><%= jobTitle %></span><%
  }
  if (Util.notEmpty(department) || Util.notEmpty(organization)) {
    if (Util.notEmpty(jobTitle)) { %> - <% }
    %><span class="profil-company"><%
      if (Util.notEmpty(organization)) {
        %><span class="profil-organization"><%= organization %></span><%
      }
      if (Util.notEmpty(department) && Util.notEmpty(organization)) { %> - <% }
      if (Util.notEmpty(department)) {
        %><span class="profil-department"><%= department %></span><%
      }
      %></span><%
  } %></jalios:buffer><%
  if (Util.notEmpty(profileCompanyBuffer.toString())) {
    %><p class="profile-function-company"><%
      %><%= profileCompanyBuffer.toString() %><%
    %></p><%
  } %>

  <%-- Coordonnees --%>
  <jalios:buffer name="profileCoordonneesBuffer">
    <%-- Coordonness -> Mail / phone / mobile --%>
    <%
    boolean showMail = Util.notEmpty(email) && (member.isEmailVisible() || isAdmin);
    boolean showPhone = Util.notEmpty(member.getPhone());
    boolean showMobile = Util.notEmpty(member.getMobile());
    %>
    <% if (showMail) { %>
    <div title="<%= encodeForHTMLAttribute(glp("ui.com.lbl.email")) %>" class="member-mail sidebar-profile-item">
      <jalios:icon src='mail' />
      <a href='mailto:<%= encodeForHTMLAttribute(email) %>'
          title='<%= encodeForHTMLAttribute(glp("ui.com.lbl.contact-email")) %>'>
        <%= email %>
      </a>
    </div>
    <% } %>
    
    <% if (showMobile || showPhone) { %>
      <div class='sidebar-profile-item'>
      <%-- Mobile --%>
      <% if (showMobile) { %>
      <div title="<%= encodeForHTMLAttribute(glp("ui.adm.mbr-edit.lbl.mobile")) %>" class='member-mobile sidebar-profile-item<%= showPhone ? " has-phone" : "" %>'>
        <jalios:icon src='phone' />
        <jalios:phone number="<%= member.getMobile() %>" region="<%= member.getCountry() %>" />
      </div>
      <% } %>
  
      <%-- Phone --%>
      <% if (showPhone) { %>
      <div title="<%= encodeForHTMLAttribute(glp("ui.adm.mbr-edit.lbl.phone")) %>" class='member-telephone sidebar-profile-item<%= showMobile ? " has-mobile" : "" %>'>
        <jalios:icon src='telephone' />
        <jalios:phone number="<%= member.getPhone() %>" region="<%= member.getCountry() %>" />
      </div>
      <% } %>
      </div>
    <% } %>

    <%-- Coordonness -> address / structured address --%>
    <% if (member != null && member.hasAnyAddress()) { %>
    <div class="profile-address sidebar-profile-item">
      <% if (member != null && member.hasAnyAddress()) { %>
        <jalios:icon src="address" />
        <% if (member.hasStructuredAddress()) { %>
          <% if (Util.notEmpty(member.getStreet())) { %>
            <span class="address-item address-street"><%= member.getStreet() %></span>
          <% } %>
    
          <% if (Util.notEmpty(member.getPoBox())) { %>
            <span class="address-item address-post-office-box"><%= member.getPoBox() %></span>
          <% } %>
          <% if (Util.notEmpty(member.getPostalCode())) { %>
            <span class="address-item address-postal-code"><%= member.getPostalCode() %></span>
          <% } %>
          <% if (Util.notEmpty(member.getLocality())) { %>
            <span class="address-item address-locality"><%= member.getLocality() %></span>
          <% } %>   
          <% if (Util.notEmpty(member.getRegion())) { %>
            <span class="address-item address-region"><%= member.getRegion() %></span>
          <% } %>        
          <% if (Util.notEmpty(member.getCountry())) { %>
            <span class="address-item address-country"><%= glp("country." + member.getCountry()) %></span>
          <% } %>                
        <% } else { %>
          <%= member.getAddress() %>
        <% } %>
      <% } %>
    </div>
    <% } %>
  </jalios:buffer>
  <% if (Util.notEmpty(profileCoordonneesBuffer.toString())) { %>
  <div class="profile-coordonnees">
    <%= profileCoordonneesBuffer.toString() %>
  </div>
  <% } %>

  <div class="profile-actions">
    <% if (channel.isDataWriteEnabled()) { %>
      <%
      String editUrl = ResourceHelper.getMemberProfileEditor() + "?mid=" + member.getId();
      String profileDisplayPortal = getDataIdParameter("portal");
      if (Util.notEmpty(profileDisplayPortal)) {
        editUrl += "&amp;portal=" + profileDisplayPortal;
      }
      %>
      <a class="edit-profile-link btn btn-primary profile-action" href='<%= editUrl %>'>
        <%= glp("jcms.sidebar-tab.profile.edit") %>      
      </a>
    <% } %>
    <jalios:link data='<%= member %>' css='see-profile-link btn btn-default profile-action noTooltipCard'>
      <%= glp("jcms.sidebar-tab.profile.display") %>      
    </jalios:link>
  </div>
</div>
