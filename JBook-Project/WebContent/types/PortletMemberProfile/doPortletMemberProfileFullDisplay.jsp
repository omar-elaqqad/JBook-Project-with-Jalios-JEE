<%@ include file='/jcore/doInitPage.jspf' %>
<%@ include file='/jcore/portal/doPortletParams.jspf' %>
<%@ page import="com.jalios.jcmsplugin.esn.*" %>
<%@ page import="com.jalios.jcms.calendar.*" %>

<% 
if (!isLogged) {
  request.setAttribute("ShowPortalElement" , Boolean.FALSE);    
  return;
}

ESNManager esnMgr = ESNManager.getInstance();

request.setAttribute("jcmsplugin.esn.member", loggedMember);
String editLabel = "[ " + glp("jcmsplugin.esn.lbl.editLabel") + " ]";

jcmsContext.addCSSHeader("plugins/ESNPlugin/css/esn.css");
jcmsContext.addCSSHeader("plugins/ESNPlugin/types/AbstractPortletSkinable/ESNSkin/esnSkin.css");

PortletMemberProfile box = (PortletMemberProfile)portlet;
%>


<div id="portlet-member-profile" class="esn">
  <% Member itMember = loggedMember; %>
  
  <%-- MEMBER STATUS --%>  
  <div class="member-info item-box-member">
    <%@ include file='/plugins/ESNPlugin/jsp/common/doMemberStatus.jspf' %>
  </div>
  
  <%-- SUGGESTIONS --%>
  <% if (box.getShowSuggestions()) { %>
    <jalios:buffer name="suggestionsBuffer">
    <% request.setAttribute("jcmsplugin.esn.showResetSuggestion", false); %>  
    <jsp:include page='/plugins/ESNPlugin/jsp/portlet/doSuggestions.jsp'/>
    <% request.removeAttribute("jcmsplugin.esn.showResetSuggestion"); %>
    </jalios:buffer>
  
    <% if (Util.notEmpty(suggestionsBuffer)) { %>
	  <ul class="nav nav-tabs">
	    <li class="active"><a href="#" onclick="return false;"><%= glp("jcmsplugin.esn.lbl.connections.suggestions") %></a></li>
	  </ul>
    <%= suggestionsBuffer %>
    <% } %>
  <% } %>

  <%-- CONNECTION REQUESTS --%>
  <% if (box.getShowConnectionRequests()) { %>
  <jsp:include page='/plugins/ESNPlugin/jsp/portlet/doConnectionRequests.jsp'/>
  <% } %>
  
</div>
<%
request.removeAttribute("skinTitle");
request.setAttribute("ShowPortalElement" , Boolean.TRUE); 
%>
