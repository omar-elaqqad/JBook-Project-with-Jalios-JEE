<%@page import="com.jalios.jcms.uicomponent.image.editor.ImageEditorManager"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
if (!isLogged) {
  sendForbidden(request, response);
}

FileDocument document = getDataParameter("fileDocumentId", FileDocument.class);

if (document == null) {
  sendRedirect(channel.getDefaultWorkspace());
  return;
}

if (!loggedMember.canWorkOn(document)) {
  sendForbidden(request, response);
  return;
}
%>
<%@ include file="/jcore/doHeader.jspf" %>
<%

request.setAttribute("title", glp("ui.filedocument.image-editor"));
jcmsContext.addCSSHeader("css/jalios/core/components/imageEditor/jalios-image-editor.css");
jcmsContext.addJavaScript("js/jalios/core/components/imageEditor/jalios-image-editor.js");

DataAttribute dataAttribute = ImageEditorManager.getInstance().getImageEditorContextDataAttributes(document);
%>
<jalios:javascript>
  var $imageEditorWrapper = jQuery(".image-editor-inline");
  let imageEditorContext = $imageEditorWrapper.data("jalios-image-editor-context");
  if (!imageEditorContext) {
    imageEditorContext = {};
  }
  imageEditorContext.container = jQuery(".image-editor-inline");
  
  jQuery.jalios.ImageEditor.launchImageEditor(imageEditorContext);
  jQuery(document).on('jalios:imageEditor', function (event) {
    if (event.imageEditor.type !== jQuery.jalios.ImageEditor.EditorEventType.AFTER_IMAGE_REFRESHED) {
      return;
    }
    history.back();
  })
  
</jalios:javascript>
<div class="image-editor-wrapper image-editor-inline row" <%= dataAttribute %>>
  
</div>
<%@ include file='/jcore/doFooter.jspf' %>