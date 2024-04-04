<%@ include file='/jcore/doInitPage.jspf' %><%

  Map<String, String[]> valueMap  = (Map<String, String[]>) getIncludeObject("values",null);
  Map<String, String[]> bodyMap   = (Map<String, String[]>) getIncludeObject("bodies",null);
  %><%
  boolean isTab = Util.toBoolean(getIncludeString("isTab", null), false);
  boolean isMulti = Util.toBoolean(getIncludeString("isMulti", null), false);
  boolean isRequired = Util.toBoolean(getIncludeString("isRequired", null), false);
  boolean isDisabled = Util.toBoolean(getIncludeString("isDisabled", null), false);
  boolean isKeyword = Util.toBoolean(getIncludeString("isKeyword", null), false);
  boolean isMultivalued = Util.toBoolean(getIncludeString("isMultivalued", null), false);
  boolean isArea = Util.toBoolean(getIncludeString("isArea", null), false);

  String fieldGroup = getIncludeString("fieldGroup", null);

  String errorMessage = getIncludeString("errorMessage", null);
  
  String label = getIncludeString("WIDGET_LABEL", getIncludeString("label", null));
  String tooltip = getIncludeString("tooltip", null);
  String description = getIncludeString("description", null);
  String name = getIncludeString("name", null);
  String fieldId = getIncludeString("fieldId", null);
  String fieldLabelId = getIncludeString("fieldLabelId", null);

  // Buffer
  String widgetAppend = getIncludeString("WIDGET_APPEND", "");
  String widgetPrepend = getIncludeString("WIDGET_PREPEND", "");
  String fieldAppend = getIncludeString("FIELD_APPEND", "");
  String fieldPrepend = getIncludeString("FIELD_PREPEND", "");
  
  int col = Util.toInt(getIncludeString("col", null), 1);
  
  // 0. Inline / Vertical
  boolean isInline = Util.toBoolean(request.getAttribute("field-inline"), false);
  boolean isVertical = Util.toBoolean(request.getAttribute("field-vertical"), false);
  boolean isHorizontal = Util.toBoolean(request.getAttribute("field-horizontal"), false);
  
  // 1. Wrapper
  int wrapMD  = col>1 ? 12/col*2  : 12;
  int wrapLG  = col>1 ? 12/col    : 12;
  String wrap = isVertical || col < 2  ? "" : "col-md-"+ wrapMD +" col-lg-" + wrapLG;
  
  // 2. Content
  int contSM  = col>2 ? 12-12/col : col==2 ? 8 : 12;
  int contMD  = col>1 ? contSM    : 9 ;
  
  // 3. Label
  int labelSM = col>2 ? 12-contSM : col==2 ? 4 : 12;
  int labelMD = col>1 ? 12-contSM : 3 ;

  // 4. Grid custom css
  if (isInline){
    contSM = 12; contMD = 12;
    wrap   += " field-inline";
  } 
  else if (isVertical){
    wrap   += " field-vertical";
  }
  else if (isHorizontal){
    labelSM = labelMD; contSM = contMD;
    wrap   += " field-horizontal";
  }
  
  boolean isML   = bodyMap.size() > 1;
  String  active = null;
  String  wdgTab = isTab ? "tab-content" : "";
  
  String controlLabelGridCss = isVertical ? "" : " col-md-" + labelMD;
  String widgetContentGridCss = isVertical ? "" : " col-md-" + contMD;
  
  String css = getIncludeString("css", "") + (isRequired ? " required" : "") 
                                           + (isDisabled ? " disabled" : "")
                                           + (isKeyword  ? " keyword"  : "")
                                           + (isMultivalued  ? " multivalued"  : "")
                                           + (isML  ? " multilingual"  : "");
  boolean isDnD = css.indexOf("nodnd") < 0 && !isTab;
