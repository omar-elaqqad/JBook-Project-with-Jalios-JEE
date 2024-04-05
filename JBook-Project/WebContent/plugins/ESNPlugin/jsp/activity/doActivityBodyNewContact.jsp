<%@page import="com.jalios.jcms.taglib.card.CardsDisplayMode"%>
<%@page import="com.jalios.jcmsplugin.esn.activity.ActivityEntry"%>
<%@ include file='/jcore/doInitPage.jspf' %><% 
ActivityEntry activityEntry = (ActivityEntry) request.getAttribute("jcmsplugin.esn.activity.activity-entry");

if (activityEntry == null) {
  return;
}

Member itMember = (Member) activityEntry.getActivityData();

if (itMember == null) {
  return;
}
%>
<jalios:cards mode="<%= CardsDisplayMode.INLINE %>">
  <jalios:cardData data="<%= itMember %>" template="small" link="<%= itMember.getDisplayUrl(userLocale) %>"/>
</jalios:cards>