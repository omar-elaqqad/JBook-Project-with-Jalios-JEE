<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/plugins/SmartPhonePlugin/jsp/components/list/doInitMobileDataListItem.jspf" %><%
%><jalios:listItem 
        css="<%= css %>"
        dataAttribute="<%= dataAttribute %>"
        icon="<%= icon %>"
        link="<%= link %>"
        linkCss="<%= linkCss %>"
        linkDataAttribute="<%= linkDataAttribute %>"
        template="jmobile"
        text="<%= text %>"><%
      %><%@ include file="/front/list/doDataListItemImage.jspf" %><%
      %><%@ include file="/plugins/SmartPhonePlugin/jsp/components/list/doDataListItemText.jspf" %><%
      %><%@ include file="/front/list/doDataListItemDetailedMeta.jspf" %><%
      %><%@ include file="/plugins/SmartPhonePlugin/jsp/components/list/doDataListItemActions.jspf" %><%
%></jalios:listItem>
