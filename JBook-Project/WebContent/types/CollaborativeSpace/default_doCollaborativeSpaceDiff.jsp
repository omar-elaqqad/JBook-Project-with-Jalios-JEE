<%@ page contentType="text/html; charset=UTF-8" %>
<%-- This file was automatically generated. Please, do not edit. --%>
<%--
  @Summary: generated.CollaborativeSpace diff page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
{ 
generated.CollaborativeSpace newObj = (generated.CollaborativeSpace)request.getAttribute("newPub"); 
generated.CollaborativeSpace oldObj = (generated.CollaborativeSpace)request.getAttribute("oldPub"); 
String[] vids = (String[])request.getAttribute("vids"); 
int fieldCount = 1; 
TypeEntry typeEntry = channel.getTypeEntry(generated.CollaborativeSpace.class);
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
 
  <%-- ** description ***************** --%>
  <jalios:foreach collection='<%= channel.getLanguageList() %>' name='itLang' type='String'>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getDescription(itLang, false), oldObj.getDescription(itLang, false)) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <% fieldDomId = "descriptionDiffDomId"; %>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.CollaborativeSpace.class, "description", userLang) %>
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
  <%-- ** introduction ***************** --%>
  <jalios:foreach collection='<%= channel.getLanguageList() %>' name='itLang' type='String'>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getIntroduction(itLang, false), oldObj.getIntroduction(itLang, false)) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <% fieldDomId = "introductionDiffDomId"; %>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.CollaborativeSpace.class, "introduction", userLang) %>
      <jalios:if predicate='<%= channel.isMultilingual() %>'><jalios:lang lang='<%= itLang %>'/></jalios:if>
      <% fieldDomId += "_" + itLang; %>
    </td>
    <% 
      request.setAttribute("fieldDomId", fieldDomId);
      request.setAttribute("step", "action");
    %>
    <td class="text-left" colspan="2" id="<%= fieldDomId %>">
    
    <div id='intro_introduction_<%= itLang %>'>
    <%= glp("ui.work.ver.diff.ww.change") %>. <a href='#' onclick="$('textHtmlView_introduction_<%= itLang %>').show(); $('intro_introduction_<%= itLang %>').hide(); return false;"><%= glp("ui.work.ver.diff.ww.detail") %>.</a>
    </div>
    <div id='textHtmlView_introduction_<%= itLang %>' style="display: none;">
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
      <div id='textView_introduction_<%= itLang %>'>
        <p>
    <%= glp("ui.work.ver.diff.ww.text") %>
    - <a href='#' onclick="$('htmlView_introduction_<%= itLang %>').show(); $('textView_introduction_<%= itLang %>').hide(); return false;"><%= glp("ui.work.ver.diff.ww.html") %></a>
    - <a href='#' onclick="$('intro_introduction_<%= itLang %>').show(); $('textHtmlView_introduction_<%= itLang %>').hide(); return false;"><%= glp("ui.work.ver.diff.ww.hide") %></a>
        </p>
    
    <%
    {
    String newIntroduction = newObj.getIntroduction(itLang, false) == null ? "" : Util.toWordLine(XmlUtil.extractText(newObj.getIntroduction(itLang, false)));
    String oldIntroduction = oldObj.getIntroduction(itLang, false) == null ? "" : Util.toWordLine(XmlUtil.extractText(oldObj.getIntroduction(itLang, false)));
    request.setAttribute("newField", newIntroduction);
    request.setAttribute("oldField", oldIntroduction);
    request.setAttribute("step", "show_fields");
    %>
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
        <div class="merge_fields" >
    <%
    BufferedReader newReader = new BufferedReader(new StringReader(newIntroduction));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldIntroduction));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldIntroduction));
    %>
    <%= diff.iterateHunkBuffer(oldReader, "<span class='diff-remove'>" , "</span>" , "<span class='diff-add'>" , "</span>", "" , "", false,true,true) %>
    <% 
    oldReader.close(); 
    }
    %>
    
        </div>
      </div>
    
      <div id='htmlView_introduction_<%= itLang %>' style='display: none;'>
        <p>
    <a href='#' onclick="$('textView_introduction_<%= itLang %>').show(); $('htmlView_introduction_<%= itLang %>').hide(); return false;"><%= glp("ui.work.ver.diff.ww.text") %></a>
    - <%= glp("ui.work.ver.diff.ww.html") %>
    - <a href='#' onclick="$('intro_introduction_<%= itLang %>').show(); $('textHtmlView_introduction_<%= itLang %>').hide(); return false;"><%= glp("ui.work.ver.diff.ww.hide") %></a>
        </p>
    
    <%
    {
    String newIntroduction = newObj.getIntroduction(itLang, false) == null ? "" : Util.toWordLine(newObj.getIntroduction(itLang, false));
    String oldIntroduction = oldObj.getIntroduction(itLang, false) == null ? "" : Util.toWordLine(oldObj.getIntroduction(itLang, false));
    request.setAttribute("newField", newIntroduction);
    request.setAttribute("oldField", oldIntroduction);
    request.setAttribute("step", "show_fields");
    %>
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
            <div class="merge_fields" >
    <%
    BufferedReader newReader = new BufferedReader(new StringReader(newIntroduction));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldIntroduction));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldIntroduction));
    %>
    <%= diff.iterateHunkBuffer(oldReader, "<span class='diff-remove'>" , "</span>" , "<span class='diff-add'>" , "</span>", "" , "", false,true,true) %>
    <% 
    oldReader.close(); 
    }
    %>
    
        </div>
      </div>
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
      <%= channel.getTypeFieldLabel(generated.CollaborativeSpace.class, "accessPolicy", userLang) %>
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
      <%= channel.getTypeFieldLabel(generated.CollaborativeSpace.class, "signupPolicy", userLang) %>
    </td>
    <td><%= Util.getString(newObj.getSignupPolicy(), "") %></td>
    <td><%= Util.getString(oldObj.getSignupPolicy(), "") %></td>
  </tr>
  </jalios:if>
  <%-- ** layout ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getLayout(), oldObj.getLayout()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.CollaborativeSpace.class, "layout", userLang) %>
    </td>
    <td><%= Util.getString(newObj.getLayout(), "") %></td>
    <td><%= Util.getString(oldObj.getLayout(), "") %></td>
  </tr>
  </jalios:if>
  <%-- ** dashboardColumnCount ***************** --%>
  <jalios:if predicate='<%= newObj.getDashboardColumnCount() != oldObj.getDashboardColumnCount() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.CollaborativeSpace.class, "dashboardColumnCount", userLang) %></td>
    <td><%= newObj.getDashboardColumnCount()  %></td>
    <td><%= oldObj.getDashboardColumnCount()  %></td>
  </tr>
  </jalios:if>
  <%-- ** theme ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getTheme(), oldObj.getTheme()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <% fieldDomId = "themeDiffDomId"; %>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.CollaborativeSpace.class, "theme", userLang) %>
    </td>
    <% 
      request.setAttribute("fieldDomId", fieldDomId);
      request.setAttribute("step", "action");
    %>
    <td class="text-left" colspan="2" id="<%= fieldDomId %>">
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
    <%
    {
    String newTheme = newObj.getTheme() == null ? "" : Util.toWordLine(newObj.getTheme());
    String oldTheme = oldObj.getTheme() == null ? "" : Util.toWordLine(oldObj.getTheme());
    request.setAttribute("newField", newTheme);
    request.setAttribute("oldField", oldTheme);
    request.setAttribute("step", "show_fields");
    %>
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
        <div class="merge_fields" >
    <%
    BufferedReader newReader = new BufferedReader(new StringReader(newTheme));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldTheme));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldTheme));
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
  <%-- ** header ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getHeader(), oldObj.getHeader()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.CollaborativeSpace.class, "header", userLang) %>
    </td>
    <td><%= Util.getString(newObj.getHeader(), "") %></td>
    <td><%= Util.getString(oldObj.getHeader(), "") %></td>
  </tr>
  </jalios:if>
  <%-- ** headerSettings ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getHeaderSettings(), oldObj.getHeaderSettings()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.CollaborativeSpace.class, "headerSettings", userLang) %>
    </td>
    <td><%= Util.getString(newObj.getHeaderSettings(), "") %></td>
    <td><%= Util.getString(oldObj.getHeaderSettings(), "") %></td>
  </tr>
  </jalios:if>
  <%-- ** exactCategory ***************** --%>
  <jalios:if predicate='<%= newObj.getExactCategory() != oldObj.getExactCategory() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.CollaborativeSpace.class, "exactCategory", userLang) %></td>
    <td><%= newObj.getExactCategoryLabel(userLang) %></td>
    <td><%= oldObj.getExactCategoryLabel(userLang) %></td>
  </tr>
  </jalios:if>
  <%-- ** followersGroup ***************** --%>
  <jalios:if predicate='<%= newObj.getFollowersGroup() != oldObj.getFollowersGroup() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.CollaborativeSpace.class, "followersGroup", userLang) %></td>
    <td>
      <% Data newLink = newObj.getFollowersGroup(); %>
      <% if (newLink != null) { %> 
      <%   if (newLink instanceof FileDocument) { %>
      <a href="work/displayWork.jsp?id=<%= newLink.getId() %>&amp;details=true"><jalios:fileicon doc='<%= ((FileDocument)newLink) %>' /></a>
      <%   } %><jalios:link data='<%= newLink %>'/><% } %>
    </td>
    <td>
      <% Data oldLink = oldObj.getFollowersGroup(); %>
      <% if (oldLink != null) { %> 
      <%   if (oldLink instanceof FileDocument) { %>
      <a href="work/displayWork.jsp?id=<%= oldLink.getId() %>&amp;details=true"><jalios:fileicon doc='<%= ((FileDocument)oldLink) %>' /></a>
      <%   } %><jalios:link data='<%= oldLink %>'/><% } %>
    </td>  </tr>
  </jalios:if>
  <%-- ** jportal ***************** --%>
  <jalios:if predicate='<%= newObj.getJportal() != oldObj.getJportal() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.CollaborativeSpace.class, "jportal", userLang) %></td>
    <td>
      <% Data newLink = newObj.getJportal(); %>
      <% if (newLink != null) { %> 
      <%   if (newLink instanceof FileDocument) { %>
      <a href="work/displayWork.jsp?id=<%= newLink.getId() %>&amp;details=true"><jalios:fileicon doc='<%= ((FileDocument)newLink) %>' /></a>
      <%   } %><jalios:link data='<%= newLink %>'/><% } %>
    </td>
    <td>
      <% Data oldLink = oldObj.getJportal(); %>
      <% if (oldLink != null) { %> 
      <%   if (oldLink instanceof FileDocument) { %>
      <a href="work/displayWork.jsp?id=<%= oldLink.getId() %>&amp;details=true"><jalios:fileicon doc='<%= ((FileDocument)oldLink) %>' /></a>
      <%   } %><jalios:link data='<%= oldLink %>'/><% } %>
    </td>  </tr>
  </jalios:if>
  <%-- ** syncMode ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getSyncMode(), oldObj.getSyncMode()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.CollaborativeSpace.class, "syncMode", userLang) %>
      
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
  <%-- ** modelSyncMode ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getModelSyncMode(), oldObj.getModelSyncMode()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.CollaborativeSpace.class, "modelSyncMode", userLang) %>
      
    </td>
    <td>
      <% if (Util.notEmpty(newObj.getModelSyncMode())) { %>
      <ol>
        <jalios:foreach name="itData" type="String" array="<%= newObj.getModelSyncMode() %>" counter='c2'>
        <li><%= itData %></li>
        </jalios:foreach>
      </ol>
      <% } else { %> - <% } %>
    </td>
    <td>
      <% if (Util.notEmpty(oldObj.getModelSyncMode())) { %>
      <ol>
        <jalios:foreach name="itData" type="String" array="<%= oldObj.getModelSyncMode() %>" counter='c2'>
        <li><%= itData %></li>
        </jalios:foreach>
      </ol>
      <% } else { %> - <% } %>
    </td>
  </tr>
  </jalios:if>
  <%-- ** model ***************** --%>
  <jalios:if predicate='<%= newObj.getModel() != oldObj.getModel() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.CollaborativeSpace.class, "model", userLang) %></td>
    <td>
      <% Data newLink = newObj.getModel(); %>
      <% if (newLink != null) { %> 
      <%   if (newLink instanceof FileDocument) { %>
      <a href="work/displayWork.jsp?id=<%= newLink.getId() %>&amp;details=true"><jalios:fileicon doc='<%= ((FileDocument)newLink) %>' /></a>
      <%   } %><jalios:link data='<%= newLink %>'/><% } %>
    </td>
    <td>
      <% Data oldLink = oldObj.getModel(); %>
      <% if (oldLink != null) { %> 
      <%   if (oldLink instanceof FileDocument) { %>
      <a href="work/displayWork.jsp?id=<%= oldLink.getId() %>&amp;details=true"><jalios:fileicon doc='<%= ((FileDocument)oldLink) %>' /></a>
      <%   } %><jalios:link data='<%= oldLink %>'/><% } %>
    </td>  </tr>
  </jalios:if>
  <%-- ** applications ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getApplications(), oldObj.getApplications()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.CollaborativeSpace.class, "applications", userLang) %></td>
    <td>
      <% if (Util.notEmpty(newObj.getApplications())) { %>
      <ol>
        <jalios:foreach name="itData" type="Data" array="<%= newObj.getApplications() %>">
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
      <% if (Util.notEmpty(oldObj.getApplications())) { %>
      <ol>
        <jalios:foreach name="itData" type="Data" array="<%= oldObj.getApplications() %>">
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
  <%-- ** mobilePortlets ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getMobilePortlets(), oldObj.getMobilePortlets()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.CollaborativeSpace.class, "mobilePortlets", userLang) %></td>
    <td>
      <% if (Util.notEmpty(newObj.getMobilePortlets())) { %>
      <ol>
        <jalios:foreach name="itData" type="Data" array="<%= newObj.getMobilePortlets() %>">
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
      <% if (Util.notEmpty(oldObj.getMobilePortlets())) { %>
      <ol>
        <jalios:foreach name="itData" type="Data" array="<%= oldObj.getMobilePortlets() %>">
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
  <%-- ** mobileShowIntro ***************** --%>
  <jalios:if predicate='<%= newObj.getMobileShowIntro() != oldObj.getMobileShowIntro() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.CollaborativeSpace.class, "mobileShowIntro", userLang) %></td>
    <td><%= newObj.getMobileShowIntroLabel(userLang) %></td>
    <td><%= oldObj.getMobileShowIntroLabel(userLang) %></td>
  </tr>
  </jalios:if>
  <%-- ** mobileShowApplications ***************** --%>
  <jalios:if predicate='<%= newObj.getMobileShowApplications() != oldObj.getMobileShowApplications() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.CollaborativeSpace.class, "mobileShowApplications", userLang) %></td>
    <td><%= newObj.getMobileShowApplicationsLabel(userLang) %></td>
    <td><%= oldObj.getMobileShowApplicationsLabel(userLang) %></td>
  </tr>
  </jalios:if>
<%
  ServletUtil.backupAttribute(pageContext, "fieldCount");
  ServletUtil.backupAttribute(pageContext, "isSuperTypeIncluded");
  request.setAttribute("fieldCount", new Integer(fieldCount));
  request.setAttribute("isSuperTypeIncluded", Boolean.TRUE);
%>
<jsp:include page="/types/AbstractCollaborativeSpace/doAbstractCollaborativeSpaceDiff.jsp"/>
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
%><%-- 7Ozpp8XkzuVhY6GrWLvfwA== --%>