<%@ page contentType="text/html; charset=UTF-8" %><%
%><%-- This file has been automatically generated. --%><%
%><%--
  @Summary: CSRequest display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><% CSRequest obj = (CSRequest)request.getAttribute(PortalManager.PORTAL_PUBLICATION); %><%
%><%@ include file='/front/doFullDisplay.jspf' %>
<div class="fullDisplay CSRequest <%= obj.canBeEditedFieldByField(loggedMember) ? "unitFieldEdition" : "" %>" itemscope="itemscope">
<%@ include file='/front/publication/doPublicationHeader.jspf' %>
<table class="fields">
  <tr class="field name textfieldEditor  <%= Util.isEmpty(obj.getName(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(CSRequest.class, "name", userLang) %><jalios:edit pub='<%= obj %>' fields='name'/></td>
    <td class='field-data' <%= gfla(obj, "name") %>>
            <% if (Util.notEmpty(obj.getName(userLang))) { %>
            <%= obj.getName(userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field description textareaEditor  <%= Util.isEmpty(obj.getDescription(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(CSRequest.class, "description", userLang) %><jalios:edit pub='<%= obj %>' fields='description'/></td>
    <td class='field-data' <%= gfla(obj, "description") %>>
            <% if (Util.notEmpty(obj.getDescription(userLang))) { %>
            <jalios:wiki><%= obj.getDescription(userLang) %></jalios:wiki>
            <% } %>
    </td>
  </tr>
  <tr class="field accessPolicy enumerateEditor  <%= Util.isEmpty(obj.getAccessPolicy()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(CSRequest.class, "accessPolicy", userLang) %><jalios:edit pub='<%= obj %>' fields='accessPolicy'/></td>
    <td class='field-data' <%= gfla(obj, "accessPolicy") %>>
            <% if (Util.notEmpty(obj.getAccessPolicy())) { %>
            <%= obj.getAccessPolicyLabel(obj.getAccessPolicy(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field signupPolicy enumerateEditor  <%= Util.isEmpty(obj.getSignupPolicy()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(CSRequest.class, "signupPolicy", userLang) %><jalios:edit pub='<%= obj %>' fields='signupPolicy'/></td>
    <td class='field-data' <%= gfla(obj, "signupPolicy") %>>
            <% if (Util.notEmpty(obj.getSignupPolicy())) { %>
            <%= obj.getSignupPolicyLabel(obj.getSignupPolicy(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field model textfieldEditor abstract <%= Util.isEmpty(obj.getModel()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(CSRequest.class, "model", userLang) %><jalios:edit pub='<%= obj %>' fields='model'/></td>
    <td class='field-data' <%= gfla(obj, "model") %>>
            <% if (Util.notEmpty(obj.getModel())) { %>
            <%= obj.getModel() %>
            <% } %>
    </td>
  </tr>
  <tr class="field language textfieldEditor  <%= Util.isEmpty(obj.getLanguage()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(CSRequest.class, "language", userLang) %><jalios:edit pub='<%= obj %>' fields='language'/></td>
    <td class='field-data' <%= gfla(obj, "language") %>>
            <% if (Util.notEmpty(obj.getLanguage())) { %>
            <%= obj.getLanguage() %>
            <% } %>
    </td>
  </tr>
  <tr class="field admins memberEditor  <%= Util.isEmpty(obj.getAdmins()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(CSRequest.class, "admins", userLang) %><jalios:edit pub='<%= obj %>' fields='admins'/></td>
    <td class='field-data' >
            <% if (Util.notEmpty(obj.getAdmins())) { %>
            <ol>
              <jalios:foreach name="itData" type="com.jalios.jcms.Member" array="<%= obj.getAdmins() %>">
              <% if (itData != null ) { %>
              <li><jalios:link data='<%= itData %>'/></li>
              <% } %>
              </jalios:foreach>
            </ol>
            <% } %>
    </td>
  </tr>
  <tr class="field groups groupEditor  <%= Util.isEmpty(obj.getGroups()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(CSRequest.class, "groups", userLang) %><jalios:edit pub='<%= obj %>' fields='groups'/></td>
    <td class='field-data' >
            <% if (Util.notEmpty(obj.getGroups())) { %>
            <ol>
              <jalios:foreach name="itData" type="com.jalios.jcms.Group" array="<%= obj.getGroups() %>">
              <% if (itData != null ) { %>
              <li><jalios:link data='<%= itData %>'/></li>
              <% } %>
              </jalios:foreach>
            </ol>
            <% } %>
    </td>
  </tr>
  <tr class="field members memberEditor  <%= Util.isEmpty(obj.getMembers()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(CSRequest.class, "members", userLang) %><jalios:edit pub='<%= obj %>' fields='members'/></td>
    <td class='field-data' >
            <% if (Util.notEmpty(obj.getMembers())) { %>
            <ol>
              <jalios:foreach name="itData" type="com.jalios.jcms.Member" array="<%= obj.getMembers() %>">
              <% if (itData != null ) { %>
              <li><jalios:link data='<%= itData %>'/></li>
              <% } %>
              </jalios:foreach>
            </ol>
            <% } %>
    </td>
  </tr>
  <tr class="field notificationPolicy enumerateEditor  <%= Util.isEmpty(obj.getNotificationPolicy()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(CSRequest.class, "notificationPolicy", userLang) %><jalios:edit pub='<%= obj %>' fields='notificationPolicy'/></td>
    <td class='field-data' <%= gfla(obj, "notificationPolicy") %>>
            <% if (Util.notEmpty(obj.getNotificationPolicy())) { %>
            <%= obj.getNotificationPolicyLabel(obj.getNotificationPolicy(), userLang) %>
            <% } %>
    </td>
  </tr>
  <tr class="field parent textfieldEditor  <%= Util.isEmpty(obj.getParent()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(CSRequest.class, "parent", userLang) %><jalios:edit pub='<%= obj %>' fields='parent'/></td>
    <td class='field-data' <%= gfla(obj, "parent") %>>
            <% if (Util.notEmpty(obj.getParent())) { %>
            <%= obj.getParent() %>
            <% } %>
    </td>
  </tr>
  <tr class="field syncMode enumerateEditor  <%= Util.isEmpty(obj.getSyncMode()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(CSRequest.class, "syncMode", userLang) %><jalios:edit pub='<%= obj %>' fields='syncMode'/></td>
    <td class='field-data' <%= gfla(obj, "syncMode") %>>
        <% if (Util.notEmpty(obj.getSyncMode())) { %>
            <ol>
            <jalios:foreach name="itString" type="String" array="<%= obj.getSyncMode() %>">
            <% if (Util.notEmpty(itString)) { %>
              <li>
            <%= obj.getSyncModeLabel(itString, userLang) %>
              </li>
            <% } %>
            </jalios:foreach>
            </ol>
        <% } %>
    </td>
  </tr>
 
  <tr class="field submit-member member <%=  obj.getSubmitMember() != null ? "" : "empty" %>">
    <td class='field-label'>
      <% /* %>Submit member<% */ %><%= glp("ui.work.forms.lbl.submit-mbr") %>
    </td>
    <td class='field-data'>
      <% if (obj.getSubmitMember() != null) { %>
      <a href="<%= ResourceHelper.getQuery() %>?mids=<%=  obj.getSubmitMember().getId() %>"><% /* %>John Smith<% */ %><%= obj.getSubmitMember() %></a>
      <% } %>
    </td>
  </tr>
  <tr class="field submit-remote-addr <%=  obj.getSubmitRemoteAddr() != null ? "" : "empty" %>">
    <td class='field-label'>
      <% /* %>IP address<% */ %><%= glp("ui.work.forms.lbl.submit-ip") %>
    </td>
    <td class='field-data'>
      <% /* %>10.10.10.10<% */ %><%= obj.getSubmitRemoteAddr() %>
    </td>
  </tr>
</table>
<jsp:include page="/front/doFullDisplayCommonFields.jsp" />
</div><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- 0emSjCSXQWB2x70Ppj+1Aw== --%>