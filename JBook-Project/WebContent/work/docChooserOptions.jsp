<%@page import="com.jalios.jcms.handler.EditFileDocumentHandler"%>
<%@ page import="com.jalios.jcms.tracking.ReaderTrackerManager" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

  DocUploadHandler formHandler = (DocUploadHandler)request.getAttribute("docChooserHandler");
  if (Util.isEmpty(formHandler)) { 
    %><jalios:include jsp="work/docChooserHandler.jsp" /><% 
    formHandler = (DocUploadHandler)request.getAttribute("docChooserHandler");
  } 
  
 //Parameters
 FileDocument doc     = formHandler.getAvailableFileDocument();
 boolean isUpdate     = doc != null;
 boolean showUnzipOpt = com.jalios.jcms.upload.UnzipUploadManager.canUnzipToFileDocuments() && !isUpdate && !getBooleanParameter("hideUnzip", false) && formHandler.getAvailableOpenerForm() == null;
 Class documentType = formHandler.getAvailableType();
 String documentTypeShortName = documentType.getSimpleName(); 
 EditFileDocumentHandler docFormHandler = (EditFileDocumentHandler)request.getAttribute(documentTypeShortName + ".formHandler");
 if (docFormHandler == null) { %>
 <jalios:include jsp='<%= "/types/" + documentTypeShortName + "/do" + documentTypeShortName + "FormHandler.jsp" %>' />
 <% 
  docFormHandler = (EditFileDocumentHandler)request.getAttribute(documentTypeShortName + ".formHandler");
  docFormHandler.setUploadContext(true);
  docFormHandler.validate();

  formHandler.setDocumentFormHandler(docFormHandler);%>
 <% } %>
  <div class="toggle-wrapper-state ajax-refresh-div <%= formHandler.getAvailableShowOptions() ? "" : "hide" %>" data-jalios-ajax-refresh-url="work/docChooserOptions.jsp">
    <%-- TABS --%>
    <ul class="nav nav-tabs nav-tabs-underlined is-left-aligned">
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
        <% if (!isUpdate || showUnzipOpt) { %><li class="tab"><a href="#padvanced" onclick="return false;"><%= glp("ui.work.form.tab.adv") %></a></li><% } %>
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
          <% if (channel.getBooleanProperty("doc-chooser.automatic-type-selection", true)) { %>
            <jalios:field  name='type' label="ui.com.lbl.type"  value='<%= documentType %>'>
              <select name="type" class="form-control triggerTypeChangeRefresh">
                <option value="" <%= isTypeAutoSelect ? "selected='selected'" : "" %>><%= glp("ui.work.doc.upload.lbl.type-auto") %></option>
                <jalios:foreach collection="<%= typeSet %>" name="itClass" type="Class">
                <option value="<%= itClass.getName() %>" <%= !isTypeAutoSelect && documentType == itClass ? "selected='selected'" : "" %>><%= channel.getTypeLabel(itClass, userLang) %></option>
                </jalios:foreach>
              </select>
            </jalios:field>
          <% } else { %>
            <jalios:control settings='<%= new HiddenSettings().name("type").value(isTypeAutoSelect ? "" : formHandler.getAvailableType().getName())  %>' />
          <% } %>
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
        <jalios:include target="DOCCHOOSER_MODAL_CONTENTTAB" targetContext="div" />
        
      </div>
          
      <% if (!formHandler.isCategoryTabHidden()) {%>
      <div class="tab-pane categories" id="pcat">
      <% } %>
      <%-- Always include doEditPubCat.jspf, even if tab hidden, as jsp contains its own logic to print hidden cids input (since JCMS-6101) --%>
        <%@ include file='/work/doEditPubCat.jspf' %>
      <% if (!formHandler.isCategoryTabHidden()) {%>
        <jalios:include target="DOCCHOOSER_MODAL_CATEGORIESTAB" targetContext="div" />
      </div>
      <% } %>
            
      <% if (!formHandler.isReadRightTabHidden()) { %>
        <div class="tab-pane read-rights" id="prrights">
          <%@ include file="/work/docChooser_readRightsTab.jspf" %>
          <jalios:include target="DOCCHOOSER_MODAL_READRIGHTTAB" targetContext="div" />
        </div>
      <% } %>
      
      <% if (!formHandler.isUpdateRightTabHidden()) { %>
        <div class="tab-pane update-right" id="purights">
          <%@ include file="/work/docChooser_updateRightsTab.jspf" %>
          
          <jalios:include target="DOCCHOOSER_MODAL_UPDATERIGHTTAB" targetContext="div" />
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
            <% if (!isUpdate && ReaderTrackerManager.getInstance().isReaderTrackerEnabled()) { %>
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
  
            <% if (isUpdate && (!channel.isJSyncEnabled() || !channel.getJSyncReplica().getSyncFiles())) { %>
            <jalios:field  name='<%= "removeFile" %>' label='<%=  glp("ui.work.doc.lbl.remove-file") %>' value='<%= ""+formHandler.getAvailableRemoveFile() %>'>
                  <jalios:control type="<%= ControlType.BOOLEAN %>" />
                </jalios:field>
            <% } %>
  
            <% if (isUpdate && doc.isStrongLocked()) { %>
              <jalios:field  name='<%= "unlock" %>' label='<%= glp("ui.work.doc.lbl.unlock") %>' value='<%= "true" %>'>
                <jalios:control type="<%= ControlType.BOOLEAN %>" />
              </jalios:field>
            <% } %>
  
            <jalios:include target="DOCCHOOSER_MODAL_ADVTAB" targetContext="div" />
          </div>
      <% } %>
        <jalios:include target="DOCCHOOSER_MODAL" targetContext="div" />
      </div>
  </div>  