<%@ page contentType="text/html; charset=UTF-8" %><%--
--%><%@ page import="com.jalios.jcmsplugin.esn.*" %><%--
--%><%@ include file='/jcore/doInitPage.jspf' %><%--
--%><%if (!isLogged) {
  sendForbidden(request, response);
  return;
}
ESNManager esnMgr = ESNManager.getInstance();
Member member = getDataParameter("mid", Member.class);
if (member == null) {
  MemberNote note = getDataParameter("id", MemberNote.class);
  member = note.getMember();
}
if (member == null || !esnMgr.isConnected(loggedMember, member)) {
%>
<script>
document.location = "<%= contextPath + "/" + loggedMember.getDisplayUrl(userLocale) %>#links";
</script>
<%
  return;
}%>
<% if (!esnMgr.checkAgreement(loggedMember)) {
  request.setAttribute("modal.redirect", "plugins/ESNPlugin/jsp/agreement.jsp"); %>
<%@ include file="/jcore/modal/modalRedirect.jspf" %>
<%  
  return;
}
%>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.esn.EditMemberNoteHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
  <jsp:setProperty name='formHandler' property='noRedirect' value='true'/>
</jsp:useBean>
<% if (formHandler.validate()) { %>
<% 
request.setAttribute("modal.redirect", member.getDisplayUrl(userLocale));
%>
<%@ include file="/jcore/modal/modalRedirect.jspf" %>
<%
return;
} %>

<jalios:modal title="jcmsplugin.esn.lbl.notes.add" picture="jcmsplugin-esn-note32" url="plugins/ESNPlugin/jsp/form/editNote.jsp" formHandler="<%= formHandler %>">
 
	<jalios:field name="text" value="<%= formHandler.getAvailableText() %>" resource="field-light">
		<jalios:control type="<%= ControlType.WIKIAREA %>"/>
	</jalios:field>	
  
  <jalios:buffer name="MODAL_BUTTONS">
	  <input type="hidden" name="mid" value="<%= member.getId() %>" />  
	  
	  <input type="submit" class="btn btn-default" name="opCancel" data-dismiss="modal" value="<%= glp("ui.com.btn.cancel") %>"/>
	  <% if (formHandler.getData() == null) { %>
		  <input type="submit" class="btn-primary btn ajax-refresh" name="opCreate" value="<%= glp("ui.com.btn.save") %>" />
	  <% } else { %>
		  <input type="submit" class="btn btn-danger ajax-refresh" name="opDelete" value="<%= glp("ui.com.btn.delete") %>" />
		  <input type="submit" class="btn-primary btn ajax-refresh" name="opUpdate" value="<%= glp("ui.com.btn.save") %>" />
		  <input type="hidden" name="id" value="<%= formHandler.getData().getId() %>" />
	  <% } %>	  
  </jalios:buffer>
  
</jalios:modal>