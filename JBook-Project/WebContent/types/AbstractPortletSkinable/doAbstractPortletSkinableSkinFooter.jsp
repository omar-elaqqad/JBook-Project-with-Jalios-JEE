<%@ include file='/jcore/doInitPage.jspf' %><% 
PortalElement portlet = (PortalElement)   request.getAttribute(PortalManager.PORTAL_PORTALELEMENT);
if (portlet == null) {
  return;
}
if (!(portlet instanceof AbstractPortletSkinable)) {
  return;
}

String skinFooter = ((AbstractPortletSkinable) portlet).getSkinFooter();
if (Util.isEmpty(skinFooter)) {
  return;
}
%><jalios:wysiwyg><%= skinFooter %></jalios:wysiwyg>