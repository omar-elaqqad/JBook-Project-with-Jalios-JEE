<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ page import="com.jalios.jcmsplugin.esn.*" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

if (!isLogged) {
  sendForbidden(request, response);
  return;
}
ESNManager esnMgr = ESNManager.getInstance();
Member member = getDataParameter("mid", Member.class);
if (member == null) {
  sendRedirect(loggedMember);
  return;
}
%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.esn.EditMemberLinkHandler'><%
  %><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
  %><jsp:setProperty name='formHandler' property='noRedirect' value='true'/><%
  %><jsp:setProperty name='formHandler' property='author' value='<%= member.getId() %>'/><%
%></jsp:useBean><%

jcmsContext.addJavaScript("plugins/ESNPlugin/js/edit-member-link.js");

MemberProfile profile = esnMgr.getMemberProfile(member);
String modalRedirect = getUntrustedStringParameter("redirect", profile.getDisplayUrl(userLocale) + "#links");
if (formHandler.validate()) {
  request.setAttribute("modal.redirect", modalRedirect);
  %><%@ include file="/jcore/modal/modalRedirect.jspf" %><% 
}
String op = Util.notEmpty(formHandler.getId()) ? "opUpdate" : "opCreate" ;
String button = Util.notEmpty(formHandler.getId()) ? glp("ui.com.btn.update") : glp("ui.com.btn.create") ;
String urlDomainLabelJsonString = formHandler.getUrlDomainLabelJson();
%>
<jalios:modal op="<%= op %>" button="<%= button %>" title="jcmsplugin.esn.lbl.links.add" picture="" url="plugins/ESNPlugin/jsp/form/editLink.jsp" formHandler="<%= formHandler %>" css="esn-edit-member-link modal-lg">
  <jalios:field label="jcmsplugin.esn.link.lbl.url" name="url" required="true" value="<%= formHandler.getAvailableUrl() %>">
    <jalios:control type="<%= ControlType.URL %>"/>
  </jalios:field>
  <jalios:field label="jcmsplugin.esn.link.lbl.name" name="title" required="true" value="<%= formHandler.getAvailableTitle() %>">
    <jalios:control type="<%= ControlType.TEXTFIELD %>"/>
  </jalios:field>
  <jalios:field label="jcmsplugin.esn.link.lbl.description" name="description" value="<%= formHandler.getAvailableDescription() %>">
    <jalios:control type="<%= ControlType.TEXTAREA %>"/>
  </jalios:field>
  <% if (Util.notEmpty(modalRedirect)) { %>
    <input type="hidden" name="redirect" value="<%= modalRedirect %>" />  
  <% } %>
  <% if (Util.notEmpty(formHandler.getId())) { %>
    <input type="hidden" name="id" value="<%= formHandler.getId() %>" />
  <% } %>
  <input type="hidden" name="mid" value="<%= member.getId() %>" />
  <% if (Util.notEmpty(urlDomainLabelJsonString)) { %>
  <%-- Note: do not quote value as it is a JSON --%>
  <jalios:javascript>
    jQuery.plugin.esn.editMemberLink.urlDomainLabelMap = <%= urlDomainLabelJsonString %>;
  </jalios:javascript>
  <% } %>
</jalios:modal>