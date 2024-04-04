<%@page import="com.jalios.jcms.application.ApplicationAppHandler"%>
<%@ include file="/jcore/doInitPage.jspf" %><%

ApplicationAppHandler formHandler = (ApplicationAppHandler) request.getAttribute("appStoreAppHandler");

if (formHandler == null) {
%>
<jalios:include jsp="jcore/appstore/app/appStoreAppHandler.jsp" />
<%
}

if (formHandler == null) {
  return;
}

Category cat = (Category) request.getAttribute("appstore.category");

Set<Category> childrenSet = new TreeSet<>(Category.getOrderComparator(userLang)); 
childrenSet.addAll(cat.getChildrenSet());
boolean isActive = Util.arrayContains(formHandler.getCids(), cat.getId());

%>
<li class="<%= Util.arrayContains(formHandler.getCids(), cat.getId()) ? "active is-checked" : ""  %>">
  <label class="" dir="ltr" >
	   <input name="cids" type="radio" value="<%= cat.getId() %>" data-jalios-action="ajax-refresh">
     <%= cat.getName(userLang) %> 
  </label>
  <% if (Util.notEmpty(childrenSet)) { %>
    <ul>
	    <% for (Category itChildren : childrenSet) { %>
	      <% request.setAttribute("appstore.category", itChildren); %>
	      <jalios:include jsp="jcore/appstore/app/appStoreApp_categoryNode.jsp" />
	    <% } %>      
    </ul>
  <% } %>
</li>