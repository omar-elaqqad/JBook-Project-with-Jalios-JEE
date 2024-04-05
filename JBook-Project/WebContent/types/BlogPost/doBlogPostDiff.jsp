<%@ page contentType="text/html; charset=UTF-8" %>
<%-- This file was automatically generated. Please, do not edit. --%>
<%--
  @Summary: generated.BlogPost diff page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
{ 
generated.BlogPost newObj = (generated.BlogPost)request.getAttribute("newPub"); 
generated.BlogPost oldObj = (generated.BlogPost)request.getAttribute("oldPub"); 
String[] vids = (String[])request.getAttribute("vids"); 
int fieldCount = 1; 
TypeEntry typeEntry = channel.getTypeEntry(generated.BlogPost.class);
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
 
  <%-- ** content ***************** --%>
  <jalios:foreach collection='<%= channel.getLanguageList() %>' name='itLang' type='String'>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getContent(itLang, false), oldObj.getContent(itLang, false)) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <% fieldDomId = "contentDiffDomId"; %>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.BlogPost.class, "content", userLang) %>
      <jalios:if predicate='<%= channel.isMultilingual() %>'><jalios:lang lang='<%= itLang %>'/></jalios:if>
      <% fieldDomId += "_" + itLang; %>
    </td>
    <% 
      request.setAttribute("fieldDomId", fieldDomId);
      request.setAttribute("step", "action");
    %>
    <td class="text-left" colspan="2" id="<%= fieldDomId %>">
    
    <div id='intro_content_<%= itLang %>'>
    <%= glp("ui.work.ver.diff.ww.change") %>. <a href='#' onclick="$('textHtmlView_content_<%= itLang %>').show(); $('intro_content_<%= itLang %>').hide(); return false;"><%= glp("ui.work.ver.diff.ww.detail") %>.</a>
    </div>
    <div id='textHtmlView_content_<%= itLang %>' style="display: none;">
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
      <div id='textView_content_<%= itLang %>'>
        <p>
    <%= glp("ui.work.ver.diff.ww.text") %>
    - <a href='#' onclick="$('htmlView_content_<%= itLang %>').show(); $('textView_content_<%= itLang %>').hide(); return false;"><%= glp("ui.work.ver.diff.ww.html") %></a>
    - <a href='#' onclick="$('intro_content_<%= itLang %>').show(); $('textHtmlView_content_<%= itLang %>').hide(); return false;"><%= glp("ui.work.ver.diff.ww.hide") %></a>
        </p>
    
    <%
    {
    String newContent = newObj.getContent(itLang, false) == null ? "" : Util.toWordLine(XmlUtil.extractText(newObj.getContent(itLang, false)));
    String oldContent = oldObj.getContent(itLang, false) == null ? "" : Util.toWordLine(XmlUtil.extractText(oldObj.getContent(itLang, false)));
    request.setAttribute("newField", newContent);
    request.setAttribute("oldField", oldContent);
    request.setAttribute("step", "show_fields");
    %>
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
        <div class="merge_fields" >
    <%
    BufferedReader newReader = new BufferedReader(new StringReader(newContent));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldContent));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldContent));
    %>
    <%= diff.iterateHunkBuffer(oldReader, "<span class='diff-remove'>" , "</span>" , "<span class='diff-add'>" , "</span>", "" , "", false,true,true) %>
    <% 
    oldReader.close(); 
    }
    %>
    
        </div>
      </div>
    
      <div id='htmlView_content_<%= itLang %>' style='display: none;'>
        <p>
    <a href='#' onclick="$('textView_content_<%= itLang %>').show(); $('htmlView_content_<%= itLang %>').hide(); return false;"><%= glp("ui.work.ver.diff.ww.text") %></a>
    - <%= glp("ui.work.ver.diff.ww.html") %>
    - <a href='#' onclick="$('intro_content_<%= itLang %>').show(); $('textHtmlView_content_<%= itLang %>').hide(); return false;"><%= glp("ui.work.ver.diff.ww.hide") %></a>
        </p>
    
    <%
    {
    String newContent = newObj.getContent(itLang, false) == null ? "" : Util.toWordLine(newObj.getContent(itLang, false));
    String oldContent = oldObj.getContent(itLang, false) == null ? "" : Util.toWordLine(oldObj.getContent(itLang, false));
    request.setAttribute("newField", newContent);
    request.setAttribute("oldField", oldContent);
    request.setAttribute("step", "show_fields");
    %>
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
            <div class="merge_fields" >
    <%
    BufferedReader newReader = new BufferedReader(new StringReader(newContent));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldContent));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldContent));
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
  <%-- ** summary ***************** --%>
  <jalios:foreach collection='<%= channel.getLanguageList() %>' name='itLang' type='String'>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getSummary(itLang, false), oldObj.getSummary(itLang, false)) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <% fieldDomId = "summaryDiffDomId"; %>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.BlogPost.class, "summary", userLang) %>
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
    String newSummary = newObj.getSummary(itLang, false) == null ? "" : Util.toWordLine(newObj.getSummary(itLang, false));
    String oldSummary = oldObj.getSummary(itLang, false) == null ? "" : Util.toWordLine(oldObj.getSummary(itLang, false));
    request.setAttribute("newField", newSummary);
    request.setAttribute("oldField", oldSummary);
    request.setAttribute("step", "show_fields");
    %>
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
        <div class="merge_fields" >
    <%
    BufferedReader newReader = new BufferedReader(new StringReader(newSummary));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldSummary));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldSummary));
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
  <%-- ** blog ***************** --%>
  <jalios:if predicate='<%= newObj.getBlog() != oldObj.getBlog() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.BlogPost.class, "blog", userLang) %></td>
    <td>
      <% Data newLink = newObj.getBlog(); %>
      <% if (newLink != null) { %> 
      <%   if (newLink instanceof FileDocument) { %>
      <a href="work/displayWork.jsp?id=<%= newLink.getId() %>&amp;details=true"><jalios:fileicon doc='<%= ((FileDocument)newLink) %>' /></a>
      <%   } %><jalios:link data='<%= newLink %>'/><% } %>
    </td>
    <td>
      <% Data oldLink = oldObj.getBlog(); %>
      <% if (oldLink != null) { %> 
      <%   if (oldLink instanceof FileDocument) { %>
      <a href="work/displayWork.jsp?id=<%= oldLink.getId() %>&amp;details=true"><jalios:fileicon doc='<%= ((FileDocument)oldLink) %>' /></a>
      <%   } %><jalios:link data='<%= oldLink %>'/><% } %>
    </td>  </tr>
  </jalios:if>
  <%-- ** category ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getCategory(loggedMember), oldObj.getCategory(loggedMember)) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.BlogPost.class, "category", userLang) %></td>
    <td>
      <% if (Util.notEmpty(newObj.getCategory(loggedMember))) { %>
      <ol>
        <jalios:foreach collection="<%= newObj.getCategory(loggedMember) %>" type="Category" name="itCategory" >
        <li><%= itCategory == null ? "" : itCategory.getAncestorString(channel.getCategory("j_3"), " > ", true) %></li>
        </jalios:foreach>
      </ol>
      <% } %>
    </td>
    <td>
      <% if (Util.notEmpty(oldObj.getCategory(loggedMember))) { %>
      <ol>
        <jalios:foreach collection="<%= oldObj.getCategory(loggedMember) %>" type="Category" name="itCategory" >
        <li><%= itCategory == null ? "" : itCategory.getAncestorString(channel.getCategory("j_3"), " > ", true) %></li>
        </jalios:foreach>
      </ol>
      <% } %>
    </td>
  </tr>
  </jalios:if>
  <%-- ** featuredImage ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getFeaturedImage(), oldObj.getFeaturedImage()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.BlogPost.class, "featuredImage", userLang) %>
    </td>
    <td><%= Util.getString(newObj.getFeaturedImage(), "") %></td>
    <td><%= Util.getString(oldObj.getFeaturedImage(), "") %></td>
  </tr>
  </jalios:if>
  <%-- ** featuredImageAlt ***************** --%>
  <jalios:foreach collection='<%= channel.getLanguageList() %>' name='itLang' type='String'>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getFeaturedImageAlt(itLang, false), oldObj.getFeaturedImageAlt(itLang, false)) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <% fieldDomId = "featuredImageAltDiffDomId"; %>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.BlogPost.class, "featuredImageAlt", userLang) %>
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
    String newFeaturedImageAlt = newObj.getFeaturedImageAlt(itLang, false) == null ? "" : Util.toWordLine(newObj.getFeaturedImageAlt(itLang, false));
    String oldFeaturedImageAlt = oldObj.getFeaturedImageAlt(itLang, false) == null ? "" : Util.toWordLine(oldObj.getFeaturedImageAlt(itLang, false));
    request.setAttribute("newField", newFeaturedImageAlt);
    request.setAttribute("oldField", oldFeaturedImageAlt);
    request.setAttribute("step", "show_fields");
    %>
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
        <div class="merge_fields" >
    <%
    BufferedReader newReader = new BufferedReader(new StringReader(newFeaturedImageAlt));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldFeaturedImageAlt));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldFeaturedImageAlt));
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
  <%-- ** thumbnailImage ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getThumbnailImage(), oldObj.getThumbnailImage()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.BlogPost.class, "thumbnailImage", userLang) %>
    </td>
    <td><%= Util.getString(newObj.getThumbnailImage(), "") %></td>
    <td><%= Util.getString(oldObj.getThumbnailImage(), "") %></td>
  </tr>
  </jalios:if>
  <%-- ** thumbnailImageAlt ***************** --%>
  <jalios:foreach collection='<%= channel.getLanguageList() %>' name='itLang' type='String'>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getThumbnailImageAlt(itLang, false), oldObj.getThumbnailImageAlt(itLang, false)) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <% fieldDomId = "thumbnailImageAltDiffDomId"; %>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.BlogPost.class, "thumbnailImageAlt", userLang) %>
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
    String newThumbnailImageAlt = newObj.getThumbnailImageAlt(itLang, false) == null ? "" : Util.toWordLine(newObj.getThumbnailImageAlt(itLang, false));
    String oldThumbnailImageAlt = oldObj.getThumbnailImageAlt(itLang, false) == null ? "" : Util.toWordLine(oldObj.getThumbnailImageAlt(itLang, false));
    request.setAttribute("newField", newThumbnailImageAlt);
    request.setAttribute("oldField", oldThumbnailImageAlt);
    request.setAttribute("step", "show_fields");
    %>
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
        <div class="merge_fields" >
    <%
    BufferedReader newReader = new BufferedReader(new StringReader(newThumbnailImageAlt));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldThumbnailImageAlt));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldThumbnailImageAlt));
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
%><%-- EJHpvm7ffEtqnQydzju1mA== --%>