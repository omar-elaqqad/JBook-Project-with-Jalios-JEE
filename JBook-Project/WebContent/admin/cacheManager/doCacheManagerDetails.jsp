<%--
  @Summary: Cache Manager details tabpane
  @Since: jcms-10.0.7
--%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ include file="/admin/cacheManager/doInitCacheManager.jspf" %><%
String refreshUrl = "admin/cacheManager/doCacheManagerDetails.jsp";
%><div class="ajax-refresh-div admin-cache-manager-details-wrapper" data-jalios-ajax-refresh-url="<%= refreshUrl %>"><%
  %><%@ include file='/jcore/doMessageBox.jspf' %><%
  %><table id='cacheTable' class="table-data">
    <thead>
      <tr>
        <th></th>
        <th><%= glp("ui.com.lbl.id") %></th>
        <th><%= glp("ui.adm.cache.lbl.session") %></th>
        <th><%= glp("ui.adm.cache.lbl.incom") %></th>
        <th><%= glp("ui.adm.cache.lbl.size") %></th>
        <th><%= glp("ui.adm.cache.lbl.timeout") %></th>
        <th><%= glp("ui.adm.cache.lbl.listen") %></th>
        <th><%= glp("ui.adm.cache.lbl.configuration") %></th>
        <th>&nbsp;</th>
      </tr>
    </thead>
    
    <tbody>
      <jalios:pager name='cmPagerHandler' declare='true' action='init' size='<%= cacheManager.getSize() %>'/>
      <jalios:foreach collection="<%= channel.getCacheManager().getCacheEntries() %>" 
                      name="itCacheEntry" 
                      type="CacheManager.CacheEntry"
                      max="<%= cmPagerHandler.getPageSize() %>"
                      skip="<%= cmPagerHandler.getStart() %>">
      
      <tr> 
        <td class="text-right"><%= cmPagerHandler.getStart() + itCounter.intValue() %>.</td>
        <td>
          <span title='<%= encodeForHTMLAttribute(itCacheEntry.getId()) %>'><%
            %><jalios:truncate length="100" suffix="..."><%= itCacheEntry.getId() %></jalios:truncate><%
          %></span>
        </td>
        <td class="text-center"><%= itCacheEntry.getSessionScope() ? channel.getProperty("list.boolean.on", "X") : channel.getProperty("list.boolean.off", "&nbsp;") %></td>
        <td class="text-right"><jalios:date date='<%= itCacheEntry.getDate() %>' format='<%= "short" %>'/> <jalios:time date='<%= itCacheEntry.getDate() %>' format='<%= "kk:mm:ss" %>'/></td>
        <td class="text-right">
          <jalios:filesize size='<%= itCacheEntry.getContentSize() %>' /> 
        </td>
        <td class="text-right">
          <% if (itCacheEntry.getTimeout() > 0) { %>
            <jalios:duration time='<%= itCacheEntry.getTimeout() %>' />
          <% } else { %>
            &nbsp;
          <% } %>
        </td>
       <td>
          <ul>
            <jalios:foreach array="<%= itCacheEntry.getClasses() %>" type="Class" name="itClass" counter="itCounter2">
            <li><%= channel.getTypeLabel(itClass, userLang) %></li>
            </jalios:foreach>
          </ul>
       </td>
       <td>
         <%= Util.getString(itCacheEntry.getConfiguration(),"") %>
       </td>
       <td>
         <a href="admin/cacheManager.jsp?opClear=true&amp;id=<%= itCacheEntry.getId() %>" class="modal confirm"><jalios:icon src='trash-empty'/></a>
        </td>
      </tr>  
      </jalios:foreach>
    
    </tbody>
  
  </table>
  <jalios:pager name='cmPagerHandler'/><br />
  <%
  %><%@ include file="/jcore/doAjaxFooter.jspf" %><%
%></div><%-- EOF.ajax-refresh-div --%><%
%>