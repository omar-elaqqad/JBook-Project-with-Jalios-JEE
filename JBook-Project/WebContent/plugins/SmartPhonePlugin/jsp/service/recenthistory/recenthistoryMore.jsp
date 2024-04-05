<%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%--  
--%><%@ page import="com.jalios.jcms.recenthistory.*" %><%--  
--%><%@ page import="com.jalios.jcmsplugin.smartphone.*" %>
<%@ taglib uri="/jcmsplugin/SmartPhonePlugin/tld/smartphone.tld" prefix="smartphone" %><%  
  SmartPhoneManager smartPhoneManager = SmartPhoneManager.getInstance();

  Collection recentMemberPubCollection = RecentHistoryManager.getInstance().getPubRecentHistory(loggedMember, null); 
  
  int skip = getIntParameter("skip",0);
  int max = getIntParameter("max",smartPhoneManager.getDefaultPageSize());
  
  if (Util.isEmpty(recentMemberPubCollection)) { 
    return;
  }
%>
<jalios:foreach collection='<%= recentMemberPubCollection %>' type='Publication' name='itPub' skip="<%= skip %>" max='<%= max %>'>
  <jalios:dataListItem data="<%= itPub %>" template="jmobile" />
</jalios:foreach>
<% if ((skip + max) < Util.getSize(recentMemberPubCollection)) {%>
  <li class="ui-listview-showmore">
    <a data-role="button" data-theme="b" class="ajax-refresh ui-link" data-jalios-ajax-action="plugins/SmartPhonePlugin/jsp/service/recenthistory/recenthistoryMore.jsp?skip=<%= skip + max %>&amp;max=<%= max %>"><%= glp("jcmsplugin.smartphone.action.showmore") %></a>
  </li>
<% } %>