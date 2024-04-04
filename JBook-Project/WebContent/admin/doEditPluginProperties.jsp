<%@ include file="/jcore/doInitPage.jspf" %>
<%
Plugin plugin = (Plugin) request.getAttribute("plugin");
Map props  = plugin.getEditableProperties();

if (Util.isEmpty(props)) { %>
  <jalios:message msg='<%= glp("ui.adm.plugin.edit.no-properties", plugin.getName()) %>' />

<% } else { %>
  <form name="displayForm" action="admin/displayPlugin.jsp" method="post" class="form-horizontal responsive">
    <div class="row">
      <jalios:foreach collection="<%= props.entrySet() %>" name="itEntry" type="Map.Entry">
      <%
      String itKey = (String) itEntry.getKey();

      String editor = WidgetUtil.getPropertyEditor(itKey);

      String itDefault = (String) itEntry.getValue();
      String itEditor = editor;
      String itShortKey = WidgetUtil.getShortProperty(itKey, itEditor);
      String itValue = channel.getProperty(itShortKey, itDefault);
      String itLabel = glp(itShortKey);

      String descriptionProp = (Util.notEmpty(editor) ? itShortKey : itKey) + ".help";
      String itDesc = glp(descriptionProp);
      itDesc = !descriptionProp.equals(itDesc) ? itDesc : null;

      ControlSettings controlSettings = WidgetUtil.getControlSettings(itEditor);
      %>
      <% if (controlSettings != null) { %>
        <jalios:field label="<%= itLabel %>" name="propValue" value="<%= itValue  %>" tooltip="<%= itDesc %>">
          <jalios:control settings="<%= controlSettings %>" />
          <jalios:buffer name="WIDGET_APPEND">
          <% if (Util.notEmpty(itDefault)) { %>
            <p class="help-block">
              <%= glp("ui.adm.plugin.lbl.prop-default") %> :
              <% if ("boolean".equals(itEditor)) { %><code><%= glp("ui.com.lbl." + itDefault) %></code><% } else { %><code><%= itDefault %></code><% } %>
            </p>
          <% } %>
          </jalios:buffer>
        </jalios:field>
        <input type="hidden" name="propName" value="<%= itShortKey %>" />

      <% } else { // JSP Editor %>
        <%
        String jsp = itDefault;
        // Redefine the default value by getting [the.plugin.prop].default property
        itDefault = channel.getProperty(itShortKey + ".default", "");
        // Get the value: can be the user value or the jsp value if the user hasn't enter a value
        itValue = channel.getProperty(itShortKey, itDefault);

        request.setAttribute("itKey", itKey);
        request.setAttribute("itDefault", itDefault);
        request.setAttribute("itEditor", itEditor);
        request.setAttribute("itShortKey", itShortKey);
        request.setAttribute("itValue", itValue);
        request.setAttribute("itLabel", itLabel);
        request.setAttribute("itDesc", itDesc);

        %><jalios:include jsp="<%= jsp %>" />
      <% } %>
    </jalios:foreach>
    </div>

    <p><input class="btn btn-primary" type="submit" name="opUpdateProperties" value="<%= glp("ui.com.btn.save") %>" /></p>

    <input type="hidden" name="name" value="<%= plugin.getName() %>" />
    <input type="hidden" name="redirect" value="admin/displayPlugin.jsp?name=<%= plugin.getName() %>" />

  </form>
<% } %>