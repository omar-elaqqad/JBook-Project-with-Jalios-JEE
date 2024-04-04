<%@page import="com.jalios.jcms.upload.DocUploadHandler"%><%
%><%@page import="com.jalios.jcms.handler.JcmsFormHandler"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.jcms.tracking.ReaderTrackerManager" %><%
%><%@page import="com.jalios.jcms.handler.EditFileDocumentHandler"%><%

  if (loggedMember == null) {
    sendForbidden(request, response);
    return;
  }

  jcmsContext.addCSSHeader("css/jalios/docChooser.css");

%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.upload.DocUploadHandler' type="com.jalios.jcms.handler.EditPublicationHandler"><%
  %><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
%></jsp:useBean><%

Class documentType = ((DocUploadHandler)formHandler).getAvailableType();
String documentTypeShortName = documentType.getSimpleName();  

%><jalios:include jsp='<%= "/types/" + documentTypeShortName + "/do" + documentTypeShortName + "FormHandler.jsp" %>' /><%

  EditFileDocumentHandler docFormHandler = (EditFileDocumentHandler)request.getAttribute(documentTypeShortName + ".formHandler");
  docFormHandler.setUploadContext(true);
  docFormHandler.validate();
  
  DocUploadHandler docUploadHandler = ((DocUploadHandler)formHandler);

  docUploadHandler.setDocumentFormHandler(docFormHandler);
  Class clazz  = docUploadHandler.getPublicationClass();
  docUploadHandler.internalInit();
  FileDocument doc = docUploadHandler.getAvailableFileDocument();

  // UPDATE
  if (docUploadHandler.isUpdate()) {
    if (!loggedMember.canWorkOn(doc)) {
      sendForbidden(request, response);
      return;
    }
  } 
  // CREATE
  else {
    if (!loggedMember.canPublish(clazz, docUploadHandler.getAvailableWorkspace())) {
      if (clazz == FileDocument.class && loggedMember.canPublishSome(DBFileDocument.class, docUploadHandler.getAvailableWorkspace())){
        docUploadHandler.setType("DBFileDocument");
        
      } else {
        sendForbidden(request, response);
        return;
      }
    }
  }

%><%-- *** PLUGINS ********************** --%><%
%><jalios:buffer name="docChooserHeader" trim="true"><jalios:include target="DOCCHOOSER_HEADER" /></jalios:buffer><%

	String    errors = docUploadHandler.handleUploadError(docUploadHandler.handleUpload());
	int       nbElt  = docUploadHandler.getAvailableNbElt();
  boolean   isUpdate = doc != null;
  String    btnText = isUpdate ? glp("ui.com.btn.upload-update") : glp("ui.com.btn.upload");
	boolean   showUnzipOpt = com.jalios.jcms.upload.UnzipUploadManager.canUnzipToFileDocuments() && !isUpdate &&
                           !getBooleanParameter("hideUnzip", false) &&
                           docUploadHandler.getAvailableOpenerForm() == null;
  
  boolean showForm     = !docUploadHandler.isUploading() || Util.notEmpty(errors);
  if (doc != null && !doc.checkStrongLockMember(loggedMember)) {
    errors   = doc.getStrongLockInfo(userLocale);
    showForm = !loggedMember.canWorkOn(doc);
  }
  
  // It's possible to add custom messages if you use DOCCHOOSER_HEADER
  List<String> customMessages = (List<String>) request.getAttribute("docChooser.messages");
  if(Util.notEmpty(customMessages)) {
    StringBuilder sb = new StringBuilder();
    sb.append("<ul>");
    for(String customMessage : customMessages) {
      sb.append("<li>").append(customMessage).append("</li>");
    }
    sb.append("</ul>");
    errors = sb.toString();
  }
  
  if (isUpdate && doc.getPdfUploadDate() != null) {
    setInfoMsg(glp("filedocument.pdfupload.reupload.warning"), request);
  }
  
  jcmsContext.addBodyAttributes("class", "doc-chooser");
