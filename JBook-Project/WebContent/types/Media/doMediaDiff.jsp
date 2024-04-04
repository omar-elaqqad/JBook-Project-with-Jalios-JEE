<%@ page contentType="text/html; charset=UTF-8" %>
<%-- This file was automatically generated. Please, do not edit. --%>
<%--
  @Summary: generated.Media diff page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
{ 
generated.Media newObj = (generated.Media)request.getAttribute("newPub"); 
generated.Media oldObj = (generated.Media)request.getAttribute("oldPub"); 
String[] vids = (String[])request.getAttribute("vids"); 
int fieldCount = 1; 
TypeEntry typeEntry = channel.getTypeEntry(generated.Media.class);
boolean isSuperTypeIncluded = Boolean.TRUE.equals((Boolean)request.getAttribute("isSuperTypeIncluded")); 
{
  Integer superFieldCount = (Integer)request.getAttribute("fieldCount");
  if (superFieldCount != null) { 
    fieldCount = superFieldCount.intValue();
  }
}
String fieldDomId = "";
%>
<jsp:include page="/types/FileDocument/doFileDocumentDiff.jsp"/>
 
  <%-- ** mediaWidth ***************** --%>
  <jalios:if predicate='<%= newObj.getMediaWidth() != oldObj.getMediaWidth() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.Media.class, "mediaWidth", userLang) %></td>
    <td><%= newObj.getMediaWidth()  %></td>
    <td><%= oldObj.getMediaWidth()  %></td>
  </tr>
  </jalios:if>
  <%-- ** mediaHeight ***************** --%>
  <jalios:if predicate='<%= newObj.getMediaHeight() != oldObj.getMediaHeight() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.Media.class, "mediaHeight", userLang) %></td>
    <td><%= newObj.getMediaHeight()  %></td>
    <td><%= oldObj.getMediaHeight()  %></td>
  </tr>
  </jalios:if>
  <%-- ** mediaDuration ***************** --%>
  <jalios:if predicate='<%= newObj.getMediaDuration() != oldObj.getMediaDuration() %>'>
  <tr class="vTop">
    <td class="text-right"><%= fieldCount++ %>.</td>
    <td nowrap="nowrap"><%= channel.getTypeFieldLabel(generated.Media.class, "mediaDuration", userLang) %></td>
    <td><%= newObj.getMediaDuration()  %></td>
    <td><%= oldObj.getMediaDuration()  %></td>
  </tr>
  </jalios:if>
<% } %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- /EbU9gDev66ipwszHNLpPg== --%>