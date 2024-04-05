<%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%

  Map<String, String[]> valueMap  = (Map<String, String[]>) getIncludeObject("values",null);
  Map<String, String[]> bodyMap   = (Map<String, String[]>) getIncludeObject("bodies",null);
  
  boolean isTab = Util.toBoolean(getIncludeString("isTab", null), false);
  boolean isMulti = Util.toBoolean(getIncludeString("isMulti", null), false);
  boolean isRequired = Util.toBoolean(getIncludeString("isRequired", null), false);
  boolean isDisabled = Util.toBoolean(getIncludeString("isDisabled", null), false);
  boolean isKeyword = Util.toBoolean(getIncludeString("isKeyword", null), false);
  boolean isMultivalued = Util.toBoolean(getIncludeString("isMultivalued", null), false);
  boolean isArea = Util.toBoolean(getIncludeString("isArea", null), false);

  String fieldGroup = getIncludeString("fieldGroup", null);

  String errorMessage = getIncludeString("errorMessage", null);
  
  String label  = getIncludeString("label", null);
  String tooltip = getIncludeString("tooltip", null);
  String description = getIncludeString("description", null);
  String name = getIncludeString("name", null);
  String fieldId = getIncludeString("fieldId", null);
  String css = getIncludeString("css", "") + (isRequired ? " required" : "") 
                                           + (isDisabled ? " disabled" : "")
                                           + (isKeyword  ? " keyword"  : "")
                                           + (isMultivalued  ? " multivalued"  : "");
  boolean isDnD = css.indexOf("nodnd") < 0 && !isTab;
  int cptMax = Util.toInt(getIncludeString("cptMax", null), 1);
  
  // Buffer
  label = getIncludeString("WIDGET_LABEL", label);
  String  widgetAppend = getIncludeString("WIDGET_APPEND", "");
  
  boolean isML   = bodyMap.size() > 1;
  String  active = null;
  String  wdgTab = isTab ? "tab-content" : "";
%>
<div class="form-group widget <%= Util.notEmpty(name) ? "widget-name-" + name : "widget-custom" %> <%= css %>">
  
  <%-- LABEL --%>
  <% if (Util.notEmpty(label)){ %>
  <div class="control-label <%= isRequired ? "is-required" : "" %>">
    <% if (Util.notEmpty(getIncludeString("WIDGET_LABEL", ""))) { %>
      <label<%--= Util.notEmpty(fieldId) ? " for='" + fieldId + "'" : "" --%>><%= label %></label>
    <% } else { %>
      
      <label<%--= Util.notEmpty(fieldId) ? " for='" + fieldId + "'" : "" --%>>
      
        <span class="jalios-label-addon inline">
          <% if (isRequired){ %><jalios:icon src="required"/><% } %>
          <% if (Util.notEmpty(tooltip)) { %>
            <% if (tooltip.indexOf(' ') >= 0) { %><jalios:tooltip><%= tooltip %></jalios:tooltip><% } else { %><jalios:tooltip property="<%= tooltip %>" /><% } %>
          <% } %>
        </span>
      
     <%= glp(label) %></label>
    <% } %>
  </div>
  <% } %>

  <%-- CONTENT --%>
  <div class="widget-content">
    <%-- Tabs ML --%>
    <% if (isML) { %>
      <div class="tab-content">
    <% } %>
    
      <%-- Language --%>
      <% active = null; %>
      <% for (Map.Entry<String, String[]> itEntry : bodyMap.entrySet()) { %>
        <% 
          String lang = itEntry.getKey();

          // TODO support for more than one language
          if(!("ALL".equals(lang)) && !(lang.equals(channel.getLanguage()))) {
            continue;
          }
        
          String[] bodies = itEntry.getValue();
          
          if (Util.notEmpty(bodies)) {
            int length = isMulti ?  bodies.length : 1;
            boolean isList = isMulti;
            active = (active == null) ? "active" : "";
            
            // Multivalued NON -KEYWORDS fields have 2 more empty fields, Smartphone must have one => remove one
            if(isMulti && !isKeyword) {
              length--;
            }
        %>
          <% if (isML) { %>
            <div id="tab_<%= fieldId %>_<%= lang %>" class="tab-pane <%= active %> wdglang wdglang-<%= lang %>">
          <% } %>

          <%-- Area --%>
          <% if (isList && isTab){ active = null; %>
          <ul class="nav nav-pills no-tab-drop jalios-nav-pills">
            <% for (int i = 0 ; i < length ; i++) { %>
              <% active = (active == null) ? "class='active'" : ""; %>
              <li <%= active %>><a href="#tab_<%= fieldId %>_<%= lang %>_<%= i %>" class="link-tab-<%= lang %>" data-toggle="tab" <%= fieldGroup != null ? "data-jalios-fieldgroup='" + fieldGroup + "_" + i + "'" : "" %> onclick="return false;"><%= i %></a></li>
            <% } %>
          </ul>
          <% } %>

          <%-- List --%>
          <% active = null; %>
          <% if (isList){ %>
            <div class="input-group-list <%= lang %> <%= wdgTab %>">
          <% } %>
          <% for (int i = 0 ; i < length ; i++) {
               active = (isTab && active == null) ? "active" : ""; 
               String tabId  = isTab ? "id='tab_" + fieldId + "_" + lang + "_" + i + "'" : "";
          %>
            <div <%= tabId %> class='<%= !isArea ? "input-group" : "" %> tab-pane <%= active %> jalios-input-group'>
              <% if (Util.notEmpty(errorMessage)) { %>
                <jalios:message level="<%= MessageLevel.WARN %>" msg="<%= errorMessage %>" />
              <% } %>
              <% if (isKeyword){ %>
                <div class="jalios-input-keyword"><%= bodies[i] %></div>
              <% } else { %>
                <%= bodies[i] %>
              <% } %>
            </div>
          <% } %>
          <% if (isList){ %></div><% } %>

          <% if (isML) { %></div><% } %>

      <% } %>
    <% } %>
    
    <%-- Tabs ML --%>
    <% if (isML) { %></div><% } %>
    
    <%-- Hook --%>
    <% if (Util.notEmpty(getIncludeString("WIDGET_FOOTER", ""))) { %>
    <div class="clearfix field-footer"><%= getIncludeString("WIDGET_FOOTER", "") %></div>
    <% } %>
    
    <%-- Footer --%>
    <% if (Util.notEmpty(description)) { %>
    <p class="help-block"><%= glp(description) %></p>
    <% } %>
    
    <%= widgetAppend %>
  </div>
</div>