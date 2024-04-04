<%@ include file="/front/card/data/doInitCardData.jspf" %><%
Publication pub = (Publication) data;
%>
<%--
  @Summary: Common result display page
  @Customizable: True
  @Requestable: False
--%><%
%><%
  // Improvement JCMS-2476 : Take into account the "jcms.resource.default-template.query" resource if it is specified
  String currentTemplateUsage = jcmsContext.getTemplateUsage();
  String defaultQueryTemplate = channel.getProperty("jcms.resource.default-template.query", "");
  if (TypeTemplateEntry.USAGE_DISPLAY_QUERY.equals(currentTemplateUsage) &&
      Util.notEmpty(defaultQueryTemplate) && !"custom/jcms/doResultDisplay.jsp".equals(defaultQueryTemplate)) {
    %><jsp:include page='<%= "/" + defaultQueryTemplate %>' flush="true" /><%
    return;
  }

  PortalInterface reqPortal = getDataParameter("portal", PortalInterface.class);

  // displayURLparams must be used in <jalios:url>/<jalios:link> to
  // propagate JCMS behavior (portlet options, highligth params, etc)
  String displayURLparams = (String)request.getAttribute("displayURLparams");
  
  int thWidth = JcmsConstants.THUMBNAIL_LARGE_WIDTH;
  int thHeight = JcmsConstants.THUMBNAIL_LARGE_HEIGHT;
  String cardCss = "card-search-result search-result card-horizontal card-default " + Util.getClassShortName(pub);
  cardCss += (pub.getAuthor() != null) ? " MID_" +  pub.getAuthor().getId() : "";
  String resultDisplayImage = getIncludeString("RESULT_DISPLAY_IMAGE", "");
%>
<jalios:card css="<%= cardCss %>" htmlTagWrapper="article">
  <% if (Util.notEmpty(resultDisplayImage)) { %>
    <div class="card-img-squared-wrapper">
      <%= resultDisplayImage %>
    </div>
  <% } else if (pub instanceof FileDocument && !((FileDocument)pub).isImage()) { %>
    <jalios:link data="<%= pub %>" css="noTooltipCard card-img-link" htmlAttributes="aria-hidden=\"true\" tabindex=\"-1\"">
      <div class="card-img-squared-wrapper"><%--
        --%><jalios:thumbnail alt="<%= pub.getTitle(userLang) %>" css="card-img" fileDoc="<%= (FileDocument)pub %>" width='<%= thWidth %>' height='<%= thHeight %>'>
            <img src="<%= pub.getGenericThumbnail() %>" alt="" />
            </jalios:thumbnail><%--
      --%></div>
    </jalios:link>
  <% } else if (Util.notEmpty(pub.getDataImage())) { %>
    <jalios:link data="<%= pub %>" css="noTooltipCard card-img-link"  htmlAttributes="aria-hidden=\"true\" tabindex=\"-1\"">
      <%
      boolean isCoverImage = false;
      if (pub instanceof FileDocument) {
        if (((FileDocument)pub).getWidth() > 0 && ((FileDocument)pub).getHeight() > 0) {
          double ratio = ((FileDocument)pub).getWidth() / ((FileDocument)pub).getHeight();
          if (ratio > 0.6 && ratio < 1) {
            // Handle very high images
            isCoverImage = true;
          }
        }
      } else {
        FileDocument dataImageDoc = FileDocument.getFileDocumentFromFilename(pub.getDataImage());
        if (dataImageDoc != null) {
          if (dataImageDoc.getWidth() > 0 && dataImageDoc.getHeight() > 0) {
            double ratio = dataImageDoc.getWidth() / dataImageDoc.getHeight();
            if (ratio > 0.6 && ratio < 1) {
              // Handle very high images
              isCoverImage = true;
            }
          }
        }
      }
      boolean isSmallImage = pub instanceof FileDocument && ((FileDocument)data).getWidth() < 150 && ((FileDocument)data).getHeight() < 150;
      %>
      <div class="card-img-squared-wrapper <%= isSmallImage ? "is-small-image" : "" %><%= isCoverImage ? "is-cover-image" : "" %>"><%--
         --%><jalios:thumbnail css="card-img" path="<%= pub.getDataImage() %>" width='<%= thWidth %>' height='<%= thHeight %>'><jalios:icon src="image" /></jalios:thumbnail><%--
       --%></div>
    </jalios:link>
  <% } else { %>
    <jalios:link data="<%= pub %>" css="noTooltipCard card-img-link"  htmlAttributes="aria-hidden=\"true\" tabindex=\"-1\"">
      <div class="card-img-squared-wrapper">
        <img src="<%= pub.getGenericThumbnail() %>" alt="" />
      </div>
    </jalios:link>
  <% } %>
  <jalios:cardBlock css="card-body">
    <<%= titleTag %> class="card-title">
      <jalios:link data='<%= pub %>' params='<%= displayURLparams %>'><jalios:dataicon css="pub-icon" addTextualAlternative="true" data="<%= pub %>" /> <%= pub.getTitle(userLang) %></jalios:link>
    </<%= titleTag %>>
    <jalios:include target="RESULTDISPLAY_AFTER_TITLE" />
    <% if (Util.notEmpty(pub.getAbstract(userLang, true))) { %>
      <div class="abstract">
        <%= encodeForHTML(pub.getAbstractAsText(userLocale)) %>
      </div>
    <% } %>    
    <%@ include file="/custom/jcms/doResultDisplayCardMetadata.jspf" %>
  </jalios:cardBlock>
</jalios:card>