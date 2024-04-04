<%
  request.setAttribute("CheckCSRF", Boolean.TRUE);
%><%@ include file="/jcore/doInitPage.jspf" %><%
  String autocomplete = getUntrustedStringParameter("autocomplete",""); // ENCODE !!
  String scUsage = "media";
%>
<ul class="dropdown-menu">
<li data-value="[media path='<%= encodeForHTMLAttribute(autocomplete) %>' /]"><a href='#'><jalios:icon src="media"   /> <%= glp("ui.wiki.lbl.media") %> <br/><span class='info'><%= glp("ui.wiki.lbl.media.h") %></span></a></li>

<%@ include file="/jcore/autocomplete/doShortCode.jspf" %>
</ul>