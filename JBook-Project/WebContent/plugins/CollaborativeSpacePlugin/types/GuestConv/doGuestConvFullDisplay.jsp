<%--
  @Summary: GuestConv customized full display
  @Category: Content
  @Author: Sylvain Devaux <sylvain.devaux@jalios.com>
  @Customizable: True
  @Requestable: True
  @Since: csp-6.0
--%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
GuestConv contactReq = (GuestConv)request.getAttribute(PortalManager.PORTAL_PUBLICATION);

Member contactReqContact = contactReq.getContact();
request.setAttribute("guest-contact-id", contactReqContact.getId());
%><%@ include file='/plugins/CollaborativeSpacePlugin/types/GuestRequest/doGuestRequestFullDisplay.jsp' %><%
request.removeAttribute("guest-contact-id");
%>