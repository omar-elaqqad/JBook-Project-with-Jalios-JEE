<%@ include file='/jcore/topbar/items/doInitTopbarItem.jspf' %><%

WebAssetsUtils.addScrollbarWebAssets(jcmsContext);
jcmsContext.addCSSHeader("css/jalios/core/components/topbar/jalios-topbar-slide-menu.css");
jcmsContext.addJavaScript("js/jalios/core/components/jalios-topbar-slide-menu.js");

String propPrefix = "publish-menu.item.";
Map<String,Object> menuMap = new TreeMap(channel.getChannelProperties().getSubProperties(propPrefix));
StringBuilder childrenMenu = new StringBuilder();
%>
<jalios:buffer name="topbarPublishMenuContent">
<% if (Util.notEmpty(menuMap)) { %>
    <jalios:foreach collection="<%= menuMap.entrySet() %>" type="Map.Entry" name="entry">
    <%
    String key = (String)entry.getKey();
    String fullkey = propPrefix + key;
    String iconkey = fullkey.replaceAll("\\.", "-");
    JProperties prop = (JProperties)(entry.getValue());
    %>
    <% if (prop.size() == 1) { %>
      <jalios:include jsp="<%= (String)(Util.getFirst(prop.values())) %>" />
    <% } else { %>
      <% 
      Map subMap = new TreeMap(prop); 
      List childrenList = new ArrayList(); 
      %>
      <jalios:foreach collection="<%= subMap.entrySet() %>" type="Map.Entry" name="entry2" counter="c2">
        <jalios:buffer name="child">
          <jalios:include jsp="<%= (String)(entry2.getValue()) %>" />
        </jalios:buffer>
      <% 
      if (Util.notEmpty(child)) {
        childrenList.add(child);
      }
      %>
      </jalios:foreach>
      <% if (childrenList.size() == 1) { %>
        <%= Util.getFirst(childrenList) %>
      <% } else if (childrenList.size() > 1) { %>
          <a tabindex="0" role="button" data-bound="<%= key %>"  class="publish-menu-item list-group-item has-child">
            <jalios:icon src='<%= iconkey %>' /> 
            <%= glp(fullkey) %>  
            <jalios:icon src='menu-next' css="icon-child-menu"/>
          </a>
          <jalios:buffer name="children">
          <div class="list-group child-menu hide" data-bound="<%= key %>">
            <a tabindex="0" role="button" class="publish-menu-item list-group-item back" role="menuitem" data-jalios-slidemenu-bound-mode="back" data-bound="publish-menu-root">
              <jalios:icon src='menu-prev' />
              <%= glp("menu.back") %>
            </a>      
            <jalios:foreach collection="<%= childrenList %>" type="String" name="child" counter="c2">
              <%= child %>
            </jalios:foreach>
          </div>
          </jalios:buffer>
          <% childrenMenu.append(children); %>
      <% } %>
    <% } %>
    </jalios:foreach>
<% } %>
</jalios:buffer>
<div class="slide-wrapper">
  <div class="main-menu list-group is-active" data-bound="publish-menu-root">
    <%= topbarPublishMenuContent %>
  </div>
  <%= childrenMenu %>
</div>
<%@ include file='/jcore/doAjaxFooter.jspf' %>