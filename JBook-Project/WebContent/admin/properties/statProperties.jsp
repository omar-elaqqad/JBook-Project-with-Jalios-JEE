<%@ include file="/admin/properties/doCommonProp.jspf" %>  
<div class="row">
  <fieldset class="col-md-12">
  
    <jalios:field label="ui.adm.prop.analytics.enabled" name='analytics_enable' value='<%= Util.toBoolean(formHandler.getAnalytics_enable(),true) %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>
    <jalios:field label="ui.adm.prop.stat.dns" name='analytics_resolvehost' tooltip="ui.adm.prop.stat.dns.h" value='<%= Util.toBoolean(formHandler.getAnalytics_resolvehost(),false) %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>
  </fieldset>
</div>