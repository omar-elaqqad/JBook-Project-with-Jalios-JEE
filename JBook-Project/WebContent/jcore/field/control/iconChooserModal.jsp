<%@page import="com.jalios.jcms.uicomponent.icon.IconChooserModalHandler"%><%
%><%@page import="com.jalios.jcms.uicomponent.icon.Icon"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><jalios:include jsp="jcore/field/control/iconChooserModalHandler.jsp" /><%
IconChooserModalHandler formHandler = (IconChooserModalHandler) request.getAttribute("iconChooserModalHandler");
if (formHandler.validate()) { %>
  <script>
    jQuery.jalios.ui.icon.updateIcon("<%= formHandler.getDomElementId() %>", "<%= formHandler.getIconSrc() %>");
    jQuery.jalios.ui.Modal.close(false);
  </script>
<% }
formHandler.addFrontEndDependencies();
%>
<jalios:modal op="opChooseIcon" button="widget.icon.modal-btn" formHandler="<%= formHandler %>" title="widget.icon.modal-title" url="jcore/field/control/iconChooserModal.jsp">
  <div class="icon-chooser-actions">
    <div class="icon-chooser-search">
      <jalios:control settings='<%= formHandler.getSearchFieldSettings() %>' />
      <span class="input-group-btn">
        <button aria-label="<%= glp("widget.icon.modal-search-placeholder") %>" value="true" class="btn btn-default app-search-submit"><jalios:icon src="app-search"/></button>
        <button type="button" class="btn btn-default add-on js-search-cancel" title='<%= glp("ui.com.btn.reset") %>'><jalios:icon src="remove" /></button>
      </span>
    </div>
  </div>
  
  <jalios:include jsp="jcore/field/control/iconChooser.jsp" />

  <jalios:control settings='<%= new HiddenSettings().name("iconPropPrefix").value(formHandler.getIconPropPrefix()) %>' />
  <jalios:control settings='<%= new HiddenSettings().name("domElementId").value(formHandler.getDomElementId()) %>' />
  <jalios:buffer name="MODAL_BUTTONS">
	  <button type="button" class="btn btn-default" name="opCancel" data-dismiss="modal"><%= glp("ui.com.btn.close") %></button>
	  <button type="submit" class="btn btn-primary ajax-refresh plupload-submit" name="opChooseIcon" value="true"><%= glp("widget.icon.modal-btn") %></button>
  </jalios:buffer>
</jalios:modal>