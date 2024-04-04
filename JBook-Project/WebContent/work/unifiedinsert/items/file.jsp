<%@ page language="java" contentType="text/html; charset=UTF-8" %><%
%><%@ page import="com.jalios.jcms.tracking.ReaderTrackerManager" %><%
%><%@ page import="com.jalios.jcms.upload.UploadManager" %><%
%><%@ page import="com.jalios.jcms.handler.EditFileDocumentHandler" %><%
%><%@ page import="com.jalios.jcms.unifiedinsert.InsertionContext" %><%
request.setAttribute(InsertionContext.UNIFIED_INSERT_ATTR, Boolean.TRUE);
%><%@ include file='/jcore/doInitPage.jspf' %><%

  if (!channel.getBooleanProperty("unified-insert.items.file.enabled", false)) {
    sendForbidden(request, response);
    return;    
  }

  // If not logged or not allow to publish document
  if (!isLogged || !loggedMember.canPublishSome(FileDocument.class)) {
    sendForbidden(request, response);
    return;
  }
    
%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.upload.DocUploadHandler"><%
  %><jsp:setProperty name="formHandler" property="request" value="<%= request %>"/><%
  %><jsp:setProperty name="formHandler" property="response" value="<%= response %>"/><%
  %><jsp:setProperty name="formHandler" property="showOptions" value="false"/><%
  %><jsp:setProperty name="formHandler" property="*" /><%
  %><jsp:setProperty name="formHandler" property="modal" value="<%= true %>" /><%-- required to prevent popup closing --%><%
  %><jsp:setProperty name="formHandler" property="jsFunc" value="document;jQuery.jalios.UnifiedInsert.File.insertAndClose" /><%
      
%></jsp:useBean><%

jcmsContext.addCSSHeader("css/jalios/unifiedinsert-file.css");
InsertionContext.addScripts(jcmsContext, request);
jcmsContext.addJavaScript("js/jalios/ux/jalios-unifiedinsert-file.js");

formHandler.internalInit();
formHandler.checkMemberClassWorkspaceCompliance();
formHandler.checkWorkspaceChange();

Class documentType = formHandler.getAvailableType();
String documentTypeShortName = documentType.getSimpleName();  

%><jalios:include jsp='<%= "/types/" + documentTypeShortName + "/do" + documentTypeShortName + "FormHandler.jsp" %>' /><%

  EditFileDocumentHandler docFormHandler = (EditFileDocumentHandler)request.getAttribute(documentTypeShortName + ".formHandler");
  docFormHandler.setUploadContext(true);
  docFormHandler.validate();

  formHandler.setDocumentFormHandler(docFormHandler);
  //formHandler.internalInit();

  // Validate 
  String errors = formHandler.handleUploadError(formHandler.handleUpload());
  
  // CSS & JS
  UploadManager.getInstance().addUploadComponentScripts(jcmsContext);
  
  // Labels
  String submit       = glp("ui.com.btn.upload");
  
  // Parameters
  boolean showUnzipOpt = com.jalios.jcms.upload.UnzipUploadManager.canUnzipToFileDocuments() && !getBooleanParameter("hideUnzip", false) && formHandler.getAvailableOpenerForm() == null;
  if (Util.notEmpty(errors)){ request.setAttribute(JcmsConstants.WARNING_MSG, errors);   }
  
