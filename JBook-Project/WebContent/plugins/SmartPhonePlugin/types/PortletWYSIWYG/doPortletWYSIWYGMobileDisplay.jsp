<%@ include file="/plugins/SmartPhonePlugin/jsp/components/portlet/doInitPortlet.jspf" %><%
%><% PortletWYSIWYG box = (PortletWYSIWYG) portlet;  %><%--
--%><jalios:if predicate='<%= Util.notEmpty(box.getWysiwyg(userLang)) %>'><%--
	 --%><div class="wysiwyg-mobile-wrapper"><jalios:wysiwyg><%= box.getWysiwyg(userLang) %></jalios:wysiwyg></div><%--
--%></jalios:if>