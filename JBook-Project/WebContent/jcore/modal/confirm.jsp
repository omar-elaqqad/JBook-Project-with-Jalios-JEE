<%
  // Kludge workardound to check if this JSP is invoked for the logout message
  // in this case, do not perform CSRF check to prevent failure if session has expired
  final String logoutMsg = JcmsUtil.glp(Util.getString(request.getAttribute("userLang"), channel.getLanguage()),"ui.com.alt.logout.confirm");
  String msg = getUntrustedStringParameter("msg",""); // do not encode because it might contain HTML, however, XSS prevent through CSRF validation
  boolean isLogout = msg != null && msg.equals(logoutMsg);
  if (!isLogout) {
    request.setAttribute("CheckCSRF", Boolean.TRUE);
  }

%><%@ include file="/jcore/doInitPage.jspf" %><%

  // untranslatedZoneAttribute

  String confirmTitle    = getUntrustedStringParameter("confirmTitle","");
  String confirmMessage  = Util.getString(msg, glp("js.msg.js.confirm"));
  String confirmButton   = getUntrustedStringParameter("confirmButton", glp("ui.com.btn.ok")); // Encode !
  boolean isConfirmAgain = getBooleanParameter("confirmAgain", false);

  confirmTitle = Util.getString(request.getAttribute("modal-confirm-title"), confirmTitle);
  confirmMessage = Util.getString(request.getAttribute("modal-confirm-message"), confirmMessage);
  confirmButton = Util.getString(request.getAttribute("modal-confirm-button"), confirmButton);
  isConfirmAgain = Util.toBoolean(request.getAttribute("modal-confirm-again"), isConfirmAgain);

  String modalClasses = "modal-confirm";
  if (isConfirmAgain) {
    modalClasses += " modal-lg modal-confirm-danger";
  } else {
    modalClasses += " modal-md";
  }
  String ariaLabelTitle = Util.isEmpty(confirmTitle) ? glp("ui.com.lbl.confirm") : confirmTitle;
  String ariaLabel = " aria-label=\"" + ariaLabelTitle +"\"";
%>

<jalios:modal css="<%= modalClasses %>" title="<%= confirmTitle %>" htmlAttributes="<%= ariaLabel %>">
  <% if (Util.isEmpty(confirmTitle)) { %>
    <%-- Only when there is no custom confirm modal title --%>
    <h3><%= glp("ui.com.lbl.confirm") %></h3>
  <% } %>
  <p><%= confirmMessage %></p>

  <jalios:buffer name="MODAL_BUTTONS">
    <button type="button" class="btn btn-default btn-cancel" data-dismiss="modal"><%= glp("ui.com.btn.cancel") %></button>
    <% if (isConfirmAgain) { %>
      <%-- Second confirmation --%>
      <%-- data-jalios-confirm="true": for JS to retrieve the real first trigger, not the previous confirm trigger --%>
      <a class="confirm ajax-refresh btn btn-danger" href="#" data-jalios-confirm="true">
        <%= encodeForHTML(confirmButton) %>
      </a>
    <% } else { %>
      <button type="submit" class="btn btn-primary btn-confirm" onclick="jQuery.jalios.ui.Modal.closeAndFollow(true);">
        <%= encodeForHTML(confirmButton) %>
      </button>
    <% } %>
  </jalios:buffer>
</jalios:modal>