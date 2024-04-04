<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.jcms.handler.EditMemberPhotoHandler" %><%
%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.handler.EditMemberPhotoHandler"><%
 %><jsp:setProperty name="formHandler" property="pageContext" value="<%= pageContext %>"/><%
 %><jsp:setProperty name="formHandler" property="*" /><%
 %><jsp:setProperty name='formHandler' property="noRedirect" value="true" /><%
 %><jsp:setProperty name='formHandler' property='member' value='<%= getMemberParameter("mbrId") %>' /><%
%></jsp:useBean><% 

  if (formHandler.validate()) {
    %><%@ include file="/jcore/modal/modalRedirect.jspf" %><%
    return;
  }

  jcmsContext.addCSSHeader("css/jalios/core/jalios-photo-crop.css");
  jcmsContext.addCSSHeader("css/lib/cropper/cropper.css");
  jcmsContext.addJavaScript("js/lib/cropper/cropper.js");
  jcmsContext.addCSSHeader("css/jalios/ux/jalios-image-editor.css");
  jcmsContext.addJavaScript("js/jalios/ux/jalios-image-editor.js");

  int step = formHandler.getFormStep();
  int stepCount = formHandler.getFormStepCount();
%>
<jalios:modal css="modal-lg photo-crop-modal modal-upload" title="ui.member-editor.change-photo" picture="images/jalios/icons/imageEditor.gif" url="front/memberPhoto/editPhoto.jsp" formHandler="<%= formHandler %>">
  <%@ include file='/front/memberPhoto/editPhoto_upload.jspf' %>  
  <%@ include file='/front/memberPhoto/editPhoto_crop.jspf' %> 
</jalios:modal>