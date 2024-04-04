<%@ page contentType="text/html; charset=UTF-8" %>
<%-- This file was automatically generated. Please, do not edit. --%>
<%--
  @Summary: generated.Shortcut diff page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
{ 
generated.Shortcut newObj = (generated.Shortcut)request.getAttribute("newPub"); 
generated.Shortcut oldObj = (generated.Shortcut)request.getAttribute("oldPub"); 
String[] vids = (String[])request.getAttribute("vids"); 
int fieldCount = 1; 
TypeEntry typeEntry = channel.getTypeEntry(generated.Shortcut.class);
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
 
  <%-- ** image ***************** --%>
  <jalios:foreach collection='<%= channel.getLanguageList() %>' name='itLang' type='String'>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getImage(itLang, false), oldObj.getImage(itLang, false)) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.Shortcut.class, "image", userLang) %>
      <jalios:if predicate='<%= channel.isMultilingual() %>'><jalios:lang lang='<%= itLang %>'/></jalios:if>
    </td>
    <td><%= Util.getString(newObj.getImage(itLang, false), "") %></td>
    <td><%= Util.getString(oldObj.getImage(itLang, false), "") %></td>
  </tr>
  </jalios:if>
  </jalios:foreach>
  <%-- ** icon ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getIcon(), oldObj.getIcon()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.Shortcut.class, "icon", userLang) %>
    </td>
    <td><%= Util.getString(newObj.getIcon(), "") %></td>
    <td><%= Util.getString(oldObj.getIcon(), "") %></td>
  </tr>
  </jalios:if>
  <%-- ** text ***************** --%>
  <jalios:foreach collection='<%= channel.getLanguageList() %>' name='itLang' type='String'>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getText(itLang, false), oldObj.getText(itLang, false)) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <% fieldDomId = "textDiffDomId"; %>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.Shortcut.class, "text", userLang) %>
      <jalios:if predicate='<%= channel.isMultilingual() %>'><jalios:lang lang='<%= itLang %>'/></jalios:if>
      <% fieldDomId += "_" + itLang; %>
    </td>
    <% 
      request.setAttribute("fieldDomId", fieldDomId);
      request.setAttribute("step", "action");
    %>
    <td class="text-left" colspan="2" id="<%= fieldDomId %>">
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
    <%
    {
    String newText = newObj.getText(itLang, false) == null ? "" : Util.toWordLine(newObj.getText(itLang, false));
    String oldText = oldObj.getText(itLang, false) == null ? "" : Util.toWordLine(oldObj.getText(itLang, false));
    request.setAttribute("newField", newText);
    request.setAttribute("oldField", oldText);
    request.setAttribute("step", "show_fields");
    %>
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
        <div class="merge_fields" >
    <%
    BufferedReader newReader = new BufferedReader(new StringReader(newText));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldText));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldText));
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
  </jalios:foreach>
  <%-- ** link ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getLink(), oldObj.getLink()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.Shortcut.class, "link", userLang) %>
    </td>
    <td><%= Util.getString(newObj.getLink(), "") %></td>
    <td><%= Util.getString(oldObj.getLink(), "") %></td>
  </tr>
  </jalios:if>
  <%-- ** pub ***************** --%>
  <jalios:if predicate='<%= newObj.getPub() != oldObj.getPub() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.Shortcut.class, "pub", userLang) %></td>
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
  <%-- ** parameters ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getParameters(), oldObj.getParameters()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <% fieldDomId = "parametersDiffDomId"; %>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.Shortcut.class, "parameters", userLang) %>
    </td>
    <% 
      request.setAttribute("fieldDomId", fieldDomId);
      request.setAttribute("step", "action");
    %>
    <td class="text-left" colspan="2" id="<%= fieldDomId %>">
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
    <%
    {
    String newParameters = newObj.getParameters() == null ? "" : Util.toWordLine(newObj.getParameters());
    String oldParameters = oldObj.getParameters() == null ? "" : Util.toWordLine(oldObj.getParameters());
    request.setAttribute("newField", newParameters);
    request.setAttribute("oldField", oldParameters);
    request.setAttribute("step", "show_fields");
    %>
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
        <div class="merge_fields" >
    <%
    BufferedReader newReader = new BufferedReader(new StringReader(newParameters));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldParameters));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldParameters));
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
  <%-- ** keywords ***************** --%>
  <jalios:foreach collection='<%= channel.getLanguageList() %>' name='itLang' type='String'>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getKeywords(itLang, false), oldObj.getKeywords(itLang, false)) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <% fieldDomId = "keywordsDiffDomId"; %>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.Shortcut.class, "keywords", userLang) %>
      <jalios:if predicate='<%= channel.isMultilingual() %>'><jalios:lang lang='<%= itLang %>'/></jalios:if>
      <% fieldDomId += "_" + itLang; %>
    </td>
    <% 
      request.setAttribute("fieldDomId", fieldDomId);
      request.setAttribute("step", "action");
    %>
    <td class="text-left" colspan="2" id="<%= fieldDomId %>">
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
    <%
    {
    String newKeywords = newObj.getKeywords(itLang, false) == null ? "" : Util.toWordLine(newObj.getKeywords(itLang, false));
    String oldKeywords = oldObj.getKeywords(itLang, false) == null ? "" : Util.toWordLine(oldObj.getKeywords(itLang, false));
    request.setAttribute("newField", newKeywords);
    request.setAttribute("oldField", oldKeywords);
    request.setAttribute("step", "show_fields");
    %>
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
        <div class="merge_fields" >
    <%
    BufferedReader newReader = new BufferedReader(new StringReader(newKeywords));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldKeywords));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldKeywords));
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
  </jalios:foreach>
  <%-- ** openMode ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getOpenMode(), oldObj.getOpenMode()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.Shortcut.class, "openMode", userLang) %>
    </td>
    <td><%= Util.getString(newObj.getOpenMode(), "") %></td>
    <td><%= Util.getString(oldObj.getOpenMode(), "") %></td>
  </tr>
  </jalios:if>
  <%-- ** showInToolsPage ***************** --%>
  <jalios:if predicate='<%= newObj.getShowInToolsPage() != oldObj.getShowInToolsPage() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.Shortcut.class, "showInToolsPage", userLang) %></td>
    <td><%= newObj.getShowInToolsPageLabel(userLang) %></td>
    <td><%= oldObj.getShowInToolsPageLabel(userLang) %></td>
  </tr>
  </jalios:if>
  <%-- ** type ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getType(loggedMember), oldObj.getType(loggedMember)) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.Shortcut.class, "type", userLang) %></td>
    <td>
      <% if (Util.notEmpty(newObj.getType(loggedMember))) { %>
      <ol>
        <jalios:foreach collection="<%= newObj.getType(loggedMember) %>" type="Category" name="itCategory" >
        <li><%= itCategory == null ? "" : itCategory.getAncestorString(channel.getCategory("$id.application.shortcut.category"), " > ", true) %></li>
        </jalios:foreach>
      </ol>
      <% } %>
    </td>
    <td>
      <% if (Util.notEmpty(oldObj.getType(loggedMember))) { %>
      <ol>
        <jalios:foreach collection="<%= oldObj.getType(loggedMember) %>" type="Category" name="itCategory" >
        <li><%= itCategory == null ? "" : itCategory.getAncestorString(channel.getCategory("$id.application.shortcut.category"), " > ", true) %></li>
        </jalios:foreach>
      </ol>
      <% } %>
    </td>
  </tr>
  </jalios:if>
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
%><%-- UfezOKzGMIS0s9dbhrsyTA== --%>