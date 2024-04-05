<%@ include file="/jcore/doInitPage.jspf" %><%--
--%><%@ page import="com.jalios.jcmsplugin.esn.*" %><%--
--%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcmsplugin.esn.AddContactHandler"><%--
--%>  <jsp:setProperty name="formHandler" property="request" value="<%= request %>"/><%--
--%>  <jsp:setProperty name="formHandler" property="response" value="<%= response %>"/><%--
--%>  <jsp:setProperty name="formHandler" property="*" /><%--
--%>  <jsp:setProperty name='formHandler' property="noRedirect" value="true" /><%--
--%></jsp:useBean><%--
--%><%
request.setAttribute("formHandler", formHandler);
ESNManager esnMgr = ESNManager.getInstance();

if (!esnMgr.checkAgreement(loggedMember)) {
  request.setAttribute("modal.redirect", "plugins/ESNPlugin/jsp/agreement.jsp"); %>
<%@ include file="/jcore/modal/modalRedirect.jspf" %>
<%  
  return;
}

if (formHandler.validate()) {
  Member newContact = formHandler.getMember();
  request.setAttribute("modal.redirect", newContact.getDisplayUrl(userLocale)); %>
<%@ include file="/jcore/modal/modalRedirect.jspf" %>
<% } %>
<%
int step = formHandler.getFormStep();
int stepCount = formHandler.getFormStepCount();
boolean isDataWriteEnable = channel.isDataWriteEnabled();

if (!isDataWriteEnable){
  JcmsUtil.setDataWriteDisabledMsg(request, userLang);
}

String stepPrefixProp = "jcmsplugin.esn.add-contact.steps.";

%>
<jalios:modal css="modal-lg esn esn-addcontact" formHandler="<%= formHandler %>" title="jcmsplugin.esn.add-contact.title" picture="jcmsplugin-esn-contact" url="plugins/ESNPlugin/jsp/form/addContact.jsp">
  <%@ include file='/plugins/ESNPlugin/jsp/form/addContactStep_check.jspf' %>
  <%@ include file='/plugins/ESNPlugin/jsp/form/addContactStep_propositions.jspf' %>
  <%@ include file='/plugins/ESNPlugin/jsp/form/addContactStep_info.jspf' %>
  <%@ include file='/plugins/ESNPlugin/jsp/form/addContactStep_expertise.jspf' %>
  <% if (formHandler.showSaveButton()) { %>  
    <jalios:buffer name="MODAL_BUTTONS">
      <button type="button" class="btn btn-default" data-dismiss="modal"><%= glp("ui.com.btn.cancel") %></button>
      <% if (formHandler.showPreviousButton()) { %> 
      <button type="submit" class="btn btn-default" name='opPrevious' data-jalios-action="ajax-refresh" value="true"><%= glp("ui.com.btn.previous") %></button>
      <% } %>
      <% if (formHandler.getFormStep() == formHandler.STEP_INFO) { %>
      <button type="submit" class="btn btn-primary" name='opNext' data-jalios-action="ajax-refresh" value="true"><%= glp("ui.com.btn.next") %></button>
      <% } %>         
      <% String btnCreateCss = formHandler.getFormStep() == formHandler.STEP_INFO ? "btn btn-default ajax-refresh" : "btn btn-primary ajax-refresh"; %>
      <button type="submit" class="<%= btnCreateCss %>" name="opCreateAndContinue" value="true"><%= glp("jcmsplugin.esn.add-contact.btn.continue") %></button>
      <button type="submit" class="<%= btnCreateCss %>" name="opCreate" value="true" ><%= glp("ui.com.btn.save") %></button>
      <% String redirect = formHandler.getRedirect() == null ? getUntrustedStringParameter("redirect", "") : formHandler.getRedirect(); %>
      <input type='hidden' name='redirect' value='<%= encodeForHTMLAttribute(redirect) %>' />
      <%= formHandler.getFormStepHiddenFields() %>
      <input type='hidden' name='formStep' class='step'  value='<%= formHandler.getFormStep() %>' />
    </jalios:buffer>
  <% } %>
  <jalios:include target="PLUGIN_ESN_ADD_CONTACT_END" />
</jalios:modal>