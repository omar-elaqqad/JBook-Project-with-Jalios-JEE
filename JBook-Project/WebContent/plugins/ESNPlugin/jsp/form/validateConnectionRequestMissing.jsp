<%@ include file='/jcore/doInitPage.jspf' %>
<%@ include file='/jcore/doHeader.jspf' %>
<%
	if (!isLogged) {
		sendForbidden(request,response);
    return;
	}
%>
<jalios:message level="<%= MessageLevel.INFO %>" msg="jcmsplugin.esn.lbl.connections.requests.missing"/>
<%@ include file='/jcore/doFooter.jspf' %>