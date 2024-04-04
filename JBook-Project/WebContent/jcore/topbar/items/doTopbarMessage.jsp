<%@page import="com.jalios.jcms.quota.QuotaElement"%>
<%@page import="com.jalios.jcms.quota.QuotaManager"%>
<%@ page import="com.jalios.jcms.quota.*" %>
<%@ include file='/jcore/topbar/items/doInitTopbarItem.jspf' %>

<jalios:buffer name="topbarMessage">
  <%-- WARNINGS --%>
  <% QuotaElement quotaElt = QuotaManager.getInstance().getChannelQuotaAlert(); 
  if(loggedMember == null || !loggedMember.isAdmin()){
    quotaElt = null;
  }
  if(loggedMember != null && workspace != null && (loggedMember.isAdmin(workspace) || loggedMember.isWorker(workspace))){
    QuotaElement workspaceQuotaElt = workspace.getQuotaAlert();
    if(workspaceQuotaElt != null && quotaElt == null){
      quotaElt = workspaceQuotaElt;
    }
  }
  %>
  <% if (!channel.isDataWriteEnabled()) { %>  
  <li class="topbar-warning-datawrite">
    <p><strong><%= glp("msg.data-disabled") %></strong></p>
    <jalios:message title="" dismissable="" level="<%= MessageLevel.WARN  %>">
      <%= glp("ui.adm.data-write.full-msg", Util.getString(channel.getProperty("channel.data-write.status"), glp("ui.adm.data-write.default-msg"))) %>
    </jalios:message>
  </li>
  <% } %> 
  <% if (quotaElt != null) { 
  	String message = "";
  	if(quotaElt.getWorkspace() != null){
  	  String target = channel.getUrl() + "work/wsDataReport.jsp?openTab=3&ws=" + quotaElt.getWorkspace().getId();
  	  String link = "<a href='"+ target +"'>"+quotaElt.getWorkspace().getTitle(userLang)+"</a>";
  	  message = glp("quota-manager.warning-ws", link, Util.formatFileSize(quotaElt.getQuota()),Util.formatFileSize(quotaElt.getQuotaMaxValue()));  	  
  	}
  	else{
  	  message = glp("quota-manager.warning", Util.formatFileSize(quotaElt.getQuota()),Util.formatFileSize(quotaElt.getQuotaMaxValue()));
  	}  
  %>  
  <li class="topbar-warning-quota<%= !channel.isDataWriteEnabled()?" sep":"" %>"><%=message  %></li>
  <% } %>
  <jalios:include target="WORK_TOPBAR_WARNING" targetContext="li" />
</jalios:buffer>

<% if (Util.notEmpty(topbarMessage)) { %>
<div class="dropdown dropdown-topbar topbar-warning-menu keep-open">
  <%-- TOPBAR ICON --%>
  <a href="#" id="topbar-warning-menu-opener" class="topbar-item" data-toggle="dropdown" onclick="return false;" aria-haspopup="true">
    <jalios:icon src="topbar-warning" css="topbar-warning-icon" />
    <span class="topbar-menu-label topbar-warning-label"><%= glp("msg.message-box.warning") %></span>
    <span class="ctx-caret-white ctx-caret"></span>
  </a>

  <div class="dropdown-menu topbar-warning-menu-dropdown topbar-menu topbar-default-menu" aria-labelledby="topbar-warning-menu-opener" >
    <div class="topbar-ctxmenu-body clearfix">
      <a class="js-close-menu" href="#" title="<%= encodeForHTMLAttribute(glp("ui.topbar.close-menu.title")) %>">
        <jalios:icon src="topbar-close-menu" />
      </a>
      <ul class="topbar-warning-list">
        <%= topbarMessage %>
      </ul>
    </div>
  </div>
</div>
<% } %>