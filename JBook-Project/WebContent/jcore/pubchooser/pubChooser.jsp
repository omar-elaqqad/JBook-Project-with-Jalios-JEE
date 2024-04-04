<%@page import="com.jalios.jcms.handler.PubChooserHandler.FilterMode"%>
<%@page import="com.jalios.jcms.handler.PubChooserHandler"%>
<%@ include file='/jcore/doInitPage.jspf' %>
<jalios:include jsp="jcore/pubchooser/pubChooserHandlers.jsp" />
<%

if (!isLogged) {
  sendForbidden(request, response);
  return;
}

WorkspaceQueryHandler workspaceQueryHandler = (WorkspaceQueryHandler) request.getAttribute("workspaceQueryHandler");
PubChooserHandler formHandler = (PubChooserHandler) request.getAttribute("pubChooserHandler");
formHandler.addFrontEndDependencies();
%>
<%@ include file='/jcore/doEmptyHeader.jspf' %>
<div class="pub-chooser has-hidden-filters">
  <form action="jcore/pubchooser/pubChooserInner.jsp" method="POST">
    <div class="navbar-placeholder"></div>
    <jalios:include jsp="jcore/pubchooser/pubChooserInner.jsp" />
    <%-- Common queryHandler fields to submit on ajax --%>
<%--     <% if (Util.notEmpty(formHandler.getPstatus())) { %>
      <% for (String itPStatus : formHandler.getPstatus()) { %>
        <input type="hidden" name="pstatus" value="<%= itPStatus %>" />
      <% } %>
    <% } %> --%>
    <% if (Util.notEmpty(formHandler.getDocumentKinds())) { %>
      <% for (String itDocumentKind : formHandler.getDocumentKinds()) { %>
        <input type="hidden" name="documentKinds" value="<%= itDocumentKind %>" />
      <% } %>
    <% } %>
    <% if (Util.notEmpty(formHandler.getCids())) { %>
      <% for (String itCategoryId : formHandler.getCids()) { %>
        <input type="hidden" name="cids" value="<%= itCategoryId %>" />
      <% } %>
    <% } %>
    <% if (Util.notEmpty(formHandler.getJsFunc())) { %>
      <input type="hidden" class="js-func" name="jsFunc" value="<%= encodeForHTMLAttribute(formHandler.getJsFunc()) %>" />
    <% } %>
    <% if (Util.notEmpty(formHandler.getSuperTypes())) { %>
      <% for (String itSuper : formHandler.getSuperTypes()) { %>
        <input type="hidden" name="initialSuper" value="<%= encodeForHTMLAttribute(itSuper) %>" />
      <% } %>
    <% } %>
    <input type="hidden" name="itemAction" value="<%= encodeForHTMLAttribute(formHandler.getItemAction()) %>" />
    <input type="hidden" name="multivalue" value="<%= formHandler.isMultivalue() %>" />
    <% if (formHandler.isMultivalue()) { %>
    <footer class="multi-select-values">
      <script id="pub-item" type="text/x-handlebars-template">
        <span class="label pub-item" title="{{dataLabel}}" data-jalios-data-id="{{dataId}}">
          {{dataLabel}}
          <span data-jalios-data-id="{{dataId}}" data-jalios-chooser-action="removeItem" class="pub-item-remove"><jalios:icon src="remove" /></span>
        </span>
      </script>
      <div class="multi-select-values-wrapper"></div>
      <input class='btn btn-default' data-jalios-chooser-action="multipleInsert" data-jalios-insert-label="<%= glp("ui.work.pub-ch.list") %>" type='button' value='<%= glp("ui.work.pub-ch.btn.select") %>'>
    </footer>
    <% } %>
  </form>
  <div class="dropzone-full-forbidden hide">
    <div class="dropzone-full-content">
      <jalios:icon src="glyph: icomoon-warning2" />
      <p><%= glp("pubchooser.warning.workspace-upload") %></p>
    </div>
  </div>
  <div class="dropzone-full hide">
    <div class="dropzone-full-content">
      <jalios:icon src="glyph: icomoon-upload4" />
      <p><%= glp("ui.com.btn.drop-file-here") %></p>
    </div>
  </div>
  <div class="upload-previews dropzone">
    <div class="upload-previews-header"><jalios:icon css="close-preview btn" title="ui.com.btn.close" src="pubchooser-upload-close" /> <%= glp("pubchooser.uploads.label") %></div>
    <div class="upload-previews-body"></div>
  </div>  
  <div id="template-container" class="hide">
    <div class="dz-preview dz-file-preview explorer-item-data">
      <div class="dz-image">
        <img alt="" data-dz-thumbnail src="s.gif" />
      </div>
      <div class="dz-details">
        <div class="dz-filename"><span data-dz-name></span></div>
        <div class="dz-size" data-dz-size></div>
        <div class="dz-progress"><span class="progress-text"></span><span class="dz-upload" data-dz-uploadprogress></span></div>
        <div class="dz-error-message"><span data-dz-errormessage></span></div>
      </div>
      <div class="upload-state">
        <jalios:icon src="pubchooser-upload-success" />
        <jalios:icon src="pubchooser-upload-failed" />
      </div>
    </div>
  </div>
</div>
<%@ include file='/jcore/doEmptyFooter.jspf' %>