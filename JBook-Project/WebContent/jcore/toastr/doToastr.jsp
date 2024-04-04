<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%

jcmsContext.addCSSHeader("css/lib/toastr/toastr.css");
jcmsContext.addCSSHeader("css/jalios/core/components/toastr/jalios-toastr.css");
jcmsContext.addJavaScript("js/lib/toastr/toastr.js"); 

String message = encodeForJavaScript(getIncludeString("message", ""));
MessageLevel level = (MessageLevel) getIncludeObject("level", MessageLevel.INFO);
Map<String, Object> optionMap = (Map<String, Object>) getIncludeObject("optionMap", "");
String url = (String) optionMap.get("url");
String optionAsJson = new ObjectMapper().writeValueAsString(optionMap);
%>

<jalios:javascript>

toastr.options = <%= optionAsJson %>
<% if(Util.notEmpty(url)){ %>
	toastr.options.onclick = function(){
	 window.location.href = "<%= url %>";
	};
<% } %>

<% 
switch(level){
  case SUCCESS:
    %>toastr.success("<%= message %>");<%
    break;
  case INFO:
    %>toastr.info("<%= message %>");<%
    break;
  case WARN:
  	%>toastr.warning("<%= message %>");<%
    break;
  case ERROR:
    %>toastr.error("<%= message %>");<%
    break;
}
%>
</jalios:javascript>