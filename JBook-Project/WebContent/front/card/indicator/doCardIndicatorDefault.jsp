<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/front/card/indicator/doInitIndicatorCard.jspf" %>
<% if (isHrefLink) { %>
  <a class="card-link" href="<%= link %>"<%= isTargetBlank ? " target='_blank'":"" %><%= linkAttributes != null ? (" " + linkAttributes.toString()) : "" %>>
<% } %>
 <div <%= htmlAttributes %> class="<%= css %>  card-indicator"<%= dataAttribute != null ? " " + dataAttribute.toString() : "" %>
   <%= !isHrefLink && linkAttributes != null ? (" " + linkAttributes.toString()) : "" %>>
   <% if (Util.notEmpty(getIncludeString("INDICATOR_TOP", null))){ %>
     <%= getIncludeString("INDICATOR_TOP", null) %>
   <% } %>
   <jalios:cardBlock>
     <jalios:icon css="<%= jaliosIconCss %>" src="<%= icon  %>" />
     <div class="indicator-content">
       <% if (Util.notEmpty(getIncludeString("INDICATOR_NUMBER", null))){ %>
       <%= getIncludeString("INDICATOR_NUMBER", null) %>
       <% } else { %> 
       <span class="indicator-number <%= numberCss %>"><%= roundedNumber %><span class="indicator-unit"><%= unit %></span></span>
       <% } %>
       <span class="indicator-text"><%= text %> <% if (Util.notEmpty(tooltip)) { %><jalios:tooltip><%= tooltip %></jalios:tooltip><% } %></span>
     </div>
   </jalios:cardBlock>
   <% if (Util.notEmpty(getIncludeString("INDICATOR_BOTTOM", null))){ %>
	   <%= getIncludeString("INDICATOR_BOTTOM", null) %>
	 <% } %>
 </div>
<% if (isHrefLink) { %>
  </a>
<% } %>
