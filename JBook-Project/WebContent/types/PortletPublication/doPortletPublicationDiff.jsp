<%@ page contentType="text/html; charset=UTF-8" %>
<%-- This file was automatically generated. Please, do not edit. --%>
<%--
  @Summary: generated.PortletPublication diff page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
{ 
generated.PortletPublication newObj = (generated.PortletPublication)request.getAttribute("newPub"); 
generated.PortletPublication oldObj = (generated.PortletPublication)request.getAttribute("oldPub"); 
String[] vids = (String[])request.getAttribute("vids"); 
int fieldCount = 1; 
TypeEntry typeEntry = channel.getTypeEntry(generated.PortletPublication.class);
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
 
  <%-- ** pub ***************** --%>
  <jalios:if predicate='<%= newObj.getPub() != oldObj.getPub() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletPublication.class, "pub", userLang) %></td>
    <td>
      <% Data newLink = newObj.getPub(); %>
      <% if (newLink != null) { %> 
      <%   if (newLink instanceof FileDocument) { %>
      <a href="work/displayWork.jsp?id=<%= newLink.getId() %>&amp;details=true"><jalios:fileicon doc='<%= ((FileDocument)newLink) %>' /></a>
      <%   } %><jalios:link data='<%= newLink %>'/><% } %>
    </td>
    <td>
      <% Data oldLink = oldObj.getPub(); %>
      <% if (oldLink != null) { %> 
      <%   if (oldLink instanceof FileDocument) { %>
      <a href="work/displayWork.jsp?id=<%= oldLink.getId() %>&amp;details=true"><jalios:fileicon doc='<%= ((FileDocument)oldLink) %>' /></a>
      <%   } %><jalios:link data='<%= oldLink %>'/><% } %>
    </td>  </tr>
  </jalios:if>
  <%-- ** template ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getTemplate(), oldObj.getTemplate()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <% fieldDomId = "templateDiffDomId"; %>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.PortletPublication.class, "template", userLang) %>
    </td>
    <% 
      request.setAttribute("fieldDomId", fieldDomId);
      request.setAttribute("step", "action");
    %>
    <td class="text-left" colspan="2" id="<%= fieldDomId %>">
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
    <%
    {
    String newTemplate = newObj.getTemplate() == null ? "" : Util.toWordLine(newObj.getTemplate());
    String oldTemplate = oldObj.getTemplate() == null ? "" : Util.toWordLine(oldObj.getTemplate());
    request.setAttribute("newField", newTemplate);
    request.setAttribute("oldField", oldTemplate);
    request.setAttribute("step", "show_fields");
    %>
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
        <div class="merge_fields" >
    <%
    BufferedReader newReader = new BufferedReader(new StringReader(newTemplate));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldTemplate));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldTemplate));
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
  <%-- ** showDisplayHeader ***************** --%>
  <jalios:if predicate='<%= newObj.getShowDisplayHeader() != oldObj.getShowDisplayHeader() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletPublication.class, "showDisplayHeader", userLang) %></td>
    <td><%= newObj.getShowDisplayHeaderLabel(userLang) %></td>
    <td><%= oldObj.getShowDisplayHeaderLabel(userLang) %></td>
  </tr>
  </jalios:if>
  <%-- ** showDisplayFooter ***************** --%>
  <jalios:if predicate='<%= newObj.getShowDisplayFooter() != oldObj.getShowDisplayFooter() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletPublication.class, "showDisplayFooter", userLang) %></td>
    <td><%= newObj.getShowDisplayFooterLabel(userLang) %></td>
    <td><%= oldObj.getShowDisplayFooterLabel(userLang) %></td>
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
%><%-- 01WyCTq8imqHhQZFS/n9ag== --%>