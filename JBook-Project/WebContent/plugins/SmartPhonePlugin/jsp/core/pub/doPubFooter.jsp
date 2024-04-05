<%@page import="com.jalios.jcmsplugin.smartphone.SmartPhonePublicationManager.PublicationActionItem"%><%
%><%@page import="com.jalios.jcmsplugin.smartphone.SmartPhonePublicationManager"%><% 
%><%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneManager"%><%
%><%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%-- 
--%><%@page import="com.jalios.jcms.Member"%>
<%@page import="java.util.Set"%>
<%@page import="com.jalios.util.Util"%><%--
--%><%@ page import="com.jalios.jcms.vote.*" %><%
  // When included
  Publication pub = (Publication) request.getAttribute("jcms.plugin.smartphone.fulldisplay.pub");
  boolean disableVote = Util.toBoolean(request.getAttribute("jcms.plugin.smartphone.disable-vote"), false);
  ServletUtil.backupAttribute(pageContext, "jcms.plugin.smartphone.pub");
  request.setAttribute("jcms.plugin.smartphone.pub", pub);
  if(pub == null) {
    // When AJAX call
    pub = getPublicationParameter("pubId");
  }
  
  if(pub == null) {
    return;
  }
  
%>
<jalios:include jsp="plugins/SmartPhonePlugin/jsp/core/pub/doPubSocialFooter.jsp" />
<% 
SmartPhonePublicationManager pubManager = SmartPhonePublicationManager.getInstance();
Set<PublicationActionItem> actionItems = pubManager.getFullDisplayActionItems(pub);
%>
<div class="actions-wrapper" data-jalios-data-id="<%= pub.getId() %>">
  <% for (PublicationActionItem item : actionItems) { %>
    <jalios:include jsp="<%= item.getUrl() %>" />
  <% } %>
</div>

<div class="card-item pub-footer card-item-divider">
  <jalios:include target="SMARTPHONE_PUB_FULLDISPLAY_FOOTER" />
</div>
<%   
  ServletUtil.restoreAttribute(pageContext, "jcms.plugin.smartphone.pub");
%>