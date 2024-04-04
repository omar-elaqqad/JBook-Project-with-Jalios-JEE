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
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.jstore.jsync.*" %><%

  if (!checkAccess("admin/monitoring/db-info")) {
    sendForbidden(request, response);
    return;
  }

request.setAttribute("dbInfoSubAdminMenu", "true"); 

HibernateManager hibernateMgr = HibernateManager.getInstance();

List<Class> classList = new ArrayList();
classList.add(DBData.class);
classList.add(Data.class);
classList.add(Publication.class);
classList.add(UserContent.class);
classList.add(Form.class);

List<Class> subClassList = new ArrayList();
for(Iterator it = hibernateMgr.getConfiguration().getClassMappings(); it.hasNext();) {
  org.hibernate.mapping.PersistentClass itPersistentClass = (org.hibernate.mapping.PersistentClass)it.next();
  subClassList.add(itPersistentClass.getMappedClass());
}
Collections.sort(subClassList, channel.getTypeLabelComparator(userLang));
classList.addAll(subClassList);

DerbyManager derbyMgr = DerbyManager.getInstance();

int counter = 0;

%><%@ include file='/admin/doAdminHeader.jspf' %>
  <div class="page-header"><h1><%= glp("ui.adm.mn.info.db") %></h1></div>
           
<%-- TABS --%>
<ul class="nav nav-tabs nav-tabs-underlined is-left-aligned" role="tablist">
  <li class="active"><a href="#config" role="tab" data-toggle="tab" onclick="return false;"><%= glp("ui.adm.dbinfo.conf") %></a></li>
  <li><a href="#data" role="tab" data-toggle="tab" onclick="return false;"><%= glp("ui.adm.dbinfo.data") %></a></li>
</ul>


<div class="tab-content">

  <%-- CONFIGURATION --%>
  <% counter = 0; %>
  <div class="tab-pane active" id="config">
    <table class="table-data is-auto">
      <%-- jcmsdb --%>
      <tr> 
        <th class="nowrap" scope="row"><%= glp("ui.adm.dbinfo.conf.rdbms") %></th>
        <td>
          <% String jcmsdb = channel.getProperty("channel.jcmsdb", ""); %>
          <%= glp("ui.adm.prop.db.jcmsdb.rdbms." + jcmsdb) %><br/>
          <% if ("derby".equals(jcmsdb)) { %>
          <a href="admin/derbyInfo.jsp" onclick='return Popup.popupWindow(this.href, "Derby Info", 800, 600, "", true);'><%= glp("ui.adm.dbinfo.conf.derby.info") %></a>
          <% } %>
        </td>
      </tr>
      <% if (hibernateMgr.isJDBCConnection()) { %>
      <%-- URL --%>
      <tr> 
        <th class="nowrap" scope="row"><%= glp("ui.adm.dbinfo.conf.url") %></th>
        <td>
          <code><jalios:truncate length="50" suffix="..."><%= hibernateMgr.getConnectionUrl() %></jalios:truncate></code>
        </td>
      </tr>
      <%-- Driver --%>
      <tr> 
        <th class="nowrap" scope="row"><%= glp("ui.adm.dbinfo.conf.driver") %></th>
        <td><code><%= hibernateMgr.getConnectionDriver() %></code></td>
      </tr>
      <%-- Connection pool --%>
      <tr> 
        <th class="nowrap" scope="row"><%= glp("ui.adm.dbinfo.conf.connection-pool") %></th>
        <td>
          <% if (hibernateMgr.isConnectionPoolEnabled()) { %>
          <span class="label label-success"><%= glp("ui.com.txt.enabled") %></span>
          <% } else { %>
          <span class="label label-danger"><%= glp("ui.com.txt.disabled") %></span>
          <% } %>
        </td>
      </tr>
      <% } else { %>
      <%-- DataSource --%>
      <tr> 
        <th class="nowrap" scope="row"><%= glp("ui.adm.dbinfo.conf.datasource") %></th>
        <td><%= hibernateMgr.getConnectionDataSource() %></td>
      </tr>            
      <% } %>
      
      <%-- Dialect --%>
      <tr> 
        <th class="nowrap" scope="row"><%= glp("ui.adm.dbinfo.conf.dialect") %></th>
        <td><code><%= hibernateMgr.getDialect() %></code></td>
      </tr>
    
      <%-- 2nd Level Cache --%>
      <tr> 
        <th class="nowrap" scope="row"><%= glp("ui.adm.dbinfo.conf.second-level-cache") %></th>
        <td>
          <% if (hibernateMgr.isSecondLevelCacheEnabled()) { %>
          <span class="label label-success"><%= glp("ui.com.txt.enabled") %></span>
          <% } else { %>
          <span class="label label-danger"><%= glp("ui.com.txt.disabled") %></span>
          <% } %>
        </td>        
      </tr>
    
      <%-- Query Cache --%>
      <tr> 
        <th class="nowrap" scope="row"><%= glp("ui.adm.dbinfo.conf.query-cache") %></th>
        <td>
          <% if (hibernateMgr.isQueryCacheEnabled()) { %>
          <span class="label label-success"><%= glp("ui.com.txt.enabled") %></span>
          <% } else { %>
          <span class="label label-danger"><%= glp("ui.com.txt.disabled") %></span>
          <% } %>
        </td>        
      </tr>
    
      <% if (derbyMgr.isServerStarted()) { %>
      <%-- Derby > Port --%>
      <tr> 
        <th class="nowrap" scope="row"><%= glp("ui.adm.dbinfo.conf.derby.port") %></th>
        <td><%= derbyMgr.getServerPort() %></td>
      </tr>
    
      <%-- Derby > Backup --%>
      <tr> 
        <th class="nowrap" scope="row"><%= glp("ui.adm.dbinfo.conf.derby.backup") %></th>
        <td>
          <% if (!derbyMgr.isBackupEnabled()) { %>
          <%= glp("ui.adm.dbinfo.conf.derby.no-backup") %>
          <% } else { %>
          <%= derbyMgr.getBackupSchedule() %>
          <% } %>
        </td>
      </tr>
      <% } %>
    
    </table>
  </div>


  <%-- DB DATA --%>
  <% counter = 0; %>
  <div class="tab-pane" id="data">
    <table class="table-data is-auto">
      <thead>
        <tr> 
          <th ><%= glp("ui.adm.dbinfo.data") %></th>
          <th ><%= glp("ui.adm.type-list.lbl.name") %></th>
          <th ><%= glp("ui.adm.dbinfo.data.count") %></th>
          <th ><%= glp("ui.adm.dbinfo.data.count-exact") %></th>
        </tr>
      </thead>
      
      <tbody>
        <jalios:foreach collection="<%= classList %>" name="itClass" type="Class">
        <tr> 
          <td nowrap="nowrap"><%= channel.getTypeLabel(itClass, userLang) %></code></td>
          <td nowrap="nowrap"><code><%= Util.getClassShortName(itClass) %></code></td>
          <td class="text-right"><%= HibernateUtil.queryCount(itClass) %></td>
          <td class="text-right">
          <% 
          try { 
            int exactCount = HibernateUtil.queryCountExact(itClass);%>
            <%= exactCount %><%
          } catch (Exception ex) { %> 
            <span style="color:#AAAAAA">N/A</span> 
          <% } %>               
          </td>
        </tr>
        <% if (itClass == Form.class) {%>
        <tr> <td colspan="4"></td></tr>
        <% } %>
        </jalios:foreach>
      </tbody>
    </table> 
  </div>
</div>
<%@ include file='/admin/doAdminFooter.jspf' %> 