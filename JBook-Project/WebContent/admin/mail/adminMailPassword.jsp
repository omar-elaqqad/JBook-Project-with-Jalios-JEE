<%--
  @Summary: Mail editor  
  @Category: Work / Mail  
  @Author: Jp Encausse  
  @Copyright: Jalios SA  
  @Customizable: False  
  @Requestable: True  
  @Deprecated: False  
  @Since: jcms-4.1
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><% 
  if (!(isAdmin || checkAccess(AccessControlConstants.MBR_EDIT_RESOURCE) || checkAccess(AccessControlConstants.DBMBR_EDIT_RESOURCE) || checkAccess(AccessControlConstants.WSMBR_EDIT_RESOURCE))) {
	  sendForbidden(request, response);
	  return;
	}

%><jsp:useBean id="mailHandler" scope="page" class="com.jalios.jcms.handler.MailPasswordHandler"><%
 %><jsp:setProperty name="mailHandler" property="request" value="<%= request %>"/><%
 %><jsp:setProperty name="mailHandler" property="response" value="<%= response %>"/><%
 %><jsp:setProperty name="mailHandler" property="*" /><%
%></jsp:useBean><% 

  if (mailHandler.validate()) {
    return;
  }

%>