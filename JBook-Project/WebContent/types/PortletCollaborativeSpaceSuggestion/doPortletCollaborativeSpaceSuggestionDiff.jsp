<%@ page contentType="text/html; charset=UTF-8" %>
<%-- This file was automatically generated. Please, do not edit. --%>
<%--
  @Summary: generated.PortletCollaborativeSpaceSuggestion diff page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
{ 
generated.PortletCollaborativeSpaceSuggestion newObj = (generated.PortletCollaborativeSpaceSuggestion)request.getAttribute("newPub"); 
generated.PortletCollaborativeSpaceSuggestion oldObj = (generated.PortletCollaborativeSpaceSuggestion)request.getAttribute("oldPub"); 
String[] vids = (String[])request.getAttribute("vids"); 
int fieldCount = 1; 
TypeEntry typeEntry = channel.getTypeEntry(generated.PortletCollaborativeSpaceSuggestion.class);
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
 
  <%-- ** typology ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getTypology(loggedMember), oldObj.getTypology(loggedMember)) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletCollaborativeSpaceSuggestion.class, "typology", userLang) %></td>
    <td>
      <% if (Util.notEmpty(newObj.getTypology(loggedMember))) { %>
      <ol>
        <jalios:foreach collection="<%= newObj.getTypology(loggedMember) %>" type="Category" name="itCategory" >
        <li><%= itCategory == null ? "" : itCategory.getAncestorString(channel.getCategory("$id.jcmsplugin.collaborativespace.typology-root"), " > ", true) %></li>
        </jalios:foreach>
      </ol>
      <% } %>
    </td>
    <td>
      <% if (Util.notEmpty(oldObj.getTypology(loggedMember))) { %>
      <ol>
        <jalios:foreach collection="<%= oldObj.getTypology(loggedMember) %>" type="Category" name="itCategory" >
        <li><%= itCategory == null ? "" : itCategory.getAncestorString(channel.getCategory("$id.jcmsplugin.collaborativespace.typology-root"), " > ", true) %></li>
        </jalios:foreach>
      </ol>
      <% } %>
    </td>
  </tr>
  </jalios:if>
  <%-- ** threshold ***************** --%>
  <jalios:if predicate='<%= newObj.getThreshold() != oldObj.getThreshold() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletCollaborativeSpaceSuggestion.class, "threshold", userLang) %></td>
    <td><%= newObj.getThreshold()  %></td>
    <td><%= oldObj.getThreshold()  %></td>
  </tr>
  </jalios:if>
  <%-- ** maxItems ***************** --%>
  <jalios:if predicate='<%= newObj.getMaxItems() != oldObj.getMaxItems() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletCollaborativeSpaceSuggestion.class, "maxItems", userLang) %></td>
    <td><%= newObj.getMaxItems()  %></td>
    <td><%= oldObj.getMaxItems()  %></td>
  </tr>
  </jalios:if>
  <%-- ** hideWhenNoResults ***************** --%>
  <jalios:if predicate='<%= newObj.getHideWhenNoResults() != oldObj.getHideWhenNoResults() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletCollaborativeSpaceSuggestion.class, "hideWhenNoResults", userLang) %></td>
    <td><%= newObj.getHideWhenNoResultsLabel(userLang) %></td>
    <td><%= oldObj.getHideWhenNoResultsLabel(userLang) %></td>
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
%><%-- r3xqrrx7nsuomzE74Qp31A== --%>