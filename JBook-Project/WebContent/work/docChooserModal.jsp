<%@page import="com.jalios.jcms.upload.DocUploadHandler"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%  
%><%@ page import="com.jalios.jcms.tracking.ReaderTrackerManager" %><%
%><%@ page import="com.jalios.jcms.upload.UploadManager" %><%
%><%@page import="com.jalios.jcms.handler.EditFileDocumentHandler"%><%
%><% 
    
DocUploadHandler formHandler = (DocUploadHandler)request.getAttribute("docChooserHandler");
if (Util.isEmpty(formHandler)) { 
  %><jalios:include jsp="work/docChooserHandler.jsp" /><% 
  formHandler = (DocUploadHandler)request.getAttribute("docChooserHandler");
}

Class documentType = formHandler.getAvailableType();
String documentTypeShortName = documentType.getSimpleName();  

%><jalios:include jsp='<%= "/types/" + documentTypeShortName + "/do" + documentTypeShortName + "FormHandler.jsp" %>' /><%EditFileDocumentHandler docFormHandler = (EditFileDocumentHandler)request.getAttribute(documentTypeShortName + ".formHandler");
  docFormHandler.setUploadContext(true);
  docFormHandler.validate();

  formHandler.setDocumentFormHandler(docFormHandler);
  //formHandler.internalInit();
  
  // If not logged or not allow to publish document
  Map<String,?> canPublishContextMap = Util.getHashMap(RightPolicyFilter.CTXT_CATEGORIES, formHandler.getAvailableCategorySet());      
  if (!isLogged || !loggedMember.canPublishSome(formHandler.getAvailableType(), formHandler.getWorkspace(), canPublishContextMap)) {
    sendForbidden(request, response);
    return;
  }

  // Validate 
  String errors = formHandler.handleUploadError(formHandler.handleUpload());
  
  // CSS & JS
  UploadManager.getInstance().addUploadComponentScripts(jcmsContext);
  
  // BrowserPlus
  // jcmsContext.addJavaScript("http://bp.yahooapis.com/2.4.21/browserplus-min.js");
  
  // Labels
  String submit       = glp("ui.com.btn.upload");
  
  // Parameters
  FileDocument doc     = formHandler.getAvailableFileDocument();
  boolean isUpdate     = doc != null;
  boolean showUnzipOpt = com.jalios.jcms.upload.UnzipUploadManager.canUnzipToFileDocuments() && !isUpdate && !getBooleanParameter("hideUnzip", false) && formHandler.getAvailableOpenerForm() == null;
  
  boolean showForm     = true;
  if (doc != null && !doc.checkStrongLockMember(loggedMember)) {
    errors   = doc.getStrongLockInfo(userLocale);
    showForm = !loggedMember.canWorkOn(doc);
  }
  if (Util.notEmpty(errors)){ request.setAttribute(JcmsConstants.WARNING_MSG, errors);   }%>

<%-- UPLOADING --%>
<% if (Util.isEmpty(errors) && formHandler.isUploading()) { %>
<jalios:modal css="modal-lg modal-upload" title="msg.js.process-in-progress">
  <jalios:javascript><%= formHandler.getNextUploadStep() %></jalios:javascript>
  <div class="text-center"><jalios:icon src='wait'/></div>
</jalios:modal>
<% return; } %>

<%-- HIDDEN --%>
<% if (!showForm) { %>
<jalios:modal css="modal-lg modal-upload" title="ui.com.lbl.plupload.title">&nbsp;</jalios:modal>
<% return; } %>

