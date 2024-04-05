<%@ page contentType="text/html; charset=UTF-8" %><%--
--%><%@ page import="com.jalios.jcmsplugin.esn.*" %><%--
--%><%@ include file='/jcore/doInitPage.jspf' %><%--
--%><%if (!isLogged) {
  sendForbidden(request, response);
  return;
}
ESNManager esnMgr = ESNManager.getInstance();
%>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.esn.DisconnectHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
  <jsp:setProperty name='formHandler' property='noRedirect' value='true'/>
</jsp:useBean>
<% if (formHandler.validate()) { %>
<% request.setAttribute("modal.redirect", formHandler.getAvailableTarget().getDisplayUrl(userLocale)); %>
<%@ include file="/jcore/modal/modalRedirect.jspf" %>
<% } %>
<% 
boolean lastConnection = formHandler.isLastConnection(); 
Member member = formHandler.getAvailableMember();
Member target = formHandler.getAvailableTarget();
String label = loggedMember == member ? glp("jcmsplugin.esn.lbl.disconnect.btn.disconnect") : glp("jcmsplugin.esn.lbl.disconnect.btn.disconnect-other");
%>

<jalios:modal op="opDisconnect" button="<%= label %>" title="jcmsplugin.esn.lbl.disconnect.title" url="plugins/ESNPlugin/jsp/form/disconnect.jsp">
  <div class="alert alert-info">
    <% if (member == loggedMember) { %>
    <p><%= glp("jcmsplugin.esn.lbl.disconnect.confirm", target.getFullName()) %></p>
    <% } else { %>
    <p><%= glp("jcmsplugin.esn.lbl.disconnect.confirm-contact", target.getFullName(), member.getFullName()) %></p>
    <% } %>
    
    <% if (lastConnection) { %>
    <p><%= glp("jcmsplugin.esn.lbl.disconnect.confirm-warn", target.getFullName()) %></p>
    <% } %>
  </div>
  <input type="hidden" name="member" value="<%= member.getId() %>" />
  <input type="hidden" name="target" value="<%= target.getId() %>" />
  <% if (lastConnection) { %>
    <jalios:buffer name="MODAL_BUTTON">
      <input type="submit" class="ajax-refresh btn btn-default" name="opDisconnectAndRemove" value="<%= glp("jcmsplugin.esn.lbl.disconnect.btn.delete") %>"/>
    </jalios:buffer>
  <% } %>

</jalios:modal>