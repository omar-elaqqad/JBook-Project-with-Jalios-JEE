<%@ include file="/jcore/doInitPage.jspf" %><%--  
--%><%@ page import="com.jalios.jcmsplugin.esn.*" %><%--  
--%><%
  MemberCategoriesManager mcMgr = MemberCategoriesManager.getInstance();
  String search = getUntrustedStringParameter("autocomplete", "");
  Set<Category> suggestionSet = JcmsUtil.select(mcMgr.getCategorySuggestionSet(search, userLang), new Category.AuthorizedSelector(loggedMember), new Category.NameComparator(userLang)); 
%><%--  
--%><div class="typeahead-menu expert-directory-ctx-menu ajax-refresh-div">
	<ul class="dropdown-menu">
    <% if (Util.isEmpty(suggestionSet)) { %>
      <li><a href='#'><%= glp("ui.com.lbl.no-result") %></a></li>
    <% } else { %>
      <% Set<Category> rootSet = mcMgr.getMemberCategoriesRootSet(); %>
  	  <jalios:pager name='expertCatAcHandler' action='init' declare='true' size='<%= Util.getSize(suggestionSet) %>' pageSize='5'/>
  	  <% int skip = hasParameter("skip") ? getIntParameter("skip",0) : expertCatAcHandler.getStart(); %>
      <% if (skip != 0) { %>
          <li class='info results'><a href='#'><%= glp("ui.com.lbl.count-result",skip,(skip + expertCatAcHandler.getPageSize())) %></a></li>    	  
      <% } %>
      <% if (skip !=  0) { %>
  	    <li class='ajax-refresh previous'><a href='plugins/ESNPlugin/jsp/directory/autocomplete.jsp?autocomplete=<%= search %>&amp;skip=<%= skip - expertCatAcHandler.getPageSize() %>'><%= glp("ui.com.lbl.prev-result") %></a></li>
  	  <% } %>  
  	  <jalios:foreach collection="<%= suggestionSet %>" name="itCat" type="Category" max="5" skip='<%= skip %>'>
  	  <% 
  		  String path = "";
  		  for(Category root: rootSet) {
  		    if (itCat.hasAncestor(root)) {
  		      path = itCat.getAncestorString(root, " > ", false, userLang);
  		      path += " > <b>" + itCat.getName() + "</b>";
  		      break;
  		    }
  		  }
  	  %>
  	  <li class="ajax-refresh"><a data-jalios-target=".esn-directory-container" href="plugins/ESNPlugin/jsp/expertDirectory.jsp?mcat=<%= itCat.getId() %>"><%= path %></a></li> 
  	  </jalios:foreach>
  	  <% if (!(expertCatAcHandler.getPageSize() + skip > expertCatAcHandler.getItemsNbr())) { %>
  	    <li class='ajax-refresh next'><a href='plugins/ESNPlugin/jsp/directory/autocomplete.jsp?autocomplete=<%= search %>&amp;skip=<%= expertCatAcHandler.getPageSize() + skip %>'><%= glp("ui.com.lbl.next-result") %></a></li>
  	  <% } %>
    <% } %>
	</ul>
</div>