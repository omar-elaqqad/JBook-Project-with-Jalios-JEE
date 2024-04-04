<%--
  @Summary: Display information about the store
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

  if (!checkAccess("admin/monitoring/store-info")) {
    sendForbidden(request, response);
    return;
  }

request.setAttribute("storeInfoSubAdminMenu", "true"); 

com.jalios.jstore.LoadReport loadReport = channel.getStoreLoadReport(); 
int counter = 0;

%><%@ include file='/admin/doAdminHeader.jspf' %><%
%><%@ include file='/jcore/doMessageBox.jspf' %>
<div class="page-header"><h1><%= glp("ui.adm.mn.info.store") %></h1></div>

<%-- TABS --%>
<ul class="nav nav-tabs nav-tabs-underlined is-left-aligned" role="tablist">
  <li class="active"><a href="#info" role="tab" data-toggle="tab" onclick="return false;"><%= glp("ui.adm.ch-status.st.title") %></a></li>
  <li><a href="#milestone" role="tab" data-toggle="tab" onclick="return false;"><%= glp("ui.adm.ch-status.st.ms") %></a></li>
  <li><a href="#report" role="tab" data-toggle="tab" onclick="return false;"><%= glp("ui.adm.ch-status.tab.lr") %></a></li>
</ul>


<div class="tab-content">

  <%-- STORE INFO --%>
  <% counter = 0; %>
  <div class="tab-pane active" id="info">
    <table class="table-data is-auto">
      <tr> 
        <th class="nowrap" scope="row"><%= glp("ui.adm.ch-status.st.load") %></th>
        <td class="text-right" nowrap="nowrap">
          <jalios:duration time="<%= loadReport.getDuration() %>"/>
        </td>
      </tr>
      <tr> 
        <th class="nowrap" scope="row"><%= glp("ui.adm.ch-status.st.mem") %></th>
        <td class="text-right" nowrap="nowrap">
          <jalios:filesize size="<%= loadReport.getMemoryUsed() %>"/>
        </td>
      </tr>
      <tr> 
        <th class="nowrap" scope="row"><%= glp("ui.adm.ch-status.st.load-err") %></th>
        <td class="numeric"> 
          <b><a href="admin/loadReport.jsp" style='<%= loadReport.getErrorCount() > 0 ? "text-decoration: none; color: red" : "" %>'><%= glp("ui.adm.ch-status.st.errors", loadReport.getErrorCount()) %></b>
        </td>
      </tr>
      <tr> 
        <th class="nowrap" scope="row"><%= glp("ui.adm.ch-status.st.obj") %></th>
        <td class="numeric">
           <%= channel.getStoreSize() %><br /><br />
           <%= glp("ui.com.lbl.workspaces") %> : <%= Util.getSize(channel.getDataSet(Workspace.class)) %><br />
           <%= glp("ui.com.lbl.groups") %> : <%= Util.getSize(channel.getDataSet(Group.class)) %><br />
           <%= glp("ui.com.lbl.members") %> : <%= Util.getSize(channel.getDataSet(Member.class)) %><br />
           <%= glp("ui.com.lbl.categories") %> : <%= Util.getSize(channel.getDataSet(Category.class)) %><br />
           <%= glp("ui.com.lbl.publications") %> : <%= Util.getSize(channel.getDataSet(Publication.class)) %><br />
           <%= glp("ui.com.lbl.contents") %> : <%= Util.getSize(channel.getDataSet(Content.class)) %><br />
           <%= glp("ui.com.lbl.ugcs") %> : <%= Util.getSize(channel.getDataSet(UserContent.class)) %><br />
           <%= glp("ui.com.lbl.portalelements") %> : <%= Util.getSize(channel.getDataSet(PortalElement.class)) %><br />
           <%= glp("ui.com.lbl.forms") %> : <%= Util.getSize(channel.getDataSet(Form.class)) %><br />
        </td>
      </tr>
      <tr> 
        <th class="nowrap" scope="row"><%= glp("ui.adm.ch-status.st.create") %></th>
        <td class="numeric">
          <%= channel.getStoreCreateCount() %> (+<%= channel.getStoreCreateCount() - loadReport.getCreateCount()%>)
        </td>
      </tr>
      <tr> 
        <th class="nowrap" scope="row"><%= glp("ui.adm.ch-status.st.update") %></th>
        <td class="numeric">
          <%= channel.getStoreUpdateCount() %> (+<%= channel.getStoreUpdateCount() - loadReport.getUpdateCount() %>)
        </td>
      </tr>
      <tr> 
        <th class="nowrap" scope="row"><%= glp("ui.adm.ch-status.st.delete") %></th>
        <td class="numeric">
          <%= channel.getStoreDeleteCount() %> (+<%= channel.getStoreDeleteCount() - loadReport.getDeleteCount() %>)
        </td>
      </tr>
    </table>
    
    <%-- CLEAN --%>
    <% if (channel.getBooleanProperty("channel.dev-tools.enabled", true)){ %>
    <div class="buttons">
      <jalios:icon src='store-cleaner'  />&nbsp;<a href="admin/storeCleaner.jsp"><%= glp("ui.adm.mn.dev.store-cleaner") %></a>
    </div>
    <% } %>
  </div>
        

  <%-- MILESTONE ---------------------------------------------------------------- --%>
  <% counter = 0; %>
  <div class="tab-pane" id="milestone">

    <jalios:message msg="ui.adm.ch-status.st.ms.txt" dismissable="true" />
    
    <%-- ADD A MILESTONE --%>
    <div class="navbar navbar-default navbar-table-header">
      <div class="navbar-header">
        <span class="navbar-brand"><%= glp("ui.adm.ch-status.st.ms.list") %></span>
      </div>
      
      <form action="admin/appendMilestone.jsp" class="navbar-form navbar-left" name="msForm" method="post">
         <div class="form-group">               
           <input type="text" name="text" class="form-control" style="width: 300px;" placeholder="<%= glp("ui.adm.ch-status.st.ms.placeholder") %>">
           <button class='btn btn-danger modal confirm' type="submit" name="opMilestone" value='true' ><%= glp("ui.adm.ch-status.st.ms.btn") %></button>
         </div>
      </form>
    </div>
    
    <%-- MILESTONE LIST --%>
    <% 
    List milestoneList = new ArrayList(channel.getStore().getMilestoneList());
    Collections.reverse(milestoneList);
    %>
    <% if (Util.notEmpty(milestoneList)) { %>   
    <table class="table-data">
      <thead>
        <tr>
          <th class="fit nowrap"></th>
          <th class="fit nowrap"><%= glp("ui.com.lbl.date") %></th>
          <th width='expand'><%= glp("ui.com.lbl.title") %></th>
          <th class="fit nowrap"><%= glp("ui.com.lbl.stamp") %></th>
        </tr>
      </thead>

      <jalios:pager name="pager" declare="true" action="init" size="<%= milestoneList.size() %>"/>
      <tbody>    
        <jalios:foreach collection='<%= milestoneList %>' 
                        name='itEntry' 
                        type='com.jalios.jstore.LogEntry'
                        max="<%= pager.getPageSize() %>"
                        skip="<%= pager.getStart() %>"> 
          <tr >
            <td class="fit"><jalios:icon src='milestone' alt='milestone' /></td>
            <td class="fit nowrap"><%= itEntry.getAttributes().get("date") %></td>
            <td width='expand'><%= encodeForHTML(itEntry.getAttributes().get("text")) %></td>
            <td class="fit"><code><%= itEntry.getStamp() %></code></td>
          </tr>
        </jalios:foreach>
      </tbody>
    </table>
    <jalios:pager name="pager"/>
    
    <% } %>
  </div>


  <%-- ** LOAD REPORT ********************************** --%>
  <% counter = 0; %>
  <div class="tab-pane" id="report">
    <b><font face="Arial, Helvetica, sans-serif">Load info</font></b><br />
    Store file: <%= loadReport.getStoreFile() %><br />
      #op: <%= loadReport.getOpCount() %><br />
      #create: <%= loadReport.getCreateCount() %><br />
      #update: <%= loadReport.getUpdateCount() %><br />
      #delete: <%= loadReport.getDeleteCount() %><br />
      Progress table: <%= loadReport.getProgressTable() %><br />
      Load duration: <%= loadReport.getDuration() %> ms<br />
      Memory used: <jalios:filesize size='<%= loadReport.getMemoryUsed() %>' /> (<%= loadReport.getMemoryUsed() %> bytes) <br />
      Store size: <jalios:filesize size='<%= loadReport.getStoreSize() %>' /> (<%= loadReport.getStoreSize() %> bytes) <br />
      Load errors: <%= loadReport.getErrorCount() %> errors</p>
    
    <% if (loadReport.getErrorCount() > 0) { %>
    <hr size="1" noshade="noshade"/>
    <p>
    <b><font face="Arial, Helvetica, sans-serif"><%= loadReport.getClassErrorList().size() %> class error(s)</font></b><br />
    A class error occurs when the corresponding class cannot be loaded or instanciated from the operation tag name.<br />
      <jalios:foreach name="itLogEntry" type="com.jalios.jstore.StorableLogEntry" collection="<%= loadReport.getClassErrorList() %>">
    <ul>
      <li><font color="#FF0000">Class Error at line <%= itLogEntry.getLineNumber() %> - Cannot instanciate class <b><%= itLogEntry.getName() %></b></font><br />
      <jalios:truncate length="300" suffix="..."><%= XmlUtil.normalize(itLogEntry.toXML()) %></jalios:truncate>
    </ul>
    </jalios:foreach>
    <hr size="1" noshade="noshade"/>
    
    
    <p>
    <b><font face="Arial, Helvetica, sans-serif"><%= loadReport.getCreateErrorList().size() %> create error(s)</font></b><br />
    A create error occurs when the ID of this operation is already used.<br />
    <jalios:foreach name="itLogEntry" type="com.jalios.jstore.StorableLogEntry" collection="<%= loadReport.getCreateErrorList() %>">
    <ul>
      <li><font color="#FF0000">Create Error at </font><font color="#FF0000">line <%= itLogEntry.getLineNumber() %> - ID <b><a href="edit.jsp?id=<%= itLogEntry.getID() %>" style="text-decoration: none"><%= itLogEntry.getID() %></a></b> already used (<%= channel.getData(itLogEntry.getID()) != null ? channel.getData(itLogEntry.getID()).getClass().getName() : "null" %>).</font><br />
      <jalios:truncate length="300" suffix="..."><%= XmlUtil.normalize(itLogEntry.toXML()) %></jalios:truncate>
    </ul>
    </jalios:foreach>
    <hr size="1" noshade="noshade"/>
    
    <p>
    <b><font face="Arial, Helvetica, sans-serif"><%= loadReport.getMutationErrorList().size() %> mutation error(s)</font></b><br />
    A mutation error occurs on update or delete operations if there is no data bound on the ID.<br />
      <jalios:foreach name="itLogEntry" type="com.jalios.jstore.StorableLogEntry" collection="<%= loadReport.getMutationErrorList() %>">
    <ul>
      <li><font color="#FF0000">Mutation Error at </font><font color="#FF0000">line <%= itLogEntry.getLineNumber() %></font><font color="#FF0000"> - No object bound on ID <%= itLogEntry.getID() %>.</font><br />
      <jalios:truncate length="300" suffix="..."><%= XmlUtil.normalize(itLogEntry.toXML()) %></jalios:truncate>
    </ul>
    </jalios:foreach>
    <hr size="1" noshade="noshade"/>
    
    <p>
    <b><font face="Arial, Helvetica, sans-serif"><%= loadReport.getStampErrorList().size() %> stamp error(s)</font></b><br />
    A stamp error occurs if the current stamp is lower that the previous one.<br />
      <jalios:foreach name="itLogEntry" type="com.jalios.jstore.StorableLogEntry" collection="<%= loadReport.getStampErrorList() %>">
    <ul>
      <li><font color="#FF0000">Stamp Error at line <%= itLogEntry.getLineNumber() %> - Decreasing </font><font color="#FF0000"> stamp <%= itLogEntry.getStamp() %> for operation on ID <b><a href="edit.jsp?id=<%= itLogEntry.getID() %>" style="text-decoration: none"><%= itLogEntry.getID() %></a></b> (<%= channel.getData(itLogEntry.getID()) != null ? channel.getData(itLogEntry.getID()).getClass().getName() : "null" %>)</font><br />
      <jalios:truncate length="300" suffix="..."><%= XmlUtil.normalize(itLogEntry.toXML()) %></jalios:truncate>
    </ul>
    </jalios:foreach>
    <hr size="1" noshade="noshade"/>
    
    <p>
    <b><font face="Arial, Helvetica, sans-serif"><%= loadReport.getJavaErrorList().size() %> Java error(s)</font></b><br />
    A Java error occurs if an exception is raised when a log entry is processed.<br />
      <jalios:foreach name="itLogEntry" type="com.jalios.jstore.StorableLogEntry" collection="<%= loadReport.getJavaErrorList() %>">
    <ul>
      <li><font color="#FF0000">Java Error at line <%= itLogEntry.getLineNumber() %> - <%= itLogEntry.getException().getClass().getName() %>: <%= itLogEntry.getException().getMessage() %></font><br />
      <jalios:truncate length="300" suffix="..."><%= XmlUtil.normalize(itLogEntry.toXML()) %></jalios:truncate><br />
      Exception:
      <% 
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw, true);
        itLogEntry.getException().printStackTrace(pw); 
      %>  
      <pre><%= sw %></pre>
    </ul>
    </jalios:foreach>
    <% } %>
    <hr size="1" noshade="noshade"/>
    <br />
  </div>
</div>
<%@ include file='/admin/doAdminFooter.jspf' %> 