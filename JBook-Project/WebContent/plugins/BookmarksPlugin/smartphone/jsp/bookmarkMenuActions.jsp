<%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %>

<jsp:useBean id='bookmarkHandler' scope='page' class='com.jalios.jcmsplugin.bookmarks.BookmarkHandler'>
  <jsp:setProperty name='bookmarkHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='bookmarkHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='bookmarkHandler' property='*' />
  <jsp:setProperty name='bookmarkHandler' property='noRedirect' value='<%= true%>' />
</jsp:useBean>

<%
boolean result = bookmarkHandler.validate();
if(result){
  HibernateUtil.commitTransaction();
  HibernateUtil.beginTransaction();  
}
%>