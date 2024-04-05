<%--
  @Summary: MicroBlogging content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditMicroBloggingHandler formHandler = (EditMicroBloggingHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.MicroBlogging.class);
%>
<%-- Text ------------------------------------------------------------ --%>
<jalios:field name="text" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%
{ 
  TreeSet  removedCatSet = new TreeSet(); 
  Category itRemoveCat = null;
  request.setAttribute("MicroBlogging.removedCatSet", removedCatSet);
}  
%>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<input type="hidden" name="title" value="<%= encodeForHTMLAttribute(JcmsUtil.unescapeHtml(loggedMember.getFriendlyName()) +" - "+ new Date())  %>" />
<input type="hidden" name="opMicroBlog" value="true" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %>