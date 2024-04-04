<%@ page contentType="text/html; charset=UTF-8" %>
<%-- This file was automatically generated. Please, do not edit. --%>
<%--
  @Summary: generated.PortletWorkflow diff page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
{ 
generated.PortletWorkflow newObj = (generated.PortletWorkflow)request.getAttribute("newPub"); 
generated.PortletWorkflow oldObj = (generated.PortletWorkflow)request.getAttribute("oldPub"); 
String[] vids = (String[])request.getAttribute("vids"); 
int fieldCount = 1; 
TypeEntry typeEntry = channel.getTypeEntry(generated.PortletWorkflow.class);
boolean isSuperTypeIncluded = Boolean.TRUE.equals((Boolean)request.getAttribute("isSuperTypeIncluded")); 
{
  Integer superFieldCount = (Integer)request.getAttribute("fieldCount");
  if (superFieldCount != null) { 
    fieldCount = superFieldCount.intValue();
  }
}
String fieldDomId = "";
%>
<% if (!isSuperTypeIncluded) { %>
  <%-- ** title *****************  --%>
  <jalios:foreach collection='<%= channel.getLanguageList() %>' name='itLang' type='String'>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getTitle(itLang, false), oldObj.getTitle(itLang, false)) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td>
      <%= typeEntry.getTitleLabel(userLang) %>
      <jalios:if predicate='<%= channel.isMultilingual() %>'><jalios:lang lang='<%= itLang %>'/></jalios:if>
    </td>
    <% 
      fieldDomId = "titleDiffDomId_" + itLang ; 
      request.setAttribute("fieldDomId", fieldDomId);
      request.setAttribute("step", "action");
    %>
    <td class="text-left" colspan="2" id="<%= fieldDomId %>">
		<jsp:include page="/work/doVersionToggleMergeFields.jsp" />
    <%
    String newTitle = newObj.getTitle(itLang, false) == null ? "" : Util.toWordLine(newObj.getTitle(itLang, false));
    String oldTitle = oldObj.getTitle(itLang, false) == null ? "" : Util.toWordLine(oldObj.getTitle(itLang, false));
    request.setAttribute("newField", newTitle);
    request.setAttribute("oldField", oldTitle);
    request.setAttribute("step", "show_fields");
    %>
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
        <div class="merge_fields" >
    <%
    BufferedReader newReader = new BufferedReader(new StringReader(newTitle));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldTitle));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldTitle));
    %>
    <%= diff.iterateHunkBuffer(oldReader, "<span class='diff-remove'>" , "</span>" , "<span class='diff-add'>" , "</span>", "" , "", false,true,false) %>
    <% oldReader.close(); %>
        </div>
    </td>
  </tr>
  </jalios:if>
  </jalios:foreach>
<% } %>
 
  <%-- ** queries ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getQueries(), oldObj.getQueries()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.PortletWorkflow.class, "queries", userLang) %>
      
    </td>
    <td>
      <% if (Util.notEmpty(newObj.getQueries())) { %>
      <ol>
        <jalios:foreach name="itData" type="String" array="<%= newObj.getQueries() %>" counter='c2'>
        <li><%= itData %></li>
        </jalios:foreach>
      </ol>
      <% } else { %> - <% } %>
    </td>
    <td>
      <% if (Util.notEmpty(oldObj.getQueries())) { %>
      <ol>
        <jalios:foreach name="itData" type="String" array="<%= oldObj.getQueries() %>" counter='c2'>
        <li><%= itData %></li>
        </jalios:foreach>
      </ol>
      <% } else { %> - <% } %>
    </td>
  </tr>
  </jalios:if>
  <%-- ** maximumItemsPerWorkspace ***************** --%>
  <jalios:if predicate='<%= newObj.getMaximumItemsPerWorkspace() != oldObj.getMaximumItemsPerWorkspace() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletWorkflow.class, "maximumItemsPerWorkspace", userLang) %></td>
    <td><%= newObj.getMaximumItemsPerWorkspace()  %></td>
    <td><%= oldObj.getMaximumItemsPerWorkspace()  %></td>
  </tr>
  </jalios:if>
  <%-- ** orderBy ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getOrderBy(), oldObj.getOrderBy()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.PortletWorkflow.class, "orderBy", userLang) %>
    </td>
    <td><%= Util.getString(newObj.getOrderBy(), "") %></td>
    <td><%= Util.getString(oldObj.getOrderBy(), "") %></td>
  </tr>
  </jalios:if>
  <%-- ** hideWhenNoResults ***************** --%>
  <jalios:if predicate='<%= newObj.getHideWhenNoResults() != oldObj.getHideWhenNoResults() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletWorkflow.class, "hideWhenNoResults", userLang) %></td>
    <td><%= newObj.getHideWhenNoResultsLabel(userLang) %></td>
    <td><%= oldObj.getHideWhenNoResultsLabel(userLang) %></td>
  </tr>
  </jalios:if>
  <%-- ** pageSizes ***************** --%>
  <%-- ** pagerAllLimit ***************** --%>
  <jalios:if predicate='<%= newObj.getPagerAllLimit() != oldObj.getPagerAllLimit() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletWorkflow.class, "pagerAllLimit", userLang) %></td>
    <td><%= newObj.getPagerAllLimit()  %></td>
    <td><%= oldObj.getPagerAllLimit()  %></td>
  </tr>
  </jalios:if>
  <%-- ** displayCSWorkspacePublication ***************** --%>
  <jalios:if predicate='<%= newObj.getDisplayCSWorkspacePublication() != oldObj.getDisplayCSWorkspacePublication() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletWorkflow.class, "displayCSWorkspacePublication", userLang) %></td>
    <td><%= newObj.getDisplayCSWorkspacePublicationLabel(userLang) %></td>
    <td><%= oldObj.getDisplayCSWorkspacePublicationLabel(userLang) %></td>
  </tr>
  </jalios:if>
<%
  ServletUtil.backupAttribute(pageContext, "fieldCount");
  ServletUtil.backupAttribute(pageContext, "isSuperTypeIncluded");
  request.setAttribute("fieldCount", new Integer(fieldCount));
  request.setAttribute("isSuperTypeIncluded", Boolean.TRUE);
%>
<jsp:include page="/types/AbstractPortletSkinable/doAbstractPortletSkinableDiff.jsp"/>
<%
  {
    Integer superFieldCount = (Integer)request.getAttribute("fieldCount");
    if (superFieldCount != null) {
      fieldCount = superFieldCount.intValue();
    }
  }
  ServletUtil.restoreAttribute(pageContext, "fieldCount");
  ServletUtil.restoreAttribute(pageContext, "isSuperTypeIncluded");
%>
<% if (!isSuperTypeIncluded) { 
  ServletUtil.backupAttribute(pageContext, "fieldCount");
  request.setAttribute("fieldCount", new Integer(fieldCount));
%>  
<jsp:include page="/work/doCommonPubDiff.jsp"/>
<% 
  {
    Integer superFieldCount = (Integer)request.getAttribute("fieldCount");
    if (superFieldCount != null) {
      fieldCount = superFieldCount.intValue();
    }
  }
  ServletUtil.restoreAttribute(pageContext, "fieldCount");
 } else {
     request.setAttribute("fieldCount", new Integer(fieldCount));
 } %>
<% } %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- slfj1H0BaW9/iq/0eCFidw== --%>