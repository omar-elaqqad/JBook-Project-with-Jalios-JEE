<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.jcms.media.AbstractMedia" %><%
%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.media.MediaTracksHandler"><%
 %><jsp:setProperty name="formHandler" property="request" value="<%= request %>"/><%
 %><jsp:setProperty name="formHandler" property="response" value="<%= response %>"/><%
 %><jsp:setProperty name='formHandler' property='*' /><%
%></jsp:useBean><%

  if (formHandler.validate()) {
    %><script type="text/javascript" language="JavaScript"><%
    if (Util.notEmpty(formHandler.getRedirect())) {
      %>window.top.jQuery.jalios.Browser.redirect("<%= formHandler.getRedirect() %>");<%
    } else {
      %>window.top.jQuery.jalios.Browser.reload();<%      
    }
    %></script><%
    return;    
  }

  FileDocument fdMedia = formHandler.getMedia();

  boolean inIframe = getBooleanParameter("iframe", false);
  if (inIframe) { %><% 
    %><%@ include file='/jcore/doEmptyHeader.jspf' %><%
    %><jalios:javascript>
    window.top.jQuery('#mediaTracksUploadSubmitIframe').parent().html(jQuery('#mediaTracksUploadSubmitIframe').parent()[0].innerHTML);
    </jalios:javascript><%
  }

String modalTitleId = ServletUtil.generateUniqueDOMId(request, "modalTitle");
%>
<div class="ajax-refresh-div" aria-modal="true" role="dialog" aria-labelledby="<%= modalTitleId %>">
  <iframe id="mediaTracksUploadSubmitIframe" name='mediaTracksUploadSubmitIframe' style='display: none;'></iframe>
   
  <form  action="work/mediaTracksUploadModal.jsp" method="post" 
         name="mediaTracksUploadForm" enctype="multipart/form-data"
         target='mediaTracksUploadSubmitIframe'  role="form" 
         class="form-horizontal noSingleSubmitButton lang-trigger" >
    <input type="hidden" name="id" value="<%= fdMedia.getId() %>"/>
    <input type="hidden" name="iframe" value="true"/>
    
   <div class='modal-dialog modal-lg'>
    <div class="modal-content" role="document">
  
      <div class="modal-header">
        <div class="modal-title" id="modalLabel">
          <h2 id="<%= modalTitleId %>"><%= glp("media.tracks-manager.modal.title." + (fdMedia.hasTracks() ? "manage" : "add")) %></h2>
        </div>
        <jalios:include target="MEDIA_TRACKS_MODAL_HEADER" targetContext="div" />
      </div>
      
      <div class="modal-body container-fluid">
        <%@ include file='/jcore/doMessageBox.jspf' %>
        <jalios:message msg='<%= glp("media.tracks-manager.modal.description", encodeForHTML(fdMedia.getTitle(userLang))) %>' title="" dismissable="false" />
        
        <jalios:include target="MEDIA_TRACKS_MODAL_BODY_TOP" targetContext="div" />
        
        <%
        Set<File> fdMediaAssociatedFileSet = fdMedia.getAssociatedFileSet();
        for (String lang : channel.getLanguageList()) {
          File existingTrackFile = (fdMediaAssociatedFileSet == null) ? null : fdMediaAssociatedFileSet.stream().filter(f->f.getName().matches("track_subtitles_" + lang + "_.*")).findFirst().orElse(null);
          String existingTrackPath = (existingTrackFile != null) ? channel.getRelativePath(existingTrackFile) : null;
          FileSettings fileSettings = new FileSettings().mode(FileSettings.Mode.SIMPLE_FILE);
        %>
          <jalios:field name='<%= "subtitles_" + lang %>' formHandler="<%= formHandler %>" value="<%= existingTrackPath %>">
          <%
          if (existingTrackFile != null) {
            fileSettings.css("hide subtitles-"+lang+"-toggle-me");
            String removeInputId = ServletUtil.generateUniqueDOMId(request, "");
          %>
          <jalios:buffer name="FIELD_PREPEND">
           <span class="subtitles-<%= lang %>-toggle-me">
            <a href="<%= encodeForHTMLAttribute(existingTrackPath) %>" title="<%= glp("ui.com.btn.download") %> <%= encodeForHTMLAttribute(existingTrackFile.getName()) %>">
              <jalios:icon src="file-empty" /> 
              <code>.<%= encodeForHTML(com.jalios.io.IOUtil.getExtension(existingTrackFile)) %></code>
            </a>
            <span class="small">
             &middot;
             <jalios:date date="<%= new Date(existingTrackFile.lastModified()) %>" format="short"/> <jalios:time date="<%= new Date(existingTrackFile.lastModified()) %>"  format="short"/>
             &middot;
             (<%= Util.formatFileSize(existingTrackFile.length(), userLocale, true) %>)
             &middot;
            </span>
            <input id="<%= removeInputId %>" type="hidden" name="delete_subtitles_<%= lang %>" value="<%= encodeForHTMLAttribute(existingTrackPath) %>" disabled="disabled"/>
            <a href="#" class="small" data-jalios-action="toggle:disabled toggle:hide" data-jalios-target="#<%= removeInputId %>|.subtitles-<%= lang %>-toggle-me"> <%= glp("media.tracks-manager.modal.remove") %> </a>
           </span>
          </jalios:buffer>
          <% 
        }
           %>
            <jalios:buffer name="WIDGET_LABEL"><%= Util.recapitalize(glp("lang."+lang)) %> <jalios:lang lang="<%= lang %>" /></jalios:buffer>
            <jalios:control settings="<%= fileSettings %>" />    
           </jalios:field>
        <% } %>
        
        <jalios:include target="MEDIA_TRACKS_MODAL_BODY_BOTTOM" targetContext="div" />
        
      </div>
      
      <div class="modal-footer">
        <jalios:include target="MEDIA_TRACKS_MODAL_FOOTER" targetContext="div" />
        <input type="button" name="opCancel" class="btn btn-default" value='<%= glp("ui.com.btn.cancel") %>' data-dismiss="modal" />
        <jalios:include target="MEDIA_TRACKS_MODAL_BUTTON" targetContext="div" />
        <input type="submit" name="opUpdate" class="btn btn-primary" value="<%= glp("ui.com.btn.save") %>" />
      </div>
    </div>
   </div>
    
  </form>
  
  <%
    if (!inIframe) { 
      %><%@ include file='/jcore/doAjaxFooter.jspf' %><%
    }  
  %>
</div>
<%
  if(inIframe) { %><% 
    %><%@ include file='/jcore/doEmptyFooter.jspf' %><%
  }
%>