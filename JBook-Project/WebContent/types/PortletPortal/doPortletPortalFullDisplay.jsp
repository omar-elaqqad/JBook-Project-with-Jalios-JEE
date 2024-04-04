<%@ include file='/jcore/doInitPage.jspf' %><%@ include file='/jcore/portal/doPortletParams.jspf' %><% 

  PortletPortal box = (PortletPortal) portlet;  
  String titleCat = currentCategory != null ? " - "+currentCategory.getName(userLang) : "";
  request.setAttribute("title" , Util.getString(box.getPageTitle(userLang), box.getTitle(userLang))+titleCat);
  request.setAttribute("metadescription", HtmlUtil.html2text(box.getAbstract(userLang)));
  
  if (box.getChild() != null) {
    displayPortlet = (PortalElement) box.getChild();
    %><%@ include file='/jcore/portal/doIncludePortlet.jspf' %><% 
  }
  
  jcmsContext.addCSSHeader(box.getCssFile());
%>