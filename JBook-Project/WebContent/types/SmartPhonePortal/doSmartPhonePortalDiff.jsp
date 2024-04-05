<%@ page contentType="text/html; charset=UTF-8" %>
<%-- This file was automatically generated. Please, do not edit. --%>
<%--
  @Summary: generated.SmartPhonePortal diff page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
{ 
generated.SmartPhonePortal newObj = (generated.SmartPhonePortal)request.getAttribute("newPub"); 
generated.SmartPhonePortal oldObj = (generated.SmartPhonePortal)request.getAttribute("oldPub"); 
String[] vids = (String[])request.getAttribute("vids"); 
int fieldCount = 1; 
TypeEntry typeEntry = channel.getTypeEntry(generated.SmartPhonePortal.class);
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
      <%= channel.getTypeFieldLabel(generated.SmartPhonePortal.class, "description", userLang) %>
      <jalios:if predicate='<%= channel.isMultilingual() %>'><jalios:lang lang='<%= itLang %>'/></jalios:if>
      <% fieldDomId += "_" + itLang; %>
    </td>
    <% 
      request.setAttribute("fieldDomId", fieldDomId);
      request.setAttribute("step", "action");
    %>
    <td class="text-left" colspan="2" id="<%= fieldDomId %>">
    
    <div id='intro_description_<%= itLang %>'>
    <%= glp("ui.work.ver.diff.ww.change") %>. <a href='#' onclick="$('textHtmlView_description_<%= itLang %>').show(); $('intro_description_<%= itLang %>').hide(); return false;"><%= glp("ui.work.ver.diff.ww.detail") %>.</a>
    </div>
    <div id='textHtmlView_description_<%= itLang %>' style="display: none;">
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
      <div id='textView_description_<%= itLang %>'>
        <p>
    <%= glp("ui.work.ver.diff.ww.text") %>
    - <a href='#' onclick="$('htmlView_description_<%= itLang %>').show(); $('textView_description_<%= itLang %>').hide(); return false;"><%= glp("ui.work.ver.diff.ww.html") %></a>
    - <a href='#' onclick="$('intro_description_<%= itLang %>').show(); $('textHtmlView_description_<%= itLang %>').hide(); return false;"><%= glp("ui.work.ver.diff.ww.hide") %></a>
        </p>
    
    <%
    {
    String newDescription = newObj.getDescription(itLang, false) == null ? "" : Util.toWordLine(XmlUtil.extractText(newObj.getDescription(itLang, false)));
    String oldDescription = oldObj.getDescription(itLang, false) == null ? "" : Util.toWordLine(XmlUtil.extractText(oldObj.getDescription(itLang, false)));
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
    <%= diff.iterateHunkBuffer(oldReader, "<span class='diff-remove'>" , "</span>" , "<span class='diff-add'>" , "</span>", "" , "", false,true,true) %>
    <% 
    oldReader.close(); 
    }
    %>
    
        </div>
      </div>
    
      <div id='htmlView_description_<%= itLang %>' style='display: none;'>
        <p>
    <a href='#' onclick="$('textView_description_<%= itLang %>').show(); $('htmlView_description_<%= itLang %>').hide(); return false;"><%= glp("ui.work.ver.diff.ww.text") %></a>
    - <%= glp("ui.work.ver.diff.ww.html") %>
    - <a href='#' onclick="$('intro_description_<%= itLang %>').show(); $('textHtmlView_description_<%= itLang %>').hide(); return false;"><%= glp("ui.work.ver.diff.ww.hide") %></a>
        </p>
    
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
  <%-- ** structure ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getStructure(), oldObj.getStructure()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <% fieldDomId = "structureDiffDomId"; %>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.SmartPhonePortal.class, "structure", userLang) %>
    </td>
    <% 
      request.setAttribute("fieldDomId", fieldDomId);
      request.setAttribute("step", "action");
    %>
    <td class="text-left" colspan="2" id="<%= fieldDomId %>">
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
    <%
    {
    String newStructure = newObj.getStructure() == null ? "" : Util.toWordLine(newObj.getStructure());
    String oldStructure = oldObj.getStructure() == null ? "" : Util.toWordLine(oldObj.getStructure());
    request.setAttribute("newField", newStructure);
    request.setAttribute("oldField", oldStructure);
    request.setAttribute("step", "show_fields");
    %>
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
        <div class="merge_fields" >
    <%
    BufferedReader newReader = new BufferedReader(new StringReader(newStructure));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldStructure));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldStructure));
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
  <%-- ** portlets ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getPortlets(), oldObj.getPortlets()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.SmartPhonePortal.class, "portlets", userLang) %></td>
    <td>
      <% if (Util.notEmpty(newObj.getPortlets())) { %>
      <ol>
        <jalios:foreach name="itData" type="Data" array="<%= newObj.getPortlets() %>">
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
      <% if (Util.notEmpty(oldObj.getPortlets())) { %>
      <ol>
        <jalios:foreach name="itData" type="Data" array="<%= oldObj.getPortlets() %>">
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
  <%-- ** displayScrollToTop ***************** --%>
  <jalios:if predicate='<%= newObj.getDisplayScrollToTop() != oldObj.getDisplayScrollToTop() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.SmartPhonePortal.class, "displayScrollToTop", userLang) %></td>
    <td><%= newObj.getDisplayScrollToTopLabel(userLang) %></td>
    <td><%= oldObj.getDisplayScrollToTopLabel(userLang) %></td>
  </tr>
  </jalios:if>
  <%-- ** pageTitle ***************** --%>
  <jalios:foreach collection='<%= channel.getLanguageList() %>' name='itLang' type='String'>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getPageTitle(itLang, false), oldObj.getPageTitle(itLang, false)) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <% fieldDomId = "pageTitleDiffDomId"; %>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.SmartPhonePortal.class, "pageTitle", userLang) %>
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
    String newPageTitle = newObj.getPageTitle(itLang, false) == null ? "" : Util.toWordLine(newObj.getPageTitle(itLang, false));
    String oldPageTitle = oldObj.getPageTitle(itLang, false) == null ? "" : Util.toWordLine(oldObj.getPageTitle(itLang, false));
    request.setAttribute("newField", newPageTitle);
    request.setAttribute("oldField", oldPageTitle);
    request.setAttribute("step", "show_fields");
    %>
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
        <div class="merge_fields" >
    <%
    BufferedReader newReader = new BufferedReader(new StringReader(newPageTitle));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldPageTitle));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldPageTitle));
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
  <%-- ** image ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getImage(), oldObj.getImage()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <% fieldDomId = "imageDiffDomId"; %>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.SmartPhonePortal.class, "image", userLang) %>
    </td>
    <% 
      request.setAttribute("fieldDomId", fieldDomId);
      request.setAttribute("step", "action");
    %>
    <td class="text-left" colspan="2" id="<%= fieldDomId %>">
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
    <%
    {
    String newImage = newObj.getImage() == null ? "" : Util.toWordLine(newObj.getImage());
    String oldImage = oldObj.getImage() == null ? "" : Util.toWordLine(oldObj.getImage());
    request.setAttribute("newField", newImage);
    request.setAttribute("oldField", oldImage);
    request.setAttribute("step", "show_fields");
    %>
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
        <div class="merge_fields" >
    <%
    BufferedReader newReader = new BufferedReader(new StringReader(newImage));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldImage));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldImage));
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
  <%-- ** css ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getCss(), oldObj.getCss()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <% fieldDomId = "cssDiffDomId"; %>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.SmartPhonePortal.class, "css", userLang) %>
    </td>
    <% 
      request.setAttribute("fieldDomId", fieldDomId);
      request.setAttribute("step", "action");
    %>
    <td class="text-left" colspan="2" id="<%= fieldDomId %>">
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
    <%
    {
    String newCss = newObj.getCss() == null ? "" : Util.toWordLine(newObj.getCss());
    String oldCss = oldObj.getCss() == null ? "" : Util.toWordLine(oldObj.getCss());
    request.setAttribute("newField", newCss);
    request.setAttribute("oldField", oldCss);
    request.setAttribute("step", "show_fields");
    %>
    <jsp:include page="/work/doVersionToggleMergeFields.jsp" />
        <div class="merge_fields" >
    <%
    BufferedReader newReader = new BufferedReader(new StringReader(newCss));
    BufferedReader oldReader = new BufferedReader(new StringReader(oldCss));
    Diff diff = new Diff(); 
    diff.diffBuffer(oldReader , newReader);
    newReader.close();
    oldReader.close();
    oldReader  = new BufferedReader(new StringReader(oldCss));
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
%><%-- xvJ3H10v6hg6SUTO9Sf6tw== --%>