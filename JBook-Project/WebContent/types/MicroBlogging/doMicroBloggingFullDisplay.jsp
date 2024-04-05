<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %><%
  jcmsContext.addCSSHeader("plugins/ESNPlugin/css/microblogging.css");
  jcmsContext.addJavaScript("plugins/ESNPlugin/js/microblogging.js");
%><% MicroBlogging obj = (MicroBlogging)request.getAttribute(PortalManager.PORTAL_PUBLICATION); %>

<%@ include file='/front/doFullDisplay.jspf' %>
<div class="microblogging-fulldisplay fullDisplay MicroBlogging <%= obj.canBeEditedFieldByField(loggedMember) ? "unitFieldEdition" : "" %>" data-jalios-dataid="<%= obj.getId() %>">
   <div class="author-row">
    <jalios:memberphoto member="<%= obj.getAuthor() %>" size="<%= PhotoSize.TINY %>" />  
    <div class="author-infos">
        <% if(obj.getAuthor() != null){ %>
        <jalios:link data="<%= obj.getAuthor() %>">
        <%= obj.getAuthor().getFullName() %>
        </jalios:link>
        <% } %>
          <div class="infos-row">
				    <%= JcmsUtil.getFriendlyDate(obj.getCdate(), DateFormat.SHORT, true, userLocale) %>
				  </div>
    </div>
   </div> 
	<div class="content-row">
    <jalios:wiki css="microblogging wiki" data="<%= obj %>" field="text" ><%= obj.getText() %></jalios:wiki>
  
	</div>
</div>


