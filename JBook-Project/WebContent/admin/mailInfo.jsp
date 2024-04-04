<%--
  @Summary: Display information about the Mail
  @Category: Admin / Channel
  @Author: Oliver Dedieu
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-5.5
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.jcms.mail.*,org.apache.log4j.spi.*" %><%

if (!checkAccess("admin/monitoring/mail-info")) {
  sendForbidden(request, response);
  return;
}

request.setAttribute("mailInfoSubAdminMenu", "true"); 
int counter = 0;

jcmsContext.addCSSHeader("css/jalios/logs.css");
MailManager mailMgr = MailManager.getInstance();
%><%@ include file='/admin/doAdminHeader.jspf' %>

<div class="page-header"><h1><%= glp("ui.adm.mn.info.mail") %></h1></div>


<%-- TABS --%>
<ul class="nav nav-tabs nav-tabs-underlined is-left-aligned" role="tablist">
  <li class="active"><a href="#status" role="tab" data-toggle="tab" onclick="return false;"><%= glp("ui.adm.mail-info.status") %></a></li>
  <li><a href="#account" role="tab" data-toggle="tab" onclick="return false;"><%= glp("ui.adm.mail-info.account") %></a></li>
  <li><a href="#logs" role="tab" data-toggle="tab" onclick="return false;"><%= glp("ui.adm.mail-info.logs") %></a></li>
</ul>


