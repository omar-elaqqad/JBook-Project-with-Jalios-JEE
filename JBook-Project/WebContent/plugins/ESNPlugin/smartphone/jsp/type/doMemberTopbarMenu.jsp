<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%
%><%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneManager"%><%
%><%@page import="com.jalios.jcmsplugin.smartphone.SmartPhonePortalPolicyFilter"%><%
%><%@page import="com.jalios.jcms.recommendation.RecommendationManager"%><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/doInitMemberProfile.jspf' %><%

String uniqueId = ServletUtil.generateUniqueDOMId(request, "topbarPublicationMenu"); 
%>
<div class="topbar-actions topbar-item topbar-right" data-role="none">
  <a class="topbar-actions topbar-item" href="#<%= uniqueId %>" data-rel="popup" data-transition="slideup">
    <jalios:icon src="smartphone-topbar-action-menu" />
  </a>
</div>
<div data-role="popup" id="<%= uniqueId %>" data-theme="a" class="topbar-menu-dropdown">
  <ul data-role="listview" data-inset="true" style="min-width:210px;">
    <jalios:include target="SMARTPHONE_TOPBAR_MEMBER_ACTIONS_TOP" targetContext="LI" />
    <jalios:include target="SMARTPHONE_TOPBAR_MEMBER_ACTIONS_BOTTOM" targetContext="LI" />
    <%-- Add to address book --%>
    <li><a data-jalios-member-id="<%= member.getId() %>" class="js-export-contact" id="linkExportContact" data-role="button" data-ajax="false" href="plugins/SmartPhonePlugin/jsp/smartPhoneVcard.jsp?mid=<%= member.getId() %>"><jalios:icon src="smartphone-member-vcard" /> <%= glp("jcmsplugin.smartphone.lbl.member.add-to-address-book") %></a></li>
    <%-- Recommend --%>
    <% if (RecommendationManager.getInstance().canBeRecommendedBy(member, loggedMember)) { %>
    <li><a data-ajax="false" href="plugins/SmartPhonePlugin/jsp/action/recommendation.jsp?recommendedDataId=<%= member.getId() %>"><jalios:icon src="smartphone-recommend" /> <%= glp("ui.recommendation") %></a></li>
    <% } %>    
    <%-- Access website --%>
    <li><a data-ajax="false" href="<%= member.getDisplayUrl(userLocale) %>?<%= SmartPhonePortalPolicyFilter.FORCE_NO_SMARTPHONE_SESSION_ATTR %>" <%= SmartPhoneManager.getInstance().isMobileApp(request) ? "target=\"_blank\"" : "" %>><jalios:icon src="smartphone-access-website" /> <%= glp("jcmsplugin.smartphone.lbl.access-website") %></a></li>
    <jalios:include target="SMARTPHONE_TOPBAR_MEMBER_ACTIONS_BOTTOM_2" targetContext="LI" />
  </ul>
</div>
