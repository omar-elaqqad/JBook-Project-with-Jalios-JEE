<%@ page contentType="text/html; charset=UTF-8" %><%--
--%><%@ include file='/jcore/doInitPage.jspf' %><%--
--%><%    
DBComment comment = (DBComment) getPublicationParameter("commentId");
if (!isLogged || comment== null) { %><%--
<%@ include file="/jcore/modal/modalRedirect.jspf" %><%--
--%><% } %><%--
--%><jsp:useBean id='commentHandler' scope='page' class='generated.EditDBCommentHandler'>
  <jsp:setProperty name='commentHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='commentHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='commentHandler' property='*' />
  <jsp:setProperty name='commentHandler' property='noRedirect' value='true' />
  <jsp:setProperty name='commentHandler' property='id' value='<%= comment.getId() %>' />
  <jsp:setProperty name='commentHandler' property='workspace' value='<%= comment.getWorkspace() %>'/>
</jsp:useBean><%--  
 
--%><% if (commentHandler.validate()) { %><%--
--%><%@ include file="/jcore/modal/modalRedirect.jspf" %><%--
--%><% } %>

<jalios:modal title="jcmsplugin.esn.activity.edit-comment" picture="forum" url="plugins/ESNPlugin/jsp/form/editComment.jsp" formHandler="<%= commentHandler %>">
  <jalios:field formHandler="<%= commentHandler %>" name="description" resource="field-vertical" label="">
    <jalios:control/>
  </jalios:field>
  <input type="hidden" name="commentId" value="<%= comment.getId() %>"/>
  
  <jalios:buffer name="MODAL_BUTTON">
    <button type="submit" value="true" name="opDelete" class="btn btn-danger ajax-refresh confirm"><%= glp("ui.com.btn.delete") %></button> 
  </jalios:buffer>
  
</jalios:modal>