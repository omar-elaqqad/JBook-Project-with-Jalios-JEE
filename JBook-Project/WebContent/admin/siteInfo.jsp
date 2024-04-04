<%--
  @Summary: Display information about the site
  @Category: Admin / Channel
  @Author: Oliver Dedieu
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-5.5
--%><%
%><%@ page import="com.jalios.jcms.quota.*" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.jstore.jsync.*" %><%

  if (!checkAccess("admin/monitoring/site-info")) {
    sendForbidden(request, response);
    return;
  }

request.setAttribute("siteInfoSubAdminMenu", "true"); 

com.jalios.jstore.LoadReport loadReport = channel.getStoreLoadReport(); 
int counter = 0;

long freeMemory = Runtime.getRuntime().freeMemory();
long totalMemory = Runtime.getRuntime().totalMemory();
String usedMemoryStr = Util.formatFileSize(totalMemory-freeMemory, userLocale); 
String totalMemoryStr = Util.formatFileSize(totalMemory, userLocale); 
int percentMemory = (int)((totalMemory-freeMemory) * 100 / totalMemory);
boolean showCSLimit = PluginManager.getPluginManager().getPlugin("CollaborativeSpacePlugin") != null;
LimitController limitController = channel.getLimitController();
%><%@ include file='/admin/doAdminHeader.jspf' %><%
%><%@ include file='/jcore/doMessageBox.jspf' %>

<div class="page-header"><h1><%= glp("ui.adm.mn.info.site") %></h1></div>

<%-- TABS --%>
<ul class="nav nav-tabs nav-tabs-underlined is-left-aligned" role="tablist">
  <li class="active"><a href="#jplatform" role="tab" data-toggle="tab" onclick="return false;"><%= glp("ui.adm.ch-status.ch.jcms.title") %></a></li>
  <li><a href="#server" role="tab" data-toggle="tab" onclick="return false;"><%= glp("ui.adm.ch-status.ch.system.title") %></a></li>
  <li><a href="#sessions" role="tab" data-toggle="tab" onclick="return false;"><%= glp("ui.adm.ch-status.ch.st.title") %></a></li>
</ul>

