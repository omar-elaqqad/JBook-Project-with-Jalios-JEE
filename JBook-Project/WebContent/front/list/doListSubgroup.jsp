<%@page import="com.jalios.jcms.taglib.list.ListSubgroupTag"%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
String css = getIncludeString("css", "");
%>
<div class="itemlist-subgroup<%= Util.getString(" " + css, "") %>">
  <% if (Util.notEmpty(getIncludeString(ListSubgroupTag.BUFFER_LIST_SUBGROUP_TITLE, ""))) { %>
    <div class="itemlist-subgroup-title">
      <%= getIncludeString(ListSubgroupTag.BUFFER_LIST_SUBGROUP_TITLE, "") %>
    </div>
  <% } %>
  <%= getIncludeBody() %>
</div>