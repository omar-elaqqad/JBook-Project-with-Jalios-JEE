<%@page import="com.jalios.jcms.ui.IconManager"%>
<%@page import="com.jalios.jcms.taglib.settings.ControlSettings"%><%
%><%@page import="com.jalios.jcms.taglib.settings.SelectorSettings"%><%
%><%@ include file="/jcore/field/control/doInitControl.jspf" %><%
%><%
Class superTypeClass = getOption(TypeSettings.SUPER_TYPE, null) == null && Util.isEmpty((Collection<Class<?>>) getOption(TypeSettings.TYPES, null)) ? Publication.class : (Class) getOption(TypeSettings.SUPER_TYPE, null);
List<Class<? extends Publication>> superTypeClasses = (ArrayList) getOption(TypeSettings.SUPER_TYPES, new ArrayList<>());
Workspace typeWorkspace = getOption(TypeSettings.WORKSPACE, null);

request.setAttribute("additionalCss", "select2-enumerate select2-type");

// Type resolution
boolean isMultiple = getOption(TypeSettings.MULTIPLE, false);
boolean acceptSuperType = getOption(TypeSettings.ACCEPT_SUPER_TYPE, false);
String multiple = isMultiple ? "multiple=\"multiple\"" : "";
TypeSettings.addFrontEndDependencies(jcmsContext);
boolean isPublicationSuperClass = Publication.class == superTypeClass;

// Html attributes
String placeholder = Util.isEmpty(getOption(BasicSettings.PLACEHOLDER, "")) ? glp(TypeSettings.getPlaceHolderDefaultProp(superTypeClass)) : getOption(BasicSettings.PLACEHOLDER, "");
Map<String, Object> options = getOption(TypeSettings.OPTIONS, null) == null ? new HashMap<String, Object>() : (HashMap) getOption(TypeSettings.OPTIONS, null);
options.put("placeholder", placeholder);
String optionsAttribute = Util.notEmpty(options) ? "data-jalios-select2-options='" + TypeSettings.buildOptions(options) + "'" : null;
fieldRequired = getOption(SelectorSettings.REQUIRED, fieldRequired); // Check if required is overrided by the control
String dataAttributes = formatDataAttributes(getOption(BasicSettings.DATA_ATTRIBUTES, (Map<String, Object>) null));
String separator = getOption(TypeSettings.UNIQUE_VALUE_SEPARATOR, " ");
String title = Util.notEmpty(getOption(BasicSettings.TITLE, "")) ? " title=\"" + glp(getOption(BasicSettings.TITLE, "")) + "\" " : "";
Map<String, Object> ariaAttributesMap = getOption(BasicSettings.ARIA_ATTRIBUTES, (Map<String, Object>) null);
ControlUtils.autoFillAriaAttributes(ariaAttributesMap, fieldResource, fieldLabelId);
String ariaAttributes = formatAriaAttributes(ariaAttributesMap);

// Append / Prepend
String prepend = getIncludeString("PREPEND", getOption(BasicSettings.PREPEND, ""));
String append = getIncludeString("APPEND", getOption(BasicSettings.APPEND, ""));

// Unique value / Multiple values
boolean isUniqueValue = getOption(TypeSettings.IS_UNIQUE_VALUE, false);

setIncludeString("isMulti", "false"); // Set isMulti to 'false' to prevent the parent tag to loop multiple times on this tag

Set<Class<? extends Publication>> classValues = TypeSettings.getClassValues(fieldValues, fieldValue, separator);

