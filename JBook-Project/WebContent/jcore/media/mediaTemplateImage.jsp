<%--
  @Summary: Template used to display images
--%>
<%@page import="com.jalios.jcms.uicomponent.image.editor.ImageEditorManager"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/media/mediaTemplateInit.jspf' %><%

WebAssetsUtils.addWebAssets(jcmsContext, "jalios-lightbox");
DataAttribute dataAttribute = LightboxUtils.getImageDataAttribute(fileDoc, userLang, userLocale, loggedMember, true);

 %><a href="<%= mediaPath %>" class="lightbox-img <%= css %>" onclick="return false;" <%= htmlAttributes %>><jalios:thumbnail dataAttribute='<%= dataAttribute %>' css="img-thumbnail" path='<%= mediaPath %>' 
                     width='<%= maxWidth %>' height='<%= maxHeight %>' alt='<%= mediaDescription %>'><%
   %><img class="img-thumbnail" <%= dataAttribute %> src="<%= mediaPath %>" alt="<%= encodeForHTMLAttribute(mediaDescription) %>" style="max-width: <%= maxWidth %>;" /><%
 %></jalios:thumbnail></a>