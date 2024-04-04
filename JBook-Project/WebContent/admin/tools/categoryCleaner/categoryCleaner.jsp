<%@ page import="com.jalios.jcms.categorycleaner.*" %>
<%@ include file="/jcore/doInitPage.jspf" %>
<%

if (!checkAccess("admin/dev/category-cleaner")) {
  sendForbidden(request, response);
  return;
}
%>
<jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.categorycleaner.CategoryCleanerHandler">
  <jsp:setProperty name="formHandler" property="request" value="<%= request %>"/>
  <jsp:setProperty name="formHandler" property="response" value="<%= response %>"/>
  <jsp:setProperty name="formHandler" property="*" />
</jsp:useBean>

<%
if (formHandler.validate()) {
  return;
}
Category categoryRoot = formHandler.getCategoryRoot();
Map<String, Set<Category>> clusterMap = formHandler.getClusterMap();

request.setAttribute("title", glp("ui.adm.mn.dev.category-cleaner"));  
request.setAttribute("categoryCleanerSubAdminMenu", "true"); 

int similarity = formHandler.getAvailableSimilarity();
String similarityAlgorithm = formHandler.getAvailableSimilarityAlgorithm();

String commonParams = "categoryRootId=" + JcmsUtil.getId(categoryRoot) + "&amp;similarity=" + similarity + "&amp;similarityAlgorithm=" + similarityAlgorithm + "&amp;";

String queryUrlPrefix = ResourceHelper.getQuery() + "?cids=";

%>

<%@ include file="/admin/doAdminHeader.jspf" %>

<div class="category-cleaner">

  <%-- ** TITLE *********************************** --%>
  <div class="page-header"><h1><%= glp("ui.adm.category-cleaner.title") %></h1></div>

    
  <%-- ** FORM *********************************** --%>
  <div class="navbar navbar-default">
    <div class="container-fluid">     
    
    <form name="filterForm" action="admin/tools/categoryCleaner/categoryCleaner.jsp" method="post" class="navbar-form navbar-left">
      <jalios:field name="categoryRootId" resource="field-inline" value="<%= categoryRoot %>">
        <jalios:control settings='<%= new CategorySettings().chooser() %>' />
      </jalios:field>
      
      <jalios:field name="similarity" resource="field-inline" value="<%= similarity %>">
        <jalios:control settings='<%= new NumberSettings().prepend(glp("ui.adm.category-cleaner.lbl.similarity")).append("%").numberType(double.class) %>' />
      </jalios:field>
 
      <% if (similarity < 100) { %>
      <jalios:field name="similarityAlgorithm" resource="field-inline" value="<%= similarityAlgorithm %>">
        <jalios:control settings='<%= new EnumerateSettings().select().enumValues(formHandler.getSimilarityAlgorithmNames()).prepend(glp("ui.adm.category-cleaner.lbl.algo")) %>' />
      </jalios:field>
      <% } %>
      
      <button type="submit" name="opCompute" value="true" class="btn btn-primary"><%= glp("ui.adm.category-cleaner.btn.display") %></button>
    </form>
    </div>
  </div>

  <%-- NO CLUSTER --%>
  <% if (categoryRoot != null && Util.isEmpty(clusterMap)) { %>
  <jalios:message msg="ui.adm.category-cleaner.msg.no-cluster" title="" dismissable="false"/>
  <% } %>

    

  <%-- ** CLUSTER LIST *********************************** --%>
  <% if (Util.notEmpty(clusterMap)) { %>
  <table id="catTable" class="table-data table-condensed">
    <tr>
      <th class="numeric">#</th>
      <th class="numeric"><%= glp("ui.com.lbl.size") %></th>
      <th><%= glp("ui.adm.category-cleaner.lbl.sim-cat") %></th>
      <th></th>
    </tr>
    <jalios:foreach collection="<%= clusterMap.entrySet() %>" name="itEntry" type="Map.Entry<String, Set<Category>>" counter="c1">
    <%
    String clusterId = itEntry.getKey();
    Set<Category> cluster = itEntry.getValue();
    %> 
    <tr> 
      <td class="numeric fit"><%= c1 %>.</td>
      <td class="numeric fit"><%= cluster.size() %></td>
      <td class="">
        <jalios:foreach collection="<%= cluster %>" name="itCat" type="Category" counter="c2"> 
        <a class="meta-cat" href="<%= queryUrlPrefix + itCat.getId()%>"><%= itCat.getName() %></a>
        </jalios:foreach>
      </td>
      <td class="fit nowrap">
        <% Set<String> cids = cluster.stream().map(c -> c.getId()).collect(java.util.stream.Collectors.toSet()); %>
        <a class="modal btn btn-default" href="admin/tools/categoryCleaner/mergeCategories.jsp?<%= commonParams %>cids=<%= Util.join(cids, "&amp;cids=") %>" class="btn btn-default"><%= glp("ui.adm.category-cleaner.btn.merge") %></a>
        <% String hideUrl = HttpUtil.getUrlWithCSRFToken("admin/tools/categoryCleaner/categoryCleaner.jsp?" + commonParams + "opRemove=true&amp;clusterId=" + clusterId, request, true); %>
        <a class="btn btn-default" href="<%= hideUrl %>" class="btn btn-default"><%= glp("ui.adm.category-cleaner.btn.hide") %></a>
      </td>
    </tr>
  </jalios:foreach>
  </table>
  <% } %>
</div>

<%@ include file="/admin/doAdminFooter.jspf" %>
