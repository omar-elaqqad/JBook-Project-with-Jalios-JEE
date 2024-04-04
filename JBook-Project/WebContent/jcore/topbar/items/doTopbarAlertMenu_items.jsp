<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@page import="org.codehaus.jackson.map.ObjectMapper"%><%
%><%@page import="com.jalios.jcms.alert.Alert"%><%
%><%@page import="com.jalios.jcms.alert.AlertHandler"%><%
%><%@page import="com.jalios.jcms.alert.AlertManager"%><%
%><%@page import="com.jalios.jcms.alert.AlertQueryBuilder.ReadMode"%><%
%><%@page import="com.jalios.jcms.alert.AlertQueryBuilder"%><%
%><%@page import="com.jalios.jcms.alert.AlertTopbarHandler"%><%
%><%@page import="com.jalios.jcms.alert.MemberAlertSettings"%><%
%><%@page import="com.jalios.jcms.alert.WebAlertChannel"%><%
%><%@ include file='/jcore/topbar/items/doInitTopbarItem.jspf' %><%

jcmsContext.addCSSHeader("css/jalios/core/components/topbar/jalios-topbar-alert-menu_items.css");
jcmsContext.addCSSHeader("css/jalios/core/components/card/jalios-card.css");
jcmsContext.addCSSHeader("css/jalios/core/components/card/jalios-card-alert.css");
jcmsContext.addJavaScript("js/jalios/core/components/jalios-topbar-alertmenu.js");
jcmsContext.addWebAssets("jalios-truncate");
jcmsContext.addCSSHeader("css/jalios/core/components/topbar/jalios-topbar-slide-menu.css");
jcmsContext.addJavaScript("js/jalios/core/components/jalios-topbar-slide-menu.js");

%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.alert.AlertTopbarHandler'><%
  %><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
%></jsp:useBean><%

if (!isLogged) {
  sendForbidden(request, response);
  return;
 }

PageResult<Alert> pageResult = formHandler.getAlertsPageResult();
boolean isFirstLoad = formHandler.isFirstLoad();
boolean isMoreRequest = formHandler.isMoreRequest();
String templatePath = "jcore/topbar/items/doTopbarAlertMenu_items.jsp";

if (isFirstLoad) {
  %><div class="ajax-refresh-div" data-jalios-ajax-refresh-url="<%= templatePath %>">
    <div class="slide-wrapper">
    <!-- Alert menu level 1 (.main-menu) -->
    <div class="main-menu list-group is-active" data-bound="alerts-menu-root">
      <%-- SETTINGS FORM --%>
      <jalios:include jsp="jcore/topbar/items/doTopbarAlertMenuSettings.jsp" />
      <div class="topbar-ctxmenu-no-result<%= Util.isEmpty(pageResult.getResultList()) ? "" : " is-hidden" %>">
        <jalios:icon src="topbar-alert-allread" />
        <p><%= glp("ui.topbar.workspace.alert.all-read") %></p>
      </div><%
}
%>
<!-- Alert main menu --><%
for (Alert alert : pageResult.getResultList()) {
  String childBoundKey = "alert-" + alert.getId();
  String alertMeta = JcmsUtil.getFriendlyDate(getZonedDateTime(alert.getCdate()), java.time.format.FormatStyle.SHORT, true, userLocale);
  String alertMenuItemClasses = "alert-menu-item list-group-item has-child data-bound-parent alert-menu-item-" + alert.getLevel().getKey() + (isMoreRequest ? " js-new-alert" : "");
  String descriptionText = HtmlUtil.html2text(Util.getString(alert.getSummary(), alert.getDescription()));
  String markAsReadTitle = glp("alert.list.lbl.mark-as-read");
  boolean isReadAllAlert = AlertHandler.isReadAllAlert(alert);
  String alertParentId = isReadAllAlert ? AlertHandler.getAlertParentDataId(alert) : null;
  %>
  <!-- alert-main-menu: <%= alert.getId() %> -->
  <div tabindex="0" role="button" class='<%= alertMenuItemClasses %>' data-jalios-topbar-menu-action="onDisplayPreview" data-bound="<%= childBoundKey %>" data-jalios-dataid="<%= alert.getId() %>" data-jalios-alert-id="<%= alert.getId() %>" data-jalios-alert-level="<%= alert.getLevel().getKey() %>"<%= isReadAllAlert ? " data-jalios-alert-parent-data-id=\"" + alertParentId + "\"" : "" %>>
    <span class="sr-only"><%= alert.getLevel().getLabel(userLang) %></span>
    <jalios:memberphoto css="pull-left" link="false" size="<%= PhotoSize.TINY %>" member="<%= alert.getAuthor() %>" />
    <div class="description media-body">
      <% if (Util.notEmpty(descriptionText)) {
        %><div class="alert-description"
            title="<%= encodeForHTMLAttribute(descriptionText) %>"><%= encodeForHTML(descriptionText) %></div><%
      } %>
      <div class="alert-meta"><%= alertMeta %></div>
    </div><%
    if (channel.isDataWriteEnabled()) { %>
      <div class="alert-actions">
      <a class="mark-as-read btn btn-rounded js-alert-mark-as-read js-no-slide" data-jalios-topbar-menu-action="markAsRead" title='<%= encodeForHTMLAttribute(markAsReadTitle) %>'>
        <jalios:icon src='topbar-alert-mark-read' alt="<%= markAsReadTitle %>" />
      </a>
      <jalios:buffer name="alertMenuDropdown">
        <% if (isReadAllAlert && AlertHandler.isUnfollowableAlert(alert, loggedMember)) { %>
          <a class="js-no-slide alert-unfollow-action" data-jalios-alert-action="opUnfollow" data-jalios-alert-parent-data-id="<%= AlertHandler.getAlertParentDataId(alert) %>"><%= glp("alert.action.unfollow") %></a>
        <% } %>
        <% if (isReadAllAlert) { %>
          <a class="js-no-slide alert-read-action" data-jalios-alert-action="opReadAllPub" data-jalios-alert-parent-data-id="<%= AlertHandler.getAlertParentDataId(alert) %>"><%= glp("alert.action.read") %></a>
        <% } %>
        <a class="modal js-no-slide" href="jcore/alert/editAlertRule.jsp?alert=<%= alert.getId() %>" ><%= glp("alert.action.filter") %></a>        
      </jalios:buffer>
      <% if (Util.notEmpty(alertMenuDropdown)) { %>
        <div class="dropdown alert-menu-dropdown dropdown-menu-right dropdown-clear" title="<%= encodeForHTMLAttribute(glp("alert.action.menu-title")) %>">
          <a id="alert-menu-opener-<%= alert.getId() %>" class="btn btn-rounded alert-menu-opener js-no-slide" role="button" aria-haspopup="true" aria-expanded="false"><jalios:icon src="alert-menu-actions" /></a>
          <ul class="dropdown-menu dropdown-menu-alert-actions" aria-labelledby="alert-menu-opener-<%= alert.getId() %>">
            <li>
              <%= alertMenuDropdown %>
            </li>
          </ul>
        </div>
      <% } %>
      </div>
      <%
    }
  %></div><%
}

