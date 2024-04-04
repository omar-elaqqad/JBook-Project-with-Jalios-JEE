<%@ page contentType="text/html; charset=UTF-8" %>
<%-- This file was automatically generated. Please, do not edit. --%>
<%--
  @Summary: generated.PortletCarousel diff page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
{ 
generated.PortletCarousel newObj = (generated.PortletCarousel)request.getAttribute("newPub"); 
generated.PortletCarousel oldObj = (generated.PortletCarousel)request.getAttribute("oldPub"); 
String[] vids = (String[])request.getAttribute("vids"); 
int fieldCount = 1; 
TypeEntry typeEntry = channel.getTypeEntry(generated.PortletCarousel.class);
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
 
  <%-- ** autoplaycarousel ***************** --%>
  <jalios:if predicate='<%= newObj.getAutoplaycarousel() != oldObj.getAutoplaycarousel() %>'>
  <tr class="vTop" >
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletCarousel.class, "autoplaycarousel", userLang) %></td>
    <td><jalios:duration time='<%= newObj.getAutoplaycarousel() * 1000 %>'/></td>
    <td><jalios:duration time='<%= oldObj.getAutoplaycarousel() * 1000 %>'/></td>
  </tr>
  </jalios:if>
  <%-- ** arrows ***************** --%>
  <jalios:if predicate='<%= newObj.getArrows() != oldObj.getArrows() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletCarousel.class, "arrows", userLang) %></td>
    <td><%= newObj.getArrowsLabel(userLang) %></td>
    <td><%= oldObj.getArrowsLabel(userLang) %></td>
  </tr>
  </jalios:if>
  <%-- ** dots ***************** --%>
  <jalios:if predicate='<%= newObj.getDots() != oldObj.getDots() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletCarousel.class, "dots", userLang) %></td>
    <td><%= newObj.getDotsLabel(userLang) %></td>
    <td><%= oldObj.getDotsLabel(userLang) %></td>
  </tr>
  </jalios:if>
  <%-- ** showTitle ***************** --%>
  <jalios:if predicate='<%= newObj.getShowTitle() != oldObj.getShowTitle() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletCarousel.class, "showTitle", userLang) %></td>
    <td><%= newObj.getShowTitleLabel(userLang) %></td>
    <td><%= oldObj.getShowTitleLabel(userLang) %></td>
  </tr>
  </jalios:if>
  <%-- ** showDate ***************** --%>
  <jalios:if predicate='<%= newObj.getShowDate() != oldObj.getShowDate() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletCarousel.class, "showDate", userLang) %></td>
    <td><%= newObj.getShowDateLabel(userLang) %></td>
    <td><%= oldObj.getShowDateLabel(userLang) %></td>
  </tr>
  </jalios:if>
  <%-- ** showAuthor ***************** --%>
  <jalios:if predicate='<%= newObj.getShowAuthor() != oldObj.getShowAuthor() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletCarousel.class, "showAuthor", userLang) %></td>
    <td><%= newObj.getShowAuthorLabel(userLang) %></td>
    <td><%= oldObj.getShowAuthorLabel(userLang) %></td>
  </tr>
  </jalios:if>
  <%-- ** slidesToShow ***************** --%>
  <jalios:if predicate='<%= newObj.getSlidesToShow() != oldObj.getSlidesToShow() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.PortletCarousel.class, "slidesToShow", userLang) %></td>
    <td><%= newObj.getSlidesToShow()  %></td>
    <td><%= oldObj.getSlidesToShow()  %></td>
  </tr>
  </jalios:if>
  <%-- ** numberOfLinesInTheTitle ***************** --%>
  <jalios:if predicate='<%= !Util.isSameContent(newObj.getNumberOfLinesInTheTitle(), oldObj.getNumberOfLinesInTheTitle()) %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap">
      <%= channel.getTypeFieldLabel(generated.PortletCarousel.class, "numberOfLinesInTheTitle", userLang) %>
    </td>
    <td><%= Util.getString(newObj.getNumberOfLinesInTheTitle(), "") %></td>
    <td><%= Util.getString(oldObj.getNumberOfLinesInTheTitle(), "") %></td>
  </tr>
  </jalios:if>
<%
  ServletUtil.backupAttribute(pageContext, "fieldCount");
  ServletUtil.backupAttribute(pageContext, "isSuperTypeIncluded");
  request.setAttribute("fieldCount", new Integer(fieldCount));
  request.setAttribute("isSuperTypeIncluded", Boolean.TRUE);
%>
<jsp:include page="/types/PortletQueryForeach/doPortletQueryForeachDiff.jsp"/>
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
%><%-- lvcmW03FMNatJ8ipgDPHSg== --%>