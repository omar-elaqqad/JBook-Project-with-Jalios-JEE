<%-- 
  @Deprecated: False
  @Customizable: False
  @Requestable: True
  @Summary: Caddy popin
  @Category: Presentation / Popup
--%>
<%@ include file='/jcore/doInitPage.jspf' %>  
<jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.caddy.CaddyPopinHandler">
  <jsp:setProperty name="formHandler" property="pageContext" value="<%= pageContext %>"/>
  <jsp:setProperty name="formHandler" property="*" />
</jsp:useBean>
<%
  if (formHandler.validate()) {
    return;
  }
  // Read zone before update
  boolean isAdminZone = jcmsContext.isAdminZone();
  request.setAttribute("zone", "Public");
  if (trace != null) {
    trace.put("zone", request.getAttribute("zone"));
  }
  request.setAttribute("title", glp("ui.work.mn.caddy"));

  Caddy  caddy = Caddy.getCaddy(request);
  Class  dataClass = formHandler.getDataClass();
  String dataType = formHandler.getDataType();
  List   dataOrIdList = caddy.getList(dataClass);
  String caddyManagerJsp = "work/caddy/" + dataType.toLowerCase() + "CaddyManager.jsp";
  if (isAdminZone) {
    caddyManagerJsp += "?adminArea=true";
  } else {
    Workspace caddyWs = getWorkspaceParameter("ws");
    // If the member is not a worker of the specified workspace, use the favorite workspace (ie first workspace in which logged member is a worker)
    caddyWs = isLogged && (caddyWs == null || !loggedMember.isWorker(caddyWs)) ? loggedMember.getFavoriteWorkspace(caddyWs, null) : caddyWs;
    caddyManagerJsp += "?ws=" + JcmsUtil.getId(caddyWs);
  }
  
  // Special case for AllMemberQueryString, which may add both Member and DBMember (with dataClass=Member)
  boolean isAllMember = hasParameter("cadAllMemberQueryString"); 
  int dbMemberSize = isAllMember ? caddy.getDBMemberListSize() : 0;
  
  boolean couldManageCaddy = isLogged && loggedMember.isWorker();
  boolean manageButtonEnabled = couldManageCaddy && caddy.canManage(dataClass, loggedMember);
  boolean isEmpty = dataOrIdList.size() == 0 && dbMemberSize == 0;
  
  
  
  int totalCount = formHandler.getCaddyTotalCount();
%>
<div class="ajax-refresh-div" <%= untranslatedZoneAttribute %>>
  <jalios:javascript>
    var caddyCountBadge = jQuery(".topbar-caddy-count");
    var newCount = <%= totalCount %>;
    
    if (caddyCountBadge.exists()) {
      if (newCount === 0) {
        caddyCountBadge.addClass("hide");
      } else {
        caddyCountBadge.removeClass("hide");
        caddyCountBadge.html(newCount);
      }
    }
    
  </jalios:javascript>
  <% if (channel.getBooleanProperty("ui.caddy-popin.enabled", false)) { %>
  <div class="box caddy">
    <div class="box-body">
      <a href="#" class="close-btn"></a>
      <h3><%= formHandler.isCaddyUpdated() ? glp("ui.caddy-popin.updated") : glp("ui.work.mn.caddy") %></h3>
      <p>
      <%= isEmpty ? glp("ui.caddy-popin.is-empty") : glp("ui.caddy-popin.infos." + dataType.toLowerCase(), dataOrIdList.size()) %>
      <%= isAllMember && dbMemberSize != 0 ? "<br>" + glp("ui.caddy-popin.infos.dbmember", dbMemberSize) : "" %>
      </p>
   
		  <% if (!isEmpty) { %>
		  <div class="text-right">
		    <a href="work/caddy/printCaddy.jsp?dataType=<%= dataType %>" class="btn btn-default" target="_blank"><%= glp("ui.caddy-popin.print") %></a>
		    &nbsp;
		    <% if (manageButtonEnabled) { %>
		      <a href="<%= caddyManagerJsp %>" class="btn btn-primary" onclick="if (Popup.isInPopup() || Util.isInIFrame()) { this.target='_blank'; }"><%= glp("ui.caddy-popin.manage") %></a>
		    <% } %>
		  </div>
		  <% } %>
    </div>
  </div>
  <% } %>
  <div id="caddyPopinAjaxReplacements" style="display:none;">
<%
    String[] elmIds = getStringParameterValues("elmIds", "^[a-zA-Z0-9_\\-\\.]*$"); // HTML id
    if (elmIds != null) {
      for (String elmId : elmIds) {
        String action = getStringEnumParameter(elmId + "cadAction", null, CaddyPopinHandler.ALL_ACTIONS);
  
        TreeSet<Data> dataSet = getDataSetParameterValues(elmId + "cadIds", Data.class);
        Data data = (dataSet.size() == 1) ? dataSet.iterator().next() : null;
            
        String qs      = getUntrustedStringParameter(elmId + "cadQueryString", null);
        String grpQs   = getUntrustedStringParameter(elmId + "cadGroupQueryString", null);
        String mbrQs   = getUntrustedStringParameter(elmId + "cadMemberQueryString", null);
        String dbmbrQs = getUntrustedStringParameter(elmId + "cadDbMemberQueryString", null);
        String allMbrQs= getUntrustedStringParameter(elmId + "cadAllMemberQueryString", null);
        String wsQs    = getUntrustedStringParameter(elmId + "cadWorkspaceQueryString", null);
  
        boolean checkPstatus = getBooleanParameter(elmId + "cadCheckPstatus", false);
        boolean displayLinkText = getBooleanParameter(elmId + "cadDisplayLinkText", false);
        
        String css = getUntrustedStringParameter(elmId + "cadCss", null);
        String icon = getUntrustedStringParameter(elmId + "cadIcon", null);
        String iconOut = getUntrustedStringParameter(elmId + "cadIconOut", null);
        
      %><div id="<%= encodeForHTMLAttribute(elmId) %>Replacement"><jalios:caddy 
          action='<%= action %>'
          
          data='<%= data %>'
          collection='<%= dataSet %>'
          
          queryString='<%= qs %>'
          groupQueryString='<%= grpQs %>'
          memberQueryString='<%= mbrQs %>'
          dbMemberQueryString='<%= dbmbrQs %>'
          allMemberQueryString='<%= allMbrQs %>'
          workspaceQueryString='<%= wsQs %>'
  
          checkPstatus='<%= checkPstatus %>'
          displayLinkText='<%= displayLinkText %>'
          
          css='<%= css %>'
          icon='<%= icon %>'
          iconOut='<%= iconOut %>'
  
      /></div><%
      }
    }
%>
  </div>
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>