%><% if (jcmsContext.isAjaxRequest() && Util.isEmpty(errors) && formHandler.isUploading()) { %>
<div class="ajax-refresh-div">
  <jalios:javascript><%= formHandler.getNextUploadStep() %></jalios:javascript>
  <jalios:icon src='wait'/>
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>
<% } else { %>
<% if (!jcmsContext.isAjaxRequest()) { %><%@ include file='/jcore/doEmptyHeader.jspf' %><% } %>
<div id="jalios-unified-insert-file" class="container ajax-refresh-div" data-jalios-ajax-refresh-url="work/unifiedinsert/items/file.jsp">
<div class="navbar-placeholder"></div>
<form class="form-horizontal noSingleSubmitButton lang-trigger" name='fileUploadForm' 
      lang="<%= formHandler.getAvailableMainLanguage() %>" action='work/unifiedinsert/items/file.jsp' method="post"
      role="form" accept-charset="UTF-8" enctype="multipart/form-data">

  <div class="mb-nav navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container-fluid">
      <ul class="nav navbar-form navbar-nav navbar-right">      
        <li>
       <button class="btn btn-default unifiedinsert-close" type="button" name="opCancel"><%= glp("ui.com.btn.cancel") %></button>
       <% if (formHandler.isUploadEnabled()) { %>
       <button class="btn btn-primary ajax-refresh plupload-submit" type="submit"  name="opUpload"  value="true"><%= submit %></button>
       <% } %>
      </ul>   
    </div>
  </div>
  
  <div class="container-fluid">
   
   <%@ include file='/jcore/doMessageBox.jspf' %>

  <%-- PLUPLOAD  --%>
  <% String filter = getAlphaNumParameter("pluploadFilter", null); %>
  <% String resize = getAlphaNumParameter("pluploadResize", null); %>
  <jalios:field name="filename" resource="field-inline">
    <jalios:control settings='<%= new FileSettings().filter(filter).resizeImage(resize) %>' />
  </jalios:field>
  
  <br>
  
   <div>
      <button class="btn btn-default" data-jalios-action="toggle:hide toggle:disabled" data-jalios-target=".toggle-wrapper-state|.showOptionsField">
        <span class="toggle-wrapper-state <%= formHandler.getAvailableShowOptions() ? "hide" : "" %>"><%= glp("ui.work.doc.upload.lbl.show-options") %></span>
        <span class="toggle-wrapper-state <%= formHandler.getAvailableShowOptions() ? "" : "hide" %>"><%= glp("ui.work.doc.upload.lbl.hide-options") %></span>
      </button>
      <% if (channel.isMultilingual() && formHandler.showLanguageChooser()) { %>
      <a href="#" lang="<%= formHandler.getAvailableMainLanguage() %>" class="ctxLangForm ctxmenu lang-fix langStatus btn btn-default toggle-wrapper-state <%= formHandler.getAvailableShowOptions() ? "" : "hide" %>">
        <%= glp("ui.com.lbl.language.edit") %> <jalios:lang lang='<%= formHandler.getAvailableMainLanguage() %>' />
      </a>
      <% } %>       
   </div>
   
  <div class="toggle-wrapper-state <%= formHandler.getAvailableShowOptions() ? "" : "hide" %>">
    <div class="br"></div>
    <%-- TABS --%>
    <ul class="nav nav-tabs">
        <li class="tab active"><a href="#pcontent" onclick="return false;"><%= glp("ui.com.lbl.infos") %></a></li>
      
     <% if (!formHandler.isCategoryTabHidden()) { %>
        <li class="tab"><a href="#pcat" onclick="return false;"><%= glp("ui.work.form.lbl.categories") %></a></li>
     <% } %>
     
     <% if (!formHandler.isReadRightTabHidden()) { %>
        <li class="tab"><a href="#prrights" onclick="return false;"><%= glp("ui.work.form.lbl.read-rights") %></a></li>
     <% } %>
     
     <% if (!formHandler.isUpdateRightTabHidden()) { %>
        <li class="tab"><a href="#purights" onclick="return false;"><%= glp("ui.work.form.lbl.update-rights") %></a></li>
     <% } %>
     
     <% if (!formHandler.isWorkflowTabHidden()) { %>
        <li class="tab"><a href="#pworkflow" onclick="return false;"><%= glp("ui.work.form.lbl.wf") %></a></li>     
     <% } %>
     
     <% if (!formHandler.isAdvancedTabHidden()) { %>
        <% if (showUnzipOpt) { %><li class="tab"><a href="#padvanced" onclick="return false;"><%= glp("ui.work.form.tab.adv") %></a></li><% } %>
     <% } %>
    </ul>
    <div class="br"></div>
  
    <div class="tab-content">
  
      <%-- TAB - METADATA --%>
      <div class="tab-pane active" id="pcontent">
  
        <%-- Document Type Selector --%>
        <% Set typeSet = formHandler.getTypeSet(); %>
        <% if (Util.getSize(typeSet) == 1) { %>
        <input type="hidden" name="type" value="<%= formHandler.getAvailableType().getName() %>" />
        <% } else { %>
        <% boolean isTypeAutoSelect = formHandler.isTypeAutoSelect(); %>
        <jalios:field  name='type' label="ui.com.lbl.type"  value='<%= documentType %>'>
          <select name="type" class="form-control">
            <option value="" <%= isTypeAutoSelect ? "selected='selected'" : "" %>><%= glp("ui.work.doc.upload.lbl.type-auto") %></option>
            <jalios:foreach collection="<%= typeSet %>" name="itClass" type="Class">
            <option value="<%= itClass.getName() %>" <%= !isTypeAutoSelect && documentType == itClass ? "selected='selected'" : "" %>><%= channel.getTypeLabel(itClass, userLang) %></option>
            </jalios:foreach>
          </select>
        </jalios:field>
        <% } %>
  
        <%
        final TypeEntry documentTypeEntry = channel.getTypeEntry(documentType);
        final String titleLabel = Util.getString( (documentTypeEntry != null ? documentTypeEntry.getTitleLabel(userLang) : null), "ui.com.lbl.title"); 
        final String titleDescription = "ui.work.doc.txt.title";
        final String titleTooltip = Util.getString( (documentTypeEntry != null ? documentTypeEntry.getTitleDescription(userLang) : null), ""); 
        %>
        <jalios:field  name="title" label='<%= titleLabel %>' tooltip="<%= titleTooltip %>" description='<%= titleDescription %>'  ml='<%= channel.isMultilingual() %>' value='<%= formHandler.getAllAvailableTitleML() %>' css="focus">
          <jalios:control type="<%= ControlType.TEXTFIELD %>" />
        </jalios:field>
        
        
        <%-- Document Type Editor  --%>
        <% if (docFormHandler != null) {
             docFormHandler.validate(); 
             request.setAttribute("formHandler", docFormHandler);
        %><jalios:include jsp='<%= "types/" + documentTypeShortName + "/doEdit" + documentTypeShortName + ".jsp" %>' />
        <% } %>
        <jalios:include target="DOCCHOOSER_UNIFIEDINSERT_CONTENTTAB" targetContext="div" />
        
      </div>
          
      <% if (!formHandler.isCategoryTabHidden()) {%>
      <div class="tab-pane categories" id="pcat">
      <% } %>
      <%-- Always include doEditPubCat.jspf, even if tab hidden, as jsp contains its own logic to print hidden cids input (since JCMS-6101) --%>
        <%@ include file='/work/doEditPubCat.jspf' %>
      <% if (!formHandler.isCategoryTabHidden()) {%>
        <jalios:include target="DOCCHOOSER_UNIFIEDINSERT_CATEGORIESTAB" targetContext="div" />
      </div>
      <% } %>
            
      <% if (!formHandler.isReadRightTabHidden()) { %>
        <div class="tab-pane read-rights" id="prrights">
          <%@ include file="/work/docChooser_readRightsTab.jspf" %>
          
          <jalios:include target="DOCCHOOSER_UNIFIEDINSERT_READRIGHTTAB" targetContext="div" />
        </div>
      <% } %>
      
      <% if (!formHandler.isUpdateRightTabHidden()) { %>
        <div class="tab-pane update-right" id="purights">
          <%@ include file="/work/docChooser_updateRightsTab.jspf" %>
          
          <jalios:include target="DOCCHOOSER_UNIFIEDINSERT_UPDATERIGHTTAB" targetContext="div" />
        </div>
      <% } %>
      
      <%
      Publication pub = null;
      int currentTabIndex =3;
      boolean isPortlet = false;
      boolean hasAlreadyVoted= false;
      %>
      
      <% if (!formHandler.isWorkflowTabHidden()) { %>
        <div class="tab-pane workflow" id="pworkflow">
          <%@ include file="/work/doEditCommonPubAttribute_wf_mainContent.jspf" %>
        </div>
      <%} %>
      
      <% if (!formHandler.isAdvancedTabHidden()) { %>
          <div class="tab-pane advanced" id="padvanced" style="padding-left: 20px">
          <%-- Workspace  --%>
          <%
          ServletUtil.backupAttribute(pageContext, "TRIGGER_WS_CHANGE_REFRESH");
          request.setAttribute("TRIGGER_WS_CHANGE_REFRESH", true);
          %>
          <%@ include file='/jcore/doWorkspaceField.jspf' %>
          <%
          ServletUtil.restoreAttribute(pageContext, "TRIGGER_WS_CHANGE_REFRESH");
          %>
            <% if (ReaderTrackerManager.getInstance().isReaderTrackerEnabled()) { %>
              <% String isTrackedStr = Util.getString(ReaderTrackerManager.getInstance().isTypeReaderTracked(formHandler.getPublicationClass()),"false"); %>
                <jalios:field  name='<%= "tracked" %>' label='<%= glp("ui.work.form.lbl.track") %>' value='<%= ""+formHandler.getAvailableTracked() %>'>
                  <jalios:control type="<%= ControlType.BOOLEAN %>" />
                </jalios:field>
            <% } %>
            
            <% if (showUnzipOpt) { %>
              <jalios:field  name='<%= "unzipUploadedFiles" %>' label='<%= glp("ui.work.form.lbl.unzip") %>' description='<%= "ui.work.form.lbl.unzip.h" %>' value='<%= String.valueOf(formHandler.getUnzipUploadedFiles()) %>'>
                  <jalios:control type="<%= ControlType.BOOLEAN %>" />
                </jalios:field>
            <% } %>
            
            <jalios:include target="DOCCHOOSER_UNIFIEDINSERT_ADVTAB" targetContext="div" />
          </div>
      <% } %>
        <jalios:include target="DOCCHOOSER_UNIFIEDINSERT" targetContext="div" />
      </div>
    </div>  
    
    <input type='hidden' name='pluploadFilter'  value='<%= encodeForHTMLAttribute(getAlphaNumParameter("pluploadFilter","")) %>'  />
    <input type='hidden' name='pluploadResize'  value='<%= encodeForHTMLAttribute(getAlphaNumParameter("pluploadResize","")) %>'  />
      
    <input type='hidden' name='pstatus'  value='<%= formHandler.getAvailablePstatus() %>'  />
    <input type='hidden' name='originalType' value='<%= encodeForHTMLAttribute(formHandler.getAvailableOriginalType().getName()) %>' />
    <input type='hidden' name='nbElt'    value='<%= formHandler.getAvailableNbElt() %>' />
    <input type='hidden' name='jsFunc'   value='<%= encodeForHTMLAttribute(formHandler.getAvailableJsFunc()) %>' />
    <input type='hidden' name='id'       value='x' />
    
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
      <input type='hidden' name="showOptions" value="true" <% if (!formHandler.getAvailableShowOptions()) {%>disabled<% } %> class="showOptionsField"/>
      <input type='hidden' name="showOptions" value="false" <% if (formHandler.getAvailableShowOptions()) {%>disabled<% } %> class="showOptionsField"/>

  <jalios:javascript>
    
    !function($) {

      <% if (!formHandler.isAdvancedTabHidden() && showUnzipOpt) { %>
        $("BUTTON.plupload-submit").on('click', function(event) {
          if (window.unzipConfirmed) {
            return;
          }
          // Checkbox unzip is not checked
          if ( $('#jalios-unified-insert-file INPUT[name=unzipUploadedFiles]:checked').val() == 'false'){ return; }
          
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
            $('#jalios-unified-insert-file a[href="#pworkflow"]').tab("show");
           }});
        });
        
    }(jQuery)

    </jalios:javascript>
  </div>      
</form>
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>
<% if (!jcmsContext.isAjaxRequest()) { %><%@ include file='/jcore/doEmptyFooter.jspf' %><% } %>
<% } %>