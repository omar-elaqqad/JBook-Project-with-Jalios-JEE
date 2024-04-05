<%@ include file='/jcore/doInitPage.jspf'%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%

Category itCat = (Category) request.getAttribute("directory-app-esn-expertise");
if (itCat == null) {
  return;
}
String color = itCat.getColor();

String colorHtmlAttr = "";
if (Util.notEmpty(color)) {
  colorHtmlAttr += " style=\"color:" + color + "\"";
}

boolean isNode = itCat.isNode(loggedMember);
String iconSrc;
if (isNode) {
  iconSrc = "jcmsplugin-esn-directory-competencies-folder";
} else {
  iconSrc = "jcmsplugin-esn-directory-competence-item";
}
%>
<jalios:icon css="js-icon expertise-chooser-icon" htmlAttributes="<%= colorHtmlAttr %>" src="<%= iconSrc %>" />