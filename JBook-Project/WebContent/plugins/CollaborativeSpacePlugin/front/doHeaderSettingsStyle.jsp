<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@page import="java.awt.Color"%><%
%><%@ page import="com.jalios.jcmsplugin.collaborativespace.*" %><%
%><%@ page import="com.jalios.jcmsplugin.collaborativespace.ui.model.CsHeaderSettings" %><%  
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%!

public static Color hex2Rgb(String colorStr) {
  return new Color(
      Integer.valueOf( colorStr.substring( 1, 3 ), 16 ),
      Integer.valueOf( colorStr.substring( 3, 5 ), 16 ),
      Integer.valueOf( colorStr.substring( 5, 7 ), 16 ) );
}

%><%

CSManager csMgr = CSManager.getInstance();
CollaborativeSpace cs = (CollaborativeSpace) portlet;

if (cs == null) {
  return;
}
CsHeaderSettings headerSettings = csMgr.getHeaderSettings(cs);
if (headerSettings != null) {
  double csTabsOpacityCss = 1;
  String csTabsBgColor = "";
  boolean hasTabsOpacity = false;
  if (headerSettings != null) {
    try {
      hasTabsOpacity = Util.notEmpty(headerSettings.getTabsOpacity());
      int csTabsOpacity = Integer.parseInt(headerSettings.getTabsOpacity());
      csTabsOpacityCss = ((double)csTabsOpacity) / 100;
    } catch (Exception e) {
      csTabsOpacityCss = 1;
    }
    csTabsBgColor = headerSettings.getTabsBgColor();
  }
  %>
  <%-- Custom CSS for CS header --%>
  <jalios:buffer name="csSettings">
  <!-- CollaborativeSpace: custom header styling -->
  <%
  try {
    if (Util.notEmpty(csTabsBgColor)) { 
    %><style rel="stylesheet" id="cs-style-tabs-bgColor">
    #cs-header-tabs UL.nav-tabs {
      background-color: rgba(<%= hex2Rgb(csTabsBgColor).getRed() %>, <%= hex2Rgb(csTabsBgColor).getGreen() %>, <%= hex2Rgb(csTabsBgColor).getBlue() %>, <%= csTabsOpacityCss %>);
    }
    </style><%
    } else if (hasTabsOpacity) {
      // When no tabs bgColor, AND opacity less than 100%
    %><style rel="stylesheet" id="cs-style-tabs-bgColor">
    #cs-header-tabs UL.nav-tabs {
      background-color: rgba(0, 0, 0, <%= (csTabsOpacityCss) %>);
    }
    </style><%
    }
    if (Util.notEmpty(headerSettings.getTabsColor())) {
    %><style rel="stylesheet" id="cs-style-tabs-color">
    #cs-header-tabs UL.nav-tabs > LI:not(:hover) .btn-application-menu,
    #cs-header-tabs UL.nav-tabs > LI:not(:hover) .btn-application-menu .jalios-icon,
    #cs-header-tabs UL.nav-tabs > LI,
    #cs-header-tabs UL.nav-tabs > LI:not(:hover) > A,
    #cs-header-tabs UL.nav-tabs > LI.active:not(:hover) > A,
    #cs-header-tabs UL.nav-tabs > LI.active-child:not(:hover) > A {
      color: <%= encodeForHTMLAttribute(headerSettings.getTabsColor()) %>;
    }
    #cs-header-tabs UL.nav-tabs > LI:not(:hover) > A:after,
    #cs-header-tabs UL.nav-tabs > LI.active:not(:hover) > A:after,
    #cs-header-tabs UL.nav-tabs > LI.active-child:not(:hover) > A:after { 
      background-color: <%= encodeForHTMLAttribute(headerSettings.getTabsColor()) %>;
    }
    </style><%
    }
    if (Util.notEmpty(headerSettings.getTitleColor())) {
    %><style rel="stylesheet" id="cs-style-title-color">
    #cs-header-title, #cs-header-title A {
      color: <%= encodeForHTMLAttribute(headerSettings.getTitleColor()) %>;
    }
    </style><%
    }
    if (Util.notEmpty(headerSettings.getBgColor())) {
    %><style rel="stylesheet" id="cs-style-bgColor">
      .cs-portal #cs-header, .cs-portal #cs-header.cs-custom-header {
        background-color: <%= encodeForHTMLAttribute(headerSettings.getBgColor()) %>;
      }
    </style><% 
    }
    if (Util.notEmpty(headerSettings.getRepeat())) {
    %><style rel="stylesheet" id="cs-style-repeat">
      #cs-header {
        background-repeat: <%= encodeForHTMLAttribute(headerSettings.getRepeat()) %>;
      }
    </style><% 
    }
  } catch (Exception e) {
    if (logger.isDebugEnabled()) {
      logger.debug("Exception occured while rendering custom CS CSS rules: " + e.getMessage(), e);
    }
  }
  %>
  <!-- CollaborativeSpace: end of custom header styling -->
  </jalios:buffer><%
  jcmsContext.addCustomHeader(csSettings.toString());
}
%>