%><%@ include file='/jcore/doEmptyHeader.jspf' %>
<%boolean isActionPerformed = false;%> 
<%-- Handle Errors ******************************************************* --%>
<% if (Util.notEmpty(errors)){ %>
<div class="errors">
 <jalios:message level="<%= MessageLevel.WARN %>" dismissable="true">
  <div><%= errors %></div>
 </jalios:message>
</div>

<%-- Handle Upload ******************************************************* --%>
<% } else if (docUploadHandler.isUploading()){ 
	isActionPerformed = true;%>
<jalios:javascript><%= docUploadHandler.getNextUploadStep() %></jalios:javascript>
<% } %>

<%-- Upload Form ********************************************************* --%>
<% if (showForm) { %>
<form lang="<%= docUploadHandler.getAvailableMainLanguage() %>" action="<%= contextPath %>/work/docChooser.jsp" data-jalios-target="<%= contextPath %>/work/docChooser.jsp"  method="post" name="editForm" id="editForm" accept-charset="UTF-8"  enctype="multipart/form-data"  style="margin: 0.5em;" class="form-horizontal noSingleSubmitButton lang-trigger toggle-wrapper">

  <%-- NAVBAR --%>
  <div class="navbar navbar-default">
    <div class="container-fluid">
      <% if(docUploadHandler.isUploadEnabled()) { %>
        <input class='btn btn-primary navbar-btn' name='opUpload' value='<%= btnText %>' type='submit' id='opUpload' onclick='return confirmSubmitUpload();' />
      <%} %>
      <button class="btn btn-default navbar-btn toggle-wrapper-state-btn" onclick='return false;'>
          <span class="toggle-wrapper-state <%=docUploadHandler.getAvailableShowOptions()?"hide":""%>"><%= glp("ui.work.doc.upload.lbl.show-options") %></span>
          <span class="toggle-wrapper-state <%=docUploadHandler.getAvailableShowOptions()?"":"hide"%>"><%= glp("ui.work.doc.upload.lbl.hide-options") %></span>
      </button>
    </div>
  </div>
  
  <script type="text/javascript">
    function confirmSubmitUpload() {
      /*
      <% if (showUnzipOpt) { %>
      var isZip = false;
      $('editForm').select('INPUT[name="filename"]').each(function(fn){
        var fnv = fn.value; 
        if (fnv.endsWith('zip') || fnv.endsWith('war')){ isZip = true;  }
      });
      var unzipRequested = Util.toBoolean($('editForm').getInputs('radio','unzipUploadedFiles').find(function(radio) { return radio.checked; }).value);
      if (isZip && unzipRequested) {
        return top.confirm('<%= glp("msg.js.confirm-unzip") %>');
      }
      <% } %>
      */
      return true;
    }
  </script>

 <% if (channel.getBooleanProperty("doc-chooser-upload-progress.enabled", false)) { %>
  <%-- Upload Infos ********************************************************* --%>
  <div class="doc-chooser-upload alert alert-info hide">
    <jalios:include jsp="work/docChooserUpload.jsp" />
  </div>
  <%-- Ajax Iframe ********************************************************* --%>
  <iframe src="work/docChooserIFrame.jsp" name="docIFrame" width="100%" height="10" class="hide"></iframe>
 <% } %>

  <%-- Files ------------------------------------------------------------ --%>
  <div class="files">
    <div class="drop-here-text"><%= glp("ui.com.btn.drop-file-here") %></div>
    <% for(int i=0; i < nbElt; i++) { %>
    <jalios:field name="filename" resource="field-light">
      <jalios:control settings='<%= new FileSettings().mode(FileSettings.Mode.SIMPLE_FILE) %>' />
    </jalios:field>
    <% } %>
  </div>
  
  <div class="metadata toggle-wrapper-state <%= docUploadHandler.getAvailableShowOptions() ? "" : "hide" %>">
    <div class="tab-pane" id="content-tab-pane-1">
    
      <div class="tab-page">
        <h2 class="tab"><jalios:icon src='edit' alt='P' title='<%= glp("ui.work.form.tab.content") %>' />&nbsp;<%= glp("ui.work.form.tab.content") %></h2>  
     
        <%-- Document Type Selector ------------------------------------------------------------ --%>
        <% Set typeSet = docUploadHandler.getTypeSet(); %>
        <% if (isUpdate || Util.getSize(typeSet) == 1) { %>
        <input type="hidden" name="type" value="<%= docUploadHandler.getAvailableType().getName() %>" />
        <% } else { %>
        <jalios:field label="ui.com.lbl.type" name="type">
          <select id="documentTypeSelector" name="type" class="form-control triggerTypeChangeRefresh">
            <jalios:foreach collection="<%= typeSet %>" name="itClass" type="Class">
            <option value="<%= itClass.getName() %>" <%= documentType == itClass ? "selected='selected'" : "" %>><%= channel.getTypeLabel(itClass, userLang) %></option>
            </jalios:foreach>
          </select>  
        </jalios:field>
        <% } %>
      
        <%-- MAJOR VERSION -------------------------------------------- --%> 
         <% if (isUpdate) { %>
        <jalios:field name="majorUpdate" label="ui.work.form.lbl.major-update" value='<%= ""+docUploadHandler.getAvailableMajorUpdate() %>'>
          <jalios:control type="<%= ControlType.BOOLEAN %>" />
        </jalios:field>
        <% } %>
        
      
        <%-- REMOVE PREVIOUS FILE -------------------------------------------- --%> 
        <% if (nbElt == 1 && docUploadHandler.isUpdate() && (!channel.isJSyncEnabled() || !channel.getJSyncReplica().getSyncFiles())) { %>
        <jalios:field name="removeFile" label="ui.work.doc.lbl.remove-file" value='<%= ""+docUploadHandler.getAvailableRemoveFile() %>'>
          <jalios:control type="<%= ControlType.BOOLEAN %>" />
        </jalios:field>
        <% } %>
        
        <%-- UNLOCK -------------------------------------------- --%> 
        <% if (nbElt == 1 && docUploadHandler.isUpdate() && doc.isStrongLocked()) { %>
        <jalios:field name="unlock" label="ui.work.doc.lbl.unlock" value='<%= "true" %>'>
         <jalios:control type="<%= ControlType.BOOLEAN %>" />
        </jalios:field>
        <% } %>
      
        <%-- Title ------------------------------------------------------------ --%> 
        <%
        final TypeEntry documentTypeEntry = channel.getTypeEntry(documentType);
        final String titleLabel = Util.getString( (documentTypeEntry != null ? documentTypeEntry.getTitleLabel(userLang) : null), "ui.com.lbl.title"); 
        final String titleDescription = "ui.work.doc.txt.title";
        final String titleTooltip = Util.getString( (documentTypeEntry != null ? documentTypeEntry.getTitleDescription(userLang) : null), ""); 
        %>
        <jalios:field  name='<%= "title" %>'  label='<%= titleLabel %>' tooltip="<%= titleTooltip %>" description='<%= titleDescription %>' required='<%= false %>' ml='<%= channel.isMultilingual() %>' value='<%= docUploadHandler.getAllAvailableTitleML() %>'>
          <jalios:control type="<%= ControlType.TEXTFIELD %>" />
        </jalios:field>
      
      
        <%-- Document Type Editor  --%>
        <% if (docFormHandler != null) { %>
        <% docFormHandler.validate(); %>
        <% request.setAttribute("formHandler", docFormHandler); %>   
        <jalios:include jsp='<%= "types/" + documentTypeShortName + "/doEdit" + documentTypeShortName + ".jsp" %>' />
        <% } %>
        
      
      </div>
    
      <%-- CATEGORIES ------------------------------------------------------------ --%>   
      <% if (!docUploadHandler.isCategoryTabHidden()) { %>
      <div class="tab-page">
        <h2 class="tab"><jalios:icon src='categories' alt='C' title='<%= glp("ui.work.form.lbl.categories") %>' />&nbsp;<%= glp("ui.work.form.lbl.categories") %></h2>
        <%@ include file='/work/doEditPubCat.jspf' %>
      </div>
      <% } %>
    
      <%-- READ RIGHTS ------------------------------------------------------------ --%> 
      <% if (!docUploadHandler.isReadRightTabHidden()) { %>
      <div class="tab-page">
        <h2 class="tab"><jalios:icon src='read-right' alt='R' title='<%= glp("ui.work.form.lbl.read-rights") %>' />&nbsp;<% /* %>Read Rights<% */ %><%= glp("ui.work.form.lbl.read-rights") %></h2>
        <%@ include file="/work/docChooser_readRightsTab.jspf" %>
      </div>
      <% } %>
      
      <% if (!docUploadHandler.isWorkflowTabHidden()) { %>
	      <div class="tab-page">
	        <h2 class="tab"> <jalios:icon src="wf"  alt="W" title="ui.work.form.lbl.wf" /><%= glp("ui.work.form.lbl.wf") %></h2>
	        <%
	        DocUploadHandler tmp_formFormHandler =  docUploadHandler;
	        formHandler = docFormHandler;
	        Publication pub = formHandler.getPublication();
	        int currentTabIndex =3;
	        boolean isPortlet = false;
	        boolean hasAlreadyVoted= false;
	        %>
          <%@ include file="/work/doEditCommonPubAttribute_wf_mainContent.jspf" %>
          <%
          formHandler =  tmp_formFormHandler;
          %>
	      </div>
      <%} %>
      <%-- ADVANCED ------------------------------------------------------------ --%> 
      <% if (!docUploadHandler.isAdvancedTabHidden() && (!isUpdate || showUnzipOpt)) { %>
      <div class="tab-page">
        <h2 class="tab"><jalios:icon src='advanced' alt='A' title='<%= glp("ui.work.form.tab.adv") %>' />&nbsp;<% /* %>Advanced<% */ %><%= glp("ui.work.form.tab.adv") %></h2>
          
          <%-- TRACK READER ---------------------------------------------------------- --%>
          <% if (!isUpdate) { %>
          <jalios:field  name='<%= "tracked" %>' label='<%= glp("ui.work.form.lbl.track") %>' required='<%= false %>' value='<%= ""+docUploadHandler.getAvailableTracked() %>'>
            <jalios:control type="<%= ControlType.BOOLEAN %>" />
          </jalios:field>
          <% } %>
          
          <%-- UNZIP ---------------------------------------------------------- --%>
          <% if (showUnzipOpt) { %>
          <jalios:field  name='<%= "unzipUploadedFiles" %>' label='<%= glp("ui.work.form.lbl.unzip") %>' description='<%= glp("ui.work.form.lbl.unzip.h") %>' required='<%= false %>' value='<%= String.valueOf(docUploadHandler.getUnzipUploadedFiles()) %>'>
            <jalios:control type="<%= ControlType.BOOLEAN %>" />
          </jalios:field>
          <% } %>    
    
          <%-- *** PLUGINS ********************** --%>
          <jalios:include target="DOCCHOOSER_MAINTAB" targetContext="tr" />
    
      </div>
      <% } %>
    
    </div>
  
    <%-- *** PLUGINS ********************** --%>
    <jalios:include target="DOCCHOOSER_FOOTER_BUTTON" />
  </div>
  
  <input type='hidden' name='showOptions' value='<%= getBooleanParameter("showOptions",false) %>' />
  
  <%-- Pstatus ---------------------------------------------------------- --%> 
  <input type='hidden' name='pstatus'  value='<%= docUploadHandler.getAvailablePstatus() %>'  />
  <input type='hidden' name='startElt' value='<%= docUploadHandler.getAvailableStartElt() %>' />
  <input type='hidden' name='nbElt'    value='<%= nbElt %>' />
  <input type='hidden' name='jsFunc'   value='<%= encodeForHTMLAttribute(docUploadHandler.getAvailableJsFunc()) %>' />
  
  <%-- Used by MediaBrowser  --%> 
  <input type='hidden' name='ensureLuceneIndexing' value='<%= getBooleanParameter("ensureLuceneIndexing",false) %>' />
  
  
  <input type='hidden' name='originalType'     value='<%= encodeForHTMLAttribute(docUploadHandler.getAvailableOriginalType().getName()) %>' />
  
  <% if (docUploadHandler.getRedirect() != null) { %>
    <input type='hidden' name='redirect' value='<%= encodeForHTMLAttribute(docUploadHandler.getRedirect()) %>' />
  <% } %>
  
  <% if (isUpdate) { %>
    <input type='hidden' name='id' value='<%= encodeForHTMLAttribute(doc.getId()) %>' />
  <% } %>
  
  <% if (docUploadHandler.getAvailableOpenerForm() != null) { %>
    <input type='hidden' name='openerForm' value='<%= encodeForHTMLAttribute(docUploadHandler.getAvailableOpenerForm()) %>' />
  <% } %>
  
  <% if (docUploadHandler.getAvailableOpenerRefresh() != null) { %>
    <input type='hidden' name='refresh' value='<%= encodeForHTMLAttribute(docUploadHandler.getAvailableOpenerRefresh()) %>' />
  <% } %>

</form>

<% } else { %>
<div style="text-align: center;">
  <button class='btn btn-primary' onclick='window.close();'><%= glp("ui.com.btn.close") %></button>
</div>
<% } %>

