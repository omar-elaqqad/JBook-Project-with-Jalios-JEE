<%@ page contentType="text/html; charset=UTF-8" %>
<%-- This file was automatically generated. Please, do not edit. --%>
<%--
  @Summary: generated.CSRequest diff page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
{ 
generated.CSRequest newObj = (generated.CSRequest)request.getAttribute("newPub"); 
generated.CSRequest oldObj = (generated.CSRequest)request.getAttribute("oldPub"); 
String[] vids = (String[])request.getAttribute("vids"); 
int fieldCount = 1; 
TypeEntry typeEntry = channel.getTypeEntry(generated.CSRequest.class);
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
 
  <%-- ** name ***************** --%>
  <jalios:foreach collection='<%= channel.getLanguageList() %>' name='itLang' type='String'>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getName(itLang, false), oldObj.getName(itLang, false)) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <% fieldDomId = "nameDiffDomId"; %>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.CSRequest.class, "name", userLang) %>
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
    String newName = newObj.getName(itLang, false) == null ? "" : Util.toWordLine(newObj.getName(itLang, false));
    String oldName = oldObj.getName(itLang, false) == null ? "" : Util.toWordLine(oldObj.getName(itLang, false));
    request.setAttribute("newField", newName);
    request.setAttribute("oldField", oldName);
    request.setAttribute("step", "show_fields");
    %>
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
        <div class="merge_fields" >
    <%
    BufferedReader newReader = new BufferedReader(new StringReader(newName));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldName));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldName));
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
  <%-- ** description ***************** --%>
  <jalios:foreach collection='<%= channel.getLanguageList() %>' name='itLang' type='String'>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getDescription(itLang, false), oldObj.getDescription(itLang, false)) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <% fieldDomId = "descriptionDiffDomId"; %>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.CSRequest.class, "description", userLang) %>
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
    String newDescription = newObj.getDescription(itLang, false) == null ? "" : Util.toWordLine(newObj.getDescription(itLang, false));
    String oldDescription = oldObj.getDescription(itLang, false) == null ? "" : Util.toWordLine(oldObj.getDescription(itLang, false));
    request.setAttribute("newField", newDescription);
    request.setAttribute("oldField", oldDescription);
    request.setAttribute("step", "show_fields");
    %>
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
        <div class="merge_fields" >
    <%
    BufferedReader newReader = new BufferedReader(new StringReader(newDescription));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldDescription));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldDescription));
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
  <%-- ** accessPolicy ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getAccessPolicy(), oldObj.getAccessPolicy()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.CSRequest.class, "accessPolicy", userLang) %>
    </td>
    <td><%= Util.getString(newObj.getAccessPolicy(), "") %></td>
    <td><%= Util.getString(oldObj.getAccessPolicy(), "") %></td>
  </tr>
  </jalios:if>
  <%-- ** signupPolicy ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getSignupPolicy(), oldObj.getSignupPolicy()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.CSRequest.class, "signupPolicy", userLang) %>
    </td>
    <td><%= Util.getString(newObj.getSignupPolicy(), "") %></td>
    <td><%= Util.getString(oldObj.getSignupPolicy(), "") %></td>
  </tr>
  </jalios:if>
  <%-- ** model ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getModel(), oldObj.getModel()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <% fieldDomId = "modelDiffDomId"; %>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.CSRequest.class, "model", userLang) %>
    </td>
    <% 
      request.setAttribute("fieldDomId", fieldDomId);
      request.setAttribute("step", "action");
    %>
    <td class="text-left" colspan="2" id="<%= fieldDomId %>">
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
    <%
    {
    String newModel = newObj.getModel() == null ? "" : Util.toWordLine(newObj.getModel());
    String oldModel = oldObj.getModel() == null ? "" : Util.toWordLine(oldObj.getModel());
    request.setAttribute("newField", newModel);
    request.setAttribute("oldField", oldModel);
    request.setAttribute("step", "show_fields");
    %>
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
        <div class="merge_fields" >
    <%
    BufferedReader newReader = new BufferedReader(new StringReader(newModel));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldModel));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldModel));
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
  <%-- ** language ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getLanguage(), oldObj.getLanguage()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <% fieldDomId = "languageDiffDomId"; %>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.CSRequest.class, "language", userLang) %>
    </td>
    <% 
      request.setAttribute("fieldDomId", fieldDomId);
      request.setAttribute("step", "action");
    %>
    <td class="text-left" colspan="2" id="<%= fieldDomId %>">
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
    <%
    {
    String newLanguage = newObj.getLanguage() == null ? "" : Util.toWordLine(newObj.getLanguage());
    String oldLanguage = oldObj.getLanguage() == null ? "" : Util.toWordLine(oldObj.getLanguage());
    request.setAttribute("newField", newLanguage);
    request.setAttribute("oldField", oldLanguage);
    request.setAttribute("step", "show_fields");
    %>
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
        <div class="merge_fields" >
    <%
    BufferedReader newReader = new BufferedReader(new StringReader(newLanguage));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldLanguage));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldLanguage));
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
  <%-- ** admins ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getAdmins(), oldObj.getAdmins()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.CSRequest.class, "admins", userLang) %></td>
    <td>
      <% if (Util.notEmpty(newObj.getAdmins())) { %>
      <ol>
        <jalios:foreach name="itData" type="Data" array="<%= newObj.getAdmins() %>">
        <li>
        <% if (itData != null) { %> 
        <%   if (itData instanceof FileDocument) { %>
        <a href="work/displayWork.jsp?id=<%= itData.getId() %>&amp;details=true"><jalios:fileicon doc='<%= ((FileDocument)itData) %>' /></a>
        <%   } %><jalios:link data='<%= itData %>'/><% } else { %> - <% } %>
        </li>
        </jalios:foreach>
      </ol>
      <% } %>
    </td>
    <td>
      <% if (Util.notEmpty(oldObj.getAdmins())) { %>
      <ol>
        <jalios:foreach name="itData" type="Data" array="<%= oldObj.getAdmins() %>">
        <li>
        <% if (itData != null) { %> 
        <%   if (itData instanceof FileDocument) { %>
        <a href="work/displayWork.jsp?id=<%= itData.getId() %>&amp;details=true"><jalios:fileicon doc='<%= ((FileDocument)itData) %>' /></a>
        <%   } %><jalios:link data='<%= itData %>'/><% } else { %> - <% } %>
        </li>
        </jalios:foreach>
      </ol>
      <% } %>
    </td>
  </tr>
  </jalios:if>
  <%-- ** groups ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getGroups(), oldObj.getGroups()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.CSRequest.class, "groups", userLang) %></td>
    <td>
      <% if (Util.notEmpty(newObj.getGroups())) { %>
      <ol>
        <jalios:foreach name="itData" type="Data" array="<%= newObj.getGroups() %>">
        <li>
        <% if (itData != null) { %> 
        <%   if (itData instanceof FileDocument) { %>
        <a href="work/displayWork.jsp?id=<%= itData.getId() %>&amp;details=true"><jalios:fileicon doc='<%= ((FileDocument)itData) %>' /></a>
        <%   } %><jalios:link data='<%= itData %>'/><% } else { %> - <% } %>
        </li>
        </jalios:foreach>
      </ol>
      <% } %>
    </td>
    <td>
      <% if (Util.notEmpty(oldObj.getGroups())) { %>
      <ol>
        <jalios:foreach name="itData" type="Data" array="<%= oldObj.getGroups() %>">
        <li>
        <% if (itData != null) { %> 
        <%   if (itData instanceof FileDocument) { %>
        <a href="work/displayWork.jsp?id=<%= itData.getId() %>&amp;details=true"><jalios:fileicon doc='<%= ((FileDocument)itData) %>' /></a>
        <%   } %><jalios:link data='<%= itData %>'/><% } else { %> - <% } %>
        </li>
        </jalios:foreach>
      </ol>
      <% } %>
    </td>
  </tr>
  </jalios:if>
  <%-- ** members ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getMembers(), oldObj.getMembers()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.CSRequest.class, "members", userLang) %></td>
    <td>
      <% if (Util.notEmpty(newObj.getMembers())) { %>
      <ol>
        <jalios:foreach name="itData" type="Data" array="<%= newObj.getMembers() %>">
        <li>
        <% if (itData != null) { %> 
        <%   if (itData instanceof FileDocument) { %>
        <a href="work/displayWork.jsp?id=<%= itData.getId() %>&amp;details=true"><jalios:fileicon doc='<%= ((FileDocument)itData) %>' /></a>
        <%   } %><jalios:link data='<%= itData %>'/><% } else { %> - <% } %>
        </li>
        </jalios:foreach>
      </ol>
      <% } %>
    </td>
    <td>
      <% if (Util.notEmpty(oldObj.getMembers())) { %>
      <ol>
        <jalios:foreach name="itData" type="Data" array="<%= oldObj.getMembers() %>">
        <li>
        <% if (itData != null) { %> 
        <%   if (itData instanceof FileDocument) { %>
        <a href="work/displayWork.jsp?id=<%= itData.getId() %>&amp;details=true"><jalios:fileicon doc='<%= ((FileDocument)itData) %>' /></a>
        <%   } %><jalios:link data='<%= itData %>'/><% } else { %> - <% } %>
        </li>
        </jalios:foreach>
      </ol>
      <% } %>
    </td>
  </tr>
  </jalios:if>
  <%-- ** notificationPolicy ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getNotificationPolicy(), oldObj.getNotificationPolicy()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.CSRequest.class, "notificationPolicy", userLang) %>
    </td>
    <td><%= Util.getString(newObj.getNotificationPolicy(), "") %></td>
    <td><%= Util.getString(oldObj.getNotificationPolicy(), "") %></td>
  </tr>
  </jalios:if>
  <%-- ** parent ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getParent(), oldObj.getParent()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <% fieldDomId = "parentDiffDomId"; %>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.CSRequest.class, "parent", userLang) %>
    </td>
    <% 
      request.setAttribute("fieldDomId", fieldDomId);
      request.setAttribute("step", "action");
    %>
    <td class="text-left" colspan="2" id="<%= fieldDomId %>">
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
    <%
    {
    String newParent = newObj.getParent() == null ? "" : Util.toWordLine(newObj.getParent());
    String oldParent = oldObj.getParent() == null ? "" : Util.toWordLine(oldObj.getParent());
    request.setAttribute("newField", newParent);
    request.setAttribute("oldField", oldParent);
    request.setAttribute("step", "show_fields");
    %>
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
        <div class="merge_fields" >
    <%
    BufferedReader newReader = new BufferedReader(new StringReader(newParent));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldParent));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldParent));
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
  <%-- ** syncMode ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getSyncMode(), oldObj.getSyncMode()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.CSRequest.class, "syncMode", userLang) %>
      
    </td>
    <td>
      <% if (Util.notEmpty(newObj.getSyncMode())) { %>
      <ol>
        <jalios:foreach name="itData" type="String" array="<%= newObj.getSyncMode() %>" counter='c2'>
        <li><%= itData %></li>
        </jalios:foreach>
      </ol>
      <% } else { %> - <% } %>
    </td>
    <td>
      <% if (Util.notEmpty(oldObj.getSyncMode())) { %>
      <ol>
        <jalios:foreach name="itData" type="String" array="<%= oldObj.getSyncMode() %>" counter='c2'>
        <li><%= itData %></li>
        </jalios:foreach>
      </ol>
      <% } else { %> - <% } %>
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
%><%-- jnkrjGK4JRolWuqK0fouhw== --%>