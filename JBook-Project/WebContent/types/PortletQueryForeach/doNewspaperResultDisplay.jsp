<%--
  @Summary: Publication result display for Newspaper template
  @Category: Publication Template
  @Author: Sylvain DEVAUX
  @Customizable: False
  @Requestable: False
  @since: jcms-9.0.1
--%><%@page import="com.jalios.jcms.uicomponent.image.*"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

Publication pub = (Publication) request.getAttribute(PortalManager.PORTAL_PUBLICATION);
String displayURLparams = (String)request.getAttribute("displayURLparams");
%>

<%-- Render the abstract in HTML --%>
<jalios:buffer name="abstractBuffer">
<% Publication obj = pub; %>
<%@ include file="/front/publication/doPublicationAbstract.jspf" %>
</jalios:buffer>

<%@ include file="/front/publication/doPublicationOrientedImage.jspf" %>
<%
String dataImageTitleAttr = Util.notEmpty(dataImageTitle) ? " title='" + encodeForHTMLAttribute(dataImageTitle) +"'":"";
// Prevent duplicate dataImage display (if dataImage is also contained in pub's abstract)
boolean dataImageContainedInAbstract = Util.notEmpty(abstractBuffer) && (dataImage != null) ? abstractBuffer.contains(dataImage) : false;
%>

<%-- Store result's title for possible use at different places --%>
<jalios:buffer name="resultTitle">
  <div class="newspaper-result-title">
    <jalios:link data="<%= pub %>" params="<%= displayURLparams %>" css="noTooltipCard"/>
  </div>
</jalios:buffer>

<div class="newspaper-result-display <%= Util.getClassShortName(pub) %>">

  <%-- Landscape image uses the CSS background-image property, with a "background-size: cover;" rule. --%>
  <% if (hasImage && isLandscape && !dataImageContainedInAbstract) { %>
    <%
    LandscapeImageAdapter imgAdapter = new LandscapeImageAdapter();
    imgAdapter.setImage(new File(channel.getRealPath(dataImage)));
    boolean isLeadTemplate = Util.toBoolean(request.getAttribute("pqf-newspaper-first-lead"), false);
    if (isLeadTemplate) {
      imgAdapter.setMaxWidth(1140);  // The width we would like the whole landscape image to fill in (1140 is an arbitrary choice for a Lead result taking a full Bootstrap column in a .container portal. 1170 from .container in XL screen - 2x 15px of the gutters)
    } else {
      imgAdapter.setMaxWidth(470);  // The width we would like the whole landscape image to fill in (470 is an arbitrary choice for the maximum width the image could take when in its columns, when in MD+ screen. It could also have been 768px.)
    }
    imgAdapter.setMaxHeight(200); // The maximum height the landscape image must take
    if (imgAdapter.getImage() != null) {
      %>
      <div class="thumbnail-wrapper orientation-landscape clickable" data-jalios-url="<%= pub.getDisplayUrl(userLocale) %>" style="background-image: url('<%= channel.getRelativePath(imgAdapter.getImage()) %>'); height: <%= imgAdapter.getHeight() %>px;"<%= dataImageTitleAttr %>></div>
      <%
    }
    %>
  <% } %>

  <div class="newspaper-result-body">

    <% if (!isPortrait) { %>
      <%= resultTitle %>
    <% } %>
    <% if (hasImage && !isLandscape && !dataImageContainedInAbstract) { %>
      <%
      DefaultImageAdapter imgAdapter = new DefaultImageAdapter();
      imgAdapter.setImage(new File(channel.getRealPath(dataImage)));
      imgAdapter.setMaxWidth(384);  // The width we would like the whole image to fill in (384 is an arbitrary choice for 50% of a 1 Bootstrap column in XS view (768/2))
      imgAdapter.setMaxHeight(200); // The maximum height the landscape image must take
      %>
      <div class="thumbnail-wrapper<%= isPortrait ? " orientation-portrait" : " orientation-default" %>">
        <a href="<%= pub.getDisplayUrl(userLocale) %>"<%= dataImageTitleAttr %> <%= pub.getDisplayLinkHtmlAttributes() %>>
          <% if (imgAdapter.getImage() != null) { %>
            <img src="<%= channel.getRelativePath(imgAdapter.getImage()) %>" class="img-thumbnail" alt="<%= encodeForHTMLAttribute(dataImageTitle) %>" />
          <% } %>
        </a>
      </div>
    <% } %>
    <% if (isPortrait) { %>
      <%= resultTitle %>
    <% } %>

    <%= abstractBuffer %>

    <div class="newspaper-result-footer">
      <% if (pub.getPdate() != null) { %>
      <div class="newspaper-result-pdate" title="<%= encodeForHTMLAttribute(glp("ui.work.query.txt.published") + " " + pub.getAuthor().getFullName()) %>">
        <%= glp("ui.com.lbl.pdate") %>
        <%= JcmsUtil.getFriendlyDate(getZonedDateTime(pub.getPdate()), java.time.format.FormatStyle.MEDIUM, false, userLocale) %>
      </div>
      <% } %>
    </div>

  </div>
</div>