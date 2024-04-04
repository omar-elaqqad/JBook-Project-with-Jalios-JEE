<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ page import="com.jalios.jcms.share.*" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

if (!isLogged) {
  sendForbidden(request, response);
  return;
}

Data data = getDataParameter("id");
if (data == null) {
  return;
}
List<ShareOption> optionList = ShareManager.getInstance().getOptions(data, loggedMember);

int optionSize = optionList.size();
if (optionSize == 0) {
  return;
}

if (optionSize == 1) {
  sendRedirect(optionList.get(0).getUrl());
  return;
}

String intro = data instanceof FileDocument ? glp("share.modal.intro.doc") : glp("share.modal.intro") ; 

jcmsContext.addJavaScript("js/jalios/core/jalios-share.js");

%>

<jalios:modal title='<%= glp("share.modal.title") %>'  css="modal-lg share-modal">


  <div class="modal-options-text"><%= intro %></div>

  <div class="modal-options">

    <jalios:foreach collection="<%= optionList %>" type="ShareOption" name="option">
    <div class="modal-option clickable" data-jalios-url="<%= option.getUrl() %>" data-jalios-options='{"mode":"ajax"}'>
      <jalios:icon src="<%= option.getIcon() %>"/>
      <div class="modal-option-title"><%= option.getTitle(userLang) %></div>
      <div class="modal-option-subtitle"><%= option.getSubTitle(userLang) %></div>
    </div>
    </jalios:foreach>
  </div>
  
    
  <jalios:buffer name='MODAL_BUTTONS'>
    <button class="btn btn-default btn-copy-link" onclick="return false;" name="copyLink" data-jalios-toastr-text="<%= glp("share.modal.toastr.copy-link") %>"><%= glp("share.modal.btn.copy-link") %></button>
    <button type="button" class="btn btn-default" data-dismiss="modal"><%= glp("ui.com.btn.close") %></button>
  </jalios:buffer>
  
  <input type="text" name="share-link" class="share-link hidden" value="<%= channel.getUrl() + data.getDisplayUrl(userLocale) %>" aria-hidden="true"/>  
    
</jalios:modal>