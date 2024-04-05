<%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%--  
--%><%@ page import="com.jalios.jcms.tools.JCMSAppender" %><%--  
--%><%@ page import="org.apache.log4j.spi.LoggingEvent" %><%--  
--%><%@ page import="com.jalios.jcmsplugin.smartphone.*" %><%  
  SmartPhoneManager smartPhoneManager = SmartPhoneManager.getInstance();
  
  int skip = getIntParameter("skip",0);
  int max = getIntParameter("max",smartPhoneManager.getDefaultPageSize());
  
  JCMSAppender jcmsAppender = JCMSAppender.getLastInstanceCreated();
  
  Level level = Level.toLevel(getAlphaNumParameter("level", null), Level.WARN);
  List eventList = jcmsAppender.getLoggedEventList(level);
  
  if (Util.isEmpty(eventList) && skip == 0) {
    request.setAttribute("smartphone.service.admin.logs.empty",glp("ui.adm.logs.no-warning-logs"));
  }
%>
  <jalios:foreach collection="<%= eventList %>"  
                name="event" 
                type="LoggingEvent"
                skip="<%= skip %>" max='<%= max %>'>
<% 
  Date date = new Date(event.timeStamp);
  String loggerName = event.getLoggerName();
  String icon = "images/jalios/icons/log-" +  event.getLevel().toString().toLowerCase() + ".gif";
  %>      
   <li>
   <h2>
   <img src="<%= icon %>" class="icon" alt="" />
   <% if (DateUtil.isToday(date)) { %>
   <jalios:time date="<%= date %>" format="short" />
   <% } else { %>
   <jalios:date date="<%= date %>" format="short" /> -
   <jalios:time date="<%= date %>" format="short" />
   <% } %>   
   </h2>
   <p><%= Util.escapeHtml(event.getRenderedMessage()) %></p>
   </li>             
</jalios:foreach>
<% if ((skip + max) < Util.getSize(eventList)) {%>
  <li class="ui-listview-showmore">
    <a data-jalios-ajax-action="plugins/SmartPhonePlugin/jsp/service/admin/adminLogsMore.jsp?skip=<%= skip + max %>&amp;max=<%= max %>" class="ajax-refresh" data-role="button" data-theme="b"><%= glp("jcmsplugin.smartphone.action.showmore") %></a>
  </li>
<% } %>