%>
<% if (Util.notEmpty(prepend)) { %><span class="input-group-addon"><%= prepend %></span><% } %>
<select <%= title %> class="select2-enumerate select2-type form-control <%= isUniqueValue ? "js-unique-value" : "" %>" <%= ariaAttributes %> name="<%= isUniqueValue ? "" : HttpUtil.encodeForHTMLAttribute(fieldName) %>" <%= multiple %> <%= optionsAttribute %> <%= dataAttributes %>>
  <% if (!fieldRequired.booleanValue()) { %><option value=""><%= placeholder %></option><% } %>
  <%-- CASE 1 : multiple superTypes have been defined --%>
  <% if (Util.notEmpty(superTypeClasses)) { %>
    <% for (Class itTypeClass : superTypeClasses) { %>
      <% Set<Class> subClasses = TypeSettings.getTypes(itTypeClass, typeWorkspace, userLang, acceptSuperType); %>
      <% if (superTypeClasses.size() > 1) { %>
        <optgroup label="<%= encodeForHTMLAttribute(glp("widget.type.optgroup.superclass." + itTypeClass.getSimpleName())) %>">
      <% } %>
        <% if (acceptSuperType) { %>
          <% 
            String contentSelected = classValues.contains(itTypeClass) ? "selected='selected'" : "";
            String acceptSuperTypeLabel = JcmsUtil.glpNoDefault(userLang, "widget.type.option.superclass." + itTypeClass.getSimpleName()) != null ? JcmsUtil.glpNoDefault(userLang, "widget.type.option.superclass." + itTypeClass.getSimpleName()) : glp("widget.type.option.superclass.inherit", channel.getTypeEntry(itTypeClass).getLabel(userLang));
          %>
          <jalios:buffer name="classIcon"><jalios:icon src="<%= IconManager.getInstance().getClassIcon(itTypeClass) %>" /></jalios:buffer>
          <option data-jalios-icon="<%= encodeForHTMLAttribute(classIcon) %>" value="<%= itTypeClass.getName() %>" <%= contentSelected %>><%= encodeForHTML(acceptSuperTypeLabel) %></option>
        <% } %>
        <% for (Class itClass : subClasses) { %>
          <% String selected = classValues.contains(itClass) ? "selected='selected'" : ""; %>
          <jalios:buffer name="contentIcon"><jalios:icon src="<%= IconManager.getInstance().getClassIcon(itClass) %>" /></jalios:buffer>
          <option data-jalios-icon="<%= encodeForHTMLAttribute(contentIcon) %>" value="<%= itClass.getName() %>" <%= selected %>><%= channel.getTypeEntry(itClass).getLabel(userLang) %></option>
        <% } %>
      </optgroup>
    <% } %>
  <% } else { %>
  <%-- CASE 2 : a set of specific types have been defined --%>
    <% Collection<Class> types = getOption(TypeSettings.TYPES, null) != null ? (Collection) getOption(TypeSettings.TYPES, null) : TypeSettings.getTypes(superTypeClass, typeWorkspace, userLang, acceptSuperType); %>
    <% if (acceptSuperType) { %>
      <% 
        String selected = classValues.contains(superTypeClass) ? "selected='selected'" : ""; 
        String acceptSuperTypeLabel = JcmsUtil.glpNoDefault(userLang, "widget.type.option.superclass." + superTypeClass.getSimpleName()) != null ? JcmsUtil.glpNoDefault(userLang, "widget.type.option.superclass." + superTypeClass.getSimpleName()) : glp("widget.type.option.superclass.inherit", channel.getTypeEntry(superTypeClass).getLabel(userLang));
      %>
      <jalios:buffer name="superClassIcon"><jalios:icon src="<%= IconManager.getInstance().getClassIcon(superTypeClass) %>" /></jalios:buffer>
      <option data-jalios-icon="<%= encodeForHTMLAttribute(superClassIcon) %>" value="<%= superTypeClass.getName() %>" <%= selected %>><%= encodeForHTML(acceptSuperTypeLabel) %></option>
    <% } %>
    <% for (Class<?> itType : types) { %>
      <% if (itType == UserContent.class || itType == Content.class || itType == Form.class || itType == Portlet.class) { %>
        <% Set<Class> subClasses = TypeSettings.getTypes(itType, typeWorkspace, userLang, acceptSuperType); %>
        <optgroup label="<%= encodeForHTMLAttribute(glp("widget.type.optgroup.superclass." + itType.getSimpleName())) %>">
        <% for (Class itClass : subClasses) { %>
          <% String selected = classValues.contains(itClass) ? "selected='selected'" : ""; %>
          <jalios:buffer name="subTypeIcon"><jalios:icon src="<%= IconManager.getInstance().getClassIcon(itClass) %>" /></jalios:buffer>
          <option data-jalios-icon="<%= encodeForHTMLAttribute(subTypeIcon) %>" value="<%= itClass.getName() %>" <%= selected %>><%= channel.getTypeEntry(itClass).getLabel(userLang) %></option>
          
        <% } %>
        </optgroup>
      <% } else { %>
        <% String selected = classValues.contains(itType) ? "selected='selected'" : ""; %>
        <jalios:buffer name="typeIcon"><jalios:icon src="<%= IconManager.getInstance().getClassIcon(itType) %>" /></jalios:buffer>
        <option data-jalios-icon="<%= encodeForHTMLAttribute(typeIcon) %>" value="<%= itType.getName() %>" <%= selected %>><%= channel.getTypeEntry(itType).getLabel(userLang) %></option>
      <% } %>
    <% } %>
  <% } %>
</select>
<% if (isUniqueValue) { %>
  <% String uniqueValue = TypeSettings.getUniqueValue(fieldValues, getOption(TypeSettings.UNIQUE_VALUE_SEPARATOR, " ")); %>
  <jalios:control settings='<%= new HiddenSettings().css("js-unique-value-input").name(fieldName).value(uniqueValue).dataAttribute("jalios-type-value-separator", getOption(TypeSettings.UNIQUE_VALUE_SEPARATOR, "&nbsp;")) %>' />
<% } %>
<% if (!isMultiple && !fieldRequired) { %>
  <span class="input-group-btn <%= (isMultiple && Util.isEmpty(fieldValues)) || (Util.notEmpty(fieldValue)) ? "" : "hide" %>">
    <% if (Util.notEmpty(append)) { %><span class="input-group-addon"><%= append %></span><% } %>
    <button class="btn btn-default js-type-clear" type="button" title="<%= glp("widget.type.clear.title") %>" aria-label="<%= glp("widget.type.clear.title") %>"><jalios:icon src="clear" /></button>
  </span>
<% } else { %>
  <% if (Util.notEmpty(append)) { %><span class="input-group-addon"><%= append %></span><% } %>
<% } %>
<%= getIncludeString("CONTROL_APPEND", "") %>
<%
  request.removeAttribute("additionalCss");
%>
<jalios:buffer name="formType">
<script class="hdb-template" id="hdb-form-type" type="text/x-handlebars-template"><%--
--%><span>{{{imgHtml}}} {{state.text}}</span><%--
--%></script>
</jalios:buffer>
<jalios:buffer name="formTypeSelected">
<script class="hdb-template" id="hdb-form-type-selected" type="text/x-handlebars-template"><%--
--%><span>{{{imgHtml}}} {{state.text}}</span><%--
--%></script>
</jalios:buffer>
<%= jcmsContext.addHandlebarTemplate("formType", formType) %>
<%= jcmsContext.addHandlebarTemplate("formTypeSelected", formTypeSelected) %>