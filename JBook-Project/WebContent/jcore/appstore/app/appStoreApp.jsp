<%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ include file="/front/app/doAppCommon.jspf" %><%
%><%@ include file="/jcore/doHeader.jspf" %>
<jalios:include jsp="jcore/appstore/app/appStoreAppInner.jsp" />
<%@ include file="/jcore/doFooter.jspf" %>
<jalios:javascript>
(function($, window, document, undefined) {

  // Namespace
  if (!jQuery.jalios) {
    $.jalios = {};
  }

  if (!$.jalios.appstore) {
    $.jalios.appstore = {};
  }
  
  $.jalios.appstore.i18n =  {
    appInstalledInTab: "<%= encodeForJavaScript(glp("appstore.js.toastr.appInstalledInTab")) %>",
    appRemovedFromTab: "<%= encodeForJavaScript(glp("appstore.js.toastr.appRemovedFromTab")) %>",
    launcherSaved: "<%= encodeForJavaScript(glp("appstore.js.toastr.launcherSaved")) %>",
    tabDeleted: "<%= encodeForJavaScript(glp("appstore.js.toastr.tabDeleted")) %>",
    appRemovedFromAllTabs: "<%= encodeForJavaScript(glp("appstore.js.toastr.appRemovedFromAllTabs")) %>"
  };
  
})(jQuery, window, document);

</jalios:javascript>
<script class="application-store-tab" type="text/x-handlebars-template">
  <li class="application-nav-tab-item" data-jalios-tab-nameml="{{tabNameML}}">
    <a href="#application-tab_{{counter}}" role="tab" data-toggle="tab" onclick="return false;">{{tabName}}</a>
    <div class="dropdown">
      <a class="tab-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <span class="caret"></span>
      </a>
      <ul class="dropdown-menu">
        <li><a class="btn-tab-rename" data-jalios-appstore-action="renameActiveTab"><%= glp("appstore.admin.rename-tab-btn") %></a></li>
        <li><a class="btn-tab-delete" data-jalios-appstore-action="deleteActiveTab"><%= glp("appstore.admin.delete-tab-btn") %></a></li>
      </ul>
    </div>
  </li>
</script>
<script class="application-store-tab-content" type="text/x-handlebars-template">
  <div id="application-tab_{{counter}}" class="tab-pane">
    <jalios:field css="launcher-application-items" resource="field-vertical" mv="2" value="">
      <jalios:control settings="<%= new PublicationSettings().chooser().superType(Shortcut.class) %>" />
    </jalios:field>
  </div>
</script>