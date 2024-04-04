<%--
  @Summary: Article's Full Display
  @Deprecated: False
  @Customizable: True
  @Requestable: False
  @Category: Customized
--%><%@page import="com.jalios.jcms.handler.QueryHandler"%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ page contentType="text/html; charset=UTF-8" %><%

Article article = (Article)request.getAttribute(PortalManager.PORTAL_PUBLICATION);
Content[] relatedContents = article.getRelatedContents();
jcmsContext.addCSSHeader("css/jalios/core/jalios-editorial-fulldisplay.css");

%><%@ include file="/front/doFullDisplay.jspf" %>

<% Publication pub = article; %>
<%@ include file="/front/publication/doPublicationOrientedImage.jspf" %>

<%
String picture = Util.getString(article.getPicture(userLang), "");
String pictureAlt = Util.notEmpty(article.getPictureAlt(userLang)) ? article.getPictureAlt(userLang) : dataImageTitle;

// JCMS-7816: Only use explicit "picture" image field as illustration image
boolean isPictureDataImage = Util.getString(dataImage, "").equals(picture);
boolean showTopIllustrationImage = isPictureDataImage && hasImage && !isPortrait;
boolean showPortraitIllustrationImage = isPictureDataImage && hasImage && isPortrait;
Category[] categories = article.getCategories(loggedMember);
%>

<div class="Article fulldisplay editorial-fulldisplay" itemscope="itemscope" itemtype="http://schema.org/Article">

<jalios:buffer name="articleMetadata">
<div class="publication-metadata">
  <span class="date"><jalios:date date="<%= article.getPdate() %>" format="medium" /></span>
  <div class="meta-author">
    <jalios:memberphoto focusable="false" css="meta-author-photo" member="<%= article.getAuthor() %>" size="<%= PhotoSize.ICON %>" /> 
    <jalios:link css="meta-author-name" data='<%= article.getAuthor() %>'/>
  </div>
  <% if (Util.notEmpty(categories)) { %>
    <span class="topics">
      <%@ include file="/custom/jcms/doCategoryList.jspf"  %>
    </span>
  <% } %>
</div>
</jalios:buffer>

  <%-- TOP PICTURE --%>
  <% if (showTopIllustrationImage) { %>
  <div class="publication-picture orientation-landscape">
    <meta itemprop="image" content="<%= dataImage %>" />
    <jalios:thumbnail data='<%= article %>' alt='<%= pictureAlt %>' width='960' height='540' />
  </div>
  <% } %>

  <%-- BODY --%>
  <div class="publication-body">
    <div class="publication-header">

      <% if (showTopIllustrationImage) { %>
        <%= articleMetadata %>
      <% } %>

      <h1 class="publication-title" <%= gfla(article, "title") %> itemprop="name"><%= article.getTitle(userLang) %></h1>
    </div>

    <% if (showPortraitIllustrationImage) { %>
      <div class="publication-picture<%= isPortrait ? " orientation-portrait" : " orientation-default" %>">
        <meta itemprop="image" content="<%= dataImage %>" />
        <jalios:thumbnail data='<%= article %>' css='img-thumbnail' alt='<%= pictureAlt %>' width='1999' height='1999' />
      </div>
    <% } %>

    <% if (Util.notEmpty(article.getIntro(userLang))) { %>
      <div class="publication-intro lead" <%= gfla(article, "intro") %> itemprop="headline">
        <jalios:wiki data="<%= article %>" field="intro"><%= article.getIntro(userLang) %></jalios:wiki>
      </div>
    <% } %>

    <div class="publication-content clearfix" itemprop="articleBody">
      <jalios:wysiwyg data='<%= article %>' field='content'><%= article.getContent(userLang) %></jalios:wysiwyg>
    </div>

    <% if (!showTopIllustrationImage) { %>
      <%= articleMetadata %>
    <% } %>

    <%-- Related Contents --%>
    <%
    Collection pubRelatedCollection = null;
    int pubRelatedMax = 4;

    if (Util.notEmpty(relatedContents)) {
      pubRelatedCollection =  Util.getArrayList(relatedContents).stream().filter(c -> c.canBeReadBy(loggedMember) && c.isInVisibleState()).collect(java.util.stream.Collectors.toList());
    } else {
      pubRelatedCollection = QueryManager.getInstance().getRelatedPublicationSet(article, loggedMember, Article.class);
    }
    %>
    <%@ include file="/front/publication/doPublicationRelated.jspf" %>
  </div>
</div>