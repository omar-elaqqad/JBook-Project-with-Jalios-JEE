<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="doInitCard.jspf" %><%

String linkAttributes = "";
if (link != null) {
  if (linkOptions == null || linkOptions != null && !linkOptions.isHrefLink()) {
    linkAttributes = " data-jalios-action=\"clickable\" data-jalios-url=\"" + link + "\""; 
  }
  linkAttributes += linkOptions != null && Util.notEmpty(linkOptions.getOptionsMap()) ? " data-jalios-options='" + HttpUtil.encodeForHTMLAttribute(linkOptions.toJSON()) + "'" : "";
}

css += " card-default";

String cssFlip = null;
CardBackMode cardBackMode = (CardBackMode) getIncludeObject(CardConstants.CARD_BACK_MODE_ATTR, null);
if(cardBackMode != null) {
  css += " card-effect";
  
  cssFlip = "card-flip-wrapper";
  if(cardBackMode.equals(CardBackMode.FLIP_HOVER)) {
    cssFlip += " card-flip-hover";
  }
}

DataAttribute dataAttribute = (DataAttribute) getIncludeObject("dataAttribute", null);
%>
<% if(cardBackMode != null) { %><div class="<%= cssFlip %>"><% } %>
  <% if (linkOptions != null && linkOptions.isHrefLink() && link != null) { %>
    <a class="card-link" href="<%= link %>">
  <% } %>
	  <div class="<%= css %>"<%= linkAttributes %><%= dataAttribute != null ? " " + dataAttribute.toString() : "" %>>
	    <%= getIncludeBody() %>
	  </div>
  <% if (linkOptions != null && linkOptions.isHrefLink() && link != null) { %>
    </a>
  <% } %>
<% if(cardBackMode != null) { %></div><% } %>