<div class="tab-content">

  <%-- JPLATFORM INFO --%>
  <% counter = 0; %>
  <div class="tab-pane active" id="jplatform">
    <table class="table-data is-auto">
      <tr> 
        <th class="nowrap" scope="row"><%= glp("ui.adm.ch-status.ch.jcms.last") %></th>
        <td class="numeric">
          <% Date lastRestartDate = (Date)getServletConfig().getServletContext().getAttribute("channelLastRestart"); %> 
          <jalios:date date='<%= lastRestartDate %>'/> - <jalios:time date='<%= lastRestartDate %>'/><br>
          (<jalios:duration begin='<%= lastRestartDate%>' end='<%= new Date() %>'/>) 
        </td>
      </tr>
      <tr> 
        <th class="nowrap" scope="row"><%= glp("ui.adm.ch-status.ch.jcms.database") %></th>
        <td class="numeric">
          <% String jcmsdb = channel.getProperty("channel.jcmsdb", ""); %>
          <%= glp("ui.adm.prop.db.jcmsdb.rdbms." + jcmsdb) %><br/>
          <% HibernateManager hibernateMgr = HibernateManager.getInstance(); %>
          <% if (hibernateMgr.isJDBCConnection()) { %>
          <jalios:truncate length="50" suffix="..."><%= hibernateMgr.getConnectionUrl() %></jalios:truncate>
          <% } else { %>
          <jalios:truncate length="50" suffix="..."><%= hibernateMgr.getConnectionDataSource() %></jalios:truncate>
          <% } %>
          <br>
          <% DatabaseInfo dbInfo = hibernateMgr.getDatabaseInfo(); %>
          <% if (dbInfo != null) { %>
          <%= dbInfo.getProductName() %> <%= dbInfo.getProductVersion() %>
          <% } %>
        </td>
      </tr>
      <tr> 
        <th class="nowrap" scope="row"><%= glp("ui.adm.ch-status.ch.jcms.smtp") %></th>
        <td class="numeric">
          <% if (!channel.isMailEnabled()) { %>
            <span class="label label-danger"><%= glp("ui.com.txt.disabled") %></span>
          <% } else { %>
            <%= channel.getProperty("mail.smtp.host", "") %>
          <% } %>
        </td>
      </tr>
      <tr> 
        <th class="nowrap" scope="row"><%= glp("ui.adm.ch-status.ch.jcms.ldap") %></th>
        <td class="numeric">
          <% if (!channel.isLdapEnabled()) { %>
            <span class="label label-danger"><%= glp("ui.com.txt.disabled") %></span>
          <% } else { %>
            <%= channel.getProperty("ldap.server.hostname", "") %>
          <% } %>
        </td>
      </tr>
      <tr> 
        <th class="nowrap" scope="row"><%= glp("ui.adm.ch-status.ch.jcms.jsync") %></th>
        <td class="numeric">
          <% if (!channel.isJSyncEnabled()) { %>
          <span class="label label-danger"><%= glp("ui.com.txt.disabled") %></span>
          <% } else { %>
            <% JSyncReplica replica = channel.getJSyncReplica(); %>
            URID: <%= channel.getUrid() %><br />
            <% if (replica.isLeader()) { %>
            JSync Leader (<%= replica.getReplicaMap().size() %> replicas connected)<br />
            <% } %>
            <% if (replica.isJoined()) { %>
            Connected to JSync Leader <%= replica.getLeader().getUrid() %><br />
            (<%= replica.getLeader().getUrl() %>)
            <% } else { %>
            Not yet connected to a JSync Leader
            <% } %>  
            <br /><a href='admin/jsync/jsync.jsp'><%= glp("ui.com.txt.details") %></a>
          <% } %>
        </td>
      </tr>
      <tr> 
        <th class="nowrap" scope="row"><%= glp("ui.com.lbl.datasource") %></th>
        <td class="numeric">
          <jalios:foreach collection='<%= DBUtil.getDataSourceMap().keySet() %>' type='String' name='itDataSource'>
          <%= itDataSource %><br/>
          </jalios:foreach>
        </td>
      </tr>
      <tr> 
        <th class="nowrap" scope="row"><%= glp("ui.adm.ch-status.ch.jcms.workspace") %></th>
        <td class="numeric"><%= WorkspaceManager.getNonCollaborativeWorkspaceCount() %> / <%= limitController.getWorkspaceLimit() == Integer.MAX_VALUE ? glp("ui.adm.ch-status.ch.jcms.nolimit") : (""+limitController.getWorkspaceLimit()) %></td>
      </tr>
      <% if (showCSLimit) { %>
      <tr> 
        <th class="nowrap" scope="row"><%= glp("ui.adm.ch-status.ch.jcms.cs") %></th>
        <td class="numeric"><%= WorkspaceManager.getCollaborativeSpaceCount() %> / <%= limitController.getCollaborativeSpaceLimit() == Integer.MAX_VALUE ? glp("ui.adm.ch-status.ch.jcms.nolimit") : (""+limitController.getCollaborativeSpaceLimit()) %></td>
      </tr>
      <% } %>
      <tr> 
        <th class="nowrap" scope="row"><%= glp("ui.adm.ch-status.ch.jcms.member") %></th>
        <td class="numeric"><%= limitController.getActiveMemberCount() %> / <%= limitController.getMemberLimit() == Integer.MAX_VALUE ? glp("ui.adm.ch-status.ch.jcms.nolimit") : (""+limitController.getMemberLimit()) %></td>
      </tr>
      <tr> 
        <th class="nowrap" scope="row"><%= glp("ui.adm.ch-status.ch.jcms.dbmember") %></th>
        <td class="numeric"><%= limitController.getActiveDBMemberCount() %> / <%= limitController.getDBMemberLimit() == Integer.MAX_VALUE ? glp("ui.adm.ch-status.ch.jcms.nolimit") : (""+limitController.getDBMemberLimit()) %></td>
      </tr>
      <tr> 
        <th class="nowrap" scope="row"><%= glp("ui.adm.ch-status.ch.jcms.guest") %></th>
        <td class="numeric"><%= limitController.getGuestCount() %> / <%= limitController.getGuestLimit() == Integer.MAX_VALUE ? glp("ui.adm.ch-status.ch.jcms.nolimit") : (""+limitController.getGuestLimit()) %></td>
      </tr>
      <tr> 
        <th class="nowrap" scope="row"><%= glp("ui.adm.ch-status.ch.jcms.document") %></th>
        <td class="numeric"><%= channel.getDataCount(DBFileDocument.class) %> / <%= limitController.getDBFileDocumentLimit() == Integer.MAX_VALUE ? glp("ui.adm.ch-status.ch.jcms.nolimit") : (""+limitController.getDBFileDocumentLimit()) %></td>
      </tr>
      <tr> 
        <th class="nowrap" scope="row"><%= glp("ui.adm.ch-status.ch.jcms.lang") %></th>
        <td class="numeric"><%= channel.getLanguageList().size() %> / <%= limitController.getLanguageLimit() == Integer.MAX_VALUE ? glp("ui.adm.ch-status.ch.jcms.nolimit") : (""+limitController.getLanguageLimit()) %></td>
      </tr>
    <% 
    QuotaManager mgr = QuotaManager.getInstance();
    Map<Workspace, QuotaElement> elements = mgr.getElements();
    QuotaElement siteElement = elements.get(null);
    long size = 0L;
    long maxQuotaValue = 0L;
    if(siteElement != null){
      size = siteElement.getQuota();
      maxQuotaValue = siteElement.getQuotaMaxValue();
    } 
    int nbWorkspaces = Util.getSize(elements) -1;
    int nbWorkspaceInAlert = 0;
    if(elements  != null){
      for(QuotaElement elt : elements.values()){
        if(elt == null || elt.getWorkspace() == null){
          continue;
        }
        if(elt.isAlert()){
          nbWorkspaceInAlert ++;
        }
      }
    }
    %>
      <tr> 
        <th class="nowrap" scope="row"><% /* %>Site quota<% */ %><%= glp("ui.adm.ch-status.ch.jcms.site-quota") %></th>
        <% if( siteElement == null ){%>
         <td class="numeric"><%=glp("ui.adm.data-report.inprogress") %></td>
        <%}else{ %>
        <td class="numeric"><%= Util.formatFileSize(size, userLocale) +" / "+Util.formatFileSize(maxQuotaValue, userLocale)%></td>
        <%} %>
      </tr>          
      <tr> 
        <th class="nowrap" scope="row"><% /* %>WorkspacesQuota<% */ %><%= glp("ui.adm.ch-status.ch.jcms.workspaces-quota") %></th>
        <td class="numeric"><%= nbWorkspaceInAlert %> / <%= nbWorkspaces %></td>
      </tr>          
    </table>

  </div>
  
  <%-- SERVER INFO --%>
  <% counter = 0; %>
  <div class="tab-pane" id="server">
    <table class="table-data is-auto">
      <tr> 
        <th class="nowrap" scope="row"><%= glp("ui.adm.ch-status.ch.jcms.ver") %></th>
        <td><%= channel.getJcmsInfo().getVersion() %></td>
      </tr>
      <tr> 
        <th class="nowrap" scope="row"><%= glp("ui.adm.ch-status.ch.jcms.build") %></th>
        <td><%
          Map<String, String> buildMap =  channel.getJcmsInfo().getBuildPropertiesMap();
          if(Util.isEmpty(buildMap)){
            %><%= glp("ui.adm.ch-status.ch.jcms.build-missing-file") %><%
          }
          else{
            for(Map.Entry<String, String> entry : buildMap.entrySet()){
              %><%= entry.getKey().replaceFirst("build.", "") %> : <%= entry.getValue() %><br/><%    
            }
          }
        %>
      </tr>
      <tr> 
        <th class="nowrap" scope="row"><%= glp("ui.adm.ch-status.ch.system.appsrv") %></th>
        <td><%= getServletConfig().getServletContext().getServerInfo() %></td>
      </tr>
      <tr> 
        <th class="nowrap" scope="row"><%= glp("ui.adm.ch-status.ch.system.jvm") %></th>
        <td>
           <%= System.getProperty("java.vm.name") %> (<%= System.getProperty("java.vm.version") %>)<br />
           <%= System.getProperty("java.vm.vendor") %><br />
           <%= glp("ui.adm.ch-status.mem.total") %> <%= totalMemoryStr %> - 
           <%= glp("ui.adm.ch-status.mem.used") %> <%= usedMemoryStr %> (<%= percentMemory %>%)
        </td>
      </tr>
      <tr> 
        <th class="nowrap" scope="row"><%= glp("ui.adm.ch-status.ch.system.os") %></th>
        <td>
          <%= System.getProperty("os.name") %> <%= System.getProperty("os.version") %> (<%= System.getProperty("os.arch") %>)<br />
        </td>
      </tr>
      <tr> 
        <th class="nowrap" scope="row"><%= glp("ui.adm.ch-status.ch.paths.java") %></th>
        <td><code><%= System.getProperty("java.home") %></code></td>
      </tr>
      <tr> 
        <th class="nowrap" scope="row"><%= glp("ui.adm.ch-status.ch.paths.tmpdir") %></th>
        <td><code><%= System.getProperty("java.io.tmpdir") %></code></td>
      </tr>
      <tr> 
        <th class="nowrap" scope="row"><%= glp("ui.adm.ch-status.ch.paths.webapp") %></th>
        <td><code><%= channel.getWebappPath() %></code></td>
      </tr>
      <tr> 
        <th class="nowrap" scope="row"><%= glp("ui.adm.ch-status.ch.system.net") %></th>
        <td>
          <%
            for (Enumeration niEnum = NetworkInterface.getNetworkInterfaces(); niEnum.hasMoreElements() ;) {
              NetworkInterface ni = (NetworkInterface) niEnum.nextElement();
          %>
            <%= ni.getName() %> : <%
               for (Enumeration inetAddrEnum = ni.getInetAddresses(); inetAddrEnum.hasMoreElements() ;) {
                 InetAddress inetAddr = (InetAddress) inetAddrEnum.nextElement();
               %><%= inetAddr.getHostAddress() %><%= inetAddrEnum.hasMoreElements() ? ", " : "" %>
            <% } %>
            <%= niEnum.hasMoreElements() ? "<br />" : "" %>
          <% } %>
        <br />
        </td>
      </tr>
    </table>  
  </div>
  
  <%-- SESSION INFO --%>
  <% counter = 0; %>
  <div class="tab-pane" id="sessions">
    <table class="table-data is-auto">
      <tr> 
        <th class="nowrap" scope="row"><a href="admin/memberList.jsp?sort=session" ><%= glp("ui.adm.ch-status.ch.st.logged") %></a></th>
        <td class="numeric"><%= JcmsSessionTracker.getLoggedMemberSet().size() %></td>
      </tr>
      <tr> 
        <th class="nowrap" scope="row"><%= glp("ui.adm.ch-status.ch.st.sess") %></th>
        <td class="numeric"><%= JcmsSessionTracker.getAllSessionCount() %></td>
      </tr>
      <tr> 
        <th class="nowrap" scope="row">&nbsp;&nbsp;<%= glp("ui.adm.ch-status.ch.st.log-sess") %></th>
        <td class="numeric"><%= JcmsSessionTracker.getLoggedSessionCount()%></td>
      </tr>
      <tr> 
        <th class="nowrap" scope="row">&nbsp;&nbsp;<%= glp("ui.adm.ch-status.ch.st.unk-sess") %></th>
        <td class="numeric"><%= JcmsSessionTracker.getUnauthenticatedCount() %></td>
      </tr>
      <tr> 
        <th class="nowrap" scope="row">&nbsp;&nbsp;&nbsp;&nbsp;<%= glp("ui.adm.ch-status.ch.st.unk-sess-nonrobot") %></th>
        <td class="numeric"><%= JcmsSessionTracker.getUnauthenticatedNonRobotCount() %></td>
      </tr>
      <tr> 
        <th class="nowrap" scope="row">&nbsp;&nbsp;&nbsp;&nbsp;<%= glp("ui.adm.ch-status.ch.st.unk-sess-robot") %></th>
        <td class="numeric"><%= JcmsSessionTracker.getUnauthenticatedRobotCount() %></td>
      </tr>
      <tr> 
        <th class="nowrap" scope="row"><%= glp("ui.adm.ch-status.ch.st.timeout") %></th>
        <td class="numeric"><jalios:duration time="<%= request.getSession().getMaxInactiveInterval() * 1000 %>"/></td>
      </tr>
    </table>
  </div>
</div>
  
<div class="buttons">
  <% if (channel.getAppServerInfo().isRestartSupported()) { %> 
  <button class="btn btn-danger" 
          onclick="confirmAction('<%= encodeForJavaScript(glp("msg.js.confirm")) %>', '<%= contextPath %>/admin/restart.jsp?redirect=admin/siteInfo.jsp');" 
          type="button"><%= glp("ui.com.btn.restart") %></button>
  <% } %>
  
  <% if (JcmsUtil.isAuthorizedToAccessStatusInfo(getServletConfig().getServletContext(), request)) {  %>  
    <a href="admin/statusXml.jsp" class="btn btn-default" target="_blank"><%= glp("ui.adm.ch-status.xml") %></a></span>
  <% } %>
</div>
  

<%@ include file='/admin/doAdminFooter.jspf' %> 