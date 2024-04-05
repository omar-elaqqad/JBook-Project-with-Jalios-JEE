<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ page import="com.jalios.jcmsplugin.collaborativespace.*" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

if (!isLogged) {
  sendForbidden(request, response);
  return;
}
String[] formTitles = JcmsUtil.getLanguageArray(channel.getTypeEntry(CSRequest.class).getLabelMap());
%><%--
--%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.collaborativespace.CreateSpaceHandler'><%--
--%>  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%--
--%>  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%--
--%>  <jsp:setProperty name='formHandler' property='*' /><%--
--%>  <jsp:setProperty name='formHandler' property='title' value='<%= formTitles %>'/><%--
--%></jsp:useBean><%--
--%><%
if (formHandler.validate()) {
  if (formHandler.getNewCollaborativeSpace() != null) {
    // redirect to freshly created CS
    request.setAttribute("modal.redirect", formHandler.getNewCollaborativeSpace().getDisplayUrl(userLocale));
  }
  %><%@ include file="/jcore/modal/modalRedirect.jspf" %><%
  // Form submission is not available
  return;
}

CSManager csMgr = CSManager.getInstance();

int step = formHandler.getFormStep();
int stepCount = formHandler.getFormStepCount();
boolean finish = step == stepCount;

jcmsContext.addCSSHeader("plugins/CollaborativeSpacePlugin/css/cs-create-space.css");
jcmsContext.addJavaScript("plugins/CollaborativeSpacePlugin/js/accessSignup.js");
jcmsContext.addJavaScript("plugins/CollaborativeSpacePlugin/js/createSpace.js");

boolean isParentMode = formHandler.isParentMode();
boolean canCreateCS = formHandler.canCreateCS();

String titlePropPrefix = "jcmsplugin.collaborativespace.create" + (isParentMode ? "-sub" : "");
String titleProp = titlePropPrefix + (canCreateCS ? ".title" : ".title-request");

boolean checkCollaborativeSpaceLimit = channel.getLimitController().checkCollaborativeSpaceLimit(true) == ControllerStatus.OK;
if (!checkCollaborativeSpaceLimit) {
  jcmsContext.setWarningMsg(glp("jcmsplugin.collaborativespace.create.too-many-cs", channel.getLimitController().getCollaborativeSpaceLimit()));
  step = -1;
}
%>

<jalios:modal title="<%= titleProp %>" 
              url="plugins/CollaborativeSpacePlugin/jsp/createSpace.jsp" 
              formHandler="<%= formHandler %>" 
              css="modal-lg create-space">
  
  <%-- STEP 1 - Model --%>
  <%@ include file='/plugins/CollaborativeSpacePlugin/jsp/createSpace_model.jspf' %>
  
  <%-- STEP 2 - Information --%>
  <%@ include file='/plugins/CollaborativeSpacePlugin/jsp/createSpace_info.jspf' %>
  
  <%-- STEP 3 - Attendees --%>
  <%@ include file='/plugins/CollaborativeSpacePlugin/jsp/createSpace_attendees.jspf' %>

  <%-- STEP 4 - FINISH --%>
  <% if (finish) { %>
    <%= glp("jcmsplugin.collaborativespace.create.finish") %>
    <jalios:buffer name='MODAL_BUTTONS'>
      <button type="submit" class="btn btn-primary" name="opClose" data-dismiss="modal" value="true"><%= glp("ui.com.btn.close") %></button>
    </jalios:buffer>
  <% } %>

</jalios:modal>
