<%--
  @Summary: Template used to display any audio file through MediaElement.js Player
--%><%
%><%@ page import="com.jalios.jcms.taglib.ThumbnailTag" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/media/mediaTemplateInit.jspf' %><%
%><%@ include file='/jcore/media/mediaTemplateMEjsCommon.jspf' %><%

int mejsplayerCounter = Util.toInt(request.getSession().getAttribute("mejsplayerAudioCounter"),0) + 1;
request.getSession().setAttribute("mejsplayerAudioCounter", String.valueOf(mejsplayerCounter));
String playerId = "mejsplayerAudio" + mejsplayerCounter;

String options = channel.getProperty("media.template.mejs-audio.options", "");
options = options.replace("{baseUrl}", ServletUtil.getBaseUrl(request));

%>
<div class="mejs-responsive-wrapper <%= css %>">
<audio class="mejs-audio  no-focus" preload="metadata" id="<%= playerId %>" src="<%= mediaPath %>" <%= htmlAttributes %>
       style="width:100%;height:100%;" width="100%" height="100%"></audio>
</div>
<%
//Ugly fix to make mejs works on smartphone
final boolean isSmartPhone = Util.toBoolean(request.getAttribute("jcms.plugin.smartphone.smartphone-resource"), false);

if(isSmartPhone){ %>
	<script>
		jQuery(document).on('pagebeforeshow', (prevpage) => {
			let mejsInit = jQuery('#<%= playerId %>').data("mejs-init");
			if(!mejsInit){
				jQuery('#<%= playerId %>').mediaelementplayer(<%= options %>);
			  jQuery('#<%= playerId %>').data("mejs-init", true);
			}
	
		});
	</script>
<% }else{ %>
<jalios:javascript>
<% if (Util.notEmpty(mejslang)) { %> mejs.i18n.language('<%= mejslang %>');<% } %>
jQuery('#<%= playerId %>').mediaelementplayer(<%= options %>);
</jalios:javascript>
<% } %>