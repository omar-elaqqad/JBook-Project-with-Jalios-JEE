<%--
  @Summary: BlogPost result display page. Inspired on custom/jcms/doResultDisplay.jsp
--%><%@page import="com.jalios.jcmsplugin.blog.BlogPostQueryHandler"%>
<%@page import="com.jalios.jcmsplugin.blog.BlogManager"%><%
%><%@page import="com.jalios.jcmsplugin.dbcomment.DBCommentManager"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

Publication obj = (Publication) request.getAttribute(PortalManager.PORTAL_PUBLICATION);
BlogPost post = (BlogPost) obj;

// displayURLparams must be used in <jalios:url>/<jalios:link> to
// propagate JCMS behavior (portlet options, highligth params, etc)
String displayURLparams = (String)request.getAttribute("displayURLparams");

int thWidth = JcmsConstants.THUMBNAIL_LARGE_WIDTH;
int thHeight = JcmsConstants.THUMBNAIL_LARGE_HEIGHT;
String cardCss = "card-search-result search-result default-search-result media card-horizontal card-default" + Util.getClassShortName(obj);
cardCss += (obj.getAuthor() != null) ? " MID_" +  obj.getAuthor().getId() : "";

BlogManager blogMgr = BlogManager.getInstance();
Set<Category> categorySet = blogMgr.getBlogPostCategorySet(post, loggedMember);

int voteCount = obj.getVoteCount();
int dbCommentCount = DBCommentManager.getInstance().getDBCommentCount(obj);
boolean displayVoteCount = voteCount > 0;
boolean displayDbCommentCount = dbCommentCount > 0;

String featuredImage = post.getFeaturedImage(userLang);
FileDocument featuredImageDoc = FileDocument.getFileDocumentFromFilename(featuredImage);
String featuredImageAlt = Util.getString(post.getFeaturedImageAlt(userLang), featuredImageDoc != null ? featuredImageDoc.getTitle(userLang) : glp("types.BlogPost.fields.featuredImage.label"));

String thumbnailImage = post.getThumbnailImage(userLang);
FileDocument thumbnailImageDoc = FileDocument.getFileDocumentFromFilename(thumbnailImage);
String thumbnailImageAlt = Util.getString(Util.getString(post.getThumbnailImageAlt(userLang), featuredImageAlt), thumbnailImageDoc != null ? thumbnailImageDoc.getTitle(userLang) : glp("types.BlogPost.fields.thumbnailImage.label"));
%>
<jalios:card css="<%= cardCss %>">
  <%= getIncludeString("CARD_TOP", "") %>

  <% if (Util.notEmpty(obj.getDataImage())) { %>
    <jalios:link data="<%= obj %>" css="noTooltipCard">
      <div class="card-img-squared-wrapper"><%--
         --%><jalios:thumbnail css="card-img" path="<%= obj.getDataImage() %>" width='<%= thWidth %>' height='<%= thHeight %>' alt='<%= thumbnailImageAlt %>'><jalios:icon src="image" /></jalios:thumbnail><%--
       --%></div>
    </jalios:link>
  <% } %>

  <div class="media-body">
    <div class="card-block">
      <h3 class="card-title">
        <jalios:link data='<%= obj %>' params='<%= displayURLparams %>'>
          <%= obj.getTitle(userLang) %>
        </jalios:link>
      </h3>
    </div>
  
    <jalios:cardBlock>
      <% { %>
        <% Publication pub = obj; %>
        <%@ include file="/front/publication/doPublicationAbstract.jspf" %>
      <% } %>
      <%@ include file="/custom/jcms/doResultDisplayMetadata.jspf" %>
      <% if (Util.notEmpty(categorySet)) { %>
      <%
      // Get current URL (for current filters)
      String url = ServletUtil.getUrl(request);
      url += url.contains("?") ? "&amp;": "?";
      boolean showCategoryToggler = categorySet.size() > 4;
      %>
      <div class="post-categories">
        <jalios:icon src="category" title="ui.com.lbl.categories" />
        <jalios:foreach collection="<%= categorySet %>" name="cat" type="Category" counter="itCatCounter">
        <%
        // And add itCat filter
        String catUrl = url + BlogPostQueryHandler.PARAM_CATEGORIES + "=" + cat.getId();
        %>
        <a href="<%= catUrl %>" class="meta-cat<%= itCatCounter > 4 ? " hide meta-category-toggler" : "" %>" data-jalios-action="ajax-refresh"><%= cat.getName(userLang) %></a>
        </jalios:foreach>
        <% if (showCategoryToggler) { %>
        <a href="#" title="<%= encodeForHTMLAttribute(glp("ui.com.lbl.metadata.show-all-cat")) %>" class="meta-cat meta-category-toggler" data-jalios-action="toggle:hide" data-jalios-target=".meta-category-toggler" onclick="return false;">&hellip;</a>
        <% } %>
      </div>
      <% } %>
    </jalios:cardBlock>

    <% if (displayVoteCount || displayDbCommentCount) { %>
    <jalios:cardBlock css="media-body">
      <% if (displayVoteCount) { %>
        <jalios:icon src="thumb-up" />
        <%= glp("ui.vote.pub-vote-count", voteCount) %>
      <% } %>
      <% if (displayVoteCount && displayDbCommentCount) { %>
      &middot;
      <% } %>
      <% if (displayDbCommentCount) { %>
        <jalios:icon src="comment" />
        <%= glp("jcmsplugin.dbcomment.lbl.comment-count", dbCommentCount) %>
      <% } %>
    </jalios:cardBlock>
    <% } %>
    <%= getIncludeString("CARD_BOTTOM", "") %>

  </div>
</jalios:card>