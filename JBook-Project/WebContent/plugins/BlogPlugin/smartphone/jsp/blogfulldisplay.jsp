<%@ include file='/plugins/SmartPhonePlugin/jsp/common/header.jspf' %>
<%@ page import='com.jalios.jcms.alert.*' %> 
<%@ page import="com.jalios.jcmsplugin.blog.*" %>
<%
  Publication pub = getPublicationParameter("id");
  Blog blog = (Blog) getDataParameter("id");
  request.setAttribute("jcms.plugin.dbcomment.smartphone.disable.comments", true);
  request.setAttribute("jcms.plugin.smartphone.allow-deletion", false);
%>
<%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubCommon.jspf' %>
<div id="pub-blog" data-role="page" class="pub-page pub-blog service-background-contrast" data-dom-cache="true">
  <smartphone:breadcrumb data='<%= blog %>' />
  <%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubTopbarMenu.jspf' %>
  <div data-role="content" class="pub-content">
    <jalios:include jsp="plugins/BlogPlugin/smartphone/jsp/blogMore.jsp"/>
    <jalios:include target="SMARTPHONE_PUB_FOOTER" />
  </div><%-- EOF .pub-content --%>
</div><%-- EOF #pub-blog --%>
<%@ include file='/plugins/SmartPhonePlugin/jsp/common/footer.jspf' %>