<jalios:modal css="modal-lg modal-upload toggle-wrapper" title="ui.com.lbl.plupload.title" picture="upload-big" url="work/docChooserModal.jsp" formHandler="<%= formHandler %>">
  
  <%-- PLUPLOAD  --%>
  <% String filter = getAlphaNumParameter("pluploadFilter", null); %>
  <% String resize = getAlphaNumParameter("pluploadResize", null); %>
  <jalios:field name="filename" resource="field-inline">
    <jalios:control settings='<%= new FileSettings().filter(filter).resizeImage(resize) %>' />
  </jalios:field>

  <jalios:include jsp="work/docChooserOptions.jsp" />

    <input type='hidden' name='pluploadFilter'  value='<%= encodeForHTMLAttribute(getAlphaNumParameter("pluploadFilter","")) %>'  />
    <input type='hidden' name='pluploadResize'  value='<%= encodeForHTMLAttribute(getAlphaNumParameter("pluploadResize","")) %>'  />
      
    <input type='hidden' name='pstatus'  value='<%= formHandler.getAvailablePstatus() %>'  />
    <input type='hidden' name='originalType' value='<%= encodeForHTMLAttribute(formHandler.getAvailableOriginalType().getName()) %>' />
    <input type='hidden' name='nbElt'    value='<%= formHandler.getAvailableNbElt() %>' />
    <input type='hidden' name='jsFunc'   value='<%= encodeForHTMLAttribute(formHandler.getAvailableJsFunc()) %>' />
    <input type='hidden' name='id'       value='x' />
    
    <!-- Print cids requested in parameter with a dedicated input hidden value to be able to send them again when changin type -->
    <%
     String[] initialCids = request.getParameterValues("cids"); // JspChecker.VERIFIED_FOR_SECURITY
     if (initialCids != null) {
       for (String initialCid : initialCids) { %>
         <input type='hidden' name='initialCids' value='<%= encodeForHTMLAttribute(initialCid) %>' /><%
       }
     }
     %>
    
    <%-- Used by MediaBrowser  --%> 
    <input type='hidden' name='ensureLuceneIndexing' value='<%= getBooleanParameter("ensureLuceneIndexing",false) %>' />

    <% if (formHandler.getRedirect() != null) { %>
      <input type='hidden' name='redirect' value='<%= encodeForHTMLAttribute(formHandler.getRedirect()) %>' />
    <% } %>
    
    <%-- Used by docChooser --%>
    <% if (formHandler.getAvailableOpenerForm() != null) { %>
      <input type='hidden' name='openerForm' value='<%= encodeForHTMLAttribute(formHandler.getAvailableOpenerForm()) %>' />
    <% } %>
    
    <%-- Used by docChooser --%>
    <% if (formHandler.getAvailableOpenerRefresh() != null) { %>
      <input type='hidden' name='refresh' value='<%= encodeForHTMLAttribute(formHandler.getAvailableOpenerRefresh()) %>' />
    <% } %>
      
    <jalios:buffer name="MODAL_BUTTONS">
      <%@ include file='/jcore/modal/doModalLang.jspf' %>
      <input type='hidden' name="showOptions" value="true" />
      <% if (isUpdate) { %>
        <input type='hidden' name='id' value='<%= doc.getId() %>' />
        <input type='checkbox' name='majorUpdate' class='majorUpdate' value='true' <%= formHandler.getAvailableMajorUpdate() ? "checked='checked'" : "" %> onclick='var checked = this.checked; $$("INPUT.majorUpdate").each(function(input) {input.checked = checked;});'/><span class='formInfo'><%= glp("ui.work.form.lbl.major-update") %></span>
      <% } %>
      <button class="btn btn-default" type="button" name="opCancel"  data-dismiss="modal" ><%= glp("ui.com.btn.cancel") %></button>
      <button class="btn btn-default" data-jalios-action="toggle:hide" data-jalios-target=".toggle-wrapper .toggle-wrapper-state">
        <span class="toggle-wrapper-state <%= formHandler.getAvailableShowOptions() ? "hide" : "" %>"><%= glp("ui.work.doc.upload.lbl.show-options") %></span>
        <span class="toggle-wrapper-state <%= formHandler.getAvailableShowOptions() ? "" : "hide" %>"><%= glp("ui.work.doc.upload.lbl.hide-options") %></span>
      </button>
      <% if (formHandler.isUploadEnabled()){ %>
      <button class="btn btn-primary ajax-refresh plupload-submit" type="submit"  name="opUpload"  value="true"><%= submit %></button>
      <% } %>
    </jalios:buffer>

  <jalios:javascript>
    
    !function($) {

      <% if (!formHandler.isAdvancedTabHidden() && showUnzipOpt) { %>
        $("BUTTON.plupload-submit").on('click', function(event) {
          if (window.unzipConfirmed) {
            return;
          }
          // Checkbox unzip is not checked
          if ( $('#jalios-modal INPUT[name=unzipUploadedFiles]:checked').val() == 'false'){ return; }
          
          // Has any zip
          var hasZip = false;
          var files = $('.plupload.plupload-field-filename').data('plupload').files;
          for (var i = 0 ; (files && i < files.length); i++){
            if (files[i].name && files[i].name.indexOf('.zip') > 0){ hasZip = true; break; }
          }
          if (!hasZip){ return; }
          
          // Confirm unzip
          var doUnzip = top.confirm('<%= glp("msg.js.confirm-unzip") %>');
          if (doUnzip){
            window.unzipConfirmed = true
            return;
          }
          
          event.preventDefault();
          event.stopPropagation();
        });
      <% } %>
        
        $("SELECT[name='internalWf']").on("change", function(event) {
           $form = $(event.currentTarget).closest("FORM");
           $( $form[0].workflowChangeEvent).refresh({callback : function(event2) {
            $('.modal-upload a[href="#pworkflow"]').tab("show");
           }});
        });
        
        //refresh tabs modal when the document type is changed
        $(document).on('change', '.triggerTypeChangeRefresh', function(event) {
      		var $e = $(event.currentTarget);
      		var $widget = $e.closest(".widget");
      		if (!$widget || !$widget.exists()) {
        		return;
      		}
        
         // JCMS-7835 : reset pstatus to initial state of workflow when changing document type
         // When type is changed, disabled any pstatus field (input, select or anything else) so it is NOT sent during refresh,
         // This will force use of the initial state of the workflow associated the newly selected type 
         $("#jalios-modal [name='pstatus']").attr("disabled", true);
         // Same things for categories to ensure default categories gets filled in form depending on handler behavior
         $("#jalios-modal [name='useDefaultCategories']").attr("disabled", true);
         $("#jalios-modal [name='cids']").attr("disabled", true); // disable actual cids which may contains both initial requested and default cids
         $("#jalios-modal [name='initialCids']").clone().attr("name", "cids").appendTo($("#jalios-modal FORM")); // resubmit only the initialy requested cids to ensure they are used, since JCMS-8908 and keep initialCids
	      $e.refresh();
    	});
        
    }(jQuery)

    </jalios:javascript>
</jalios:modal>