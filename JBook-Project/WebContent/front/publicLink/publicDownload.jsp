<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.jcms.publiclink.*" %><%
%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.publiclink.PublicDownloadHandler'><%
%><jsp:setProperty name='formHandler' property='request' value='<%=request%>' /><%
%><jsp:setProperty name='formHandler' property='response' value='<%=response%>' /><%
%><jsp:setProperty name='formHandler' property='*' /><%
%></jsp:useBean>
<% 

formHandler.validate();

jcmsContext.setPageTitle(glp("ui.fo.public-download.title"));
jcmsContext.addCSSHeader("css/jalios/core/jalios-public-download.css");
%>

<%@ include file='/jcore/doEmptyHeader.jspf' %>

<form action="front/publicLink/publicDownload.jsp" method="POST" class="form-horizontal ">
<jalios:panel title='<%= channel.getName() + " - " + glp("ui.fo.public-download.title") %>' css="panel-default public-download-panel">

  <%@ include file="/jcore/doMessageBox.jspf" %>
  <% if (formHandler.showAccessCode()) { %>
  <jalios:field name="accessCode" label="ui.fo.public-link.lbl.access-code">
    <jalios:control settings="<%= new TextFieldSettings().maxLength(formHandler.getAccessCodeLength()) %>" />
  </jalios:field>
  
  <div class="buttons">
    <div class="col-md-3"></div>
    <div class="col-md-9">  
      <button type="submit" name="opDownload" value="true" class="btn btn-success"><jalios:icon src="download-btn" /> <%= glp("ui.com.btn.download") %></button>
      <input type="hidden" name="id" value="<%= formHandler.getId() %>"
    </div>
  </div> 
  <% } %>
</jalios:panel>
</form>

<%@ include file='/jcore/doEmptyFooter.jspf' %>
