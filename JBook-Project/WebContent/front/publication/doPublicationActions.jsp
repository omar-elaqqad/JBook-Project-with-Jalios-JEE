<%@page import="com.jalios.jcms.uicomponent.Button.ButtonType"%>
<%@page import="com.jalios.jcms.uicomponent.image.editor.ImageEditorManager"%>
<%@page import="com.jalios.jcms.uicomponent.image.editor.ImageEditorActionHandler"%>
<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ page import="com.jalios.jcms.tracking.ReaderTrackerManager" %><%

Publication pub = (Publication) request.getAttribute("publication");

if (pub == null) {
  return;
}

if (jcmsContext.isPrintView()) {
  return;
}

jcmsContext.addJavaScript("js/jalios/ux/jalios-publication-actions.js");

FileDocument doc = null;
if (pub instanceof FileDocument) {
  doc = (FileDocument) pub;
}

boolean isDocument = doc != null;
boolean isLocalDocument = isDocument && doc.isLocalFile();

boolean dataWriteEnabled = channel.isDataWriteEnabled();
boolean canWorkOn = dataWriteEnabled && isLogged && loggedMember.canWorkOn(pub);
boolean isVisible = pub.isInVisibleState();
boolean showEdit = canWorkOn;
boolean showAttach = dataWriteEnabled && isLogged && loggedMember.isWorker();
boolean showDetachWS = dataWriteEnabled && pub.canBeDetachedFrom(workspace, loggedMember);
boolean showUnlock = canWorkOn && pub.isStrongLocked() && (!isDocument || isLocalDocument);
boolean showLock = canWorkOn && pub instanceof StrongLockable && !pub.isStrongLocked() && (!isDocument || isLocalDocument);
boolean showRequestUnlock = pub.canRequestUnlock(loggedMember);
boolean showValidateState = dataWriteEnabled && canWorkOn && Util.notEmpty(pub.getNextWFStateSet(loggedMember));
boolean showDelete = dataWriteEnabled && isLogged && pub.checkDelete(loggedMember).isOK();
boolean showDuplicate = dataWriteEnabled && pub.canCreateCopy(loggedMember);
boolean showWorkCopy = dataWriteEnabled && pub.canCreateWorkCopy(loggedMember);
boolean showCaddy = dataWriteEnabled && isLogged && loggedMember.canUseCaddy();
boolean showReaderTracker = ReaderTrackerManager.getInstance().canAccessReaderTracker(pub,loggedMember);
boolean showVersion = canWorkOn && (pub.isStored() || (pub instanceof HistorizedDBData)) && pub.hasBeenUpdated();
boolean showMetadata = isLogged;
boolean sticky = Util.toBoolean(request.getAttribute("publicationActionsSticky"), true);
boolean showPDFUpload = isLocalDocument && canWorkOn && com.jalios.jcms.handler.AssociatedPDFUploadHandler.isPDFUploadAuthorized(doc);
boolean showMergeDoc = isLocalDocument && loggedMember.canDeleteOther(doc);

//Override behavior of some actions
String deleteRedirect = Util.getString(request.getAttribute("PUBLICATION_ACTIONS_DELETE_REDIRECT"), pub.getWorkspace().getHomeUrl(userLocale));
String redirectUrl = Util.getString(request.getAttribute("PUBLICATION_ACTIONS_CUSTOM_REDIRECT"), ServletUtil.getUrl(request));
%>
<jalios:include target="PUBLICATION_ACTIONS_TOP" />

