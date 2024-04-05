<%--
  @Summary: GuestRequest customized full display
  @Category: Content
  @Author: Sylvain Devaux <sylvain.devaux@jalios.com>
  @Customizable: True
  @Requestable: True
  @Since: csp-6.0
--%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

GuestRequest obj = (GuestRequest)request.getAttribute(PortalManager.PORTAL_PUBLICATION);

String contactId = (String) request.getAttribute("guest-contact-id");
Member contact = null;
if (Util.notEmpty(contactId) && channel.getMember(contactId) != null) {
  // Either read from existing Contact
  contact = channel.getMember(contactId);
} else {
  // Or use a Mock member
  contact = new Member();
  contact.setName((String) request.getAttribute("guest-static-name"));
  contact.setFirstName((String) request.getAttribute("guest-static-firstname"));
  contact.setEmail((String) request.getAttribute("guest-static-email"));
  contact.setOrganization((String) request.getAttribute("guest-static-organization"));
}

if (contact == null) {
  logger.warn("No member information retrieved from the " + obj.getClass().getSimpleName() + " (" + obj.getId() + ")");
  return;
}
jcmsContext.addCSSHeader("plugins/CollaborativeSpacePlugin/css/cs-guest.css");

%><%@ include file='/front/doFullDisplay.jspf' %>

<div class="fullDisplay GuestRequest <%= obj.getClass().getSimpleName() %>">
  <h1 class='title'><%= glp("types." + obj.getClass().getSimpleName() + ".label") %></h1>

  <% if (contact != null) { %>
    <div class='guest-request-member'>
      <jalios:cards>
        <jalios:cardData data='<%= contact %>' template="small" />
      </jalios:cards>
    </div>
  <% } %>

  <%-- SUBMIT MEMBER --%>
  <div class='guest-request-submit-member br'>
    <div class='field-label'>
      <%= glp("types.GuestRequest.fields.submit-mbr.label") %>
    </div>
    <div class='field-data'>
      <% if (obj.getSubmitMember() != null) { %>
        <jalios:link data='<%= obj.getSubmitMember() %>'/>
        &middot;
      <% } %>
      <%= JcmsUtil.getFriendlyDate(obj.getCdate(), DateFormat.SHORT, true, userLocale) %>
    </div>
  </div>

  <%-- TARGET GROUPS --%>
  <% if (Util.notEmpty(obj.getGroups())) { %>
    <div class='guest-request-groups br'>
      <div class='field-label'>
        <%= glp("types.GuestRequest.fields.groups.label") %>
      </div>
      <ol>
        <jalios:foreach name="itData" type="com.jalios.jcms.Group" collection="<%= obj.getGroups() %>">
          <% if (itData != null) { %>
            <li><jalios:link data='<%= itData %>'/></li>
          <% } %>
        </jalios:foreach>
      </ol>
    </div>
  <% } %>

  <%-- Validation links only when "Submitted" state --%>
  <% if (channel.isDataWriteEnabled() && obj.getPstatus() == -200 && isLogged && loggedMember.canWorkOn(obj)) { %>
    <form name="customWfForm" action="edit.jsp" method="post">
      <button type="submit" class="btn btn-primary" name="pstatus" value="60"><%= glp("jcmsplugin.collaborativespace.guestaccounts.process-request.btn.accept") %></button>   
      <button type="submit" class="btn btn-default" name="pstatus" value="50"><%= glp("jcmsplugin.collaborativespace.guestaccounts.process-request.btn.reject") %></button>   
      <input type='hidden' name='id' value='<%= obj.getId() %>' />
      <input type='hidden' name='opUpdate' value='true' />
      <input type='hidden' name='redirect' value='<%= ServletUtil.getUrl(request) %>' />
    </form>
  <% } %>
</div>