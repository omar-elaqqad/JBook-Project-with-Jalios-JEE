<%@ page contentType="text/html; charset=UTF-8" %>
<%-- This file was automatically generated. Please, do not edit. --%>
<%--
  @Summary: generated.PortletMemberActivity diff page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
{ 
generated.PortletMemberActivity newObj = (generated.PortletMemberActivity)request.getAttribute("newPub"); 
generated.PortletMemberActivity oldObj = (generated.PortletMemberActivity)request.getAttribute("oldPub"); 
String[] vids = (String[])request.getAttribute("vids"); 
int fieldCount = 1; 
TypeEntry typeEntry = channel.getTypeEntry(generated.PortletMemberActivity.class);
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
 
  <%-- ** activityMode ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getActivityMode(), oldObj.getActivityMode()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.PortletMemberActivity.class, "activityMode", userLang) %>
    </td>
    <td><%= Util.getString(newObj.getActivityMode(), "") %></td>
    <td><%= Util.getString(oldObj.getActivityMode(), "") %></td>
  </tr>
  </jalios:if>
  <%-- ** showAbstract ***************** --%>
  <jalios:if predicate='<%= newObj.getShowAbstract() != oldObj.getShowAbstract() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletMemberActivity.class, "showAbstract", userLang) %></td>
    <td><%= newObj.getShowAbstractLabel(userLang) %></td>
    <td><%= oldObj.getShowAbstractLabel(userLang) %></td>
  </tr>
  </jalios:if>
  <%-- ** showMedia ***************** --%>
  <jalios:if predicate='<%= newObj.getShowMedia() != oldObj.getShowMedia() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletMemberActivity.class, "showMedia", userLang) %></td>
    <td><%= newObj.getShowMediaLabel(userLang) %></td>
    <td><%= oldObj.getShowMediaLabel(userLang) %></td>
  </tr>
  </jalios:if>
  <%-- ** showComments ***************** --%>
  <jalios:if predicate='<%= newObj.getShowComments() != oldObj.getShowComments() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletMemberActivity.class, "showComments", userLang) %></td>
    <td><%= newObj.getShowCommentsLabel(userLang) %></td>
    <td><%= oldObj.getShowCommentsLabel(userLang) %></td>
  </tr>
  </jalios:if>
  <%-- ** displayAllEvent ***************** --%>
  <jalios:if predicate='<%= newObj.getDisplayAllEvent() != oldObj.getDisplayAllEvent() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletMemberActivity.class, "displayAllEvent", userLang) %></td>
    <td><%= newObj.getDisplayAllEventLabel(userLang) %></td>
    <td><%= oldObj.getDisplayAllEventLabel(userLang) %></td>
  </tr>
  </jalios:if>
  <%-- ** filters ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getFilters(), oldObj.getFilters()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <% fieldDomId = "filtersDiffDomId"; %>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.PortletMemberActivity.class, "filters", userLang) %>
    </td>
    <% 
      request.setAttribute("fieldDomId", fieldDomId);
      request.setAttribute("step", "action");
    %>
    <td class="text-left" colspan="2" id="<%= fieldDomId %>">
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
    <%
    {
    String newFilters = newObj.getFilters() == null ? "" : Util.toWordLine(newObj.getFilters());
    String oldFilters = oldObj.getFilters() == null ? "" : Util.toWordLine(oldObj.getFilters());
    request.setAttribute("newField", newFilters);
    request.setAttribute("oldField", oldFilters);
    request.setAttribute("step", "show_fields");
    %>
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
        <div class="merge_fields" >
    <%
    BufferedReader newReader = new BufferedReader(new StringReader(newFilters));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldFilters));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldFilters));
    %>
     <%= diff.iterateHunkBuffer(oldReader, "<span class='diff-remove'>" , "</span>" , "<span class='diff-add'>" , "</span>", "" , "", false,true,false) %>
    <% 
    oldReader.close(); 
    }
    %>
        </div>
    </td>
  </tr>
  </jalios:if>
  <%-- ** defaultPageSize ***************** --%>
  <jalios:if predicate='<%= newObj.getDefaultPageSize() != oldObj.getDefaultPageSize() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletMemberActivity.class, "defaultPageSize", userLang) %></td>
    <td><%= newObj.getDefaultPageSize()  %></td>
    <td><%= oldObj.getDefaultPageSize()  %></td>
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
%><%-- qz7XNzdQ7QdQ3AFoX4QpOQ== --%>