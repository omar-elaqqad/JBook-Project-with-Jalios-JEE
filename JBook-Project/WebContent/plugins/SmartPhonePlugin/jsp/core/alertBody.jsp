<%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneManager"%><%
%><%@page import="com.jalios.jcms.alert.AlertQueryBuilder.ReadMode"%><%
%><%@page import="com.jalios.jcms.alert.AlertAppHandler"%><%
%><%@page import="com.jalios.jcms.alert.AlertHandler"%><%
%><%@page import="com.jalios.jcms.alert.Alert"%><%
%><%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%
%><%@ taglib uri="/jcmsplugin/SmartPhonePlugin/tld/smartphone.tld" prefix="smartphone" %><%

%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.alert.AlertAppHandler'><%
  %><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
  %><jsp:setProperty name='formHandler' property='noRedirect' value='<%= true %>'/><%
  %><jsp:setProperty name='formHandler' property='alertAppPager_pageSize' value='<%= String.valueOf(SmartPhoneManager.getInstance().getDefaultPageSize()) %>'/><%
%></jsp:useBean><%

  formHandler.validate();

  SmartPhoneManager smartPhoneManager = SmartPhoneManager.getInstance();

  HibernateUtil.commitTransaction();
  HibernateUtil.beginTransaction();

  PageResult<Alert> alertPageResult =  formHandler.getAlertsPageResult();
  List<Alert> alertList =  alertPageResult.getResultList();
  String commonParams = "";
  if (Util.notEmpty(formHandler.getAvailableAlertReadMode())) {
    commonParams += "&amp;"+AlertAppHandler.PARAM_ALERT_READ_MODE+"=" + formHandler.getAvailableAlertReadMode().getValue();
  }
  if (Util.notEmpty(formHandler.getAvailableAlertLevels())) {
    for (Alert.Level level : formHandler.getAvailableAlertLevels()) {
      commonParams += "&amp;"+AlertAppHandler.PARAM_ALERT_LEVEL+"=" + level.getValue();
    }
  }

  boolean showMore = getBooleanParameter("showNext", false);
      
  
  Date moreDate = alertPageResult != null && Util.notEmpty(alertPageResult.getResultList()) ? Util.getLast(alertPageResult.getResultList()).getCdate() : null;
  String moreDateParam = moreDate != null ? String.valueOf(moreDate.getTime()) : "";
  int skip = getIntParameter("skip",0);
  int max = getIntParameter("max",smartPhoneManager.getDefaultPageSize());
  
  boolean isDataWriteEnabled = channel.isDataWriteEnabled();
  
  ReadMode mode = formHandler.getAvailableAlertReadMode();
  boolean displayUnread = mode == ReadMode.NOT_READ;
  boolean displayRead = mode == ReadMode.READ;
