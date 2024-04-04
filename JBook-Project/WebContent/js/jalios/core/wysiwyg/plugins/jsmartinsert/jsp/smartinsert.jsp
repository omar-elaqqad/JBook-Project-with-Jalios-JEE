<%@ page import="org.apache.commons.lang3.StringUtils" %><%
 request.setAttribute("CheckCSRF", Boolean.TRUE); 
%><%@ include file="/jcore/doInitPage.jspf" %><%

String autocomplete = getUntrustedStringParameter("autocomplete",""); // ENCODE !!
request.setAttribute("WysiwygSmartInsert-autocomplete", autocomplete);
%><jalios:include target="WYSIWYG_SMARTINSERT" targetContext="empty" /><%
autocomplete = Util.getString(request.getAttribute("WysiwygSmartInsert-autocomplete"), "");

final boolean showPublications = Util.toBoolean(request.getAttribute("WysiwygSmartInsert-ShowPublications"), true); 
final boolean showMembers      = Util.toBoolean(request.getAttribute("WysiwygSmartInsert-ShowMembers"), true);
final boolean showCategories   = Util.toBoolean(request.getAttribute("WysiwygSmartInsert-ShowCategories"), false);
final boolean showGroups       = Util.toBoolean(request.getAttribute("WysiwygSmartInsert-ShowGroups"), false);

final String activeSection = Util.getString(request.getAttribute("WysiwygSmartInsert-ActiveSection"), "publications");

final String autocompleteEncoded = encodeForURL(autocomplete);
%>
<ul class="dropdown-menu dropdown-menu-main">
<% if (StringUtils.isNotBlank(autocomplete)) { %>
  <jalios:include target="WYSIWYG_SMARTINSERT_START" targetContext="li" />
  <% if (showPublications) { %>
  <li class="<% if (activeSection.equals("publications")) { %>active <% } %>ajax-refresh">
    <a href="jcore/autocomplete/acpublication.jsp?autocomplete=<%= autocompleteEncoded %>">
      <jalios:icon src="publication" alt='<%= glp("ui.com.lbl.publications") %>' /> <%= glp("ui.com.lbl.publications") %>
      <br/><span class="info"><%= glp("ui.wiki.alt.publink") %></span>
    </a>
  </li>
  <% } %>
  <% if (showMembers) { %>
  <li class="<% if (activeSection.equals("members")) { %>active <% } %>ajax-refresh">
    <a href="jcore/autocomplete/acmember.jsp?autocomplete=<%= autocompleteEncoded %>">
      <jalios:icon src="mbr-default" alt='<%= glp("channel.topbar.search.search-component.member") %>' /> <%= glp("channel.topbar.search.search-component.member") %>
      <br/><span class="info"><%= glp("ui.wiki.alt.mbrlink") %></span>
    </a>
  </li>
  <% } %>
  <% if (showCategories) { %>
  <li class="<% if (activeSection.equals("categories")) { %>active <% } %>ajax-refresh">
    <a href="jcore/autocomplete/accategory.jsp?autocomplete=<%= autocompleteEncoded %>">
      <jalios:icon src="categories" alt='<%= glp("ui.com.lbl.categories") %>' /> <%= glp("ui.com.lbl.categories") %>
      <br/><span class="info"><%= glp("ui.wiki.alt.catlink") %></span>
    </a>
  </li>
  <% } %>
  <% if (showGroups) { %>
  <li class="<% if (activeSection.equals("groups")) { %>active <% } %>ajax-refresh">
      <jalios:icon src="group" alt='<%= glp("ui.com.lbl.groups") %>' /> <%= glp("ui.com.lbl.groups") %>
      <br/><span class="info"><%= glp("ui.wiki.alt.grplink") %></span>
    </a>
  </li>
  <% } %>
  <jalios:include target="WYSIWYG_SMARTINSERT_END" targetContext="li" />
<% } else { %>
  <li class="nomatch"><a href='#'><%= glp("ui.com.lbl.no-result") %></a></li>
<% } %>
</ul>