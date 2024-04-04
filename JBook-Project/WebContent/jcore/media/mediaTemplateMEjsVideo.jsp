<%--
  @Summary: Template used to display any video file through MediaElement.js Player
--%><%@page import="com.jalios.jcms.media.MediaProgressionManager"%>
<%@page import="com.jalios.jcms.media.MediaProgression"%>
<%@ page import="com.jalios.jcms.authentication.handlers.AuthKeyAuthenticationHandler" %><%
%><%@ page import="com.jalios.jcms.taglib.ThumbnailTag" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/media/mediaTemplateInit.jspf' %><%
%><%@ include file='/jcore/media/mediaTemplateMEjsCommon.jspf' %><%
  int mejsplayerCounter = Util.toInt(request.getSession().getAttribute("mejsplayerCounter"),0) + 1;
  request.getSession().setAttribute("mejsplayerCounter", String.valueOf(mejsplayerCounter));
  String playerId = "mejsplayer" + mejsplayerCounter;

  String options = channel.getProperty("media.template.mejs-video.options", "");
  options = options.replace("{baseUrl}", ServletUtil.getBaseUrl(request));
  int progressionDeleteBeforeEndPercentage = channel.getIntegerProperty("media.template.mejs-video.options.media-progression.remove-before-end.percentage", 5);
  int progressionDeleteBeforeEndMinimumSeconds = channel.getIntegerProperty("media.template.mejs-video.options.media-progression.remove-before-end.minimum-seconds", 2);
  // Always use responsive, unless specified otherwise for current browser
  boolean useResponsive = channel.getBooleanProperty("media.template.mejs.use-responsive.browser-" + clientBrowser.getBrowserShortName(), true);

  final int DEFAULT_TAG_WIDTH = 320;
  final int DEFAULT_TAG_HEIGHT = 240;
      
  int width = (maxWidth != DEFAULT_TAG_WIDTH) ? maxWidth : (maxHeight * 4) / 3;
  int height = (maxHeight != DEFAULT_TAG_HEIGHT) ? maxHeight : (maxWidth * 3) / 4;
  // ensure multiple of 2 for correct handling of flv thumbnail by ffmpeg: 
  width = (int) (Math.floor(width/2) * 2);
  height = (int) (Math.floor(height/2) * 2);
  
  // Improvement JCMS-5163 : Increase default thumbnail size for video poster in MediaElement.js media template
  // When the default dimensions of the MediaTag are being received in the media template, 
  // use larger 16:9 dimensions (matching responsive layout aspect ratio) which can be configured through properties 
  if (width == DEFAULT_TAG_WIDTH && height == DEFAULT_TAG_HEIGHT) {
    width = channel.getIntegerProperty("media.template.mejs-video.width", 1280);
    height = channel.getIntegerProperty("media.template.mejs-video.height", 720);
  }
  
  String mediaUrl;
  String previewUrl = null;
  int startTime = 0;
  String fileDocumentId = "";

  // Absolute URL
  if (url != null) {
    mediaUrl = url;
  }
  // Local media path
  else {
    mediaUrl = mediaPath;
    
    if (fileDoc != null) {
      File previewImageFile = ThumbnailTag.createThumbnail(fileDoc, null, null, null, width, height);
      if (previewImageFile != null) {
        previewUrl = ServletUtil.getBaseUrl(request) + channel.getRelativePath(previewImageFile);
      }
      
      MediaProgression mediaProgression = MediaProgressionManager.getInstance().getMediaProgression(fileDoc, loggedMember);
      if(mediaProgression != null){
    	  startTime = mediaProgression.getProgression();
      }
    	fileDocumentId = fileDoc.getId();
    }

    // Use "http://www.example.com/upload/doc/filename.ext" instead of just "upload/doc/filename.ext" ?
    boolean useAbsoluteUrl = channel.getBooleanProperty("media.template.mejs.use-absolute-url", true);
    if (useAbsoluteUrl && !isMediaURL) {
      mediaUrl = ServletUtil.getBaseUrl(request) + mediaPath;
    }
  
    // Add authkey for private site or private document, to ensure plugin can download the file
    // without access to the browser session
    boolean useAuthKey = useAbsoluteUrl && (channel.isAuthenticationRequired() || !(fileDoc != null && fileDoc.isPublic())) &&
                         channel.getBooleanProperty("media.template.mejs.use-auth-key", true);
    if (useAuthKey) {
      mediaUrl = AuthKeyAuthenticationHandler.getUrlWithAddedAuthKeyParam(mediaUrl, loggedMember);
      previewUrl = Util.isEmpty(previewUrl) ? previewUrl : AuthKeyAuthenticationHandler.getUrlWithAddedAuthKeyParam(previewUrl, loggedMember);
    } 
  }