%>
<div class="form-group <%= wrap %> widget <%= Util.notEmpty(name) ? "widget-name-" + name : "widget-custom" %> <%= css %>">
  <%-- LABEL --%>
  <% if (Util.notEmpty(label)){ %>
  <div class="control-label <%= controlLabelGridCss %> clearfix">
    <% if (Util.notEmpty(getIncludeString("WIDGET_LABEL", ""))) { %>
      <label<%= Util.notEmpty(fieldId) ? " for='" + fieldId + "'" : "" %> id="<%= fieldLabelId %>"><%= label %></label>
    <% } else { %>
        <span class="jalios-label-addon">
          <% if (isRequired){ %><jalios:icon title="ui.com.txt.mandatory-field" alt="ui.com.txt.mandatory" src="required"/><% } %>
          <% if (Util.notEmpty(tooltip)) { %>
            <% if (tooltip.indexOf(' ') >= 0) { %><jalios:tooltip><%= tooltip %></jalios:tooltip><% } else { %><jalios:tooltip property="<%= tooltip %>" /><% } %>
          <% } %>
        </span>
        <label<%= Util.notEmpty(fieldId) ? " for='" + fieldId + "'" : "" %> id="<%= fieldLabelId %>"><%= glp(label) %></label>
    <% } %>
  </div>
  <% } else if (!isInline && !isVertical){ %>
    <div class="col-md-<%= labelMD %>"></div>
  <% } %>

  <%-- CONTENT --%>
  <div class="widget-content<%= widgetContentGridCss %>">
    <%= widgetPrepend %>
    
    <%-- Tabs ML --%>
    <% if (isML) { %>
      <% if (false) { %>
      <ul class="nav nav-tabs br">
      <% active = "class='active'"; %>
      <% for (Map.Entry<String, String[]> itEntry : bodyMap.entrySet()) { %>
          <li <%= active %>><a href="#tab_<%= fieldId %>_<%= itEntry.getKey() %>" role="tab" data-toggle="tab" onclick="return false;"><%= itEntry.getKey() %></a></li>
      <% active = ""; } %>
      </ul>
      <% } %>
      <div class="tab-content">
    <% } %>
    
      <%-- Language --%>
      <% active = null; %>
      <% for (Map.Entry<String, String[]> itEntry : bodyMap.entrySet()) { %>
        <% 
          String lang = itEntry.getKey();
          String[] bodies = itEntry.getValue();
          
          if (Util.notEmpty(bodies)) {
            int length = isMulti ?  bodies.length : 1;
            String tag   = isMulti ? "li" : "div";
            String clazz = isMulti && isDnD ? "sortable-lazy sortable-y sortable-handle" : "";
            active = (active == null) ? "active" : "";
        %>
          <% if (isML) { %><div id="tab_<%= fieldId %>_<%= lang %>" class="tab-pane <%= active %> wdglang wdglang-<%= lang %>"><% } %>

          <%= fieldPrepend %>
          
          <%-- Area --%>
          <% if (isMulti && isTab) { active = null; %>
          <ul class="nav nav-pills jalios-nav-pills tab-group-list sortable no-tab-drop">
            <% for (int i = 0 ; i < length ; i++) { %>
              <% active = (active == null) ? " active" : ""; %>
              <li class="tab-group-list-item sortable-handle<%= active %>"><a href="#tab_<%= fieldId %>_<%= lang %>_<%= i %>" class="link-tab-<%= lang %>" role="tab" data-toggle="tab" <%= fieldGroup != null ? "data-jalios-fieldgroup='" + fieldGroup + "_" + i + "'" : "" %> onclick="return false;"><%= (i + 1) %></a></li>
            <% } %>
          </ul>
          <% } %>

          <%-- List --%>
          <% active = null; %>
          <% if (isMulti){ %><ol class="list-unstyled clearfix input-group-list <%= lang %> <%= wdgTab %> <%= clazz %>"><%= getIncludeString("FIELD_GRID_KEYWORD_BEFORE", "") %><% } %>
          <% for (int i = 0 ; i < length ; i++) {
               active = (isTab && active == null) ? "active" : ""; 
               String tabId  = isTab ? "id='tab_" + fieldId + "_" + lang + "_" + i + "'" : "";

          %><<%= tag %> <%= tabId %> class='<%= !isArea ? "input-group" : "" %> input-group-list-item tab-pane <%= active %> jalios-input-group'>
            <% if(Util.notEmpty(errorMessage)) { %><jalios:message level="<%= MessageLevel.WARN %>" msg="<%= errorMessage %>" title="" dismissable="false" /><% } %>
            <% if (isMulti && !isKeyword && isDnD){ %><img src="s.gif" class="grip sortable-handle" alt=""><% } %>
            <% if (isKeyword){ %><div class="jalios-input-keyword"><%= bodies[i] %></div><% } else { %><%= bodies[i] %><% } %>
            </<%= tag %>><% } %>
          <% if (isMulti){ %></ol><% } %>


          <% if (isMulti && !isKeyword && !isDisabled) { %>
            <a href="#" class="br<%= !isDisabled ? " add-field btn btn-default btn-xs": "" %>" onclick="return false;"><jalios:icon src="add-widget" /> <%= glp("ui.com.alt.widget-add") %></a>
          <% } %>

          <%= fieldAppend %>

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