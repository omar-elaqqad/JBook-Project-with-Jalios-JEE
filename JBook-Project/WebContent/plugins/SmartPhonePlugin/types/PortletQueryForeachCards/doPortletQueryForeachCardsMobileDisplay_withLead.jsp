<%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneManager"%>
<%@ include file="/plugins/SmartPhonePlugin/jsp/components/portlet/doInitPortlet.jspf" %><% 
PortletQueryForeachCards box = (PortletQueryForeachCards) portlet;
%><%@ include file="/plugins/SmartPhonePlugin/types/PortletQueryForeach/doInitPortletQueryForeach.jspf" %>
<jalios:cards resource="cards.jmobile" css="padded-content pqf-cards-with-lead pqf-cards-2x2">
  <jalios:foreach collection='<%= formHandler.getPageResult().getResultList() %>' type='Publication' name='itPub' skip="<%= 0 %>" max='<%= formHandler.getPortletPageSize() %>'>
    <% if (itCounter == 1) { %>
      <jalios:cardData css="is-image-16by9 is-borderless is-lead"  data="<%= itPub  %>" template="jmobile-lead">
        <jalios:buffer name="CARD_BOTTOM">
          <jalios:cardBlock css="card-block-abstract">
            <%= encodeForHTML(itPub.getAbstractAsText(userLocale)) %>
          </jalios:cardBlock>
        </jalios:buffer>
      </jalios:cardData>
    <% } else { %>
	    <jalios:cardData css="is-image-squared is-borderless" data="<%= itPub  %>" template="jmobile-light" />
    <% } %>
  </jalios:foreach>
</jalios:cards>