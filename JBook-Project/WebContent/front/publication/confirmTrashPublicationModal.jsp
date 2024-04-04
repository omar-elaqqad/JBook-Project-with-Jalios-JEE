<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%

Publication pub = getPublicationParameter("pubId");
if (pub == null) {
  %><jalios:javascript>
    jQuery.jalios.Browser.redirect("<%= contextPath + "/" + "index.jsp" %>", false, false);
  </jalios:javascript><%
  return;
}

final com.jalios.jcms.trash.TrashManager trashMgr = com.jalios.jcms.trash.TrashManager.getInstance();
final boolean proposeTrashAction = trashMgr.proposeTrashAction(pub);
final boolean proposeFinalDeleteAction = trashMgr.proposeFinalDeleteAction(pub, loggedMember);

String modalConfirmTitle = glp("ui.trash.modal.lbl.confirm-delete");
String modalConfirmMessage = glp("ui.trash.modal.msg.confirm-delete", pub.getTitle(userLang));

if (pub instanceof TreeNode && ((TreeNode) pub).isTreeNode()) {
  modalConfirmTitle = glp("ui.trash.modal.lbl.confirm-deep-delete");
  modalConfirmMessage = glp("ui.trash.modal.msg.confirm-deep-delete", pub.getTitle(userLang), Util.join(((TreeNode) pub).getTreeChildren(), ", ", 3, "..."));
}

String modalClasses = "modal-confirm modal-lg";
if (!proposeTrashAction) {
  modalClasses += " modal-confirm-danger";
} else {
  modalClasses += " trash-modal";
}
%>
<jalios:javascript>
  $(document).on('click', '.btn-trash', function(event) {
    event.preventDefault();
    
    // find the element or the form which triggereed the operation, 
    // and replace opDelete param with opTrash
    var $elm = jQuery(jQuery.jalios.ui.Modal.latest.trigger);
    
    // Update href value of the trigger
    var href = $elm.prop('href');
    if (href) {
      href = href.replace('opDelete=', 'opTrash=');
      $elm.attr('href', href);
      return jQuery.jalios.ui.Modal.closeAndFollow(true);
    }
    // voluntarly interrupt actions if href not specified on trigger
    // we do not want to accidently perform a delete when trash was requested by user
  });
</jalios:javascript>
<jalios:modal css="<%= modalClasses %>" title="<%= modalConfirmTitle %>">
  <p><%= modalConfirmMessage %></p>

  <jalios:buffer name="MODAL_BUTTONS">
    <%-- Cancel --%>
    <button type="button" class="btn btn-default btn-cancel" data-dismiss="modal"><%= glp("ui.com.btn.cancel") %></button>
    
    <%-- Delete permanently ... (second confirmation which trigger confirmInModal in jalios-modal.js through jalios-ajax-refresh.js code --%>
    <%-- data-jalios-confirm="true": for JS to retrieve the real first trigger, not the previous confirm trigger --%>
    <% if (proposeFinalDeleteAction) { %>
    <a class="confirm ajax-refresh btn <%= proposeTrashAction ? "btn-default" : "btn-danger" %>" href="#" data-jalios-confirm="true"
       data-jalios-text="<%= encodeForHTMLAttribute(glp("ui.trash.modal.msg.confirm-final-delete")) %>"
       data-jalios-text-confirm="<%= encodeForHTMLAttribute(glp("ui.trash.lbl.delete-final-now")) %>">
      <%= glp("ui.trash.lbl.delete-final-confirm") %>
    </a>
    <% } %>
    
    <%-- Put in trash (no confirm needed) --%>
    <% if (proposeTrashAction) { %>
    <button type="submit" class="btn btn-primary btn-trash">
      <%= glp("ui.trash.lbl.trash") %>
    </button>
    <% } %>

  </jalios:buffer>
</jalios:modal>