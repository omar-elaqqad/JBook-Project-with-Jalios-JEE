<%@page import="com.jalios.jcms.taglib.list.ListItemTag"%><%
%><%@page import="com.jalios.jcms.alert.AlertAppHandler"%><%
%><%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneManager"%><%
%><%@page import="com.jalios.jcms.alert.Alert"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/plugins/SmartPhonePlugin/jsp/components/list/doInitMobileDataListItem.jspf" %><%

SmartPhoneManager smartPhoneManager = SmartPhoneManager.getInstance();

Alert alert = (Alert) data;
// <SMARTPHONE-275: use alert.summary, else alert.description
// >SMARTPHONE-275: use alert.short-description, else alert.description
// >SMARTPHONE-404: use alert.title, no longer default to description
String descriptionHtml = alert.getTitle();
text = encodeForHTML(HtmlUtil.html2text(descriptionHtml));
css += " unwrap-text has-action";
css += " level-" + alert.getLevel();

link = "plugins/SmartPhonePlugin/jsp/core/alertDetail.jsp?alertId=" + alert.getId();

Map<String, String> actionParams = new HashMap<String, String>();
if (alert.isRead()) {
  actionParams.put(AlertAppHandler.PARAM_ALERTS, alert.getId());
  actionParams.put(AlertAppHandler.OP_UNREAD, "true");
  actionParams.put("alertReadMode", "read");
} else {
  actionParams.put(AlertAppHandler.PARAM_ALERTS, alert.getId());
  actionParams.put(AlertAppHandler.OP_READ, "true");  
}
%>
<jalios:listItem 
        css="<%= css %>"
        dataAttribute="<%= dataAttribute %>"
        icon=""
        link="<%= link %>"
        linkCss="<%= linkCss %>"
        linkDataAttribute="<%= linkDataAttribute %>"
        template="jmobile-detailed"
        text="<%= text %>"><%
  %>
  <jalios:buffer name='LIST_ITEM_META'><%
  String meta = getIncludeString(ListItemTag.BUFFER_LIST_ITEM_META, "");
  String appendMeta = getIncludeString(ListItemTag.BUFFER_LIST_ITEM_META_APPEND, "");
  String prependMeta = getIncludeString(ListItemTag.BUFFER_LIST_ITEM_META_PREPREND, "");
  if (Util.isEmpty(meta)) {
    %><%= prependMeta %><%
    %><%@ include file="/front/list/doDataListItemDate.jspf" %><%
    %> <% if (data.getAuthor() != null) { %>&middot;<% } %> <jalios:memberphoto resource="memberphoto-phone" member="<%= alert.getAuthor() %>" size="<%= PhotoSize.ICON %>" /> <%= data.getAuthor() != null ? data.getAuthor().getFullName() : ""  %><%
    %><%= appendMeta %><%
  } else {
    %><%= meta %><%
  }
%></jalios:buffer>
	<% if (channel.isDataWriteEnabled()) { %>
		<jalios:buffer name="LIST_ITEM_ACTIONS">
			<a href="#" title="<%= alert.isRead() ? glp("jcmsplugin.smartphone.lbl.alert.unread") : glp("jcmsplugin.smartphone.lbl.alert.mark-read") %>" class="ajax-refresh list-item-action-link" data-jalios-ajax-action="plugins/SmartPhonePlugin/jsp/core/alertBody.jsp" data-jalios-ajax-params='<%= smartPhoneManager.getJsonString(actionParams) %>'>
	      <jalios:icon src='<%= alert.isRead() ? "jcmsplugin-smartphone-alert-unread" : "jcmsplugin-smartphone-alert-read" %>' />
	    </a>
		</jalios:buffer>
	<% } %>
</jalios:listItem>
