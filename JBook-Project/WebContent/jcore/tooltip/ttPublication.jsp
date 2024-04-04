<%@page import="com.jalios.jcms.uicomponent.image.editor.ImageEditorManager"%>
<%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ page import="com.jalios.jcms.publiclink.PublicLinkManager" %><%

  Publication pub = getPublicationParameter("ttId");
  if (pub == null || !pub.canBeReadBy(loggedMember)){
    Object tmpObj = request.getAttribute("JCMS_TTCARD_PUBLICATION");
    if(tmpObj != null && tmpObj instanceof Publication){
      pub =(Publication) tmpObj;
	    if (!pub.canBeReadBy(loggedMember)){      
	      return;
	    }
    }
    else{
      return;
    }
  }
  
  TypeFieldEntry tfe = channel.getTypeAbstractFieldEntry(pub.getClass());
  
  String pubAbstract  = pub.getAbstract(userLang);
  
  boolean hasThumbnail = Util.notEmpty(pub.getDataImage());
  
  if (!hasThumbnail && pub instanceof FileDocument && ((FileDocument)pub).getFile() != null) {
    File thumbnailFile = com.jalios.jcms.taglib.ThumbnailTag.createThumbnail((FileDocument)pub, null, null, null, JcmsConstants.TTCARD_MEDIA_WIDTH, JcmsConstants.TTCARD_MEDIA_HEIGHT);
    hasThumbnail = thumbnailFile != null;
  }
  
  Category[] categories = pub.getCategories(loggedMember);
