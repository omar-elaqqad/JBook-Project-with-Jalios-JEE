<%@page import="com.jalios.jcmsplugin.collaborativespace.CSManager"%><%
%><%@page import="com.jalios.jcms.taglib.card.CardsDisplayMode"%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%

Publication pub = getPublicationParameter("id");
if (pub == null) {
  return;
}
CSSignupRequest signup = (CSSignupRequest)pub;
String pubTitle = pub.getTitle(userLang);

// int pstatus = getIntParameter("pstatus", 0);
// String stateLabel = WorkflowManager.getInstance().getWFStateStateLabel(pub, pstatus, userLang);
String tmpRedirect = getValidHttpUrl("redirect");
if (Util.isEmpty(tmpRedirect)) {
  // Use '$DISPLAY_URL$' hook to let the Handler make the right redirect (JCMS-5304)
  tmpRedirect = "$DISPLAY_URL$";
}
jcmsContext.addCSSHeader("plugins/CollaborativeSpacePlugin/css/cs-validate-cssignuprequest-modal.css");
%>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.collaborativespace.ValidateSignupHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='internalClass' value='<%=pub.getClass() %>' />
  <jsp:setProperty name='formHandler' property='ws' value='<%= JcmsUtil.getId(pub.getWorkspace()) %>'/>  
  <jsp:setProperty name='formHandler' property='*' />
  <jsp:setProperty name='formHandler' property='noRedirect' value='true'/>
</jsp:useBean>
<%
if (formHandler.validate()) {
  String formHandlerRedirect = formHandler.getRedirect();
  String currentBaseUrl = ServletUtil.getBaseUrl(request);
  boolean isAbsoluteRedirect = Util.getString(formHandlerRedirect, "").startsWith(currentBaseUrl);
  if (isAbsoluteRedirect) {
    request.setAttribute("modal.redirect.absolute", Boolean.TRUE);
  }
  request.setAttribute("modal.redirect", formHandler.getRedirect());
  %><%@ include file="/jcore/modal/modalRedirect.jspf" %><%
}

// UNLOCKER
jcmsContext.addJavaScript("js/jalios/core/jalios-unlocker.js");

String modalUrl = channel.getProperty("jcmsplugin.collaborativespace.signup.validate-modal", "plugins/CollaborativeSpacePlugin/types/CSSignupRequest/validateCSSignupRequestModal.jsp");
Member submitMember = signup.getSubmitMember();
String objName = signup.getName(userLang);
%>

<div class="unlocker" data-jalios-unlocker-url='<%=  encodeForHTMLAttribute(HttpUtil.getUrlWithCSRFToken("work/unlock.jsp?id="+ pub.getId(), request, false)) %>'>
<jalios:modal title="jcmsplugin.collaborativespace.signup.lbl.signup" 
              url="<%= modalUrl %>" 
              formHandler="<%= formHandler %>"
              css="validate-cssignuprequest-modal modal-lg">
              
  <% if (submitMember != null) { %>
    <jalios:cards mode="<%= CardsDisplayMode.INLINE %>">
      <jalios:cardData data="<%= submitMember %>" template="small" link="<%= submitMember.getDisplayUrl(userLocale) %>" />
    </jalios:cards>
  <% } else if (Util.notEmpty(objName)) { %>
    <%= objName %>
  <% } %>

  <%-- CDate --%>
  <p class="br">
    <%= glp("jcmsplugin.collaborativespace.request-date", JcmsUtil.getFriendlyDate(pub.getCdate(), DateFormat.SHORT, true, userLocale, true)) %>
  </p>
  
  <%-- Target Group(s) ------------------------------------------------------------ --%> 
  <%
  Group[] groups = formHandler.getAvailableGroups();
  %>
  <jalios:field name="groups" 
        label="jcmsplugin.collaborativespace.members.validate-signup-modal.groups" 
        tooltip="jcmsplugin.collaborativespace.members.validate-signup-modal.groups.h" 
        value="<%= groups %>" 
        required="true">
    <jalios:control settings='<%= new GroupSettings().checkbox().multiple().enumValues(formHandler.getAvailableEnrollmentGroups()) %>' />
  </jalios:field>
  
  <%-- WF / NOTE ------------------------------------------------------------ --%> 
  <% if (pub != null) { %>
    <jalios:field label="ui.work.dpl.foot.wfn.note" name="wfNote" value='<%= formHandler.getAvailableWFNote() %>' resource="field-vertical" css="no-focus">
      <jalios:control settings='<%= new WikiAreaSettings().rows(2) %>' />
    </jalios:field>
  <% } %>
  
  <jalios:buffer name="MODAL_BUTTONS">
    <button type="button" class="btn btn-default" data-dismiss="modal"><%= glp("ui.com.btn.cancel") %></button>
    <button type="button" class="btn btn-danger ajax-refresh btn-csp-reject" value="true" name="opUpdate" data-jalios-target-pstatus='<%= CSManager.SIGNUP_REJECTED %>'><%= glp("jcmsplugin.collaborativespace.signup.btn.reject") %></button>  
    <button type="button" class="btn btn-primary ajax-refresh btn-csp-accept" value="true" name="opUpdate" data-jalios-target-pstatus='<%= CSManager.SIGNUP_ACCEPTED %>'><%= glp("jcmsplugin.collaborativespace.signup.btn.accept") %></button>  
  </jalios:buffer>

  <jalios:javascript>    
    !function($){
      $(":input[name='opUpdate']").on("click", function(event) {
        let $target = $(event.target);
        let pstatus = $target.attr('data-jalios-target-pstatus');
        if ($target.exists()) {
          $(":input[name='pstatus']").val(pstatus);
        }
      });
    }(jQuery)
  </jalios:javascript>

  <input type="hidden" name="id"       value="<%= pub.getId() %>" />
  <input type="hidden" name="pstatus"  value=""/>
  <input type="hidden" name="ws"  value="<%= pub.getWorkspaceId() %>"/>
  <input type="hidden" name="redirect"  value="<%= encodeForHTMLAttribute(tmpRedirect) %>"/>

</jalios:modal>
</div>