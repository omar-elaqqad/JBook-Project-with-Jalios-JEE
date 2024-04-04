<%@ page contentType="text/html; charset=UTF-8" %><%----%>
<%----%><%@ include file='/jcore/doInitPage.jspf' %><%----%><%
%>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.application.RecommendApplicationHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
  <jsp:setProperty name='formHandler' property='noRedirect' value='true' />
</jsp:useBean>
<% if (formHandler.validate()) { %>
  <script>
    jQuery.jalios.ui.Modal.close(false);
  </script>
<% } %>
<jalios:modal css="modal-lg appstore-recommend-modal" formHandler="<%= formHandler %>" op="opRecommend" button="ui.recommendation" title="ui.recommendation" url="jcore/appstore/app/modal/recommendApplicationModal.jsp">
  
	<jalios:field name="recommendMembers" value='<%= formHandler.getAvailableRecommendMembers() %>' label="ui.com.lbl.members" keyword="true">
	  <jalios:control settings="<%= new MemberSettings().filter(MemberSettings.MemberFilter.ACCOUNT) %>" />
	</jalios:field>
	<jalios:field name="recommendGroups" value='<%= formHandler.getAvailableRecommendGroups() %>' label="ui.com.lbl.groups" keyword="true">
	  <jalios:control type="<%= ControlType.GROUP %>" />
	</jalios:field>
	<jalios:field name="recommendMessage" value='<%= formHandler.getRecommendMessage() %>' label="ui.recommendation.modal.lbl.message">
	  <jalios:control settings='<%= new WysiwygSettings().rows(2).configurationId("light") %>' />
	</jalios:field>
  <input type="hidden" name="shortcut" value="<%= formHandler.getAvailableShortcut().getId() %>" />
</jalios:modal>