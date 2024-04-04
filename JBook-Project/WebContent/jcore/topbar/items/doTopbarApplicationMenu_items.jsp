<%@page import="com.jalios.jcms.uicomponent.topbar.TopbarManager"%>
<%@page import="com.jalios.jcms.uicomponent.topbar.TopbarApplicationItem"%>
<%@ include file="/jcore/doInitPage.jspf" %>
<jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.uicomponent.topbar.TopbarHandler">
  <jsp:setProperty name="formHandler" property="request" value="<%= request %>" />
  <jsp:setProperty name="formHandler" property="response" value="<%= response %>" />
  <jsp:setProperty name="formHandler" property="*" />
</jsp:useBean>

<%
WebAssetsUtils.addScrollbarWebAssets(jcmsContext);
jcmsContext.addJavaScript("js/jalios/core/components/jalios-topbar-application.js");

Set<TopbarApplicationItem> mbrAppSet = formHandler.getFavoriteMemberApps();
Set<TopbarApplicationItem> globalAppSet =  formHandler.getGlobalMemberApps();

if(Util.isEmpty(mbrAppSet)){
  mbrAppSet = globalAppSet;
  globalAppSet = Collections.EMPTY_SET;
}
%>

<%-- MEMBER ITEMS --%>
<div class="topbar-application-item-inner">
  <div class="topbar-application-item-wrapper topbar-application-item-mbr">
  <% for (TopbarApplicationItem itApplication : mbrAppSet) { %>
		<%@ include file="/jcore/topbar/items/doTopbarApplicationMenu_item.jspf" %>
  <% } %>
  </div>
  <div class="topbar-application-item-wrapper topbar-application-item-mbr-clone"></div>
 </div>
 
<%-- GLOBAL ITEMS --%>
 <div class="topbar-application-item-inner-global">
   <div class="topbar-application-item-wrapper topbar-application-item-global">
	<% for (TopbarApplicationItem itApplication : globalAppSet) { %>
    <%@ include file="/jcore/topbar/items/doTopbarApplicationMenu_item.jspf" %>
  <% } %>
  </div>
  <div class="topbar-application-item-wrapper topbar-application-item-global-clone"></div>
</div>
<%@ include file="/jcore/doAjaxFooter.jspf" %>