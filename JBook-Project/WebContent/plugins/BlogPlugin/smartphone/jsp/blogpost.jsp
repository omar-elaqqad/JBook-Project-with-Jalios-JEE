<%@ include file='/plugins/SmartPhonePlugin/jsp/common/header.jspf' %><%--
 --%><%
    Publication pub = getPublicationParameter("id");
    BlogPost blogPost = (BlogPost) getPublicationParameter("id");
%><%--
--%><%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubCommon.jspf' %><%--
--%><div id="pub-blogpost" data-role="page" class="pub-page pub-blogpost">
  <%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubTopbarMenu.jspf' %>
  <div data-role="content" class="pub-content">
    <div class="card card-publication">
      <%-- PREVIEW --%>
      <% if (Util.notEmpty(blogPost.getFeaturedImage()) && blogPost.displayFeaturedImage()) { %>
	      <div class="preview">
	        <img src="<%= blogPost.getFeaturedImage() %>" alt="" />
	      </div>
      <% } %>
      <% if (Util.isEmpty(blogPost.getFeaturedImage()) && Util.notEmpty(blogPost.getThumbnailImage())) { %>
	      <div class="preview">
	        <img src="<%= blogPost.getThumbnailImage() %>" alt="" />
	      </div>
      <% } %>
      <%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubHeader.jspf' %>
      <%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubMeta.jspf' %>
      <%@ include file='/plugins/SmartPhonePlugin/jsp/core/pub/doPubLock.jspf' %>
      <div class="card-item pub-body">
        <jalios:include target="SMARTPHONE_PUB_BODY_TOP" />
        <div class="zoomable-images">
          <jalios:wysiwyg><%= Util.getString(blogPost.getContent(userLang),"") %></jalios:wysiwyg>
        </div>
        <jalios:include target="SMARTPHONE_PUB_BODY_BOTTOM" />
      </div><%-- EOF .pub-body --%>
      <jalios:include jsp='/plugins/SmartPhonePlugin/jsp/core/pub/doPubFooter.jsp' />
    </div><%-- EOF .pub --%>  
    <jalios:include target="SMARTPHONE_PUB_FOOTER" />
  </div><%-- EOF .pub-content --%>
</div><%-- EOF #blog-post --%>
<%@ include file='/plugins/SmartPhonePlugin/jsp/common/footer.jspf' %>