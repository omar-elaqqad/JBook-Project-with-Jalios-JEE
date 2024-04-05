<%--
  @Summary: GuestCrea customized full display
  @Category: Content
  @Author: Sylvain Devaux <sylvain.devaux@jalios.com>
  @Customizable: True
  @Requestable: True
  @Since: csp-6.0
--%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
GuestCrea staticReq = (GuestCrea)request.getAttribute(PortalManager.PORTAL_PUBLICATION);

request.setAttribute("guest-static-name", staticReq.getName());
request.setAttribute("guest-static-firstname", staticReq.getFirstname());
request.setAttribute("guest-static-email", staticReq.getEmail());
request.setAttribute("guest-static-organization", staticReq.getOrganization());

%><%@ include file='/plugins/CollaborativeSpacePlugin/types/GuestRequest/doGuestRequestFullDisplay.jsp' %><%

request.removeAttribute("guest-static-name");
request.removeAttribute("guest-static-firstname");
request.removeAttribute("guest-static-email");
request.removeAttribute("guest-static-organization");
%>