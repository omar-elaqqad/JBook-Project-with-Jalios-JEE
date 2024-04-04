<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/front/card/indicator/doInitIndicatorCard.jspf" %>
<% if (isHrefLink) { %>
  <a class="card-link" href="<%= link %>"<%= isTargetBlank ? " target='_blank'":"" %><%= linkAttributes != null ? (" " + linkAttributes.toString()) : "" %>>
<% } %>
 <div <%= htmlAttributes %> class="<%= css %> card-indicator"<%= dataAttribute != null ? " " + dataAttribute.toString() : "" %>
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
       <span class="indicator-number"><%= roundedNumber %><span class="indicator-unit"><%= unit %></span></span>
       <% } %>
       <span class="indicator-text"><%= text %> <% if (Util.notEmpty(tooltip)) { %><jalios:tooltip><%= tooltip %></jalios:tooltip><% } %></span>
       <div class="progress">
         <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="<%= roundedNumber %>" aria-valuemin="0" aria-valuemax="100" style="width: <%= roundedNumber %>%">
         </div>
       </div>
     </div>
   </jalios:cardBlock>
 </div>
<% if (isHrefLink) { %>
  </a>
<% } %>
