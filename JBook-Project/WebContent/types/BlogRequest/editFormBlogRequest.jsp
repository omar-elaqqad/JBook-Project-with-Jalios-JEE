<%-- This file was automatically generated. --%>
<%--
  @Summary: BlogRequest editor
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %>
<% String[] formTitles = JcmsUtil.getLanguageArray(channel.getTypeEntry(BlogRequest.class).getLabelMap()); %>
<jsp:useBean id='formHandler' scope='page' class='generated.EditBlogRequestHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
  <jsp:setProperty name='formHandler' property='author' value='$id.BlogRequest.formAuthor'/>
  <jsp:setProperty name='formHandler' property='title' value='<%= formTitles %>'/>
</jsp:useBean>
<%
  if (formHandler.validate()) {
    return;
  }
  boolean formInPortal = jcmsContext.isInFrontOffice(); 
%>   
<jalios:if predicate='<%= !formInPortal %>'>
<%@ include file='/jcore/doHeader.jspf' %>
</jalios:if>
<jalios:if predicate='<%= formHandler.isOneSubmit() && formHandler.isSubmitted() %>'>
  <% setWarningMsg(glp("msg.edit.already-one-submit"), request); %>
</jalios:if>
<%@ include file='/jcore/doMessageBox.jspf' %>
<jalios:if predicate='<%= channel.isDataWriteEnabled() %>'>
<%@ include file='/work/doEditPubFormHeader.jspf' %>
<jsp:include page="doEditBlogRequest.jsp" />
<tr>
  <td style='display: none;'>
    
    
    
    <input type='hidden' name='redirect' value='index.jsp' />
    
    
    
    
    
    
    
    
    
    
    
    <input type='hidden' name='ws' value='<%= formHandler.getWorkspace().getId() %>' />
  </td>
</tr>
<%@ include file='/work/doEditPubFormFooter.jspf' %>
</jalios:if>
<jalios:if predicate='<%= !formInPortal %>'>
<%@ include file='/jcore/doFooter.jspf' %>
</jalios:if><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- dD0uxHP2UWvyfyofcOAbRg== --%>