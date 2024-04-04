<% request.setAttribute("CheckCSRF", Boolean.TRUE); %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
jcmsContext.addJavaScript("js/jalios/ux/modal/jalios-permalink-modal.js");
%>
<jalios:modal css="modal-lg permalink-modal" title="ui.modal.permalink.title">
  <% String url = getUntrustedStringParameter("defValue","").replaceAll("[^=\\&\\?]+=\\&", ""); %>
  <jalios:field label="ui.modal.permalink.intro" name="url" value='<%= url %>' resource="field-vertical">
    <jalios:control settings='<%= new UrlSettings().css("js-share-url").htmlAttributes(Util.getHashMap("readonly","readonly")) %>' />
  </jalios:field>
  <jalios:buffer name="MODAL_BUTTON">
    <button class="btn btn-primary btn-copy-link" onclick="return false;" name="copyLink" data-jalios-toastr-label="<%= glp("ui.modal.permalink.toastr-copy") %>"><%= glp("ui.modal.permalink.copy-action") %></button>
  </jalios:buffer>
</jalios:modal>