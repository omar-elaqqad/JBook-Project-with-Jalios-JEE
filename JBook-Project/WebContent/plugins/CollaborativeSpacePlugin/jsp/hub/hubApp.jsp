<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@page import="com.jalios.jcms.uicomponent.app.AppConstants"%><%
%><%@page import="com.jalios.jcmsplugin.collaborativespace.CSSuggestionManager"%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ include file="/front/app/doAppCommon.jspf" %><%
%><%@ include file="/jcore/doHeader.jspf" %><%
%><jsp:useBean id='formHandler' scope='page' class="com.jalios.jcmsplugin.collaborativespace.CSHubHandler"><%
  %><jsp:setProperty name='formHandler' property='request' value='<%=request%>'/><%
  %><jsp:setProperty name='formHandler' property='response' value='<%=response%>'/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
%></jsp:useBean><%

formHandler.addFrontEndDependencies();
request.setAttribute("formHandler", formHandler);
request.setAttribute("jcms.alert-app", true);
// No redirect needed (ajax refresh)
boolean success = formHandler.validate();
boolean isModeSuggestions = formHandler.isModeSuggestions();
String hubQS = ServletUtil.getUpdatedParams(request, new String[] {"jsp"}, new String[] {"plugins/CollaborativeSpacePlugin/jsp/hub/hubApp.jsp"}, new String[] {"id", "csrftoken"}, false);
%>
<jalios:javascript>
window.history.replaceState(history.state, "<%= encodeForJavaScript(formHandler.getAppHeaderTitle(userLang)) %>", "<%= ServletUtil.getResourcePath(request) %><%= hubQS %>");
</jalios:javascript>
<div class="ajax-refresh-div" data-jalios-ajax-refresh-url="<%= formHandler.getAppJsp() %>">
  <form action="<%= formHandler.getAppJsp() %>" method="POST">
    <jalios:app name="cs-hub">
      <jalios:include jsp='/plugins/CollaborativeSpacePlugin/jsp/hub/doAppSidebar.jsp' />
      <jalios:appMain headerTitle="<%= formHandler.getAppHeaderTitle(userLang) %>" css='<%= isModeSuggestions ? " cs-hub-suggestions" : "" %>'>
        <jalios:include jsp='/plugins/CollaborativeSpacePlugin/jsp/hub/doAppBody.jsp' />
      </jalios:appMain>
    </jalios:app>
  </form>
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>
<%@ include file="/jcore/doFooter.jspf" %>