if (formHandler.hasMore()) { %>
<!-- Alert menu More --><%
  String moreUniqueId = ServletUtil.generateUniqueDOMId(request, "js-alerts-ajax-inner");
  String moreResultLabel = glp("ui.com.txt.more-results"); %>
  <div id="<%= moreUniqueId %>" class='js-show-alerts-more-items show-alerts-more-items-wrapper'>
    <a href="#" class='no-focus btn btn-default btn-block topbar-alert-menu-dropdown-more'
        title='<%= encodeForHTMLAttribute(moreResultLabel) %>'
        data-jalios-action="ajax-refresh"
        data-jalios-options='<%= formHandler.getMoreAlertParams() %>'
        data-jalios-ajax-refresh="noscroll"
        data-jalios-ajax-refresh-url="<%= templatePath %>"
        data-jalios-ajax-refresh-inner="#<%= moreUniqueId %>" >
      <%= moreResultLabel %>
    </a>
  </div><%
}

if (isFirstLoad) {
  %></div>
  <!-- End of Alert main menu --><%
}

// LEVEL 2
if (isMoreRequest) {
  // JS to append 'more' previews below the already loaded ones
  %><div class="js-alert-previews"><%
}
%>

<!-- Alert child menu --><%
for (Alert alert : pageResult.getResultList()) {
  String childBoundKey = "alert-" + alert.getId();
  %>
  <!-- alert-child-menu: <%= alert.getId() %> -->
  <div class="list-group child-menu hide" data-bound="<%= childBoundKey %>">
    <a tabindex="0" role="button" class="list-group-item back" data-jalios-slidemenu-bound-mode="back" data-bound="alerts-menu-root">
      <jalios:icon src='menu-prev' />
      <%= glp("menu.back") %>
    </a>

    <div class="alert-preview">
      <% request.setAttribute("jcms.alertlist.alert", alert); %>
      <jalios:include jsp="<%= WebAlertChannel.getJspPath(alert) %>"/>
      <% request.removeAttribute("jcms.alertlist.alert"); %>
    </div><%-- EOF.alert-menu-item --%>
  </div><%-- EOF.list-group.child-menu --%><%
}

%><!-- End of Alert child menu --><%
if (isMoreRequest) {
  // .js-alert-previews (only if more request)
  %></div><!-- End of Alert more --><%
}

MemberAlertSettings memberSettings = AlertManager.getInstance().getMemberAlertSettings(loggedMember);
List<String> autoReadLevelList = new ArrayList();
boolean isAutoReadInfo = memberSettings.isTopbarAutoRead(Alert.Level.INFO);
boolean isAutoReadAction = memberSettings.isTopbarAutoRead(Alert.Level.ACTION);
boolean isAutoReadWarning = memberSettings.isTopbarAutoRead(Alert.Level.WARNING);
if (isAutoReadInfo) { autoReadLevelList.add("info"); }
if (isAutoReadAction) { autoReadLevelList.add("action"); }
if (isAutoReadWarning) { autoReadLevelList.add("warning"); }
%>
<jalios:javascript>
  if (jQuery.jalios.alert && jQuery.jalios.alert.topbar && typeof jQuery.jalios.alert.topbar.setAutoRead === 'function') {
    jQuery.jalios.alert.topbar.setAutoRead( <%
      %> [ <%-- Start JS array --%><%
        %><%-- List of autoRead levels --%><%
        Iterator<String> levelIterator = autoReadLevelList.iterator();
        while (levelIterator.hasNext()) {
          String itLevel = levelIterator.next();
          %>'<%= itLevel %>'<%
          if (levelIterator.hasNext()) {
            %>,<%
          }
        }
      %> ] <%-- Close JS array --%><%
    %> );
  }
</jalios:javascript>
<%

if (isFirstLoad) {
    %><%@ include file='/jcore/doAjaxFooter.jspf' %>
    </div><%-- EOF.slide-wrapper --%>
  </div><%-- EOF .ajax-refresh-div --%><%
} %>