<%@page import="com.jalios.jcms.jportal.JPortalPublishHandler"%>
<%@page import="com.jalios.jcms.taglib.card.CardsDisplayMode"%>
<%@page import="com.jalios.jcms.jportal.JPortalTemplate"%>
<%@ page import="com.jalios.jcms.workspace.WKRole" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %><%

if (!isLogged) {
  sendForbidden(request, response);
  return;
}
%>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.jportal.JPortalPublishHandler'><%
  %><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
  %><jsp:setProperty name='formHandler' property='noRedirect' value="true" /><%
%></jsp:useBean><%

if (formHandler.validate()) { %>
  <% request.setAttribute("modal.redirect", formHandler.getModalRedirect()); %>
  <%@ include file="/jcore/modal/modalRedirect.jspf" %>
<% } %><%
Publication pub = formHandler.getPublication();

boolean isInVisibleState = pub.isInVisibleState();
String op = isInVisibleState ? "opPublishJPortal" : "opUpdate";
String button = glp("ui.com.btn.publish");
%>
<jalios:modal url="jcore/jportal/doJPortalPublishModal.jsp" title="jportal.publish-modal.title" op="<%= op %>" button="<%= button %>" formHandler="<%= formHandler %>">
	<%
		List wfNoteList = WorkflowManager.getInstance().getWFNoteList(pub);
		boolean hasAlreadyVoted = Util.notEmpty(wfNoteList) && WorkflowManager.getInstance().hasAlreadyVoted(pub, loggedMember);
		boolean isWFHistoryAvailable = Util.notEmpty(wfNoteList);
		int currentTabIndex = 0;
		boolean isPortlet = false;
	%>
	
	<% if(formHandler.isShowJPortalTitleField()){ %>
		<jalios:field name="title" formHandler="<%= formHandler %>">
		 <jalios:control/>
		</jalios:field>
	<% } %>
  <% if (formHandler.isCollaborativeSpaceJPortal()) { %>
    <jalios:field name="customTitle" label="jportal.structure.custom-title.label">
      <jalios:control settings='<%= new TextFieldSettings() %>' />
    </jalios:field>
	<% } else if (!pub.isInVisibleState() || Util.isEmpty(formHandler.getAvailableCategories())) { %>
  	<jalios:field name="title" formHandler="<%= formHandler %>">
  	 <jalios:control/>
  	</jalios:field>
  	
  	<% if(!formHandler.isCollaborativeSpaceJPortal()){ %>
  	  <jalios:field name="cids" formHandler="<%= formHandler %>" label="jportal.publish-modal.navigation-category.label">
  	    <jalios:control settings='<%= new CategorySettings().tree() %>'/>
  	  </jalios:field> 
    <% } %> 
    
  	<% 
  	int pstatus = 0;
  	if(pub != null) {
  	  pstatus = pub.getPstatus(); 
  	}
  	else{
  	  pstatus = formHandler.getWorkflow().getInitState().getPstatus();
  	}
  	%>
  	<%
  	Workflow internalWf = formHandler.getAvailableInternalWorkflow(); 
  	Workflow wf = formHandler.getWorkflow(); 
  	%>
  	<%@ include file="/work/doEditCommonPubAttribute_wf_state.jspf" %>
    <%@ include file="/work/doEditCommonPubAttribute_wf_schedule.jspf" %>       
  	<jalios:javascript>    
  	!function($){
  	    $("SELECT[name='internalWf']").on("change", function(event) {
  	       $form = $(event.currentTarget).closest("FORM");
  	       $form[0].workflowChangeEvent.value='true';
  	       if(!$form.closest("DIV.ajax-refresh-div").exists()){
  	          simpleSubmitForm(window, $form[0],'opRefresh','Veuillez patienter, la page n\'est pas encore compl?tement charg?e.', 3);
  	       }           
  	    });           
  	}(jQuery)    
  	</jalios:javascript>
    
  <% } else { %>
		<% if(!formHandler.isShowJPortalTitleField()){ %>
	    <jalios:message level="<%= MessageLevel.INFO %>"><%= glp("jportal.publish-modal.publish-message") %></jalios:message>
	  <% } %>
	  <jalios:field name="customTitle" label="jportal.structure.custom-title.label">
	   <jalios:control settings='<%= new TextFieldSettings() %>' />
	  </jalios:field>
	<% } %>

  <% if (Util.notEmpty(formHandler.getAvailableCollaborativeSpace())) { %>
    <jalios:control settings='<%= new HiddenSettings().name("collaborativeSpace").value(formHandler.getAvailableCollaborativeSpace().getId()) %>' />
  <% } %>
  <jalios:control settings='<%= new HiddenSettings().name("id").value(pub.getId()) %>' />

</jalios:modal>