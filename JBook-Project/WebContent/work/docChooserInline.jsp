<%@ page language="java" contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%  
%><%@ page import="com.jalios.jcms.tracking.ReaderTrackerManager" %><%
%><%@ page import="com.jalios.jcms.upload.UploadManager" %><%
%><%@page import="com.jalios.jcms.handler.EditFileDocumentHandler"%><%
%><% 

%><jsp:useBean id="docUploadFormHandler" scope="request" class="com.jalios.jcms.upload.DocUploadHandler"><%
  %><jsp:setProperty name="docUploadFormHandler" property="request" value="<%= request %>"/><%
  %><jsp:setProperty name="docUploadFormHandler" property="response" value="<%= response %>"/><%
  %><jsp:setProperty name="docUploadFormHandler" property="*" /><%
  %><jsp:setProperty name="docUploadFormHandler" property="modal" value="<%= true %>" /><%
%></jsp:useBean><%// Do not use default categories when cids where explicitely specified (which is probably always the case for inline doc upload)
  if (HttpUtil.hasParameter(request, "cids")) {
    docUploadFormHandler.setUseDefaultCategories(false);
  }

  docUploadFormHandler.internalInit();

  // Do not display either if user does not have publish right in the selected categories
  Set<Category> catSet = docUploadFormHandler.getAvailableCategorySet();
  if (Util.notEmpty(catSet)) {
    for (Category cat : catSet) {
      if (!loggedMember.canUseCategory(cat)) {
        return;
      }
    }
  }
  
  // If not logged or not allow to publish document
  Map<String,?> canPublishContextMap = Util.getHashMap(RightPolicyFilter.CTXT_CATEGORIES, catSet);      
  if (!isLogged || !loggedMember.canPublishSome(docUploadFormHandler.getAvailableType(), docUploadFormHandler.getWorkspace(), canPublishContextMap) ||
      !channel.isDataWriteEnabled()) {
    return;
  }


Class documentType = docUploadFormHandler.getAvailableType();
String documentTypeShortName = documentType.getSimpleName();%><jalios:include jsp='<%= "/types/" + documentTypeShortName + "/do" + documentTypeShortName + "FormHandler.jsp" %>' /><%

  EditFileDocumentHandler docFormHandler = (EditFileDocumentHandler)request.getAttribute(documentTypeShortName + ".formHandler");
  docFormHandler.setUploadContext(true);    
  docFormHandler.validate();

  docUploadFormHandler.setDocumentFormHandler(docFormHandler);

  // Validate 
  String errors = docUploadFormHandler.handleUploadError(docUploadFormHandler.handleUpload());
  
  // CSS & JS
  UploadManager.getInstance().addUploadComponentScripts(jcmsContext);
  
  // BrowserPlus
  // jcmsContext.addJavaScript("http://bp.yahooapis.com/2.4.21/browserplus-min.js");
  
  // Labels
  String submit       = glp("ui.com.btn.upload");

  String filter = getAlphaNumParameter("pluploadFilter", null);
  filter = Util.notEmpty(filter) ? "plupload-filter-"+filter : "";
  
  String resize = getAlphaNumParameter("pluploadResize", null);
  resize = Util.notEmpty(resize) ? "plupload-resize-"+resize : "";
  
  // Parameters
  FileDocument doc     = docUploadFormHandler.getAvailableFileDocument();
  boolean isUpdate     = doc != null;
  boolean showUnzipOpt = com.jalios.jcms.upload.UnzipUploadManager.canUnzipToFileDocuments() && !isUpdate && !getBooleanParameter("hideUnzip", false) && docUploadFormHandler.getAvailableOpenerForm() == null;
  
  boolean showForm     = true;
  if (doc != null && !doc.checkStrongLockMember(loggedMember)) {
    errors   = doc.getStrongLockInfo(userLocale);
    showForm = !loggedMember.canWorkOn(doc);
  }
  
  if (Util.notEmpty(errors)){ session.setAttribute(JcmsConstants.WARNING_MSG, errors);   }
%>

<%-- UPLOADING --%>
<% if (docUploadFormHandler.isUploading()) { %>
<div class="ajax-refresh-div" data-jalios-ajax-refresh-url='work/docChooserInline.jsp'>
  <jalios:javascript><%= docUploadFormHandler.getNextUploadStep() %></jalios:javascript>
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>
<% return; } %>

<%-- HIDDEN --%>
<% if (!showForm) { return; } %>

<div class="ajax-refresh-div" data-jalios-ajax-refresh-url='work/docChooserInline.jsp'>