%>
<div class="tt-card tt-publication <%= pub.getClass().getSimpleName()%>" data-jalios-dataid="<%= pub.getId() %>">
  <div class="tt-card-body">
    <div class="tt-card-title">
      <jalios:buffer name="titleTopBuffer">
        <jalios:include target="PUBLICATION_TOOLTIP_TITLE_TOP" targetContext="bloc" />
      </jalios:buffer>
      <% if (Util.notEmpty(titleTopBuffer)) { %>
      <div class="tt-card-title-top"><%= titleTopBuffer %></div>
      <% } %>
      <jalios:link data="<%= pub %>"><jalios:dataicon data="<%= pub %>"/> <%= pub.getTitle(userLang) %></jalios:link>
      <jalios:buffer name="titleBottomBuffer">
        <jalios:include target="PUBLICATION_TOOLTIP_TITLE_BOTTOM" targetContext="bloc" />
      </jalios:buffer>
      <% if (Util.notEmpty(titleBottomBuffer)) { %>
      <div class="tt-card-title-bottom"><%= titleBottomBuffer %></div>
      <% } %>
    </div>
    <% if (hasThumbnail || pub.isWorkCopy() || Util.notEmpty(pubAbstract)) { %>
      <div class="tt-card-abstract media">
        <%-- Thumbnail --%>
        <% if (hasThumbnail) { %>
          <div class="tt-card-thumbnail pull-left">
            <% String titleAttr = "title='" + encodeForHTMLAttribute(pub.getTitle(userLang)) + "'"; %>
            <jalios:link data="<%= pub %>"><jalios:thumbnail data="<%= pub %>"
                            width="<%= JcmsConstants.TTCARD_MEDIA_WIDTH %>"
                            height="<%= JcmsConstants.TTCARD_MEDIA_HEIGHT %>"
                            alt="<%= pub.getTitle(userLang) %>" 
                            css="img-thumbnail"
                            htmlAttributes="<%= titleAttr %>"><jalios:icon src="image" /></jalios:thumbnail></jalios:link>
            <div class="photo-anchor"><jalios:include target="PUB_VISUAL_ANCHOR" targetContext="inline" /></div>
          </div>
        <% } %>
        
        <div class="tt-card-abstract-text media-body">
          <%-- Title --%>
          <% if (pub.isWorkCopy()) { %>
            <div class="name">
              <span class="wfstate" title="<%= encodeForHTMLAttribute(glp("ui.com.lbl.workcopyof", pub.getMainInstance().getTitle(userLang))) %>"><%= glp("ui.com.lbl.workcopy") %></span>
            </div>
          <% } %>
          <%-- Abstract --%>
          <% if (Util.notEmpty(pubAbstract)) { %>
          <div class="abstract">
            <% if (tfe != null && tfe.isWysiwyg()){ %>
              <jalios:wysiwyg><%= pubAbstract %></jalios:wysiwyg>
            <% } else { %>
            <jalios:wiki truncateLength="400" truncateSuffix="..."><%= pubAbstract %></jalios:wiki>
            <% } %>    
          </div>
          <% } %>
        </div>
      </div>
    <% } %>
    <%-- PUBLICATION_TOOLTIP_CONTENT_TOP --%>
    <jalios:buffer name="contentTopBuffer">
      <jalios:include target="PUBLICATION_TOOLTIP_CONTENT_TOP" targetContext="bloc" />
    </jalios:buffer>
    <% if (Util.notEmpty(contentTopBuffer)) { %>
    <div class="tt-card-section">
      <%= contentTopBuffer %>
    </div>
    <% } %>
    
    <%-- METADATA --%>    
    <div class="tt-card-meta">
      <% if (pub instanceof FileDocument) { 
        FileDocument doc = (FileDocument) pub;
      %>
      <div class="doc">
        <% if (doc.isLocalFile() || !"unknown".equals(doc.getContentType())) { %>
        <jalios:dataicon data="<%= doc %>" />&nbsp;<%= doc.getTypeInfo(userLang) %>
        <% if (doc.isLocalFile()) { %> / <jalios:filesize doc='<%= doc %>' /><% } %>
        <% } %>
        <%   if (doc.isImage()) { %>&middot; <%= doc.getDimensions() %><% } %>
        <%   if (doc.getDuration() > 0) { %>&middot; <jalios:duration time='<%= doc.getDuration() %>'/><% } %>
      </div>
      <% if (doc.isRemote()) { %>
      <div clas="remote-doc">
        <jalios:icon src="remote-document" /> <%= glp("ui.com.lbl.remote-document") %>
      </div>
      <% } %>         
      <% } %>
   
      
      <%-- Fields --%>
      <% boolean showUpdated = true; %>
      <% if (pub instanceof FileDocument) { %>
        <div class="author">
          <jalios:memberphoto member="<%= pub.getAuthor() %>" size="<%= PhotoSize.ICON %>"/>
        <%= glp("ui.work.query.txt.uploaded") %>    
        <jalios:link data="<%= pub.getAuthor() %>" />
        <%= JcmsUtil.getFriendlyDate(getZonedDateTime(pub.getCdate()), java.time.format.FormatStyle.SHORT, true, userLocale) %>
        </div>
        <% showUpdated = pub.getOpAuthor() != null && pub.getCdate() != null && Math.abs(pub.getMdate().getTime() - pub.getCdate().getTime()) > 2000 ; %>    
      <% } %>
      
      <% if (showUpdated) { %>
        <div class="author">
        <jalios:memberphoto member="<%= pub.getOpAuthor() != null ? pub.getOpAuthor() : pub.getAuthor() %>" size="<%= PhotoSize.ICON %>"/>
        <%= glp("ui.work.query.txt.updated") %>    
        <jalios:link data="<%= pub.getOpAuthor() != null ? pub.getOpAuthor() : pub.getAuthor() %>" />
        <%= JcmsUtil.getFriendlyDate(getZonedDateTime(pub.getMdate()), java.time.format.FormatStyle.SHORT, true, userLocale) %>
        </div>
      <% } %>
    </div>
    
    <%-- PUBLICATION_TOOLTIP_CONTENT_BOTTOM --%>
    <jalios:buffer name="contentBottomBuffer">
      <jalios:include target="PUBLICATION_TOOLTIP_CONTENT_BOTTOM" targetContext="bloc" />
    </jalios:buffer>
    <% if (Util.notEmpty(contentBottomBuffer)) { %>
    <div class="tt-card-section">
      <%= contentBottomBuffer %>
    </div>
    <% } %>
    
  </div><%-- EOF .tt-card-body --%>

  <%-- FOOTER --%>
  <jalios:buffer name="footerBuffer">
    <jalios:include target="PUBLICATION_TOOLTIP_FOOTER_START" targetContext="inline" />
    <jalios:share data="<%= pub %>" css="btn btn-default"><jalios:icon src="share" alt="share.modal.title"/></jalios:share>
    <% if (pub instanceof FileDocument) { %>
    <% 
    FileDocument doc = (FileDocument)pub; 
    String ariaLabel = encodeForHTMLAttribute(doc.getTitle(userLang)) + " - " + encodeForHTMLAttribute(doc.getTypeInfo(userLang));
    if (!doc.isRemote()) {
      ariaLabel += " - " + encodeForHTMLAttribute(Util.formatFileSize(doc.getSize(), userLocale, false));
    }    
    %>
    <% 
    ImageEditorManager imageEditorManager = ImageEditorManager.getInstance();

    if (imageEditorManager.canModifyDocument(doc, loggedMember)) { %>
      <% imageEditorManager.addImageEditorFrontEndDependencies(jcmsContext); %>
    <% } %>
    <%@ include file="/jcore/document/editDocumentWith.jspf" %>

    <%@ include file="/jcore/document/downloadDocument.jspf" %>
    
    <% } %>
    
    <jalios:include target="PUBLICATION_TOOLTIP_FOOTER" targetContext="inline" />
  </jalios:buffer>
  
  <% if (Util.notEmpty(footerBuffer)) { %>
  <div class="tt-card-footer popover-footer tt-btn focus">
    <%= footerBuffer %>
  </div>
  <% } %>
</div>