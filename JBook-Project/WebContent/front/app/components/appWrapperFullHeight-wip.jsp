<%@page import="com.jalios.jcms.a11y.A11YConstants"%>
<%@page import="com.jalios.jcms.tracking.ReaderTrackerManager"%>
<%@page import="com.jalios.jcms.uicomponent.app.AppConstants"%>
<%@ include file="/jcore/doInitPage.jspf" %><%
String name = getIncludeString("name", null);
String css = getIncludeString("css", "");
String htmlAttributes = getIncludeString("htmlAttributes", "");
String dataAttribute = getIncludeString("dataAttribute", null);
%>
<main role="main" class="app app-<%= name %> <%= css %>" <%= htmlAttributes %> <%= dataAttribute %>>
  <%= getIncludeBody() %>
</main>
<% if (channel.getBooleanProperty("jcms.application.ui.full-height", true)) { %>
  <script>
    // Add full height class directly in DOM to avoid FOUC
    var nodes = [];
    var fullHeightIndex;
    var elements = document.querySelectorAll(".app-body, .app-sidebar");
    
    for (fullHeightIndex = 0; fullHeightIndex < elements.length; ++fullHeightIndex) {
      var element = elements[fullHeightIndex];
      element.classList.add('app-full-viewport-height');
      while(element.parentNode) {
        element = element.parentNode;
        element.classList.add('app-full-viewport-height');
      }
    }
  </script>
  <style>
  BODY {
    overflow: hidden;
  }
  .app-body {
    overflow-x: auto;
    height: 100%;
  }
  .app-sidebar-content {
    height: 100%;
    overflow-x: auto;
  }
  </style>
  <jalios:javascript>
    new PerfectScrollbar(jQuery(".app-sidebar-content")[0], {
      
    });
  </jalios:javascript>
<% } %>