<%@page import="com.jalios.jcms.taglib.card.CardImageTag"%>
<%@ include file="/jcore/doInitPage.jspf" %><% 

String src = getIncludeString("src", "");
String alt = getIncludeString("alt", "");

boolean isSquare = Util.toBoolean(getIncludeObject("squareImage", false), false);
boolean useThumbnail = Util.toBoolean(getIncludeObject("useThumbnail", false), false);

int thumbnailWidth = Util.toInt(getIncludeObject("thumbnailWidth", CardImageTag.THUMBNAIL_DEFAUT_WIDTH), CardImageTag.THUMBNAIL_DEFAUT_WIDTH);
int thumbnailHeight = Util.toInt(getIncludeObject("thumbnailHeight", CardImageTag.THUMBNAIL_DEFAUT_HEIGHT), CardImageTag.THUMBNAIL_DEFAUT_HEIGHT);

String css = "card-img is-object-fit " + getIncludeString("css", "");
DataAttribute dataAttribute = (DataAttribute) getIncludeObject("dataAttribute", null);
%><div class="card-img-wrapper"><% if (useThumbnail) { %>
  <jalios:thumbnail square="<% isSquare %>" path="<%= src %>" width="<%= thumbnailWidth %>" dataAttribute="<%= dataAttribute %>" height="<%= thumbnailHeight %>"  css="<%= css %>" alt="<%= alt %>" />
<% } else { %>
  <img src="<%= src %>" class="<%= css.trim() %>" alt="<%= alt %>" <%= dataAttribute != null ? " " + dataAttribute.toString() : "" %> />
<% } %></div>