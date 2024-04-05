<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf'%><%

String nav = getStringParameter("directoryApp_nav", null, "competencies");
boolean isDirpAppExpertise = nav != null && nav.equals("competencies");
if (!isDirpAppExpertise) {
  return;
}

// Hook: include expertise autocomplete
List<Category> selectedList = channel.getDataList(getStringParameterValues("smcats", HttpUtil.DATAID_REGEX), true, Category.class);
%>
<div class="navbar-form navbar-left expertise-search">
  <input name="expertiseAutocomplete" type="text"
      autocomplete="off" 
      class="typeahead search-query form-control form-control-autocomplete"
      data-autocomplete-select-event="select-expertise"
      aria-label="<%= encodeForHTMLAttribute(glp("ui.com.btn.search")) %>" 
      placeholder="<%= encodeForHTMLAttribute(glp("jcmsplugin.esn.lbl.categories.placeholder.search")) %>" 
      data-jalios-ajax-refresh-url="/plugins/ESNPlugin/jsp/directoryApp/autocomplete.jsp" />
  <jalios:foreach collection="<%= selectedList %>" name="itCat" type="Category">
    <input type="text" name="smcats" value="<%= itCat.getId() %>" />
  </jalios:foreach>
</div>