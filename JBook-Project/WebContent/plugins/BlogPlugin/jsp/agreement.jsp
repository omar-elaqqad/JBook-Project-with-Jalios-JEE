<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<%@ include file='/jcore/doHeader.jspf' %>
<%@ page import="com.jalios.jcmsplugin.blog.*" %>
<%
BlogManager blogManager = BlogManager.getInstance();
String opAccept = getUntrustedStringParameter("opAccept","");
String blogId = getDataIdParameter("blogId");

Blog blog = (Blog) channel.getPublication(blogId);
if (Util.notEmpty(opAccept)) {
  blogManager.acceptAgreement(loggedMember);
  sendRedirect(blog);
  return;
}
%>
<div id="esn-agreement" class="esn">

  <h1><%= blogManager.getAgreementTitle(userLang) %></h1>

  <div class="terms"><%= blogManager.getAgreementText(userLocale) %></div>

  <form action="plugins/BlogPlugin/jsp/agreement.jsp" method="post">
    <input class="btn btn-primary" type="submit" name="opAccept" value="<%= encodeForHTMLAttribute(glp("jcmsplugin.blog.agreement.btn.agree")) %>" />
    <input class="btn" type="button" value="<%= encodeForHTMLAttribute(glp("jcmsplugin.blog.agreement.btn.disagree")) %>" onclick='document.location = "<%= contextPath %>";'/> 
    <input type="hidden" name="blogId" value="<%= blog.getId() %>"/>
  </form>
</div>