%>
 
  <% if (!showMore) { %>
  <div class="ajax-refresh-wrapper">
  <div data-role="navbar">
    <ul>
      <li><a data-transition="none" href="plugins/SmartPhonePlugin/jsp/core/alert.jsp?<%= AlertAppHandler.PARAM_ALERT_READ_MODE %>=<%= ReadMode.NOT_READ.getValue() %>"<%= displayUnread ?  " class=\"ui-btn-active\"" : "" %>><%= glp("jcmsplugin.smartphone.lbl.alert.unread") %></a></li>
      <li><a data-transition="none" href="plugins/SmartPhonePlugin/jsp/core/alert.jsp?<%= AlertAppHandler.PARAM_ALERT_READ_MODE %>=<%= ReadMode.READ.getValue() %>"<%= displayRead ?  " class=\"ui-btn-active\"" : "" %>><%= glp("jcmsplugin.smartphone.lbl.alert.read") %></a></li>
    </ul>
  </div><!-- /navbar -->
  <% } %>
  <% if(hasParameter("opRead") || hasParameter("opReadAll") || hasParameter("opUnread")) { %>
    <script>
      // Trigger refresh of alert badge
      jQuery.jalios.smartPhone.Alerts.updateAlertCount();
    </script>
  <% } %>  
  
  <% if (showMore) { %>
  <%
     Long timeParameter = getLongParameter("alertMoreDate", new Date().getTime());
     Date currentDate = timeParameter != null ? new Date(timeParameter) : null;
     int alertCount = 0;
          
     if(displayUnread) {
       request.setAttribute("displayMarkReadAlertAction", true);
     }
  %>
     <jalios:foreach name="alert" type="Alert" collection="<%= alertList %>">
     <%
       Date itDate = alert.getCdate();
       Member author = alert.getAuthor();
       Data data = alert.getData();
       String params = "&amp;alert=" + alert.getId() + commonParams;
     %>
     <jalios:dataListItem data="<%= alert %>" template="jmobile-detailed" css="itemlist-alert" />
       <% currentDate = alert.getCdate(); %>
     </jalios:foreach>
     <% request.removeAttribute("displayMarkReadAlertAction"); %>
     <% if ((skip + max) < alertPageResult.getTotalSize()) {%>
        <li class="ui-listview-showmore">
          <a data-role="button" data-theme="b" class="ui-link ajax-refresh btn-alerts-show-more" data-jalios-ajax-action="plugins/SmartPhonePlugin/jsp/core/alertBody.jsp?<%= AlertAppHandler.PARAM_MORE_DATE %>=<%= moreDateParam %>&amp;showNext=true&amp;alertReadMode=<%= mode.getValue()%>">
            <%= glp("jcmsplugin.smartphone.action.showmore") %>
          </a>
        </li>
     <% } %>   
  <% } else { %>
  <div data-role="content" class="ui-content">
    <% if(Util.isEmpty(alertList) && !hasParameter("showNext")) { %>
      <div class="no-result is-centered">
        <jalios:icon src="jcmsplugin-smartphone-alerts-no-result"/>
        <p>
          <% if(displayUnread) { %>
            <%= glp("jcmsplugin.smartphone.lbl.alert.all-alert-read") %>
          <% } else { %>
            <%= glp("jcmsplugin.smartphone.lbl.alert.alert-empty") %>
          <% } %>
        </p>
      </div>
    <% } else { %>
    
      <ul data-role="listview" class="list-divider-light complete ui-listview-full-abstract" <%= displayUnread ? "data-split-icon=\"delete\"" : "data-split-icon=\"check\"" %>>
        <%
          Long timeParameter = getLongParameter("alertMoreDate", new Date().getTime());
          Date currentDate = timeParameter != null ? new Date(timeParameter) : null;
          int alertCount = 0;
          
          if(displayUnread) {
            request.setAttribute("displayMarkReadAlertAction", true);
          }
        %>
        <jalios:foreach name="alert" type="Alert" collection="<%= alertList %>">
          <%
            Date itDate = alert.getCdate();
            Member author = alert.getAuthor();
            Data data = alert.getData();
            String params = "&amp;alert=" + alert.getId() + commonParams;
          %>
          <jalios:dataListItem data="<%= alert %>" template="jmobile-detailed" css="itemlist-alert" />
          <% currentDate = alert.getCdate(); %>
        </jalios:foreach>
        <% request.removeAttribute("displayMarkReadAlertAction"); %>
        <% if ((skip + max) < alertPageResult.getTotalSize()) {%>
          <li class="ui-listview-showmore">
            <a data-role="button" data-theme="b" class="ui-link ajax-refresh btn-alerts-show-more" data-jalios-ajax-action="plugins/SmartPhonePlugin/jsp/core/alertBody.jsp?<%= AlertAppHandler.PARAM_MORE_DATE %>=<%= moreDateParam %>&amp;showNext=true&amp;alertReadMode=<%= mode.getValue()%>">
              <%= glp("jcmsplugin.smartphone.action.showmore") %>
            </a>
          </li>
        <% } %>        
      </ul>
      
    <% } %>
  </div>
  <% } %>
  
  <% if (!showMore) { %>
    </div>
  <% } %>
 