<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%><%
%><%@page import="com.fasterxml.jackson.core.JsonParser"%><%
%><%@page import="com.jalios.jcms.json.ObjectMapperBuilder"%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%

org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger("jsp.jcore.closePopup_jsp");

String redirect = getValidHttpUrl("redirect");
String redirectNoClose = getValidHttpUrl("redirectNoClose");

// refreshParam must be initialized as string representing an array (cf. EditPublicationHandler.getClosePopupUrl(), ctxCategory.jsp)
String refreshParam = getUntrustedStringParameter("refresh", null);

%><%@ include file="/jcore/doEmptyHeader.jspf" %>

<%-- Run popup callback --%> 
<% if(Util.notEmpty(refreshParam)) { %>
  <% logger.trace("Injecting javascript..."); %>
  <%
  try {
    ObjectMapper mapper = new ObjectMapperBuilder().getMapper();
    mapper.configure(JsonParser.Feature.ALLOW_UNQUOTED_FIELD_NAMES, true);
    mapper.configure(JsonParser.Feature.ALLOW_SINGLE_QUOTES, true);
    Object[] array = mapper.readValue(refreshParam, Object[].class);
    refreshParam = mapper.writeValueAsString(array);
  } catch (Exception e) {
    logger.warn("Could not parse the 'refresh' parameter in JSON: " + e.getMessage());
    logger.trace(e, e);
    refreshParam = null;
  }
  %>
  <jalios:javascript>
    !function ($) {
      // Initialization on DOM ready
      $(document).ready(function($) {
        Popup.callback.apply(this, <%= refreshParam %>);
        window.close();
      });
    }(window.jQuery);
  </jalios:javascript>
<% } else { %>
  <jalios:javascript>
    // Without any opener, windows was opened in a new tab
    // redirect instead of closing the window
    if (!opener) {
      var url = '<%= encodeForJavaScript(redirectNoClose) %>';
      document.location.href = url;    
    } else {
     try {
        // if the opener is an iframe (ie. if it has a parent)
        // we want to refresh the parent and not just the iframe
        var openerLocation;
        if (opener.parent) {
          openerLocation = opener.parent.document.location;
        } else {
          openerLocation = opener.document.location;
        }
      <%-- Redirect opener to specified redirect parameter --%>
      <% if (redirect != null) { %>
        <% logger.trace("Closing popup and redirecting to : '" + redirect + "'"); %>
        var url = '<%= encodeForJavaScript(redirect) %>';
      <%-- Refresh opener --%>
      <% } else { %>
        <% logger.trace("Refreshing opener..."); %>
      
        // Remove the '#' otherwise the refresh is not performed
        var url = openerLocation.href;
        var p = url.indexOf('#')
        if (p >= 0) {
          url = url.substring(0, p);
        }
      <% } %>
      openerLocation.href = url;
     } catch(ex) {
       // EMPTY
     }
     close();
    }
  </jalios:javascript>
<% } %>
  
<%@ include file="/jcore/doEmptyFooter.jspf" %>