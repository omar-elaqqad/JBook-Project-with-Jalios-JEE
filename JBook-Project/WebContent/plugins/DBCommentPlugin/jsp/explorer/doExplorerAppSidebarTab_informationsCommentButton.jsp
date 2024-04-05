<%@page import="com.jalios.jcmsplugin.dbcomment.DBCommentManager"%>
<%@ include file='/plugins/ExplorerPlugin/jsp/app/sidebar/tabs/doInitExplorerAppSidebarTabContent.jspf' %>
<%
jcmsContext.addJavaScript("plugins/DBCommentPlugin/js/dbcomment-explorer-sidebar.js");
jcmsContext.addCSSHeader("plugins/DBCommentPlugin/css/dbcomment-explorer-sidebar.css");
Data currentData = (Data) request.getAttribute("com.jalios.jcmsplugin.explorer.sidebar.currentData");

if (DBCommentManager.getInstance().isCommentable((Publication) currentData)) { %>
<a class="btn btn-default btn-block btn-access-comment-tab" href="#"><%= glp("jcmsplugin.explorer-sidebar.see-comments") %></a>
<% } %>