<%--
  @Summary: Cache Manager (no header/footer; ajaxified)
  @Since: jcms-10.0.7
--%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ include file="/admin/cacheManager/doInitCacheManager.jspf" %><%
String refreshUrl = "admin/cacheManager/cacheManager.jsp";
%><div class="ajax-refresh-div admin-cache-manager-wrapper" data-jalios-ajax-refresh-url="<%= refreshUrl %>"><%
  %><%@ include file='/jcore/doMessageBox.jspf' %>

<%-- CONFIGURATION COUNT / SIZE TABLE --%>
<%
ObjectLongTreeMap configurationMemSizeMap = new ObjectLongTreeMap();
ObjectLongTreeMap configurationMemCountMap = new ObjectLongTreeMap();
ObjectLongTreeMap configurationMemMaxMap = new ObjectLongTreeMap();

ObjectLongTreeMap configurationSessionSizeMap = new ObjectLongTreeMap();
ObjectLongTreeMap configurationSessionCountMap = new ObjectLongTreeMap();
ObjectLongTreeMap configurationSessionMaxMap = new ObjectLongTreeMap();

for(CacheManager.CacheEntry itCacheEntry: channel.getCacheManager().getCacheEntries()) {

  String conf = Util.getString(itCacheEntry.getConfiguration(),"");
  if (Util.isEmpty(conf)) {
    String id = itCacheEntry.getId();
    if (id.indexOf("_pe_") > 0) {
      conf = "portlet";
    } 
    else {
      conf = "other";
    }
  }
  
  if (itCacheEntry.getSessionScope()) {
    configurationSessionCountMap.inc(conf);
    
    long size = itCacheEntry.getContentSize();
    configurationSessionSizeMap.inc(conf, size); 
    
    if (size > configurationSessionMaxMap.getLong(conf, 0)) {
      configurationSessionMaxMap.put(conf, size);
    }
  } else {
    configurationMemCountMap.inc(conf);
    
    long size = itCacheEntry.getContentSize();
    configurationMemSizeMap.inc(conf, size); 
    
    if (size > configurationMemMaxMap.getLong(conf, 0)) {
      configurationMemMaxMap.put(conf, size);
    }
  }
}
%>
<%-- TABS --%>
<ul class="nav nav-tabs nav-tabs-underlined is-left-aligned" role="tablist">
  <li class="active"><a href="#memory" role="tab" data-toggle="tab" onclick="return false;"><%= glp("ui.adm.cache.memory-cache") %></a></li>
  <li><a href="#disk" role="tab" data-toggle="tab" onclick="return false;"><%= glp("ui.adm.cache.disk-cache") %></a></li>
  <li><a href="#details" role="tab" data-toggle="tab" onclick="return false;"><%= glp("ui.adm.cache.details") %></a></li>
</ul>
<div class="tab-content">
  <%-- MEMORY --%>
  <div class="tab-pane active" id="memory">
    <table class="table-data is-auto">
      <thead>
        <tr>
          <th><%= glp("ui.adm.cache.lbl.configuration") %></th>
          <th>#</th>
          <th><%= glp("ui.adm.cache.lbl.size") %></th>
          <th><%= glp("ui.analytics.lbl.visitor.max") %></th>
          <th><%= glp("ui.analytics.lbl.average") %></th>
        </tr>
      </thead>
      <tbody>
        <%
        long allMemCount = 0;
        long allMemSize = 0;
        %>
        <jalios:foreach collection="<%= configurationMemSizeMap.keySet() %>" type="String" name="configuration">
        <%
        long count = configurationMemCountMap.getLong(configuration, 0);
        long size = configurationMemSizeMap.getLong(configuration, 0);
        long max = configurationMemMaxMap.getLong(configuration, 0);
        allMemCount += count;
        allMemSize += size;
        %>
        <tr>
          <td><%= configuration %></td>
          <td class="text-right"><%=  count %></td>
          <td class="text-right"><jalios:filesize size='<%= size %>' /> </td>
          <td class="text-right"><jalios:filesize size='<%= max %>' /> </td>
          <td class="text-right"><% if (count > 0) { %><jalios:filesize size='<%= size / count %>' /><% } %></td>
        </tr>
        </jalios:foreach>
        <tr>
          <td><b><%= glp("ui.adm.cache.total") %></b></td>
          <td class="text-right"><%= allMemCount %></td>
          <td class="text-right"><jalios:filesize size='<%= allMemSize %>' /> </td>
          <td class="text-right"></td>
          <td class="text-right"><% if (allMemCount > 0) { %><jalios:filesize size='<%= allMemSize / allMemCount %>' /><% } %></td>
        </tr>
      </tbody>
    </table>
  </div>

  <%-- DISK --%>
  <div class="tab-pane" id="disk">
    <table class="table-data is-auto">
      <thead>
        <tr>
          <th><%= glp("ui.adm.cache.lbl.configuration") %></th>
          <th>#</th>
          <th><%= glp("ui.adm.cache.lbl.size") %></th>
          <th><%= glp("ui.analytics.lbl.visitor.max") %></th>
          <th><%= glp("ui.analytics.lbl.average") %></th>
        </tr>
      </thead>
      <tbody>
        <%
        long allSessionCount = 0;
        long allSessionSize = 0;
        %>
        <jalios:foreach collection="<%= configurationSessionSizeMap.keySet() %>" type="String" name="configuration">
        <%
        long count = configurationSessionCountMap.getLong(configuration, 0);
        long size = configurationSessionSizeMap.getLong(configuration, 0);
        long max = configurationSessionMaxMap.getLong(configuration, 0);
        allSessionCount += count;
        allSessionSize += size;
        %>
        <tr>
          <td><%= configuration %></td>
          <td class="text-right"><%=  count %></td>
          <td class="text-right"><jalios:filesize size='<%= size %>' /> </td>
          <td class="text-right"><jalios:filesize size='<%= max %>' /> </td>
          <td class="text-right"><% if (count > 0) { %><jalios:filesize size='<%= size / count %>' /><% } %></td>
        </tr>
        </jalios:foreach>
        <tr>
          <td><b><%= glp("ui.adm.cache.total") %></b></td>
          <td class="text-right"><%= allSessionCount %></td>
          <td class="text-right"><jalios:filesize size='<%= allSessionSize %>' /> </td>
          <td class="text-right"></td>
          <td class="text-right"><% if (allSessionCount > 0) { %><jalios:filesize size='<%= allSessionSize / allSessionCount %>' /><% } %></td>
        </tr>
      </tbody>
    </table>
  </div>

  <%-- DETAILS --%>
  <div class="tab-pane" id="details"><%
    %><jalios:include jsp="/admin/cacheManager/doCacheManagerDetails.jsp" /><%
  %></div>
</div>

<%-- Actions --%>
<p>
<button class="btn btn-primary" type="button" onclick="JcmsJsContext.redirect('admin/cacheManager.jsp?opClearAll=true');" ><%= glp("ui.adm.cache.clr-all") %></button>
<button class="btn btn-default" type="button" onclick="JcmsJsContext.redirect('admin/cacheManager.jsp?opClearSession=true');" ><%= glp("ui.adm.cache.clr-sess") %></button>
</p>
<%
  %><%@ include file="/jcore/doAjaxFooter.jspf" %><%
%></div><%-- EOF.ajax-refresh-div --%><%
%>