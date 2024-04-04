<%--
  @Summary: [Abstract] Basic Portlet Skinable content editor
  @Customizable: True
  @Requestable: False
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

boolean displayPortletSkinableForm = Util.toBoolean(request.getAttribute(EditPortletSkinableHandler.DISPLAY_PORTLET_SKINABLE_FORM_REQUEST_ATTR), true);

if (!displayPortletSkinableForm) {
  return;
}

EditAbstractPortletSkinableHandler formHandler = (EditAbstractPortletSkinableHandler)request.getAttribute("formHandler");

%><%@ include file='/jcore/portal/doEditCommonPortlet.jspf' %>