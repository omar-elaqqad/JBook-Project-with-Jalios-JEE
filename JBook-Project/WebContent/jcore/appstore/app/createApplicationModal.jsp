<%@page import="com.jalios.jcms.application.ApplicationManager"%><%
%><%@page import="com.jalios.jcms.application.EditShortcutStepHandler"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.application.EditShortcutStepHandler'><%
  %><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name="formHandler" property="noRedirect" value="true" /><%
  %><jsp:setProperty name='formHandler' property='*' /><%
%></jsp:useBean><%

if (formHandler.validate()) {
  if (Util.isEmpty(getUntrustedStringParameter("redirect", null))) {
    request.setAttribute("modal.redirect", "jcore/appstore/app/appStoreApp.jsp?displayedApplication=" + formHandler.getPublication().getId());
  }
  %><%@ include file="/jcore/modal/modalRedirect.jspf" %><%
}

boolean isLinkTypeUrl = Util.notEmpty(formHandler.getAvailableLink());
boolean isLinkTypePub = !isLinkTypeUrl && formHandler.getAvailablePub() != null;
jcmsContext.addJavaScript("js/jalios/core/components/launcher/jalios-create-application-modal.js");
%>

<jalios:modal css="modal-lg create-application-modal" formHandler="<%= formHandler %>" title="appstore.lbl.create-application-modal.title" url="jcore/appstore/app/createApplicationModal.jsp">

  <% if (formHandler.getFormStep() == EditShortcutStepHandler.STEP_CONTENT) { %>
    <% TypeEntry titleTE = channel.getTypeEntry(formHandler.getPublicationClass()); %>
    <jalios:field name="title" css="focus" formHandler="<%= formHandler %>">
      <jalios:control /> 
    </jalios:field>
    <%-- Icon ------------------------------------------------------------ --%>
    <jalios:field name="icon" formHandler="<%= formHandler %>" description="appstore.lbl.create-application-modal.icon-description">
      <jalios:control />
    </jalios:field>
    <%-- Text ------------------------------------------------------------ --%>
    <jalios:field name="text" formHandler="<%= formHandler %>">
      <jalios:control settings='<%= new WysiwygSettings().rows(2).configurationId("light") %>' />
    </jalios:field>
    
    <jalios:field label='application.lbl.create-application-modal.type-link'>
      <select name="linkType" class="form-control js-choose-link-type">
        <option value="custom" <%= isLinkTypeUrl ? "selected=\"selected\"" : "" %>><%= glp("application.lbl.create-application-modal.type-link.custom") %></option>
        <option value="pub" <%= isLinkTypePub ? "selected=\"selected\"" : "" %>><%= glp("application.lbl.create-application-modal.type-link.pub") %></option>
      </select>
    </jalios:field>
    
    <div class="no-focus">
      <%-- Link ------------------------------------------------------------ --%>
      <jalios:field name="link" required="true" css='<%= !isLinkTypeUrl ? "hide" :"" %>' formHandler="<%= formHandler %>">
        <jalios:control />
      </jalios:field>
      <%-- Pub ------------------------------------------------------------ --%>
      <jalios:field name="pub" required="true" css='<%= !isLinkTypePub ? "hide" :"" %>' formHandler="<%= formHandler %>">
        <jalios:control />
      </jalios:field>
    </div>
  
  <% } else if (formHandler.getFormStep() == EditShortcutStepHandler.STEP_RIGHTS) { %>
    <%-- AuthorizedGroupSet ------------------------------------------------------------ --%> 
    <jalios:field label="ui.com.lbl.grp-read-rights" name="authorizedGroupIds" value="<%= formHandler.getAvailableAuthorizedGroupSet() %>" mv="1" css="nodnd">
      <jalios:control type="<%= ControlType.GROUP %>" />
    </jalios:field>
  
    <%-- AuthorizedMemberSet ------------------------------------------------------------ --%> 
    <jalios:field label="ui.com.lbl.mbr-read-rights" name="authorizedMemberIds" value="<%= formHandler.getAvailableAuthorizedMemberSet() %>" mv="1" css="nodnd">
      <jalios:control settings="<%= new MemberSettings().filter(MemberSettings.MemberFilter.ACCOUNT) %>" />
    </jalios:field>
  <% } else if (formHandler.getFormStep() == EditShortcutStepHandler.STEP_ADVANCED) { %>
    <%-- OpenMode ------------------------------------------------------------ --%>
    <jalios:field name="keywords" formHandler="<%= formHandler %>">
      <jalios:control />
    </jalios:field>  
  
    <%-- OpenMode ------------------------------------------------------------ --%>
    <jalios:field name="openMode" formHandler="<%= formHandler %>">
      <jalios:control />
    </jalios:field>
    <% if (ApplicationManager.getInstance().getTypeRoot() != null) { %>
      <%-- Type ------------------------------------------------------------ --%>
      <jalios:field name="type" formHandler="<%= formHandler %>">
        <jalios:control />
      </jalios:field>
    <% } %>
    
    <jalios:include jsp="/jcore/doEditExtraData.jsp" />
    
    <% if (formHandler.getAvailablePub() != null) { %>
      <%-- Only display if a pub have been chosen --%>
      <%-- Parameters ------------------------------------------------------------ --%>
      <jalios:field name="parameters" formHandler="<%= formHandler %>">
        <jalios:control />
      </jalios:field>
    <% } %>
    <%@ include file="/jcore/doWorkspaceField.jspf" %>
    
  <% } %>
  
  <% if (formHandler.getPublication() != null) { %>
    <jalios:buffer name="MODAL_BUTTON">
      <button type="submit" name="opDelete" data-jalios-action="ajax-refresh" value="true" class="btn btn-danger confirm"><%= glp("ui.com.btn.delete") %></button>
    </jalios:buffer>
  <% } %>
  <% if (Util.notEmpty(formHandler.getPublication())) { %>
  <input type="hidden" name="id" value="<%= formHandler.getPublication().getId() %>" /> 
  <% } %>
  <input type="hidden" name="showInToolsPage" value="true" /> 
  <input type="hidden" name="redirect" value="" /> 
</jalios:modal>