<jalios:javascript>    
    !function($){
        <%if(getBooleanParameter("workflowChangeEvent", false)){ %>
          setSelectedTab(jQuery(".metadata")[0], 3);
        <%} %>
        $("SELECT[name='internalWf']").on("change", function(event) {
           $form = $(event.currentTarget).closest("FORM");
           $workflowChangeEventInput = $form.find("INPUT[name=workflowChangeEvent]");
           $workflowChangeEventInput.val(true);
           event.stopPropagation();               
           document.editForm.submit();                     
        });
        
        $(document).on('change', '.triggerTypeChangeRefresh', function(event) {
           $form = $(event.currentTarget).closest("FORM");
        
           // JCMS-7835 : reset pstatus to initial state of workflow when changing document type
           // When type is changed, disabled any pstatus field (input, select or anything else) so it is NOT sent during refresh,
           // This will force use of the initial state of the workflow associated the newly selected type 
           $form.find("[name='pstatus']").attr("disabled", true);
           // Same things for categories to ensure default categories gets filled in form depending on handler behavior
           $form.find("[name='useDefaultCategories']").attr("disabled", true);
           $form.find("[name='cids']").attr("disabled", true);
           
           event.stopPropagation();               
           document.editForm.submit();                     
        });
        
        $(".toggle-wrapper-state-btn").on("click", function(event){
          event.stopPropagation();               
          $(".toggle-wrapper-state").toggleClass("hide");
          $("INPUT[name=showOptions]").val(true);
        });
        
        $("html").on("dragover", function(event) {
            event.preventDefault();  
            event.stopPropagation();
            $(this).addClass('dragging');
        });

        $("html").on("dragleave", function(event) {
            event.preventDefault();  
            event.stopPropagation();
            $(this).removeClass('dragging');
        });
        $("html").on("drop", function(event) {
            event.preventDefault();  
            event.stopPropagation();
            
            // Autofill input with first file selected
            const fileInput = document.editForm['filename'];
            const droppedFiles = event.originalEvent.dataTransfer.files;
            if (fileInput && droppedFiles && droppedFiles[0]) {
              const dT = new DataTransfer();
              dT.items.add(droppedFiles[0]);
              fileInput.files = dT.files;
            }            
            $(this).removeClass('dragging');
        });
    }(jQuery)
</jalios:javascript>

<%@ include file='/jcore/doEmptyFooter.jspf' %>