<%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%--  
--%><%@ page import="com.jalios.jcmsplugin.smartphone.*" %><%-- 
--%><%@ taglib uri="/jcmsplugin/SmartPhonePlugin/tld/smartphone.tld" prefix="smartphone" %><%-- 
--%><%SmartPhoneManager smartPhoneManager = SmartPhoneManager.getInstance();
  
  Workspace ws = (Workspace) request.getAttribute("jcms.plugin.smartphone.newsPqf.workspace");
  if (hasParameter("wsId")) {
    ws = getWorkspaceParameter("wsId");
  }
  
  //Workspace PQF
  PortletQueryForeach pqf = (PortletQueryForeach) getPublicationParameter("portletId");

  if (pqf == null) {
    return;
  }
  
  int skip = getIntParameter("skip", 0);
  int max = getIntParameter("max", smartPhoneManager.getDefaultPageSize());
  
  PortletQueryForeachPageResult resultList = smartPhoneManager.getPortletQueryForeachResultSet(pqf, request, response, loggedMember, ws, skip, max);%>
<jalios:foreach collection='<%= resultList.getResultList() %>' type='Publication' name='itPub' skip="<%= skip %>" max='<%= max %>'>
  <smartphone:card data="<%= itPub %>" readable="true" css="news" votable="true" />
</jalios:foreach>
<% if ((skip + max) < resultList.getTotalSize()) {%>
<a data-role="button" data-theme="b" class="ui-btn-showmore ajax-refresh ui-link ui-btn ui-btn-b ui-shadow ui-corner-all" data-jalios-ajax-action="plugins/SmartPhonePlugin/jsp/action/showNews.jsp?portletId=<%= pqf.getId() %>&amp;skip=<%= skip + max %>&amp;max=<%= max %>&amp;wsId=<%= ws != null ? ws.getId() : "" %>" data-ajax-deduplication-target=".smartphone-news-wrapper"><%= glp("jcmsplugin.smartphone.action.showmore") %></a>
<% } %>