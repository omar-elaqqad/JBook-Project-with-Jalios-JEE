<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/plugins/SmartPhonePlugin/jsp/core/pub/actions/doInitPubActionItem.jspf" %><%

ServletUtil.backupAttribute(pageContext, "jcms.plugin.smartphone.actions.pub");
request.setAttribute("jcms.plugin.smartphone.actions.pub", pub);

%><jalios:include resource="smartphone.publication.action-item.recommend" /><%

ServletUtil.restoreAttribute(pageContext, "jcms.plugin.smartphone.actions.pub");
%>