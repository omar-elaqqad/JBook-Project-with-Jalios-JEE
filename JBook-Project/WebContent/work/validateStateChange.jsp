<%@ include file="/jcore/doInitPage.jspf" %><%

Publication pub = getPublicationParameter("id");
if (pub == null) {
  return;
}
String pubTitle = pub.getTitle(userLang);

int pstatus = getIntParameter("pstatus", 0);
String stateLabel = WorkflowManager.getInstance().getWFStateStateLabel(pub, pstatus, userLang);
String tmpRedirect = getValidHttpUrl("redirect");
if (Util.isEmpty(tmpRedirect)) {
  // Use '$DISPLAY_URL$' hook to let the Handler make the right redirect (JCMS-5304)
  tmpRedirect = "$DISPLAY_URL$";
}

%>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.handler.ValidateStateChangePublicationHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='internalClass' value='<%=pub.getClass() %>' />
  <jsp:setProperty name='formHandler' property='ws' value='<%= JcmsUtil.getId(pub.getWorkspace()) %>'/>  
  <jsp:setProperty name='formHandler' property='*' />
  <jsp:setProperty name='formHandler' property='noRedirect' value='true'/>
</jsp:useBean>
<%


if(formHandler.validate()) {
  String formHandlerRedirect = formHandler.getRedirect();
  String currentBaseUrl = ServletUtil.getBaseUrl(request);
  boolean isAbsoluteRedirect = Util.getString(formHandlerRedirect, "").startsWith(currentBaseUrl);
  if (isAbsoluteRedirect) {
    request.setAttribute("modal.redirect.absolute", Boolean.TRUE);
  }
  request.setAttribute("modal.redirect", formHandler.getRedirect());
  %><%@ include file="/jcore/modal/modalRedirect.jspf" %><%
}
request.setAttribute("formHandler", formHandler);

// UNLOCKER
jcmsContext.addJavaScript("js/jalios/core/jalios-unlocker.js");
%>

<div class="unlocker" data-jalios-unlocker-url='<%=  encodeForHTMLAttribute(HttpUtil.getUrlWithCSRFToken("work/unlock.jsp?id="+ pub.getId(), request, false)) %>'>
<jalios:modal title="ui.com.alt.validate" 
              url="work/validateStateChange.jsp" 
              formHandler="<%= formHandler %>" >
  <%
  {
  Workflow internalWf = formHandler.getAvailableInternalWorkflow(); 
  Workflow wf = formHandler.getWorkflow(); 
  List wfNoteList = WorkflowManager.getInstance().getWFNoteList(pub);
  boolean hasAlreadyVoted = Util.notEmpty(wfNoteList) && WorkflowManager.getInstance().hasAlreadyVoted(pub, loggedMember);
  boolean isWFHistoryAvailable = Util.notEmpty(wfNoteList);
  int currentTabIndex = 0;
  %>
      
  <%@ include file="/work/doEditCommonPubAttribute_wf_state.jspf" %>  
  
    
<%-- WF / PDATE ------------------------------------------------------------ --%> 
<jalios:field name="pdate" label="ui.work.form.lbl.pdate" value='<%= formHandler.getAvailablePdate() %>' css='<%=(formHandler.getAvailablePstatus() == WorkflowConstants.SCHEDULED_PSTATUS || formHandler.getAvailablePstatus() == WorkflowConstants.PUBLISHED_PSTATUS) ? "show":"hide" %>' disabled='<%=formHandler.getAvailablePstatus() != WorkflowConstants.SCHEDULED_PSTATUS && formHandler.getAvailablePstatus() != WorkflowConstants.PUBLISHED_PSTATUS %>'>
  <jalios:control settings='<%= new DateSettings().displayTime() %>' />
</jalios:field>
<jalios:field name="edate" label="ui.work.form.lbl.edate" value='<%= formHandler.getAvailableEdate() %>' css='<%=(formHandler.getAvailablePstatus() == WorkflowConstants.PUBLISHED_PSTATUS  || formHandler.getAvailablePstatus() == WorkflowConstants.EXPIRED_PSTATUS ) ? "show":"hide" %>' disabled='<%=formHandler.getAvailablePstatus() != WorkflowConstants.EXPIRED_PSTATUS && formHandler.getAvailablePstatus() != WorkflowConstants.PUBLISHED_PSTATUS %>'>
  <jalios:control settings='<%= new DateSettings().displayTime() %>' />
</jalios:field>

 <jalios:javascript>
    !function ($) {
        $(':input[name=pstatus]').on('change', function(){
          var selectedPStatus = $(this).val();
          var $scheduleField = $(':input[name=pdate]').closest('DIV.widget');
          if(selectedPStatus == <%=WorkflowConstants.SCHEDULED_PSTATUS %> || selectedPStatus == <%=WorkflowConstants.PUBLISHED_PSTATUS %>){
          	$scheduleField.show();
          	$scheduleField.removeClass("hide");
          	$scheduleField.find(":input,:button").prop('disabled', false);
          }
          else{
          	$scheduleField.hide();
          	$scheduleField.removeClass("show");
          	$scheduleField.find(":input,:button").prop('disabled', true);
          }
          var $expirationField = $(':input[name=edate]').closest('DIV.widget');
          if(selectedPStatus == <%=WorkflowConstants.EXPIRED_PSTATUS %> || selectedPStatus == <%=WorkflowConstants.PUBLISHED_PSTATUS %>){
          	$expirationField.show();
          	$expirationField.removeClass("hide");
          	$expirationField.find(":input,:button").prop('disabled', false);
          }
          else{
          	$expirationField.hide();
          	$expirationField.removeClass("show");
          	$expirationField.find(":input,:button").prop('disabled', true);
          }
        });
    }(window.jQuery); 
    </jalios:javascript>
  
  
  <%@ include file="/work/doEditCommonPubAttribute_wf_roles.jspf" %>
  <% } %>


  <input type="hidden" name="id"       value="<%= pub.getId() %>" />
  <input type="hidden" name="pstatus"  value="<%= pstatus %>"/>
  <input type="hidden" name="ws"  value="<%= pub.getWorkspaceId() %>"/>
  <input type="hidden" name="redirect"  value="<%= encodeForHTMLAttribute(tmpRedirect) %>"/>
  <% 
    int oldPstatus = formHandler.getOldPstatus();
    //remove expiration date if the status change from expiration state to another state than archived
    if(oldPstatus ==  WorkflowConstants.EXPIRED_PSTATUS && ! (pstatus == WorkflowConstants.EXPIRED_PSTATUS || pstatus == WorkflowConstants.ARCHIVED_PSTATUS)) { %>
    <input type="hidden" name="edate" value=""/>
  <% } %>
  
  <jalios:include target="VALIDATE_STATE_CHANGE_BOTTOM" />
    
  <jalios:javascript>    
    !function($){
        
        $("SELECT[name='internalWf']").on("change", function(event) {
           $form = $(event.currentTarget).closest("FORM");
           $( $form[0].workflowChangeEvent).refresh({callback : function(event2){
            $('.modal-upload a[href="#pworkflow"]').tab("show");
           }});                     
        });
        
    }(jQuery)
  </jalios:javascript>

</jalios:modal>
</div>