<% boolean formProvided = getBooleanParameter("formProvided", false); %>
 <% if (!formProvided) { %>
  <form class="form-horizontal noSingleSubmitButton lang-trigger" name='inlineForm' lang="<%= docUploadFormHandler.getAvailableMainLanguage() %>" 
        action='work/docChooserInline.jsp' method="post" role="form" accept-charset="UTF-8"  enctype="multipart/form-data">
 <% } %>
 
    <%@ include file="/jcore/doMessageBox.jspf" %>
        
    <%-- PLUPLOAD  --%>
    <div id="plupload-inline" class='plupload plupload-light plupload-field-filename <%= encodeForHTMLAttribute(filter) %> <%= encodeForHTMLAttribute(resize) %>'>
    </div>

    <jalios:foreach collection='<%= docUploadFormHandler.getAvailableCategorySet() %>' name='itCat' type='Category'>
      <input type='hidden' name='cids' value='<%= itCat.getId() %>'>
    </jalios:foreach>


    <% String isTrackedStr = Util.getString(ReaderTrackerManager.getInstance().isTypeReaderTracked(docUploadFormHandler.getPublicationClass()),"false"); %>
    <input type='hidden' name='tracked' value='<%= isTrackedStr%>' />
    <input type='hidden' name='unzipUploadedFiles' value='<%= String.valueOf(docUploadFormHandler.getUnzipUploadedFiles()) %>' />
    
    <input type='hidden' name='pluploadFilter'  value='<%= encodeForHTMLAttribute(getAlphaNumParameter("pluploadFilter","")) %>'  />
    <input type='hidden' name='pluploadResize'  value='<%= encodeForHTMLAttribute(getAlphaNumParameter("pluploadResize","")) %>'  />
      
    <input type='hidden' name='pstatus'  value='<%= docUploadFormHandler.getAvailablePstatus() %>'  />
    <input type='hidden' name='type' value='<%= docUploadFormHandler.isTypeAutoSelect() ? "" : encodeForHTMLAttribute(docUploadFormHandler.getAvailableType().getName()) %>' />
    <input type='hidden' name='originalType' value='<%= encodeForHTMLAttribute(docUploadFormHandler.getAvailableOriginalType().getName()) %>' />
    <input type='hidden' name='nbElt'    value='<%= docUploadFormHandler.getAvailableNbElt() %>' />
    <input type='hidden' name='jsFunc'   value='<%= encodeForHTMLAttribute(docUploadFormHandler.getAvailableJsFunc()) %>' />
    <input type='hidden' name='ws'       value='<%= encodeForHTMLAttribute(docUploadFormHandler.getAvailableWorkspace().getId()) %>' />
    <input type='hidden' name='id'       value='x' />
    <input type='hidden' name='skipActivity'       value='<%= docUploadFormHandler.getAvailableSkipActivity() %>' />
    <%-- Used by MediaBrowser  --%> 
    <input type='hidden' name='ensureLuceneIndexing' value='<%= getBooleanParameter("ensureLuceneIndexing",false) %>' />

    <% if (docUploadFormHandler.getRedirect() != null) { %>
      <input type='hidden' name='redirect' value='<%= encodeForHTMLAttribute(docUploadFormHandler.getRedirect()) %>' />
    <% } %>
    
    <% String ajaxRefreshTarget = HttpUtil.getAlphaNumParameter(request, "ajaxRefreshTarget", null);
       if (ajaxRefreshTarget != null) { %>
      <input type='hidden' name='ajaxRefreshTarget' value='<%= encodeForHTMLAttribute(ajaxRefreshTarget) %>' />
    <% } %>
    
    <%-- Used by docChooser --%>
    <% if (docUploadFormHandler.getAvailableOpenerForm() != null) { %>
      <input type='hidden' name='openerForm' value='<%= encodeForHTMLAttribute(docUploadFormHandler.getAvailableOpenerForm()) %>' />
    <% } %>
    
    <%-- Used by docChooser --%>
    <% if (docUploadFormHandler.getAvailableOpenerRefresh() != null) { %>
      <input type='hidden' name='refresh' value='<%= encodeForHTMLAttribute(docUploadFormHandler.getAvailableOpenerRefresh()) %>' />
    <% } %>
      
    <% if (docUploadFormHandler.isUploadEnabled()){ %>
    <div class="inline-footer br">
      <button style="display:none;" class="btn btn-primary ajax-refresh plupload-submit" type="submit"  name="opUpload"  value="true"><%= submit %></button>
    </div>
    <% } %>
 <% if (!formProvided) { %>
  </form>
 <% } %>
  
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>