<%@ include file='/jcore/doInitPage.jspf' %><%

if (!isLogged) { 
  return; 
}


jcmsContext.addCSSHeader("css/lib/perfectscrollbar/perfect-scrollbar.css");
jcmsContext.addJavaScript("js/lib/perfectscrollbar/perfect-scrollbar.jquery.js");
jcmsContext.addCSSHeader("css/jalios/core/components/topbar/jalios-topbar-slide-menu.css");
jcmsContext.addCSSHeader("css/jalios/core/components/loading/jalios-loading-circle.css");
jcmsContext.addJavaScript("js/jalios/core/components/jalios-loading-circle.js");
jcmsContext.addJavaScript("js/jalios/core/components/jalios-topbar-slide-menu.js");

TextFieldSettings searchMenuSettings = new TextFieldSettings().css("js-slidemenu-input-refresh").name("slideMenuQuery").placeholder("jcmsplugin.bookmarks.menu.search.placeholder");

%>
<div class="bookmark-menu slide-wrapper slide-global ajax-refresh-div" data-jalios-ajax-refresh-url="plugins/BookmarksPlugin/jsp/menu/menuList.jsp" >
  <div class="list-group-item slide-menu-search-input">
    <jalios:control settings="<%= searchMenuSettings %>" />
  </div>
  <div class="js-slidemenu-input-refresh-wrapper">
    <jalios:include jsp="plugins/BookmarksPlugin/jsp/menu/menuList.jsp" />   
  </div>
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>