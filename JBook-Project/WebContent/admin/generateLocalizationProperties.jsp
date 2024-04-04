<%@ include file='/jcore/doInitPage.jspf' %><%
	if (!checkAccess("admin/dev/")) { 
    sendForbidden(request, response);
    return;
  }
%><jsp:useBean id="l10nHandler" scope="page" class="com.jalios.jcms.l10n.ProcessL10nHandler"><%
 %><jsp:setProperty name="l10nHandler" property="pageContext" value="<%= pageContext %>"/><%
 %><jsp:setProperty name="l10nHandler" property="*" /><%
%></jsp:useBean><%

  l10nHandler.validate();  
  //put in correct tab
  request.setAttribute("devAdminMenu", "true");
%>
<%@ include file='/admin/doAdminHeader.jspf' %><%
%>
<div class="page-header">
	<h1><%= glp("l10n.tool.admin-header") %></h1>
</div>
<%@ include file='/jcore/doMessageBox.jspf' %>
<%
	Map<String, List<? extends Data>> contentMap = l10nHandler.getCaddyContent();
	boolean isContent = l10nHandler.isContent();
	boolean isOpProcess = l10nHandler.isOpProcessFlag();
	if(isContent){
	    %>
		<div class="well">
		    <div><%=glp("l10n.tool.caddy-summary.msg") %></div>
		    <div><%=glp("l10n.tool.caddy-type."+l10nHandler.CATEGORY) %> <%= Util.getSize(contentMap.get(l10nHandler.CATEGORY))%></div>
		    <div><%=glp("l10n.tool.caddy-type."+l10nHandler.PUBLICATION) %> <%= Util.getSize(contentMap.get(l10nHandler.PUBLICATION))%></div>
		    <div><%=glp("l10n.tool.caddy-type."+l10nHandler.WORKSPACE) %> <%= Util.getSize(contentMap.get(l10nHandler.WORKSPACE))%></div>
		    <div><%=glp("l10n.tool.caddy-type."+l10nHandler.GROUP) %> <%= Util.getSize(contentMap.get(l10nHandler.GROUP))%></div>
		</div>
	    <%	    
	    if(isOpProcess){	        
	        %><div class="panel panel-default container">
	        	<div class="row">
		        	<div class="col-md-6"><%=glp("l10n.tool.content-header.en") %></div>
		        	<div class="col-md-6"><%=glp("l10n.tool.content-header.fr") %></div>
	        	</div>
	        	<div class="row">
		        	<div class="col-md-6">
			        	<pre><%= encodeForHTML(l10nHandler.getProcessedEnProperties()) %></pre>
		        	</div>
		        	<div class="col-md-6">
			        	<pre><%= encodeForHTML(l10nHandler.getProcessedFrProperties()) %></pre>
		        	</div>
	        	</div>
	        </div><%
	    }
	}
	else{
	    %><div class="well"><%=glp("l10n.tool.no-data.msg") %></div><%
	}
%>
<%if(isContent){%>
	<form  method="post" action="admin/generateLocalizationProperties.jsp">
    <%if(!isOpProcess){
		%><%=glp("l10n.tool.welcome.msg") %> <button class="btn btn-default btn-primary" name="opProcess" value="true" type="submit"><%=glp("ui.com.btn.ok") %></button><%
	}
	else{
		%><button class="btn btn-default btn-primary" name="opProcess" value="true" type="submit"><%=glp("l10n.tool.retry") %></button><%
	}%>
	</form>
<%}%>


<%@ include file='/admin/doAdminFooter.jspf' %>