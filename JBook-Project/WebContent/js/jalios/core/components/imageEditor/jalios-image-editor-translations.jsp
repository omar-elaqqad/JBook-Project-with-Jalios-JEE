<%@page import="org.apache.commons.lang.StringUtils"%><% 
%><%@ include file="/jcore/doInitPage.jspf" %><%

// Cache for 10 days by default or use expiration delay specified on properties (on both server and client side)
final long CACHE_TIMEOUT = channel.getLongProperty("channel.packer.cache-expiration", 10) * 24 * 60; // convert days in minutes
    
// B. Write Headers
response.setContentType("text/javascript; charset=UTF-8");
response.setDateHeader("Expires", System.currentTimeMillis() + (CACHE_TIMEOUT * 1000 * 60));

// C. Setup cache id (from queryString)
Map<String,String> translationProps = channel.getSortedProperties(userLang + ".image-editor.file-robot-image-editor.translation.");
  
%><%
%>const FILE_ROBOT_IMAGE_EDITOR_TRANSLATIONS = new Map();
<% for (String key : translationProps.keySet()) {%><% 
%>FILE_ROBOT_IMAGE_EDITOR_TRANSLATIONS.set("<%= StringUtils.substringAfter(key, "image-editor.file-robot-image-editor.translation.") %>", "<%= translationProps.get(key) %>");<% 
%><% } %>