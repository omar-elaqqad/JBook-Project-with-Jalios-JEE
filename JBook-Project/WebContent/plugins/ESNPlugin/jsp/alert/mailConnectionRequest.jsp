<%@ include file='/jcore/doInitPage.jspf' %><%--
--%><%@ include file='/jcore/alert/mail/doMailInit.jspf' %><%--
--%><%@ include file='/jcore/alert/mail/doMailHeader.jspf' %><%--
--%><%@ page import="com.jalios.jcmsplugin.esn.*" %><%--
--%><%  
	MemberConnectionRequest mcr = (MemberConnectionRequest) alert.getData();
%><%--
--%><body>
<style media="all" type="text/css">
td {
     font-family:<%= fontFamily %>;
     font-size:14px;
}
</style>
<!-- Wrapper/Container Table: Use a wrapper table to control the width and the background color consistently of your email. Use this approach instead of setting attributes on the body tag. -->
<%  
    String headerColor = "background-color:#5092BD";
    if (alert.getLevel() == Alert.Level.ACTION) { 
        headerColor = "background-color:#F89406";
    } else if (alert.getLevel() == Alert.Level.WARNING) {
        headerColor = "background-color:#B94A48";
    }
%>
<table width="100%" cellpadding="10" cellspacing="0" id="backgroundTable" style="font-size:12px;background-color:#F8F8F8;margin:0 auto;">
    <tr>
        <td class='vTop'>
        <!-- Tables are the most common way to format your email consistently. Set your table widths inside cells and in most cases reset cellpadding, cellspacing, and border to zero. Use nested tables as a way to space effectively in your message. -->

        <table width="600" class="content" style="line-height:150%;width:600px;max-width:600px;min-width:320px;font-family:<%= fontFamily %>;color:#535353;margin:0 auto;" cellpadding="5" cellspacing="0" align="center">
            <tr>
            <th style="<%= headerColor %>">
                <table style="margin:0 10px;color:white;">
                    <tr>
                        <td>                
                            <h3 style="margin:10 0; padding:0;"><%= channel.getName() %> - <%= alert.getLevel().getLabel(userLang) %></h3>
                        </td>
                    </tr>
                </table>
            </th>
            </tr>
            <tr>
                <td style="background:#fff;border-left:1px solid #dbdbdb;border-right:1px solid #dbdbdb;color:#535353;" class='vTop'>
                <table class="mail-body" width="100%" cellpadding="10">
                    <tr>
                        <td>
                            <p><%= glp("jcmsplugin.esn.connection-request.mail",alert.getAuthor()) %></p>
														<table cellspacing="5" style="background-color: #F8f8f8; border: 1px solid #CCC; padding: 10px; width: 300px;">
														<tr>
															<td width="1%" style="width:1%; vertical-align:top;">
		                            <table cellpadding="5">
		                            <tr><td>
                                  <jalios:memberphoto size="<%= PhotoSize.TINY %>" member="<%= alert.getAuthor() %>" />
                                </td></tr>
															  </table>
															</td>
															<td style="padding:5px 10px 5px;">
																<b><jalios:link data="<%= alert.getAuthor() %>" /></b>
																<p style="font-size:12px"><%= alert.getAuthor().getOrganization() %><br/>
																<%= alert.getAuthor().getDepartment() %><br/>
																<%= alert.getAuthor().getJobTitle() %></p>
															</td>
														</tr>
														</table>
														
														<br/>
													  <table cellpadding="5" cellspacing="10"><tr><td bgcolor="#006DCC" style="background-color:#006DCC;">
														<a style="color:#FFF;border-color:#888;padding:4px 12px;cursor:pointer;" href="plugins/ESNPlugin/jsp/form/validateConnectionRequestAlert.jsp?requestStatus=<%= MemberConnectionRequest.ACCEPTED %>&amp;mcrId=<%= mcr.getId() %>&amp;token=<%= HttpUtil.encodeForURL(mcr.getSecurityToken()) %>">
															<%= glp("jcmsplugin.esn.mcr.validate.lbl.accept") %>
														</a>
														</td>
														<td>
	                             &nbsp;
	                            <a href="<%= alert.getAuthor().getDisplayUrl(userLocale) %>">
	                                <%= glp("jcmsplugin.esn.ctxmenu.mbr.profile") %>
	                            </a>
														</td>
														</tr>
														</table>
														<% if (Util.notEmpty(alert.getMessage())) { %>
	                            <br/>
									            <table width="100%">
									            <tr><td bgcolor="#f6f6f6" style="background:#f6f6f6; padding:5px 10px 5px;border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px;color:#535353;line-height:160%;">    
									                <% String messageMarkup = alert.getMessageMarkup(); %>
									                <% if (AlertBuilder.HTML_MARKUP.equals(messageMarkup)) { %>
									                    <jalios:wysiwyg><%= alert.getMessage() %></jalios:wysiwyg>
									                <% } else if (AlertBuilder.WIKI_MARKUP.equals(messageMarkup)) { %>
									                    <jalios:wiki><%= alert.getMessage() %></jalios:wiki>
									                <% } else { %>
									                    <p><%= JcmsUtil.unescapeHtml(alert.getMessage()) %></p>
									                <% } %>
									            </td></tr>
									            </table>
														<% } %>
                        </td>
                    </tr>
                </table>
                </td>
            </tr>
            <tr>
                <td style="border:1px solid #dbdbdb;background:#f0f0f0; font-size:14px;">
                    <div style="text-align:center;">
                        <%  
                            StringBuilder sb = new StringBuilder();
                            if (alert.getRecipient() != null) {
                               alert.getRecipient().printDisplayLinkStart(sb, alert.getRecipient().getLocale(), channel.getUrl(), null, null, null, null, null, null, null, false, null, null, null);
                               sb.append(glp("ui.mail.footer.lbl.profile"));
                               alert.getRecipient().printDisplayLinkEnd(sb);
                            }
                        %>
                        <%= sb.toString() %> &middot; <a href="<%= channel.getUrl() %>"><%= glp("ui.mail.footer.lbl.home") %></a>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                <div style="font-size:11px;color:#999;width: 100%;text-align: center;"><%= glp("ui.mail.footer.text",channel.getName()) %></div>
             </td>
            </tr>
            </table>
        </td>
    </tr>
</table>
</table>
<%@ include file='/jcore/alert/mail/doMailFooter.jspf' %>                                  