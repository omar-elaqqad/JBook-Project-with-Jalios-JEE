<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.smartphone.ios.AddDownloadCodeHandler'><%
%><jsp:setProperty name='formHandler' property='request' value='<%=request%>' /><%
%><jsp:setProperty name='formHandler' property='response' value='<%=response%>' /><%
%><jsp:setProperty name='formHandler' property='*' /><%
%><jsp:setProperty name='formHandler' property='noRedirect' value='<%= true %>' /><%
%></jsp:useBean>

<% if(formHandler.validate()) { %>
<%@ include file="/jcore/modal/modalRedirect.jspf" %>
<% } %>

<jalios:modal title="jcmsplugin.smartphone.ios.add-codes.title"
              url="plugins/SmartPhonePlugin/jsp/ios/addDownloadCode.jsp"
              css="modal-lg jcmsplugin-smartphone-ios-add-download-code"
              op="opAdd"
              button="ui.com.btn.add">
  
  <jalios:field name="codes" label="jcmsplugin.smartphone.ios.add-codes.lbl.codes" description="jcmsplugin.smartphone.ios.add-codes.lbl.codes.h">
    <jalios:control type="<%= ControlType.TEXTAREA %>" />
  </jalios:field>
              
  <% if (formHandler.showDeleteAll()) { %>
  <jalios:buffer name="MODAL_BUTTON">  
    <input type="submit" class="btn btn-danger ajax-refresh confirm" name="opDeleteAll" value="<%= glp("jcmsplugin.smartphone.ios.add-codes.btn.delete-all") %>" />
  </jalios:buffer>
  <% } %>              
              
</jalios:modal>







