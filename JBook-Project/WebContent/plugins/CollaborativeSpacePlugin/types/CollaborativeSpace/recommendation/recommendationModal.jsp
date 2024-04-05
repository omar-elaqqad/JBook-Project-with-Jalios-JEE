<%@page import="com.jalios.jcmsplugin.collaborativespace.CSManager"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

if (!isLogged) {
  sendForbidden(request, response);
  return;
} 
%>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.collaborativespace.RecommendationHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
  <jsp:setProperty name='formHandler' property='noRedirect' value='true'/>
</jsp:useBean>
<% 
CollaborativeSpace cs = (CollaborativeSpace)getDataParameter("csId"); 
if (cs == null) {
  return;
}
if (!CSManager.getInstance().canRecommendSpace(cs, loggedMember)) {
  sendForbidden(request, response);
  return;
} 
String modalUrl = "plugins/CollaborativeSpacePlugin/types/CollaborativeSpace/recommendation/recommendationModal.jsp"; 

if (formHandler.validate()) { %>
  <%@ include file="/jcore/modal/modalRedirect.jspf" %>
<% } %>

<jalios:modal formHandler="<%= formHandler %>" title="jcmsplugin.collaborativespace.space-recommendation.title" url="<%= modalUrl %>">
  <jalios:buffer name="MODAL_CONTENT">
    <div class="modal-body">
      <%@ include file="/plugins/CollaborativeSpacePlugin/types/CollaborativeSpace/recommendation/doRecommendationForm.jspf" %>
    </div>
    <div class="modal-footer">
      <div class="buttons">
        <button type="button" class="btn btn-default" name="opCancel" data-dismiss="modal"><%= glp("ui.com.btn.cancel") %></button>
        <input type="submit" class="ajax-refresh btn btn-primary" name="opSend" value="<%= glp("ui.com.btn.submit") %>"/>
        <input type="hidden" name="csId" value="<%= cs.getId() %>" />
      </div>
    </div>
  </jalios:buffer>
</jalios:modal>