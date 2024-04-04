<%@page import="org.apache.commons.lang3.StringUtils"%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%

%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.handler.PropertiesEditorHandler'><%
  %><jsp:setProperty name="formHandler" property="pageContext" value="<%= pageContext %>"/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
%></jsp:useBean><%

  if (formHandler.validate()) {
    return;
  }

  final String text = formHandler.getText();
  final boolean onlyModifiedProp = formHandler.isOnlyModifiedProp();
  final boolean includeLangProp = formHandler.isIncludeLangProp();
  
  final Map<String,String> filteredProperties = formHandler.getFilteredProperties();
  
  jcmsContext.addCSSHeader("css/jalios/ux/jalios-propeditor.css");
  
  if (!jcmsContext.isAjaxRequest()) {
    final String pageTitle = glp("ui.adm.prop-editor.title", filteredProperties.size());
    request.setAttribute("title", pageTitle);  
    %><%@ include file="/admin/doAdminHeader.jspf" %><%
    %><div class="page-header"><h1><%= pageTitle %></h1></div><%
  }
 
%><%!
public String getAttributeForPropertyValue(String propValue) {
  return (propValue != null && propValue.contains("\n")) ? "pre" : "code";
}
%>
<div id="properties-editor">
 <%@ include file='/jcore/doMessageBox.jspf' %>
 
 <%-- NAVBAR --%>
 <form action='<%= ServletUtil.getResourcePath(request) %>' 
       name='propertiesForm' class='noSingleSubmitButton form-inline'>
   <div class="navbar navbar-default navbar-table-header">
   
     <div class="container-fluid">
     
       <div class="navbar-left navbar-form">

          <%-- Add a property button --%>
          <a href="admin/properties/editor/propEditorModal.jsp" 
             class="btn btn-default modal"><jalios:icon src="add" /> <%= glp("ui.adm.prop-editor.action.add") %></a>
             
             
          <div class="btn-group">
             <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
               <jalios:icon src='filter' /> <span class="hidden-xs hidden-sm"><%= glp("ui.com.txt.filters") %></span> <jalios:icon src='caret' />
             </button>
             
             <ul class="dropdown-menu">
               <%-- Modified prop filter --%>
               <li class="container-fluid">
                  <jalios:field label="ui.adm.prop-editor.filter.modified" name='onlyModifiedProp' resource="field-vertical">
                    <jalios:control settings='<%= new BooleanSettings().radio().value(onlyModifiedProp).onChange("submit()") %>' />
                  </jalios:field>
               </li>
               
               <%-- Lang prop filter --%>
               <li class="container-fluid">
                   <jalios:field label="ui.adm.prop-editor.filter.include-i18n" name='includeLangProp' resource="field-vertical">
                     <jalios:control settings='<%= new BooleanSettings().radio().value(includeLangProp).onChange("submit()") %>' />
                   </jalios:field>
               </li>
            </ul>
            
          </div><%-- EOF .btn-group --%>  
                 
       </div><%-- EOF .navbar-left --%>  
       
       <div class="navbar-right navbar-form">
       
          <div class="form-group">
          
             <%-- Text search --%>
             <jalios:field name='text' value="<%= text %>" resource="field-light">
               <% 
               TextFieldSettings textTFS = new TextFieldSettings().placeholder("ui.com.placeholder.search"); 
               //textTFS.css("typeahead").htmlAttributes("data-jalios-ajax-refresh-url=\"admin/properties/editor/acproperties.jsp?onlyModifiedProp="+onlyModifiedProp+"&amp;includeLangProp="+includeLangProp+"\"");
               %>
               <jalios:control settings='<%= textTFS %>' />
               <span class="input-group-btn">
                <% if (Util.notEmpty(text)) { %>
                 <button type="button" name="opClearSearch" class="btn btn-default" title="<%= encodeForHTMLAttribute(glp("ui.com.alt.clear")) %>"
                         data-jalios-action="remove:value|submit" data-jalios-target="input[name=text]|input[name=text]">
                   <jalios:icon src="clear" />
                 </button>
                 <% } %>
                 <button class="btn btn-default" name="opSearch" type="submit"><jalios:icon src="search"/></button>
               </span>               
             </jalios:field>
                
           </div>
                 
       </div><%-- EOF .navbar-right --%>  
       
     </div><%-- EOF .container-fluid --%>  
       
   </div><%-- EOF .navbar --%>  
   
   <%= printHiddenParams(request, Util.getArrayList("text", "onlyModifiedProp", "includeLangProp", "opSearch", "opClearSearch"), true) %>
 </form>
 
