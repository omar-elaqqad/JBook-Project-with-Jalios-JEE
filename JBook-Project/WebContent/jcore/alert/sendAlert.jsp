<%@ page contentType="text/html; charset=UTF-8" %><%--
--%><%@ include file='/jcore/doInitPage.jspf' %><%--
--%><%@ page import='com.jalios.jcms.alert.*' %><%--
--%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.alert.SendAlertHandler'><%--
--%>  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%--
--%>  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%--
--%>  <jsp:setProperty name='formHandler' property='*' /><%--
--%>  <jsp:setProperty name='formHandler' property='noRedirect' value='<%= true %>'/><%--
--%></jsp:useBean><%--
--%>
<% if (formHandler.validate()) { %>
<%@ include file="/jcore/modal/modalRedirect.jspf" %>
<% } %>
<%
jcmsContext.addJavaScript("js/jalios/core/alert/jalios-alert-level-chooser.js");
%>
<jalios:modal title="alert.send-alert.lbl.title" formHandler="<%= formHandler %>" url="jcore/alert/sendAlert.jsp" op="opSend" button="ui.com.btn.send">

  <jalios:field label="alert.send-alert.lbl.alert-level" name="alertLevelKey" value='<%= formHandler.getAvailableAlertLevelKey() %>' css="jalios-alert-level-chooser">
    <% for (Alert.Level itLevel: Alert.Level.values()) { %>
      <span class="badge alert-level alert-level-<%= itLevel.getKey() %>"><input type="radio" name="alertLevelKey" value="<%= itLevel.getKey() %>" id="alert-level-<%= itLevel.getKey() %>" <%= itLevel.getKey().equals(fieldValue) ? "checked='checked'" : ""  %>>&nbsp;<label for="alert-level-<%= itLevel.getKey() %>"><%= itLevel.getLabel(userLang) %></label></span>&nbsp;
    <% } %>
  </jalios:field>   
  
  <jalios:field label="alert.send-alert.lbl.subject" name="subject"  ml='<%= formHandler.isMultilingual() %>' value='<%=  formHandler.getAllAvailableSubjectML() %>' required='true'>
    <jalios:control type="<%= ControlType.TEXTFIELD %>" />
  </jalios:field>
  
  <jalios:field label="alert.send-alert.lbl.message" name="message"  ml='<%= formHandler.isMultilingual() %>' value='<%=  formHandler.getAllAvailableMessageML() %>' required='true'>
    <jalios:control settings='<%= new WikiAreaSettings().rows(2) %>' />
  </jalios:field>
  
  <% Set<Member> loggedMemberSet = formHandler.getLoggedMemberSet(); %>
  <% if (Util.getSize(loggedMemberSet) > 1) { %>
  <% String loggedMembersLabel  = glp("alert.send-alert.lbl.logged-mbrs", loggedMemberSet.size()); %>
  <jalios:field label="<%= loggedMembersLabel %>" name="loggedMembers" value='<%=  formHandler.getAvailableLoggedMembers() %>'>
    <jalios:control settings='<%= new BooleanSettings() %>' />
  </jalios:field>
  <% } %>

  <%  
  jcmsContext.setAjaxRequestAttribute("ACContact", false);
  jcmsContext.setAjaxRequestAttribute("ACContactSet", null);
  
  Workspace refineWorkspace = formHandler.getAvailableRefineWorkspace();
  %>

  <jalios:field label="ui.com.lbl.groups" name="groups" value='<%=  formHandler.getAvailableGroupSet() %>' keyword="true">
    <jalios:control settings='<%= new GroupSettings().workspace(refineWorkspace) %>' />
  </jalios:field>
  
  <jalios:field label="ui.com.lbl.members" name="members" value='<%=  formHandler.getAvailableMemberSet() %>' keyword="true">
    <jalios:control settings='<%= new MemberSettings().filter(MemberSettings.MemberFilter.ACCOUNT).workspace(refineWorkspace) %>' />
  </jalios:field>
  
  <jalios:field label="alert.send-alert.lbl.alert-expiration" name="expiration" value="<%= formHandler.getAvailableExpiration() %>">
    <jalios:control settings='<%= new DateSettings().displayTime() %>' />
  </jalios:field>
  
  <% if (refineWorkspace != null) { %><input type="hidden" name="refineWorkspace" value="<%= refineWorkspace.getId() %>"><% } %>
  
</jalios:modal>

