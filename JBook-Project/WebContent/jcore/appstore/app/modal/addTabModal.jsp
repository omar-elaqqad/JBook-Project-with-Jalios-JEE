<%@ include file="/jcore/doInitPage.jspf" %><%
%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.application.ApplicationDefaultAppHandler'>
<jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
<jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
<jsp:setProperty name="formHandler" property="pageContext" value="<%= pageContext %>"/>
<jsp:setProperty name='formHandler' property='*' />
</jsp:useBean>

<jalios:modal url="jcore/appstore/app/modal/addTabModal.jsp" title='<%= glp("application-launcher.add-tab") %>'>
	<jalios:message level="<%= MessageLevel.WARN %>" css="hide tab-langs-required-warning" msg="application-launcher.tab-langs-required" />
	<jalios:buffer name="MODAL_BUTTON">
		<button type="button" class="btn btn-primary btn-tab-add-validate"><%= glp("ui.com.btn.create") %></button>
	</jalios:buffer>
	        
	<input type="hidden" name="mainSiteLang" class="tab-main-site-lang" value="<%= formHandler.getDefaultLang() %>" />
	<% for(String lang : channel.getLanguageListOrdered()){  %>
	<div class="form-horizontal">
		<jalios:buffer name="flag">
		  <jalios:lang lang="<%= lang %>"/>
		</jalios:buffer>

		<%  String label = JcmsUtil.glp(lang, "lang") + flag; %>
		
	  <jalios:field name="<%= lang %>" label="<%= label %>" required="<%= formHandler.isDefaultLang(lang) %>">
	    <jalios:control type="<%= ControlType.TEXTFIELD %>" settings='<%= new TextFieldSettings().css("js-tab-name-ml") %>'/>
	  </jalios:field>

	</div>
  <% } %>
</jalios:modal>