<%-- Table with property listing --%>
<%-- 
 Put the whole table in a buffer to replace $SHOW_LABEL_COL and $SHOW_ORIGINAL_VALUE_COL 
 once we have iterated all value, and thus we know it is relevant to show column. 
--%>
<%
 boolean showLabelColumn = false;
 boolean showOriginalValueColumn = false;
%>
<jalios:buffer name="propTableBuffer">
<table id='propTable' class="table-data">

 <thead>
  <tr>
   <th scope="col" class="fit nowrap"><%= glp("ui.adm.prop-editor.prop-key") %></th>
   <th scope="col" class="nowrap $SHOW_LABEL_COL"><%= glp("ui.adm.prop-editor.prop-label") %></th>
   <th scope="col"><%= glp("ui.adm.prop-editor.prop-value") %></th>
   <th scope="col" class="$SHOW_ORIGINAL_VALUE_COL"><%= glp("ui.adm.prop-editor.prop-original") %></th>
   <th scope="col" class="fit nowrap"></th>
  </tr>
 </thead>

 <jalios:pager name='propPagerHandler' declare="true" action='init' size='<%= filteredProperties.size() %>'/>
 <tbody>
  <%
  int propCounter = 0;
  for (Map.Entry<String,String> entry : filteredProperties.entrySet()) {
    if (propCounter++ < propPagerHandler.getStart()) {
      continue;
    }
    if (propCounter > propPagerHandler.getStart() + propPagerHandler.getPageSize()) {
      break;
    }
    final String propKey = entry.getKey();
    final String propValue = entry.getValue();
    final boolean isModifiedProperty = com.jalios.jcms.handler.PropertiesEditorHandler.isPropertyModified(propKey);
    final boolean isMainPluginProperty = com.jalios.jcms.handler.PropertiesEditorHandler.isMainPluginProperty(propKey);
    
    %><%@ include file="doInitPropertyInfos.jspf" %><%
        showLabelColumn |= (Util.notEmpty(propLabel) || Util.notEmpty(propDescription));
        showOriginalValueColumn |= isModifiedProperty;
    %>
  <tr>
   <%-- Key --%>
   <td class="fit nowrap">
     <code><%= encodeForHTML(propKey) %></code>
   </td>
   
   <%-- Label --%>
   <td class="$SHOW_LABEL_COL">
      <% if (Util.notEmpty(propLabel)) {%><%= encodeForHTML(propLabel) %><% } %>
      <% if (Util.notEmpty(propDescription)) {%><jalios:tooltip><%= propDescription %></jalios:tooltip><% } %>
   </td>
   
   <%-- Current Value --%>
   <td class="text-overflow">
     <%
     { 
       final String printedPropValue = propValue;
       final String printedPropTitle = "";
       %><%@ include file="doPrintPropertyValue.jspf" %><%
     }
     %>
   </td>
   
   <%-- Original Value --%>
   <td class="text-overflow $SHOW_ORIGINAL_VALUE_COL">
     <%
     {
       final String printedOriginalPropKey = propKey;
       final String printedOriginalPropValue = propValue;
       %><%@ include file="doPrintPropertyOriginalValue.jspf" %><%
     }
     %>
   </td>
   
   <td>
    <div class="nowrap">
     <a href="admin/properties/editor/propEditorModal.jsp?propKeys=<%= encodeForURL(propKey) %>&allowPropKeyModification=false" 
        class="btn btn-default btn-sm modal <%= isMainPluginProperty ? "disabled" : "" %>"><%= glp("ui.adm.prop-editor.action.edit") %></a>
     <% if (isMainPluginProperty) { %>
      <jalios:tooltip><%= glp("ui.adm.prop-editor.msg.main-plugin-prop", propKey) %></jalios:tooltip>       
     <% } %>
    </div>
   </td>
  </tr>
  <% } %>
 </tbody>
</table>
 <jalios:pager name='propPagerHandler'/>
</jalios:buffer>
 <%= propTableBuffer.replace("$SHOW_LABEL_COL", showLabelColumn ? "" : "hide")
                    .replace("$SHOW_ORIGINAL_VALUE_COL", showOriginalValueColumn ? "" : "hide") %>
</div>

</div>
<% if (!jcmsContext.isAjaxRequest()) { %>
<%@ include file="/admin/doAdminFooter.jspf" %>
<% } %>