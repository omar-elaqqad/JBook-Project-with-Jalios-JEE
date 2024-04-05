<%-- This file has been automatically generated. --%>
<%--
  @Summary: BlogPost modal content editor
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: False
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<%
  EditBlogPostHandler formHandler = (EditBlogPostHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.BlogPost.class);
%>
<%-- Content ------------------------------------------------------------ --%>
<jalios:field name="content" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Summary ------------------------------------------------------------ --%>
<jalios:field name="summary" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Blog ------------------------------------------------------------ --%>
<jalios:field name="blog" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Category ------------------------------------------------------------ --%>
<jalios:field name="category" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- FeaturedImage ------------------------------------------------------------ --%>
<jalios:field name="featuredImage" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- FeaturedImageAlt ------------------------------------------------------------ --%>
<jalios:field name="featuredImageAlt" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- ThumbnailImage ------------------------------------------------------------ --%>
<jalios:field name="thumbnailImage" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- ThumbnailImageAlt ------------------------------------------------------------ --%>
<jalios:field name="thumbnailImageAlt" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<% if (formHandler.getPublication() != null) { %>
<input type="hidden" name="id" value="<%= formHandler.getPublication().getId() %>" />
<% } %>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- 7rC2Vm7xFi53+1LoQ34x9Q== --%>