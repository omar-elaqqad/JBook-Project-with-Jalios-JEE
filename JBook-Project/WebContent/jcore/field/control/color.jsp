<%@ include file="/jcore/field/control/doInitControl.jspf" %><%
%><%
String colorChooserName = "color";
addOption(ChooserConstants.CHOOSER_NAME, colorChooserName);
addOption(ChooserConstants.CHOOSER_TITLE, ChooserConstants.CHOOSER_PREFIX_PROP + colorChooserName + ".title");

// Prevent to display the picker when the tabs has been changed
addOption(BasicSettings.CSS, "no-focus " + getOption(BasicSettings.CSS, ""));

jcmsContext.addJavaScript("frontlib/spectrum/js/spectrum.js");
jcmsContext.addJavaScript("frontlib/spectrum/js/jalios-spectrum.js");
jcmsContext.addCSSHeader("frontlib/spectrum/css/jalios-spectrum.css");
jcmsContext.addCSSHeader("frontlib/spectrum/css/spectrum.css");

ColorSettings settings = (ColorSettings) getIncludeObject(ControlTag.CONTROL_SETTINGS, null);
String options = settings.getJSONColorPickerOptions(userLang);
addOption(BasicSettings.HTML_ATTRIBUTES, "data-jalios-spectrum-options='"+ encodeForHTMLAttribute(options)+"' data-jalios-init-spectrum=\"true\" data-jalios-action=\"chooser:" + colorChooserName + "\" " + getOption(BasicSettings.HTML_ATTRIBUTES, ""));

%>
<jalios:javascript>
  jQuery(document).ready(function() {
    jQuery.jalios.spectrum.init();
  });
</jalios:javascript>
<%@ include file="/jcore/field/control/doText.jspf" %>