%>

<% if (useResponsive) { %><div class="mejs-responsive-wrapper" style="max-width:<%= width %>px; max-height:<%= height %>px;"><% } %>
	<video class="mejs-video no-focus" preload="metadata"
				 data-jalios-mediaprogression-remove-beforeend-minimum-seconds="<%=progressionDeleteBeforeEndMinimumSeconds%>" 
				 data-jalios-mediaprogression-remove-beforeend-percentage="<%= progressionDeleteBeforeEndPercentage %>" 
				 data-jalios-filedocument-id="<%= fileDocumentId %>" 
				 data-jalios-mediaelement-start="<%= startTime %>" id="<%= playerId %>" src="<%= mediaUrl %>" preload="none" controls="controls" <%= htmlAttributes %>  <%
  if (useResponsive) {
    %> style="width:100%;height:100%; max-width:<%= width %>px; max-height:<%= height %>px;" <% 
  } else {
    %> width="<%= width %>" height="<%= height %>" <%
  }
  if (Util.notEmpty(previewUrl)){ %> poster="<%= previewUrl %>" <% } %>><%
  // Video Tracks (captions, subtitles, etc, ...)
  if (fileDoc != null && fileDoc.hasTracks()) {
    for (Map.Entry<String,Map<String,String>> trackKindEntry : fileDoc.getTracksMap().entrySet()) {
      final String trackKind = trackKindEntry.getKey();
      for (Map.Entry<String,String> trackEntry : trackKindEntry.getValue().entrySet()) {
        final String trackLang = trackEntry.getKey();
        final String trackPath = trackEntry.getValue();
        %><track kind="<%= encodeForHTMLAttribute(trackKind) %>" label="<%= encodeForHTMLAttribute(glp("media.tracks."+trackKind, glp("lang."+trackLang))) %>" 
                 srclang="<%= encodeForHTMLAttribute(trackLang) %>" src="<%= encodeForHTMLAttribute(trackPath) %>" /><%
      }
    }
  }
  %></video>
<% if (useResponsive) { %></div><% }
//Ugly fix to make mejs works on smartphone
final boolean isSmartPhone = Util.toBoolean(request.getAttribute("jcms.plugin.smartphone.smartphone-resource"), false);
if(isSmartPhone){ %>
	<script>
		<% if (Util.notEmpty(mejslang)) { %> mejs.i18n.language('<%= mejslang %>');<% } %>
		jQuery(document).on('pagebeforeshow', (prevpage) => {
			let mejsInit = jQuery('#<%= playerId %>').data("mejs-init");
			if(!mejsInit){
			  jQuery('#<%= playerId %>').mediaelementplayer(<%= options  %>);
			  jQuery('#<%= playerId %>').data("mejs-init", true);
			}
		});
	</script>
<% }else{ %>
	<jalios:javascript>
	<% if (Util.notEmpty(mejslang)) { %> mejs.i18n.language('<%= mejslang %>');<% } %>
	jQuery('#<%= playerId %>').mediaelementplayer(<%= options  %>);
	</jalios:javascript>
<% } %>
