<%--
  @Summary: Guest Account Contact transformation Modal
  @since: csp-4.1
  @author Sylvain Devaux <sylvain.devaux@jalios.com>
--%><%@page import="com.jalios.jcmsplugin.collaborativespace.guest.handler.*"%><%
%><%@page import="com.jalios.jcmsplugin.collaborativespace.guest.*"%><%
%><%@page import="org.jdom.Element"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%

//---------------------------------------------------------------
//
//  Guest Account Contact Transformation modal
//
//---------------------------------------------------------------
GuestAccountManager guestManager = GuestAccountManager.getInstance();

//---------------------------------------------------------------
// Parse xml to retrieve the formAuthor
//---------------------------------------------------------------
TypeEntry requestTypeEntry = channel.getTypeEntry(GuestConv.class);
String formAuthorId = Util.getString(XmlUtil.searchValue(requestTypeEntry.getXmlElement(), "type", "formAuthor"), channel.getDefaultAdmin().getId());
String[] formTitles = JcmsUtil.getLanguageArray(channel.getTypeEntry(GuestConv.class).getLabelMap());
Workspace hostWorkspace = guestManager.getRequestHostingWorkspace();

//---------------------------------------------------------------
//  Detect Workflow Set up
//---------------------------------------------------------------
boolean canConvert = guestManager.canConvertContact(loggedMember);
boolean canRequest = guestManager.canRequestContactConversion(loggedMember, null);

//---------------------------------------------------------------
//  Detect Workflow Set up
//---------------------------------------------------------------
String I18NPrefix = GuestAccountsConstants.PROPERTY_PREFIX;
String titleProp = I18NPrefix;
String opFinishLabelProp = I18NPrefix;
if (canConvert) {
  titleProp += ".request-modal.use-with-no-worflow.title";
  opFinishLabelProp += ".transformation-request-modal.use-with-no-worflow.validate";
} else {
  titleProp += ".request-modal.use-with-worflow.title";
  opFinishLabelProp += ".transformation-request-modal.use-with-worflow.validate";
}

jcmsContext.addCSSHeader("plugins/CollaborativeSpacePlugin/css/cs-workspace-group-list.css");
%>

<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.collaborativespace.guest.handler.GuestConvHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%=request%>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%=response%>'/>
  <jsp:setProperty name='formHandler' property='*' />
  <jsp:setProperty name='formHandler' property='author' value='<%=formAuthorId%>'/>
  <jsp:setProperty name='formHandler' property='noRedirect' value='true'/>
  <jsp:setProperty name='formHandler' property='title' value='<%=formTitles%>'/>
  <jsp:setProperty name='formHandler' property='workspace' value='<%=hostWorkspace%>'/>
</jsp:useBean>

<%
// ----------------------------------------------------------------------
// Set optional workspace source to the handler
// ---------------------------------------------------------------------- 
Workspace srcWs = getWorkspaceParameter(AbstractGuestHandler.SRC_WORKSPACE_ID_PARAM);
if (srcWs != null) {
  formHandler.setWsSrcId(srcWs.getId());
}

if (formHandler.validate()) {
  request.setAttribute("modal.redirect", formHandler.getRedirect());
  %><%@ include file="/jcore/modal/modalRedirect.jspf" %><%
  return;
}

Member contact = formHandler.getAvailableContact();
boolean finish = Util.toBoolean(loggedMember.getExtraInfo(GuestAccountsConstants.NEW_TRANSFORM_REQUEST_FLAG), false);

String contactReminder = glp(GuestAccountsConstants.PROPERTY_PREFIX + ".transformation-request-modal.contact-reminder", contact.getDisplayLink(userLocale));
String chooseWorkspaceGroupsIntro = glp(GuestAccountsConstants.PROPERTY_PREFIX + ".transformation-request-modal.groups-intro");
request.setAttribute("title", titleProp);

request.setAttribute("formHandler", formHandler);
%>
<jalios:modal title="<%= titleProp %>" 
              url="plugins/CollaborativeSpacePlugin/jsp/guestAccount/contactTransform/transformContactModal.jsp" 
              formHandler="<%= formHandler %>" 
              css="modal-lg guest-account-creation"
              picture="">

  <div class="alert alert-info">
    <%= contactReminder %>
  </div>
        
  <%
  // ----------------------------------------------------------------------
  // Custom buttons
  // ----------------------------------------------------------------------
  %>
  <jalios:buffer name='MODAL_BUTTONS'>
    <% if (finish) { %>
      <button type="submit" class="btn btn-primary" name="opClose" data-dismiss="modal" value="true"><%= glp("ui.com.btn.close") %></button>
    <% } else { %>
      <button type="submit" class="btn btn-default" name="opClose" data-dismiss="modal" value="true"><%= glp("ui.com.btn.cancel") %></button>
      <button type="submit" class="btn btn-primary ajax-refresh" name="opFinish" value="true"><%= glp(opFinishLabelProp) %></button>
    <% } %>
  </jalios:buffer>
  
  <%-- STEP 2 - request submission success --%>
  <% if (finish) { %>
    <% loggedMember.removeExtraInfo(GuestAccountsConstants.NEW_TRANSFORM_REQUEST_FLAG); %>
    <%= glp("jcmsplugin.collaborativespace.guestaccounts.transformation-request-controller.create.finish") %>
  <% } else { %>
    <%
    // ----------------------------------------------------------------------
    // Form Introduction
    // ----------------------------------------------------------------------
    %>
    <%= chooseWorkspaceGroupsIntro %>

    <%
    // ----------------------------------------------------------------------
    // Workspace and Groups list
    // ----------------------------------------------------------------------
    %>
    <%@ include file='/plugins/CollaborativeSpacePlugin/jsp/guestAccount/doWorkspaceGroupList.jspf' %>
    <%
    Set<Workspace> wsSet = formHandler.getSignupWorkspaceSet(loggedMember);
    request.setAttribute("step-input-name-attribute", GuestConvHandler.COLLAB_GROUPS_ID_PARAM);
    List<String> selectedDatasIdList = Util.getArrayList(formHandler.getCollabGroupId());
    out.print(getWorkspaces(request, wsSet, userLang, selectedDatasIdList, false, null, null, loggedMember));
    %>
    
    <%
    // ----------------------------------------------------------------------
    // Hidden inputs
    // ----------------------------------------------------------------------
    %>
    <jalios:if predicate='<%= Util.notEmpty(contact) %>'>
      <input type='hidden' name='<%= GuestConvHandler.SRC_CONTACT_ID_PARAM %>' value='<%= contact.getId() %>' />
    </jalios:if>
  <% } %>

</jalios:modal>