<%@ include file='/jcore/doInitPage.jspf' %><%

String caddyDataType = getAlphaNumParameter("dataType", "publication").toLowerCase();
int caddyDataCount = getIntParameter("caddyDataCount", 0);
String modalConfirmTitle = glp("ui.com.lbl.confirm-delete");
String modalConfirmMessage = glp("ui.work.caddy.confirm-delete."+caddyDataType, caddyDataCount);
String modalConfirmButton = glp("ui.com.btn.delete");

if (!"publication".equals(caddyDataType)) {
  request.setAttribute("modal-confirm-title", modalConfirmTitle);
  request.setAttribute("modal-confirm-message", modalConfirmMessage);
  request.setAttribute("modal-confirm-button", modalConfirmButton);
  request.setAttribute("modal-confirm-again", true);
  %><jalios:include resource="confirm-modal" /><%
  return;
}

modalConfirmTitle = glp("ui.trash.modal.lbl.confirm-delete");
String modalClasses = "modal-confirm modal-lg trash-modal";
%>
<jalios:javascript>
  $(document).on('click', '.btn-trash', function(event) {
    event.preventDefault();
    // find the element or the form which triggereed the operation, 
    // and replace opDelete with opTrash
    var $elm = jQuery(jQuery.jalios.ui.Modal.latest.trigger);
    $elm.prop('name', 'opTrash');
    return jQuery.jalios.ui.Modal.closeAndFollow(true);
  });
</jalios:javascript>
<%
final boolean proposeFinalDelete = getBooleanParameter("proposeFinalDelete", true);
final boolean proposeTrash = getBooleanParameter("proposeTrash", true);
%>
<jalios:modal css="<%= modalClasses %>" title="<%= modalConfirmTitle %>">
  <p><%= modalConfirmMessage %></p>

  <jalios:buffer name="MODAL_BUTTONS">
    <%-- Cancel --%>
    <button type="button" class="btn btn-default btn-cancel" data-dismiss="modal"><%= glp("ui.com.btn.cancel") %></button>
    
    <%-- Delete permanently ... (second confirmation which trigger confirmInModal in jalios-modal.js through jalios-ajax-refresh.js code --%>
    <%-- data-jalios-confirm="true": for JS to retrieve the real first trigger, not the previous confirm trigger --%>
    <% if (proposeFinalDelete) { %>
    <a class="confirm ajax-refresh btn <% if (proposeTrash) {%>btn-default<% } else { %>btn-primary<% } %>" href="#" data-jalios-confirm="true"
       data-jalios-text="<%= encodeForHTMLAttribute(glp("ui.trash.modal.msg.confirm-final-delete")) %>"
       data-jalios-text-confirm="<%= encodeForHTMLAttribute(glp("ui.trash.lbl.delete-final-now")) %>">
      <%= glp("ui.trash.lbl.delete-final-confirm") %>
    </a>
    <% } %>
    
    <%-- Put in trash (no confirm needed) --%>
    <% if (proposeTrash) { %>
    <button type="submit" class="btn btn-primary btn-trash">
      <%= glp("ui.trash.lbl.trash") %>
    </button>
    <% } %>

  </jalios:buffer>
</jalios:modal>