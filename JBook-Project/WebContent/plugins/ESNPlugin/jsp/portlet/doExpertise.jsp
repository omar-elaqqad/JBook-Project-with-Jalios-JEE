<%@ include file='/plugins/ESNPlugin/jsp/common/doCommonParams.jspf' %>
<% 
Map<Category, Set<Category>> catMap = esnMgr.getMemberCategoryMap(member, loggedMember, userLang); 
boolean hasCategories = Util.notEmpty(catMap);
%>
<% if (hasCategories || canEdit) { %>
<h2 class="profile-info-expertise-title" id="profile-categories">
  <% if (canEdit) { %>
  <span class="right">
    <a class="edit-link" href="<%= esnMgr.getMemberProfileEditor() %>?openTab=3&amp;esnProfileTab=info&amp;mid=<%= member.getId() %>"><jalios:icon src="edit" /> <%= glp("jcmsplugin.esn.lbl.editLabel") %></a>
  </span>
  <% } %>
<%= glp("jcmsplugin.esn.lbl.categories") %>
</h2>
<table class="logs profile-info-expertise-content">
  <% if (hasCategories) { %>
  <jalios:foreach collection="<%= catMap.entrySet() %>" 
                  name="entry" 
                  type="Map.Entry<Category, Set<Category>>">
  <tr>
    <td class="log-date txt-right" valign="top" >
      <%= entry.getKey().getName(userLang) %>
    </td>
    <td class="log-info" valign="top">
      <jalios:icon src="star" />
      <jalios:foreach collection="<%= entry.getValue() %>" type="Category" name="cat" counter="itCounter2">
      <% if (itCounter2 != 1) { %>&middot;<% } %>
  
      <a href="plugins/ESNPlugin/jsp/expertDirectory.jsp?mcat=<%= cat.getId() %>"><%= cat.getName(userLang) %></a>      
      </jalios:foreach>
    </td>
  </tr>
  </jalios:foreach>
  <% } %>
</table>
<% } %>