<%@ include file="/jcore/doInitPage.jspf" %><%
%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.handler.ModalPromptHandler"><%
  %><jsp:setProperty name="formHandler" property="request" value="<%= request %>"/><%
  %><jsp:setProperty name="formHandler" property="response" value="<%= response %>"/><%
  %><jsp:setProperty name="formHandler" property="*" /><%
  %><jsp:setProperty name="formHandler" property="noRedirect" value="true"/><%
%></jsp:useBean>
<%
  if (formHandler.validate()) {
  request.setAttribute("modal.redirect", formHandler.getRedirect());
  %>
  <%@ include file="/jcore/modal/modalRedirect.jspf" %><%
} %>

<jalios:modal css="modal-md" title="<%= formHandler.getTitle() %>">
  <form class="form-horizontal" role="form">
  
    <p><%= formHandler.getMsg() %></p>
    <div id='prompt-value'>
		  <jalios:field  name='<%= "value" %>' required='<%= true %>' value='<%= formHandler.getDefValue() %>' resource='field-vertical'>
		    <jalios:control type="<%= ControlType.TEXTFIELD %>" />
		  </jalios:field>
	  </div>
	  
    <%-- <jalios:include jsp="debug/debugFormField.jsp" />  --%>

	  <jalios:buffer name='MODAL_BUTTONS'>
	    <button type="button" class="btn btn-default" onclick="jQuery.jalios.ui.Modal.close(false);"><%= glp("ui.com.btn.close") %></button>
	    <button type="submit" class="btn btn-primary" onclick="jQuery.jalios.ui.Modal.closeAndFollow(jQuery('#prompt-value INPUT').val());"><%= glp("ui.com.btn.ok") %></button>
	  </jalios:buffer>
  </form>
</jalios:modal>