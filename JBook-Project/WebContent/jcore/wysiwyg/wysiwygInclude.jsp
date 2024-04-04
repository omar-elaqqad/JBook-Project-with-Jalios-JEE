<%
request.setAttribute("CheckCSRF", Boolean.TRUE);
%><%@ include file='/jcore/doInitPage.jspf' %><%

  final boolean wysiwygIncludeEnabled = channel.getBooleanProperty("wysiwyg.include.enabled", true);
  if (!wysiwygIncludeEnabled) { 
    out.println("&nbsp;");
    return;
  }  

  final String type = getAlphaNumParameter("wysiwygInclude","");
  if (Util.isEmpty(type)) { 
    out.println("&nbsp;");
    return;
  }
  
  final boolean enabled = channel.getBooleanProperty("wysiwyg.include."+type+".enabled", false);
  final String jsp = channel.getProperty("wysiwyg.include."+type+".jsp","");
  if (!enabled || Util.isEmpty(jsp)) {
    out.println("&nbsp;");
    return;
  }

  request.setAttribute("wysiwyg.include", Boolean.TRUE);
  
%><jalios:include jsp='<%= jsp %>' />