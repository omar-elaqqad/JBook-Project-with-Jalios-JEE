<%@ include file='/jcore/doInitPage.jspf' %><%
String modalTitleId = ServletUtil.generateUniqueDOMId(request, "modalTitle");
%>
<div class="ajax-refresh-div" aria-modal="true" role="dialog" data-jalios-ajax-refresh-url='<%= getIncludeString("url","#") %>' <%= getIncludeString("htmlAttributes", "") %> aria-labelledby="<%= modalTitleId %>">
  <div class='modal-dialog <%= getIncludeString("css","modal-lg") %>'>
    <div class="modal-content" role="document">
      <% if (Util.notEmpty(getIncludeString("title",""))) { %>
      <div class="modal-header">
        <div class="modal-title" >
          <h2 id="<%= modalTitleId %>"><%= glp(getIncludeString("title","")) %></h2>
        </div>
      </div>
      <% } %>
      <% if (Util.notEmpty(getIncludeString("MODAL_CONTENT", null))) { %>
        <%= getIncludeString("MODAL_CONTENT", null) %>
      <% } else { %>
        <div class="modal-body">
          <% request.setAttribute("message.titleTag", "h3"); %>
          <%@ include file='/jcore/doMessageBox.jspf' %>
          <%= getIncludeBody() %>
        </div>
        <div class="modal-footer">
          <% if (Util.notEmpty(getIncludeString("MODAL_BUTTONS", null))) { %>
            <%= getIncludeString("MODAL_BUTTONS", null) %>
          <% } else { %>
            <% String onClose = Util.notEmpty(getIncludeString("button", null)) ? "onclick=\"jQuery.jalios.ui.Modal.closeAndFollow(false);\"" : "data-dismiss=\"modal\""; %>
            <button type="button" name="opClose" class="btn btn-default" <%= onClose %>><%= glp("ui.com.btn.close") %></button>            
            
            <%= getIncludeString("MODAL_BUTTON", "") %>
            
            <% if (Util.notEmpty(getIncludeString("button",null))) { %>
            <button type="button" class="btn btn-default" onclick="jQuery.jalios.ui.Modal.closeAndFollow(true);" value="true"><%= glp(getIncludeString("button", null)) %></button>
            <% } %>
        </div>
      <% } %>
    <% } %>
    </div>
  </div>
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>