<jalios:accordion css="jalios-accordion-sticky publication-actions hidden-print" multiOpen="true">

  <div class="list-group collapse-action-wrapper<% if (sticky) {%> sticky<%}%>">
    <%-- Toggle menu --%>
    <a role="button" tabindex="0" title="<%= encodeForHTMLAttribute(glp("ui.pub-actions.toggle.title-close", pub.getTitle(userLang,true))) %>" aria-label="<%= encodeForHTMLAttribute(glp("ui.pub-actions.toggle.title-close", pub.getTitle(userLang,true))) %>" class="list-group-item pub-action-toggle pub-action-toggle-opened" data-jalios-action="toggle:selection-wrapper-side-open" data-jalios-target=".pub-action-toggler-<%= pub.getId() %>">
      <jalios:icon src="pub-actions-close" />
    </a>
    <a role="button" tabindex="0" title="<%= encodeForHTMLAttribute(glp("ui.pub-actions.toggle.title-open", pub.getTitle(userLang,true))) %>" aria-label="<%= encodeForHTMLAttribute(glp("ui.pub-actions.toggle.title-open", pub.getTitle(userLang, true))) %>" class="list-group-item pub-action-toggle pub-action-toggle-closed" data-jalios-action="toggle:selection-wrapper-side-open" data-jalios-target=".pub-action-toggler-<%= pub.getId() %>">
      <jalios:icon src="pub-actions-open" />
    </a>
  </div>

  <jalios:include target="PUBLICATION_ACTIONS_ACCORDION_TOP" />


  <jalios:accordion-panel css="publication-action-main panel-default" active="true">
    <div class="list-group sticky-action-group">

      <jalios:include target="PUBLICATION_ACTIONS_MAIN_ITEM_TOP" />
      <%-- Edit --%>
      <% if (showEdit){
           String customEditIcon = (String) request.getAttribute("PUBLICATION_ACTIONS_EDIT_ITEM");
           if (Util.notEmpty(customEditIcon)) {
             %><%=customEditIcon %><%
           } else { %>
              <% 
                TypeTemplateEntry editModalTemplateEntry = channel.getTypeEntry(pub.getClass()).getTemplateEntry("fullDisplayEditModal.default");
	              TypeTemplateEntry editFrontTemplateEntry = channel.getTypeEntry(pub.getClass()).getTemplateEntry("editFront.default");
              %>
              <% if (Util.notEmpty(editModalTemplateEntry) || Util.notEmpty(editFrontTemplateEntry)) { %>
                <% if (Util.notEmpty(editModalTemplateEntry)) { %>
                <jalios:buttonModal css="pub-action-main list-group-item pub-action-edit" url='<%= URLUtils.buildUrl(editModalTemplateEntry.getPath(), Util.getHashMap("id", new String[] {pub.getId() })) %>' title="ui.com.alt.edit">
                  <span class="pub-action-edit-icon nowrap"><jalios:icon src="edit" /></span>
                  <span class="publication-action-label"><%= glp("ui.com.alt.edit") %></span>
                </jalios:buttonModal>
                <% } else if (Util.notEmpty(editFrontTemplateEntry)) { %>
                <a class="pub-action-main list-group-item pub-action-edit" href="<%= URLUtils.buildUrl(editFrontTemplateEntry.getPath(), Util.getHashMap("id", new String[] { pub.getId() })) %>" title="ui.com.alt.edit">
                  <span class="pub-action-edit-icon nowrap"><jalios:icon src="edit" /></span>
                  <span class="publication-action-label"><%= glp("ui.com.alt.edit") %></span>
                </a>
                <% } %>
                <jalios:edit data="<%=pub%>" ctxEdit="false" popup="true" css="list-group-item pub-action-optional pub-action-edit-full">
                   <span class="pub-action-edit-icon nowrap"><jalios:icon src="edit"/></span>  
                   <span class="publication-action-label"><%=glp("ui.com.btn.edit-full") %></span>
                </jalios:edit>
              <% } else { %>
                <jalios:edit redirect="<%= redirectUrl %>" iconTitle='<%= glp("ui.pub-actions.edit.title") %>' data="<%= pub %>" ctxEdit="false" popup="true" css="list-group-item pub-action-main pub-action-edit">
                  <span class="pub-action-edit-icon nowrap"><jalios:icon src="edit" /></span>
                  <span class="publication-action-label"><%= glp("ui.com.alt.edit") %></span>
                </jalios:edit>
              <% } %>
           <% }
         } %>

      <%-- Share --%>
      <%
        String customShareIcon = (String) request.getAttribute("PUBLICATION_ACTIONS_SHARE_ITEM");
        if(Util.notEmpty(customShareIcon)){
          %><%= customShareIcon %><%
        } else { %>
          <jalios:share css="list-group-item pub-action-main pub-action-share" data="<%= pub %>">
            <jalios:icon src="share" /> <span class="publication-action-label"><%= glp("share.link-label") %></span>
          </jalios:share>
      <% } %>

      <%-- Unlock --%>
      <% if (showUnlock) { %>
	      <jalios:button buttonType="<%= ButtonType.A %>" confirm="true" url='<%= "edit.jsp?opUnlock=true&amp;id=" +  pub.getId() + "&amp;redirect=" + encodeForURL(redirectUrl) %>' confirmText='<%= encodeForHTMLAttribute(glp("msg.js.confirm-unlock", pub.getTitle(userLang))) %>' css="pub-action-optional pub-action-unlock list-group-item" >
	        <jalios:icon src="unlock-strong" /> <span class="publication-action-label"><%= glp("ui.com.alt.unlock") %></span>
	      </jalios:button>
      <% } %>

      <%-- Request Unlock --%>
      <% if (showRequestUnlock) { %>
        <jalios:buttonModal css="pub-action-optional list-group-item pub-action-request-unlock" url='<%= "work/requestUnlock.jsp?id=" + pub.getId() + "&amp;redirect=" +  encodeForURL(redirectUrl) %>'>
          <jalios:icon src="mail-lock" /> <span class="publication-action-label"><%= glp("ui.work.alt.unlock-request") %></span>
        </jalios:buttonModal>
      <% } %>

      <% if (isDocument) { %>
        <%@ include file='/front/publication/doPublicationActions_FileDocument.jspf' %>
      <% } %>
      
      <jalios:include target="PUBLICATION_ACTIONS_MAIN_ITEM_BOTTOM" />

      <%-- DELETE --%>
      <% if (showDelete) {
         String customDeleteIcon = (String) request.getAttribute("PUBLICATION_ACTIONS_DELETE_ITEM");
         if (Util.notEmpty(customDeleteIcon)) {
           %><%= customDeleteIcon %><%
         } else {
           // "Are you sure to delete <b>{pub-title}</b>? This deletion will be definitive."
           // JCMS-6490: Get a custom delete confirmation message if any
           String customConfirmDeleteMessage = (String) pub.getExtraInfo("msg.confirm-delete");
           String titleAttr = Util.notEmpty(customConfirmDeleteMessage) ? customConfirmDeleteMessage : glp("ui.com.btn.delete-publication", pub.getTitle());
           String confirmMsg = Util.getString(customConfirmDeleteMessage, null);
           String confirmMsgAttr = Util.notEmpty(confirmMsg) ? (" data-jalios-text='"+encodeForHTMLAttribute(confirmMsg)+"'") : "";
           String deleteUrl = MessageFormat.format("edit.jsp?id={0}&amp;opDelete=true&amp;confirm=true&amp;redirect={1}", pub.getId(), encodeForURL(deleteRedirect));
           String deleteConfirmUrl = MessageFormat.format("{0}?pubId={1}", channel.getProperty("jcms.resource.include.confirm-modal.publication-delete"), pub.getId());
           %>
           <a class="modal confirm list-group-item pub-action-optional pub-action-delete"
              href="<%= deleteUrl %>"
              <%-- JCMS-6490: custom title when custom confirm message (with HTML removed) --%>
              title="<%= encodeForHTMLAttribute(HtmlUtil.html2text(titleAttr)) %>"
              <%-- JCMS-6490: custom confirm message --%>
              <%= confirmMsgAttr %>
              data-jalios-confirm-url="<%= deleteConfirmUrl %>"><%
             %><jalios:icon src="delete" /> <%= glp("ui.com.btn.delete") %><%
           %></a>
        <% } %>
      <% } %>
    </div>
  </jalios:accordion-panel>

  <jalios:include target="PUBLICATION_ACTIONS_ACCORDION_MIDDLE" />

  <jalios:accordion-panel title="ui.com.txt.more" css="publication-actions-secondary panel-default" active="false">
    <%-- Used in js to change panel heading text when opened --%>
    <span class="hide actions-more"><%= glp("ui.com.txt.more") %></span>
    <span class="hide actions-less"><%= glp("ui.com.txt.less") %></span>

    <div class="list-group sticky-action-group">
      <jalios:include target="PUBLICATION_ACTIONS_OTHER_ITEM_TOP" />

      <%-- State change --%>
      <% if (showValidateState) { %>
      <jalios:buttonModal css="list-group-item pub-action-wf-validate pub-action-optional" url='<%= "work/validateStateChange.jsp?id=" + pub.getId() %>'>
        <jalios:icon src="wf" /> <span class="publication-action-label"><%= glp("ui.com.alt.validate") %></span>
      </jalios:buttonModal>
      <% } %>
      
      <%-- Reader --%>
      <% if (showReaderTracker) {%>
        <jalios:buttonModal css="list-group-item pub-action-reader pub-action-optional" url='<%= "front/readerTracking/readerTrackingModal.jsp?trackedPubId=" + pub.getId() %>'>
          <jalios:icon src="reader-tracking" /> <span class="publication-action-label"><%= glp("ui.adm.prop.tab.readertracker") %></span>
        </jalios:buttonModal>
      <% } %>

      <%-- Version --%>
      <% if (showVersion) {%>
        <a class="list-group-item pub-action-optional pub-action-version" href="work/version/version.jsp?id=<%= pub.getId() %>">
          <jalios:icon src="version" /> <span class="publication-action-label"><%= glp("ui.com.alt.version") %></span>
        </a>
      <% } %>
      
      <%-- CheckRight --%>
      <%--
        We voluntarly do not use CheckRightsHandler.canCheckRight(loggedMember, pub) below :
        since JCMS-6878, checkRight action is allowed for anyone with read right access to the publication,
        however checkRight is still a "complex" action not all user would understand,
        therefore, even if action would be allowed to those user, only display the menu for
        authors and admin (or admin with ACL).
      --%>
      <% if (isLogged && (JcmsUtil.isSameId(loggedMember, pub.getAuthor()) ||
             loggedMember.checkAccess("admin-ws/right-info", AccessControlUtil.getContext(pub.getWorkspace())))) { %>
        <jalios:buttonModal css="list-group-item pub-action-optional pub-action-checkright" url='<%= "admin/checkRights.jsp?data=" + pub.getId() %>'>
	        <jalios:icon src="report-key" /> <%= glp("right-info.checker.ctx-menu") %>
        </jalios:buttonModal>
      <% } %>

      <%-- Lock --%>
      <% if (showLock) { %>
        <jalios:button css="list-group-item pub-action-optional pub-action-lock" confirm="true" confirmText='<%= encodeForHTMLAttribute(glp("msg.js.confirm-lock", pub.getTitle(userLang))) %>' url='<%= "edit.jsp?opLock=true&amp;id=" + pub.getId() + "&amp;redirect=" + encodeForURL(redirectUrl) %>'>
	        <jalios:icon src="lock-strong" /> <span class="publication-action-label"><%= glp("ui.com.alt.lock") %></span>
        </jalios:button>
      <% } %>

      <%-- Duplicate --%>
      <% if (showDuplicate) { %>
        <jalios:buttonModal css="list-group-item pub-action-optional pub-action-duplicate" url='<%= "work/duplicateModal.jsp?id=" + pub.getId() %>'>
          <jalios:icon src="duplicate" /> <span class="publication-action-label"><%= glp("ui.com.alt.duplicate") %></span>
        </jalios:buttonModal>
      <% } %>


      <%-- WorkCopy --%>
      <% if (showWorkCopy) { %>
        <%
        String workCopyUrl = "work/duplicate.jsp?action=work&amp;popupEdition=true&amp;redirectOnClosePopup=true&amp;redirectToCopyPreview=true&amp;id=" + pub.getId();
        String workCopyFunc = "function() {Popup.popupWindow(JCMS.Security.getUrlWithCSRFToken('" + contextPath + "/" + workCopyUrl + "'), 'Copy', 900, 600);}";
        String workCopyOnclick = "confirmJSAction('" + encodeForJavaScript(glp("msg.js.confirm-workcopy", pub.getTitle(userLang))) + "', " + workCopyFunc + "); return false;";
        %>
        <a class="list-group-item pub-action-optional pub-action-workcopy" href="#" onclick="<%= workCopyOnclick %>" >
          <jalios:icon src="duplicate-work" /> <span class="publication-action-label"><%= glp("ui.com.alt.duplicatework") %></span>
        </a>
      <% } %>

      <%-- Merge workcopy --%>
      <% if (pub.isWorkCopy() && pub.canMergeWorkCopy(loggedMember)) { %>
        <% String mergeRedirectUrl = Util.getString(request.getAttribute("PUBLICATION_ACTIONS_CUSTOM_REDIRECT"), pub.getMainInstance().getDisplayUrl(userLocale)); %>
        <jalios:button css="list-group-item pub-action-wf-merge pub-action-duplicate" confirmText='<%= encodeForHTMLAttribute(glp("msg.js.confirm-mergecopy", pub.getTitle(userLang))) %>' url='<%= "edit.jsp?opMerge=true&amp;id=" + pub.getId()  +"&amp;redirect=" + encodeForURL(mergeRedirectUrl) %>'>
          <jalios:icon src="duplicate-merge" alt='ui.com.alt.duplicatemerge' /> <span class="publication-action-label"><%= glp("ui.com.alt.duplicatemerge") %></span>
        </jalios:button>
      <% } %>
      
      <%-- Follow --%>
      <jalios:include jsp="front/follow.jsp"/>

      <%-- Caddy --%>
      <% if (showCaddy) { %>
        <jalios:caddy css="list-group-item pub-action-optional pub-action-caddy" displayLinkText="true" data='<%= pub %>'/>
      <% } %>

      <%-- Upload PDF --%>
      <% if (showPDFUpload) { %>
        <jalios:buttonModal css="list-group-item pub-action-optional pub-action-upload-pdf" url='<%= "work/pdfUploadModal.jsp?id=" + pub.getId() %>'>
	        <jalios:icon src="upload-pdf" /> <span class="publication-action-label"><%= glp("filedocument.pdfupload.ctx-menu.upload-label") %></span>
        </jalios:buttonModal>
      <% } %>

      <%-- Merge Document --%>
      <% if (showMergeDoc) { %>
        <jalios:buttonModal css="list-group-item pub-action-optional pub-action-merge-doc" url='<%= "work/mergeDocument.jsp?srcDoc=" + pub.getId() %>'>
          <jalios:icon src="merge" /> <span class="publication-action-label"><%= glp("ui.work.doc.lbl.merge") %></span>
        </jalios:buttonModal>
      <% } %>

      <%-- Detach to another workspace --%>
      <% if (showDetachWS) { %>
        <a role="button" class="list-group-item modal confirm pub-action-optional pub-action-detach-ws" href="work/attachWorkspace.jsp?opDetach=true&amp;id=<%= pub.getId() %>&amp;attachWorkspace=<%= workspace.getId() %>">
          <jalios:icon src="workspace-detach"/> <span class="publication-action-label"><%= glp("ui.work.detach-ws.link") %></span>
        </a>
      <% } %>

      <%-- Attach to another publication --%>
      <% if (showAttach) {
         String customAttachIcon = (String) request.getAttribute("PUBLICATION_ACTIONS_ATTACH_ITEM");
         if(Util.notEmpty(customAttachIcon)){
           %><%= customAttachIcon %><%
         } else { %>
	        <jalios:buttonModal  css="list-group-item pub-action-optional pub-action-attach" url='<%= "work/attachPublication.jsp?attachment=" + pub.getId() %>' title='<%= encodeForHTMLAttribute(glp("ui.work.attach-pub.modal.title")) %>' >
            <jalios:icon src="link"/> <span class="publication-action-label"><%= glp("ui.work.attach-pub.link") %></span>
          </jalios:buttonModal>
        <% } %>
      <% } %>

      <%-- Print --%>
      <% if (!(pub instanceof FileDocument)) { %>
        <%
          String customPrintIcon = (String) request.getAttribute("PUBLICATION_ACTIONS_PRINT_ITEM");
          if(Util.notEmpty(customPrintIcon)){
            %><%=customPrintIcon %><%
          }else{
            request.setAttribute(DescriptiveURLs.FORCE_ORIGINAL_PORTAL, Boolean.TRUE);
            String printUrl = ServletUtil.getUrlWithUpdatedParams(request,new String[]{"id","portal","printView","qs","highlight","portlet"},new String[]{pub.getId(), channel.getProperty("channel.default-printportal", getDataIdParameter("portal")),"true", null, null, null});
            request.setAttribute(DescriptiveURLs.FORCE_ORIGINAL_PORTAL, Boolean.FALSE);
            %>
            <a target="_blank" class="list-group-item <%= pub instanceof FileDocument ? "pub-action-optional" : "pub-action-main" %> pub-action-print" rel="nofollow" href="<%= printUrl %>">
              <jalios:icon src="printer" css="tool" /> <span class="publication-action-label"><%= glp("ui.com.alt.print") %></span>
            </a>
        <%} %>
      <% } %>
      <%-- Metadata --%>
      <% if (showMetadata) {%>
        <jalios:buttonModal  css="list-group-item pub-action-optional pub-action-metadata" url='<%= "work/pubMetadata.jsp?id=" + pub.getId() %>' >
          <jalios:icon src="info" /> <span class="publication-action-label"><%= glp("ui.com.lbl.infos") %></span>
        </jalios:buttonModal>
      <% } %>

      <jalios:include target="PUBLICATION_ACTIONS_OTHER_ITEM_BOTTOM" />

    </div>
  </jalios:accordion-panel>
  <jalios:include target="PUBLICATION_ACTIONS_ACCORDION_BOTTOM" />

</jalios:accordion>

<jalios:include target="PUBLICATION_ACTIONS_BOTTOM" />
