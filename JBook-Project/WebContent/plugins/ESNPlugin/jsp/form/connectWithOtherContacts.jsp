<%@ page contentType="text/html; charset=UTF-8" %><%--
--%><%@ page import="com.jalios.jcmsplugin.esn.*" %><%--
--%><%@ include file='/jcore/doInitPage.jspf' %><%--
--%><%if (!isLogged) {
  sendForbidden(request, response);
  return;
} %>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.esn.ConnectContactHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
  <jsp:setProperty name='formHandler' property='noRedirect' value='true'/>
</jsp:useBean>
<% 
Member contact = formHandler.getContact(); 
if (formHandler.validate()) { %>
<% request.setAttribute("modal.redirect", contact.getDisplayUrl(userLocale)); %>
<%@ include file="/jcore/modal/modalRedirect.jspf" %>
<% } %>
<% 

ESNManager esnMgr = ESNManager.getInstance();
Set<Member> contactSet = esnMgr.getSortedConnectionSet(loggedMember, false, true);
contactSet.remove(contact);
Set<Member> connectionSet = esnMgr.getConnectionSet(contact);
if (connectionSet != null) {
  contactSet.removeAll(connectionSet);
}
contactSet = JcmsUtil.select(contactSet, null, Member.getNameComparator());

String button = glp("jcmsplugin.esn.connect-contact.lbl.connect");
%>
<jalios:modal button="<%= button %>" op="opConnect" title="jcmsplugin.esn.connect-contact.title" url="plugins/ESNPlugin/jsp/form/connectWithOtherContacts.jsp" formHandler="<%= formHandler %>">
	
	<% if (Util.isEmpty(contactSet)) { %>
	  <div class="alert alert-info">
		  <%= glp("jcmsplugin.esn.connect-contact.no-contact", contact.getFullName()) %>
	  </div>
	  <jalios:buffer name="MODAL_BUTTONS">
		  <button type="button" class="btn btn-default" data-dismiss="modal"><%= glp("ui.com.btn.cancel") %></button>
	  </jalios:buffer>
	<% } else { %>
	  <div class="alert alert-info"><%= glp("jcmsplugin.esn.connect-contact.info", contact.getFullName()) %></div>
	  
		<jalios:field name="targets" keyword="true" mv="1" resource="field-vertical">
      <jalios:control settings="<%= new MemberSettings().filter(MemberSettings.MemberFilter.CONTACT) %>" />
		</jalios:field>
		
    <input type="hidden" name="id" value="<%= contact.getId() %>" />
	<% } %>
	
</jalios:modal>