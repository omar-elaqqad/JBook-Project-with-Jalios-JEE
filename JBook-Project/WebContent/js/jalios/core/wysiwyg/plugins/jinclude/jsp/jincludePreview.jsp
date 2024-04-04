<%
request.setAttribute("CheckCSRF", Boolean.TRUE);
%><%@ include file='/jcore/doInitPage.jspf' %><%
  
  final String type = getAlphaNumParameter("type","");
  final String params = getUntrustedStringParameter("params","");
  if (Util.isEmpty(type) && Util.isEmpty(params)) { 
    out.println("&nbsp;");
    return;
  }
  
  final String jhtml = "<jalios:include "+
    " data-jalios-type=\"" + encodeForHTMLAttribute(type) + "\"" +
    " data-jalios-params=\"" + encodeForHTMLAttribute(params) + "\"/>";

%><%@ include file='/jcore/doEmptyHeader.jspf' %><%
%><jalios:wysiwyg><%= jhtml %></jalios:wysiwyg><%
%><%@ include file='/jcore/doEmptyFooter.jspf' %>