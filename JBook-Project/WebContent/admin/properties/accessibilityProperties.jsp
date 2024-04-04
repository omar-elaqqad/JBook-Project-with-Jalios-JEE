<%@ include file="/admin/properties/doCommonProp.jspf" %><%

jcmsContext.addJavaScript("js/jalios/core/admin/jalios-admin-a11y-avoidance-links-editor.js");
%>
<div class="row">
<jsp:useBean id='avoidanceLinksHandler' scope='page' class='com.jalios.jcms.a11y.avoidancelinks.AvoidanceLinkAdminEditHandler'>
  <jsp:setProperty name="avoidanceLinksHandler" property="pageContext" value="<%= pageContext %>"/>
  <jsp:setProperty name='avoidanceLinksHandler' property='*' />
</jsp:useBean>

  <%-- --- PERFORMANCES ------------------------------ --%>
  <fieldset class="col-md-12">
    <legend ><%= glp("ui.adm.prop.a11y.avoidance-links") %></legend>
    <p><%= glp("ui.adm.prop.a11y.avoidance-links.intro") %></p>
    <jalios:field label="ui.adm.prop.a11y.avoidance-links.enabled.label" name='avoidance_links_enabled' value='<%= Util.toBoolean(formHandler.getAvoidance_links_enabled(),false) %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>
    <jalios:field label="ui.adm.prop.a11y.avoidance-contextual-links.enabled.label" description="ui.adm.prop.a11y.avoidance-contextual-links.enabled.desc" name='avoidance_contextual_links_enabled' value='<%= Util.toBoolean(formHandler.getAvoidance_contextual_links_enabled(),false) %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>
    <div class="avoidance-links">
      <jalios:field label="Avoidance links">
        <% request.setAttribute("field-vertical", true); %>
        <jalios:field tab="true" name="targets" description="ui.adm.prop.a11y.input.avoidance-links-targets.desc" value="<%= avoidanceLinksHandler.getAvoidanceLinksTargets() %>" mv="2" fieldGroup="avoidanceLinks" ml="false" css="nodnd">
          <jalios:control settings='<%= new TextFieldSettings().placeholder("Target").aria("label", glp("ui.adm.prop.a11y.input.avoidance-links-labels.label")) %>' />
        </jalios:field>
        <jalios:field tab="true" name="labels" description="ui.adm.prop.a11y.input.avoidance-links-labels.desc" value="<%= avoidanceLinksHandler.getAvoidanceLinksLabels() %>" mv="2" fieldGroup="avoidanceLinks" ml="true" css="nodnd">
          <jalios:control settings='<%= new TextFieldSettings().placeholder("Label").aria("label", glp("ui.adm.prop.a11y.input.avoidance-links-targets.label")) %>' />
        </jalios:field>
        <% request.setAttribute("field-vertical", false); %>
        <% if (channel.isMultilingual()) { %>
          <a href="#" lang="<%= userLang %>" class="ctxLangForm ctxmenu lang-fix langStatus btn btn-default"><%= glp("ui.com.lbl.language.edit") %> <jalios:lang lang='<%= userLang %>' /></a>
        <% } %>
      </jalios:field>
      <jalios:control settings='<%= new HiddenSettings().name("avoidance_links").css("js_avoidance_links_value").value(avoidanceLinksHandler.getPropValue()) %>' />
    </div>
  </fieldset>
</div>