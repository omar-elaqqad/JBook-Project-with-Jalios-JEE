<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file="/front/app/doAppCommon.jspf" %><%
%><%@ page import="com.jalios.jcms.publiclink.*" %><%
%><jsp:useBean id="appHandler" scope="page" class="com.jalios.jcms.publiclink.PublicLinkAppHandler"><%
  %><jsp:setProperty name="appHandler" property="request"       value="<%= request %>"/><%
  %><jsp:setProperty name="appHandler" property="response"      value="<%= response %>"/><%
  %><jsp:setProperty name="appHandler" property="*" /><%
%></jsp:useBean><%
%><%
if (appHandler.validate()) {
  return;
}

jcmsContext.setPageTitle(appHandler.getAppTitle());

jcmsContext.addCSSHeader("css/jalios/ux/jalios-public-link-app.css");

%>
<%@ include file='/jcore/doHeader.jspf' %>

<div class="ajax-refresh-div" data-jalios-ajax-refresh-url="front/publicLink/app/publicLink.jsp">
  <jalios:app name="public-link">
    <%-- SIDEBAR --%>
    <%@ include file='/front/publicLink/app/doPublicLinkSidebar.jspf' %>
    <%-- MAIN --%>
    <jalios:appMain headerTitle="<%= appHandler.getAppTitle() %>">
      <%-- BODY --%>
      <%@ include file='/front/publicLink/app/doPublicLinkBody.jspf' %>
    </jalios:appMain>
  </jalios:app>
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>
<%@ include file='/jcore/doFooter.jspf' %>