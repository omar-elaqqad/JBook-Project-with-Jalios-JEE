<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/tabs/doInitTab.jspf' %><%

Map<Category, Set<Category>> catMap = esnProfileDisplayHandler.getMemberCategoryMap(member, loggedMember, userLang); 
boolean hasExpertises = Util.notEmpty(catMap);

boolean show = hasExpertises
  || esnProfileDisplayHandler.canPublishMemberCategories();

if (!show) {
  uiTab.disable(request);
}
%>