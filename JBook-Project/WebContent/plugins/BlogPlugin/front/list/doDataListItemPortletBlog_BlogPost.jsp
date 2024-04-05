<%@ include file="/front/list/doInitDataListItem.jspf" %><%
BlogPost post = (BlogPost) data;
%><jalios:dataListItem template="dataImage" data="<%= data %>" css="<%= css %>"><%
  %><% if (!post.isInVisibleState()) { %><jalios:buffer name='LIST_ITEM_META_PREPEND'><%= post.getWFStateLabelHtml(userLang) %>&nbsp;</jalios:buffer><% } %><%
%></jalios:dataListItem>