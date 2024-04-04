<%@page import="com.jalios.jcms.authentication.handlers.AuthKeyAuthenticationHandler"%>
<%@page import="com.jalios.jcms.handler.AuthKeyGeneratorHandler"%>
<%@ include file='/jcore/doInitPage.jspf' %><%

  if (!checkAccess("admin/operation/auth-key")) { 
    sendForbidden(request, response);
    return;
  }

%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.handler.AuthKeyGeneratorHandler'><%
  %><jsp:setProperty name="formHandler" property="pageContext" value="<%= pageContext %>"/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
%></jsp:useBean><%

  if (formHandler.validate()) {
    return;
  }

	request.setAttribute("title", glp("ui.adm.authkey.title")); 
  request.setAttribute("breadcrumbTitle", glp("ui.adm.authkey.title")); 
	request.setAttribute("authKeySubAdminMenu", "true");  
%>
<%@ include file='/admin/doAdminHeader.jspf' %>
<%@ include file='/jcore/doMessageBox.jspf' %>


<form action='admin/createAuthKey.jsp' method='post' name='createAuthKeyForm' class="form-horizontal">
<div class='formBox'>
  <jalios:message msg="ui.adm.authkey.info" title="" />

  <div class='inputArea'>
  
	  <jalios:field label="ui.adm.authkey.param.url"  name='url' required='<%= true %>' value='<%= formHandler.getAvailableUrl() %>'>
	    <jalios:control type="<%= ControlType.URL %>" />
	  </jalios:field>

    <jalios:field label="ui.adm.authkey.param.prefix"  name='prefixMode' required='<%= true %>' tooltip='ui.adm.authkey.param.prefix.h' value='<%= Util.toBoolean(formHandler.getAvailablePrefixMode(),false) %>'>
      <jalios:control settings='<%= new EnumerateSettings().enumValues("false", "true").enumLabels("ui.adm.authkey.param.prefix.value.false", "ui.adm.authkey.param.prefix.value.true") %>' />
    </jalios:field>

    <jalios:field label="ui.adm.authkey.param.member" tooltip="ui.adm.authkey.param.member.h" name='<%= "memberId" %>' required='<%= true %>' value='<%= formHandler.getAvailableMemberId() %>' css='mycontent'>
      <jalios:control settings="<%= new MemberSettings().filter(MemberSettings.MemberFilter.ACCOUNT) %>" />
    </jalios:field>
    
    <jalios:field label="ui.adm.authkey.param.duration" tooltip="ui.adm.authkey.param.duration.h" name='<%= "duration" %>' value='<%= formHandler.getAvailableDuration() %>' css='inline-widget'>
      <jalios:control type="<%= ControlType.DURATION %>" />
    </jalios:field>

    <jalios:field label="ui.adm.authkey.param.methods" name='<%= "methods" %>' tooltip="ui.adm.authkey.param.methods.h" required='<%= true %>' value='<%= Util.getFirst(formHandler.getAvailableMethods()) %>'>
      <jalios:control settings='<%= new EnumerateSettings().inline().checkbox().enumValues(AuthKeyGeneratorHandler.getAcceptedHttpMethods()).enumLabels(AuthKeyGeneratorHandler.getAcceptedHttpMethods()) %>' />
    </jalios:field>

    <jalios:field label="ui.adm.authkey.param.ipmask" name='ipMask' tooltip="ui.adm.authkey.param.ipmask.h" required='<%= false %>' value='<%= formHandler.getAvailableIpMask() %>'>
      <jalios:control type="<%= ControlType.TEXTFIELD %>" />
    </jalios:field>
    
    <jalios:field>    
      <button type="submit" name="opGenerateAuthKey"  value="true" class="btn btn-primary"><%= glp("ui.adm.authkey.generate") %></button>
    </jalios:field>
    
    <% if (Util.notEmpty(formHandler.getAuthKey())) { %>
	    <jalios:field name='authkeywithurl' description="ui.adm.authkey.resulturl" value='<%= formHandler.getAvailableUrlWithAuthKey() %>'>
	      <jalios:control type="<%= ControlType.TEXTFIELD %>" />
	      <div class="input-group-btn"> <jalios:icon src="auth-key" /></div>
	    </jalios:field>
      <jalios:field name='authkey' description="ui.adm.authkey.result" value='<%= formHandler.getAuthKey() %>'>
        <jalios:control type="<%= ControlType.TEXTFIELD %>" />
        <div class="input-group-btn"> <jalios:icon src="auth-key"  /></div>
      </jalios:field>
      
      <%
      	if(channel.getBooleanProperty("auth.jwt-authentication.enabled", false)){
          String jwt = formHandler.getAvailableJwt(); 
      	  %>
      	   <jalios:field name='jwt' description="ui.adm.authkey.resultjwt" value='<%= jwt %>'>
		   	  <jalios:control type="<%= ControlType.TEXTFIELD %>" />
		      <div class="input-group-btn"> <jalios:icon src="auth-key" /></div>
		    </jalios:field>
      	  <%
      	}
    }
	%>	
	</div>
</div>
</form>
<%@ include file='/admin/doAdminFooter.jspf' %>
