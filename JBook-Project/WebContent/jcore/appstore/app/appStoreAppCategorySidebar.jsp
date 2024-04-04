<%@page import="com.jalios.jcms.application.ApplicationManager"%>
<%@page import="com.jalios.jcms.application.ApplicationQueryHandler"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/jcore/doInitPage.jspf" %>
<% 
Set<Category> catChild = (Set<Category>) request.getAttribute("recursiveCatChild");
ApplicationQueryHandler formHandler = (ApplicationQueryHandler) request.getAttribute("formHandler");
Category selectedCat = channel.getCategory(Util.getFirst(formHandler.getCids()));
boolean isRootCat = (boolean) request.getAttribute("isRootCat");
if(Util.notEmpty(catChild)) { 
%>
<ul class="app-sidebar-menu app-sidebar-menu-no-title classified-ad-category-menu app-sidebar-field">
 <% for (Category itCat : catChild) { %>
	 <li <%= itCat == selectedCat ? "class=\"active\"" : "" %>>
	   <a><label>
	     <input name="cids" type="radio" value="<%= itCat.getId() %>" <%= Util.arrayContains(formHandler.getCids(), itCat.getId()) ? "checked" : "" %>> 
		   <%= itCat %>
		 </label></a>
	  </li>
  <% } %>
</ul>
<% } %>
