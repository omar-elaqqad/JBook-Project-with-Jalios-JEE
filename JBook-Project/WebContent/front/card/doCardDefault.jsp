<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="doInitCard.jspf" %><%

String linkAttributes = "";
if (link != null) {
  if (linkOptions == null || !linkOptions.isHrefLink()) {
    linkAttributes = " data-jalios-action=\"clickable\" data-jalios-url=\"" + link + "\"";
  }
  // linkOptions.dataAttribute -> linkAttributes
  if (linkOptions != null && linkOptions.getDataAttribute() != null) {
    linkAttributes += " " + linkOptions.getDataAttribute().toString();
  }

  // linkOptions.optionsMap -> data-jalios-options
  if (linkOptions != null && Util.notEmpty(linkOptions.getOptionsMap())) {
    linkAttributes += " data-jalios-options='" + encodeForHTMLAttribute(linkOptions.toJSON()) + "'";
  }
}

css = Util.getString(css, "").trim() + " card-default";

String cssFlip = null;
CardBackMode cardBackMode = (CardBackMode) getIncludeObject(CardConstants.CARD_BACK_MODE_ATTR, null);
if(cardBackMode != null) {
  css += " card-effect";

  cssFlip = "card-flip-wrapper";
  if(cardBackMode.equals(CardBackMode.FLIP_HOVER)) {
    cssFlip += " card-flip-hover";
  }
}

if (cardBackMode != null && "deck".equals(cardsMode)) {
  // Include dedicated css for flip cards in deck layout
  jcmsContext.addCSSHeader("css/jalios/core/components/card/jalios-card-layout-deck-flip.css");
}

DataAttribute dataAttribute = (DataAttribute) getIncludeObject("dataAttribute", null);
boolean isHrefLink = linkOptions != null && linkOptions.isHrefLink() && link != null;
String htmlTagWrapper = getIncludeString("htmlTagWrapper", "div");
%>
<% if(cardBackMode != null) { %><div class="<%= cssFlip %>"><% } %>
  <% if (isHrefLink) { %>
    <a class="card-link" href="<%= link %>"<%= isTargetBlank ? " target='_blank'":"" %><%= linkAttributes != null ? " " + linkAttributes.toString() : "" %>>
  <% } %>
  <<%= htmlTagWrapper %> <%= htmlAttributes %> class="<%= css.trim() %>"<%= dataAttribute != null && Util.notEmpty(dataAttribute.toString()) ? (" " + dataAttribute.toString()) : "" %><%
     %><%= !isHrefLink && linkAttributes != null && Util.notEmpty(linkAttributes.toString()) ? (" " + linkAttributes.toString()) : "" %>>
    <%= getIncludeBody() %>
  </<%= htmlTagWrapper %>>
  <% if (isHrefLink) { %>
    </a>
  <% } %>
<% if(cardBackMode != null) { %></div><% } %>
