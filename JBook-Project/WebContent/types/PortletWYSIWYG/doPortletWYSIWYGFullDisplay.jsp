<%@ include file='/jcore/doInitPage.jspf' %><% 
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%
%><% 
PortletWYSIWYG box = (PortletWYSIWYG) portlet;
String wysiwyg = (String) box.getFieldValue(jcmsContext, "wysiwyg");
%>
<% if (Util.notEmpty(wysiwyg)) { %>
  <jalios:wysiwyg data='<%= portlet %>' field='wysiwyg'><%= wysiwyg %></jalios:wysiwyg>
<% } %>