<div class="tab-content">

  <%-- STATUS --%>
  <% counter = 0; %>
  <div class="tab-pane active" id="status">
    <table class="table-data is-auto">
      <tr>
        <th scope="row"><%= glp("ui.com.lbl.enabled") %></th>
        <td colspan="2"><jalios:icon src='<%= channel.isIncomingMailEnabled() ? "accept" : "cross" %>' alt='<%= glp("ui.com.lbl." + (channel.isIncomingMailEnabled() ? "enabled" : "disabled")) %>'/></td>
      </tr>
      <tr>
        <th scope="row"><%= glp("ui.adm.mail-info.db-count") %></th>
        <td colspan="2"><%= mailMgr.getDBMailMessageCount() %></td>
      </tr>
      <tr>
        <th scope="row"><%= glp("ui.adm.mail-info.fetch-account") %></th>
        <td>
          <%
            MailAccount lastAccount = mailMgr.getMailFetcher().getLastFetchAccount();
            if (lastAccount != null){
              out.println("<em>");
              out.println(lastAccount.getLabel());
              out.println("</em>");
            }
          %>
        </td>
        <td>
          <jalios:if predicate="<%= Util.notEmpty(lastAccount) %>">
            <jalios:date date="<%= lastAccount.getLastFetchDate() %>"/> <jalios:time date="<%= lastAccount.getLastFetchDate() %>"/>
          </jalios:if>
        </td>
      </tr>
      <tr>
        <th scope="row"><%= glp("ui.adm.mail-info.pre-suf") %></strong></td>
        <td><%= encodeForHTML(channel.getProperty("mail.incoming.label")) %></td>
        <td><%= encodeForHTML(channel.getProperty("mail.incoming.suffix")) %></td>
      </tr>
      <%
      Map<String, String> patternMap = mailMgr.getMailFetcher().getIncomingMailListener().listAllPatterns();
      %>
      <tr>
        <th scope="row" rowspan="<%= patternMap.size()+1 %>"><strong><%= glp("ui.adm.mail-info.archive") %></strong></th>
        <td class="listHeader"><strong><%= glp("ui.adm.mail-info.regexp") %></strong></td>
        <td class="listHeader"><strong><%= glp("ui.adm.mail-info.criteria") %></strong></td>
      </tr>

      <% for (Map.Entry<String,String> entry : patternMap.entrySet()) { %>
        <tr>
          <td><pre class='pattern'><%= encodeForHTML(entry.getKey()) %></pre></td>
          <td><%= encodeForHTML(entry.getValue()) %></td>
         </tr>
      <% } %>
    </table>
  </div>
      
      
  <%-- ACCOUNT --%>
  <% counter = 0; %>
  <div class="tab-pane" id="account">
    <% for(MailAccount account : MailManager.getInstance().getMailFetcher().getMailAccountMap().values()){ %>
    <table class='table-data is-auto'>
      <thead>
        <tr><th colspan="2"><%= account.getLabel() %></th></tr>
      </thead>
      <tbody>
        <tr><td><strong><%= glp("ui.adm.mail-info.enable") %></strong></td><td><jalios:icon src='<%= account.isEnabled() ? "accept" : "cross" %>' alt='<%= glp("ui.com.lbl." + (account.isEnabled() ? "enabled" : "disabled")) %>'/></td></tr>
        <tr><td><strong><%= glp("ui.adm.mail-info.host") %></strong></td><td><%= account.getHost() %></td></tr>
        <tr><td><strong><%= glp("ui.adm.mail-info.port") %></strong></td><td><%= account.getPort() %></td></tr>
        <tr><td><strong><%= glp("ui.adm.mail-info.protocol") %></strong></td><td><%= account.getProtocol() %></td></tr>
        <tr><td><strong><%= glp("ui.adm.mail-info.ssl") %></strong></td><td><%= account.isSSL() %></td></tr>
        <tr><td><strong><%= glp("ui.adm.mail-info.login") %></strong></td><td><%= account.getLogin() %></td></tr>
        <tr><td><strong><%= glp("ui.adm.mail-info.mbox") %></strong></td><td><%= account.getMbox() %></td></tr>
        <tr><td><strong><%= glp("ui.adm.mail-info.expunged") %></strong></td><td><%= account.isExpunged() %></td></tr>
        <tr><td><strong><%= glp("ui.adm.mail-info.schedule") %></strong></td><td><%= account.getSchedule() %></td></tr>
        <tr><td><strong><%= glp("ui.adm.mail-info.author") %></strong></td><td><jalios:dataicon data="<%= account.getAuthor() %>" /> <jalios:link data='<%= account.getAuthor() %>' /></td></tr>
        <tr><td><strong><%= glp("ui.adm.mail-info.workspace") %></strong></td><td><jalios:dataicon data="<%= account.getWorkspace() %>" /> <jalios:link data='<%= account.getWorkspace() %>' /></td></tr>
        <tr><td colspan="2">&nbsp</td></tr>
        <tr><td><strong><%= glp("ui.adm.mail-info.fetch-date") %></strong></td><td><jalios:date date="<%= account.getLastFetchDate() %>"/> <jalios:time date="<%= account.getLastFetchDate() %>"/></td></tr>
        <tr><td><strong><%= glp("ui.adm.mail-info.fetch-count") %></strong></td><td><%= account.getLastFetchCount() %></td></tr>
        <tr><td><strong><%= glp("ui.adm.mail-info.db-count") %></strong></td><td><%= account.getDBMailMessageCount() %></td></tr>
      </tbody>
    </table>
    <% } %>
  </div>
      
  <%-- LOGS --%>
  <% counter = 0; %>
  <div class="tab-pane" id="logs">
     <%
    MailAppender appender = MailAppender.getLastInstanceCreated();
    List<LoggingEvent> eventList = appender != null ? appender.getLoggedEventList() : null;
    if (Util.notEmpty(eventList)) { %>
    
    <table class="table-data is-auto logs">
      <thead>
        <tr>
         <th class='listHeader'><%= glp("ui.adm.logs.log.level") %></th>
         <th class='listHeader'><%= glp("ui.adm.logs.log.date") %></th>
         <th class='listHeader'><%= glp("ui.adm.logs.log.time") %></th>
         <th class='listHeader'><%= glp("ui.adm.logs.log.message") %></th>
        </tr>
      </thead>
      
      <tbody>
        <jalios:foreach collection="<%= eventList %>"  name="itEvent" type="LoggingEvent"  counter='logCounter'>
        <tr>
         <% 
           Date eventDate = new Date(itEvent.timeStamp);
           String[] throwableStrRep = itEvent.getThrowableStrRep();
         %>
         <td class='level <%= itEvent.getLevel() %>'><%= glp("ui.adm.logs.level."+itEvent.getLevel()) %></td>
         <td><jalios:date date="<%= eventDate %>" format='<%= "yyyy/MM/dd" %>' /></td>
         <td><jalios:time date="<%= eventDate %>" format='<%= "HH:mm:ss" %>' /></td>
         <td width="100%">
           <%= encodeForHTML(String.valueOf(itEvent.getMessage())) %>
           <% if (throwableStrRep!= null) {%>
             <a href="" class="showDetailLink" onclick="Element.addClassName(this.parentNode, 'showDetail');return false;"><jalios:icon src="log-exception"  alt='Exception'/>+</a>
             <a href="" class="hideDetailLink" onclick="Element.removeClassName(this.parentNode, 'showDetail');return false;"><jalios:icon src="log-exception"  alt='Exception'/>-</a>
             <div class="eventDetail">
               <% for (int i = 0; i < throwableStrRep.length; i++) { %><%= throwableStrRep[i] %><% } %>
             </div>
           <% } %>
         </td>
        </tr>
        </jalios:foreach>
      </tbody>
    </table>
    <% } %>
  </div>
  

</div>

<%@ include file='/admin/doAdminFooter.jspf' %> 