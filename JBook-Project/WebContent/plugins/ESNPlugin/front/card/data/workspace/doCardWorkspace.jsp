<%@page import="com.jalios.jcmsplugin.esn.ESNManager"%>
<%@ page contentType="text/html; charset=UTF-8"%><%
%><%@ include file="/front/card/data/doInitCardData.jspf" %><%

Workspace cardWorkspace = (Workspace) data;
if (cardWorkspace == null) {
  return;
}

jcmsContext.addJavaScript("js/lib/clamp/clamp.js");
jcmsContext.addJavaScript("js/jalios/core/jalios-truncate.js");
linkOptions.hrefLink(false);
%>
<jalios:card css="<%= css %>" link="<%= link %>" linkOptions="<%= linkOptions %>" dataAttribute="<%= dataAttribute %>">
  <%= getIncludeString("CARD_TOP", "") %>
  <jalios:cardImage src="<%= cardImage %>">
    <%-- Prevent thumbnail of header image --%>
    <jalios:buffer name="thumbnailWidth">1999</jalios:buffer>
  </jalios:cardImage>
  <jalios:cardBlock>
    <div class="card-title card-publication-title" data-jalios-truncate='{ "value" : 2 }'>
      <%= cardWorkspace.getTitle(userLang, true) %>
    </div>
  </jalios:cardBlock>
  <%= getIncludeString("CARD_BOTTOM", "") %>
</jalios:card>
