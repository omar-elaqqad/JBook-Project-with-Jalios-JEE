<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@page import="com.jalios.jcmsplugin.smartphone.ShareUrlHandler.ShareInfos"%><%
%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcmsplugin.smartphone.ShareUrlHandler"><%
 %><jsp:setProperty name="formHandler" property="request"  value="<%= request %>"/><%
 %><jsp:setProperty name="formHandler" property="response" value="<%= response %>"/><%
 %><jsp:setProperty name="formHandler" property="*" /><%
%></jsp:useBean><%
 if(formHandler.redirectToShareInfo()){
   sendRedirect(formHandler.getShareInfoUrl(), request, response); 
   return;      
 }
%><%@ include file="/plugins/SmartPhonePlugin/jsp/common/header.jspf" %>
<div id="service-share-url" class="publish-page publish-conversation-page" data-role="page">
  <div class="service-share-url-content ui-content container">
  <div class="service-share-url-info">
  <jalios:icon src="smartphone-shareurl-welcome" css="img-center" />
  	<p class="text-share-page"><%= glp("jcmsplugin.smartphone.mobileapp.shareurl.message") %></p>
  </div>
  <div class="share-wrapper">
    <%  if(formHandler.validate()) { %>
      <% for(ShareInfos shareInfos : formHandler.getShareInfos()) {%>
        <% if (shareInfos.matches(shareInfos.getPattern())) { %>
        <a class="link-share-page js-ripple" href="<%= HttpUtil.getUrlWithCSRFToken(shareInfos.getUrl()+"&amp;opNext=true", request, true) %>" >
          <img src="<%= shareInfos.getIcon() %>" class="center-block" >
          <span class="service-label"><%= shareInfos.getLabel(userLang) %></span>
        </a>
        <% } %>
      <%} %>
    <% } else {
      %><%@ include file="/jcore/doMessageBox.jspf" %><%
    }
    %>
  </div>
</div>
</div>
<%@ include file="/plugins/SmartPhonePlugin/jsp/common/footer.jspf" %>