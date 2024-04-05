<%@page import="com.jalios.jcms.taglib.card.CardsDisplayMode"%>
<%@page import="com.jalios.jcmsplugin.collaborativespace.CSManager"%><%
%><%@page import="com.jalios.jcmsplugin.collaborativespace.CSConstants"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%--
  @Summary: CSSignupRequest display page
  @Category: Template
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

CSSignupRequest signup = (CSSignupRequest)request.getAttribute(PortalManager.PORTAL_PUBLICATION);
jcmsContext.addCSSHeader("plugins/CollaborativeSpacePlugin/css/collaborativeSpace.css");
jcmsContext.addCSSHeader("plugins/CollaborativeSpacePlugin/css/cs-signup.css");

Workflow pubWF = signup.getWorkflow();
boolean displayCustomWFAction = channel.isDataWriteEnabled() && isLogged && loggedMember.canWorkOn(signup);
displayCustomWFAction = displayCustomWFAction && signup.isInVisibleState();  // If pstatus is !inVisibleState, native JCMS workflow change is displayed in the HEADER 
displayCustomWFAction = displayCustomWFAction && pubWF != null && pubWF.getId().equals(CSConstants.CSSIGNUP_WF_NAME);  // WF actions are hard coded to this specific Workflow.
displayCustomWFAction = displayCustomWFAction && pubWF.getInitState().getPstatus() == signup.getPstatus();  // Only display if in "submitted" state
displayCustomWFAction = displayCustomWFAction && pubWF != null && pubWF.canWorkInState(signup, loggedMember, signup.getWFState()); // loggedMember must have rights to work in current state
Member submitMember = signup.getSubmitMember();
String objName = signup.getName(userLang);
String validationUrlPattern = "work/validateStateChange.jsp?id={0}&amp;ws={1}&amp;redirect={2}&amp;pstatus={3}";
%>

<%@ include file='/front/doFullDisplay.jspf' %>

<div class="fullDisplay CSSignupRequest">

  <h1 class="title br">
    <%= glp("jcmsplugin.collaborativespace.signup.lbl.signup") %>
  </h1>

  <%@ include file='/jcore/doMessageBox.jspf' %>

  <% if (submitMember != null) { %>
    <jalios:cards mode="<%= CardsDisplayMode.INLINE %>">
      <jalios:cardData data="<%= submitMember %>" template="small" link="<%= submitMember.getDisplayUrl(userLocale) %>" />
    </jalios:cards>
  <% } else if (Util.notEmpty(objName)) { %>
    <%= objName %>
  <% } %>

  <%-- CDate --%>
  <p class="br">
    <%= glp("jcmsplugin.collaborativespace.request-date", JcmsUtil.getFriendlyDate(signup.getCdate(), DateFormat.SHORT, true, userLocale, true)) %>
  </p>

  <% if (displayCustomWFAction) { %>
    <%
    CollaborativeSpace cs = CSManager.getInstance().getCollaborativeSpace(workspace);
    if (cs != null) {
      String redirect = cs.getDisplayUrl(userLocale);
      String acceptUrl = MessageFormat.format(validationUrlPattern, signup.getId(), signup.getWorkspaceId(), ServletUtil.encodeURL(redirect), CSManager.SIGNUP_ACCEPTED);
      String rejectUrl = MessageFormat.format(validationUrlPattern, signup.getId(), signup.getWorkspaceId(), ServletUtil.encodeURL(redirect), CSManager.SIGNUP_REJECTED);
      %>
      <a href="<%= acceptUrl %>" class="btn btn-primary modal"><%= glp("jcmsplugin.collaborativespace.signup.btn.accept") %></a>
      <a href="<%= rejectUrl %>" class="btn btn-danger modal"><%= glp("jcmsplugin.collaborativespace.signup.btn.reject") %></a>
    <% } %>
  <% } %>
</div>
