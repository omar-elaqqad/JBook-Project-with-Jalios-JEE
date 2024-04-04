<%@page import="org.apache.commons.lang3.StringUtils"%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%

%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.handler.PropertiesEditorHandler"><%
  %><jsp:setProperty name="formHandler" property="pageContext" value="<%= pageContext %>"/><%
  %><jsp:setProperty name="formHandler" property="*" /><%
%></jsp:useBean><%

if (formHandler.validate()) {
  %><jalios:javascript>
    /* Hide our custom in progress modal, prevent duplicate in progress modals */
    jQuery('.prop-editor-modal.process-in-progress').remove();
    jQuery('.modal-redirect-tempo').removeClass('hide');
  </jalios:javascript>
  <div class="modal-redirect-tempo hide">
    <%@ include file="/jcore/modal/modalRedirect.jspf" %>
  </div>
  <%
  return;
}
final boolean allowPropKeyModification = getBooleanParameter("allowPropKeyModification", true);

// Key
final String propKey = Util.getString(Util.getFirst(formHandler.getPropKeys()), "");
final String propKeyWithoutSuffix = PropertiesEditorHandler.getUnsuffixedProperty(propKey); // may be null !!

// Value
final String propKeyToLookFor = propKeyWithoutSuffix != null ? propKeyWithoutSuffix : propKey;
String propValue = (formHandler.getPropValues() != null) ? Util.getFirst(formHandler.getPropValues()) : channel.getProperty(propKeyToLookFor);

// Property information
final boolean isModifiedProperty = com.jalios.jcms.handler.PropertiesEditorHandler.isPropertyModified(propKey);
final boolean isMainPluginProperty = com.jalios.jcms.handler.PropertiesEditorHandler.isMainPluginProperty(propKey);
final boolean isDisplayableProperty = com.jalios.jcms.handler.PropertiesEditorHandler.isDisplayableProperty(propKey);

if (!isDisplayableProperty) {
  propValue = null;
}

%><%@ include file="doInitPropertyInfos.jspf" %>

<jalios:javascript>
  /* Remove all previous possible modal */
  jQuery('.prop-editor-modal.process-in-progress:not(.hide)').remove();
  /* Toggle FORM modal / inProgress modal */
  jQuery('.prop-editor-modal BUTTON[name=opSave]').on('click', function() {
    jQuery('.prop-editor-modal, .prop-editor-modal.process-in-progress').toggleClass('hide');
  });
</jalios:javascript>

<jalios:modal title="msg.js.process-in-progress" css="prop-editor-modal process-in-progress hide">
  <jalios:buffer name="MODAL_CONTENT">
    <div class="modal-body text-center">
      <jalios:icon src="wait" /> 
    </div>
  </jalios:buffer>
</jalios:modal>

<jalios:modal title="ui.adm.prop-editor.modal.title"
              url="admin/properties/editor/propEditorModal.jsp"
              css='prop-editor-modal'
              op="opSave"
              button="ui.com.btn.save">

  <div class="prop-editor-form">
    <jalios:field name="propKeys" label="ui.adm.prop-editor.prop-key" value='<%= propKey %>' disabled="<%= !allowPropKeyModification %>">
      <jalios:control type="<%= ControlType.TEXTFIELD %>" />
      <% if (!allowPropKeyModification) { %>
      <%= printHiddenParams(request, Util.getArrayList("propKeys"), false) %>
      <% } %>
    </jalios:field>
    <% if (Util.isEmpty(propKey)) { %>
    <jalios:field name="propValues" label="ui.adm.prop-editor.prop-value" value='<%= propValue %>'>
      <jalios:control type="<%= ControlType.TEXTAREA %>"/>
    </jalios:field>
    <% } else { %>
        <% final ControlSettings controlSettings = (propValue != null && propValue.contains("\n")) ? new TextAreaSettings() : WidgetUtil.getControlSettings(propEditor); %>
        <% final String propValuesCSS = !allowPropKeyModification ? "focus" : ""; %>
        <% if (controlSettings != null) { %>
          <jalios:field label='<%= Util.getString(propLabel, "ui.adm.prop-editor.prop-value") %>' name="propValues" value="<%= propValue  %>" tooltip="<%= propDescription %>" css="<%= propValuesCSS %>">
            <jalios:control settings="<%= controlSettings %>" />
          </jalios:field>
        <% } else { %>
          <jalios:field name="propValues" label="ui.adm.prop-editor.prop-value" value='<%= propValue %>' css="<%= propValuesCSS %>">
            <jalios:control type="<%= ControlType.TEXTAREA %>"/>
          </jalios:field>
        <% } %>
    <% } %>
    
    <% if (isModifiedProperty) { %>
    <jalios:field label="ui.adm.prop-editor.prop-original">
     <%
      {
         final String printedOriginalPropKey = propKey;
         final String printedOriginalPropValue = propValue;
         %><%@ include file="doPrintPropertyOriginalValue.jspf" %><%
      }
     %>
    </jalios:field>
    <% } %>
  </div>
</jalios:modal>