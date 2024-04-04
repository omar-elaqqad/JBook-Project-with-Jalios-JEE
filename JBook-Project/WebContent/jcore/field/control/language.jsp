<%@page import="com.jalios.jcms.taglib.settings.ControlSettings"%><%
%><%@page import="com.jalios.jcms.taglib.settings.SelectorSettings"%><%
%><%@ include file="/jcore/field/control/doInitControl.jspf" %><%
%><%
SelectorType sType = getOption(SelectorSettings.SELECTOR_TYPE, SelectorType.RADIO);
if(SelectorSettings.SelectorType.CHOOSER.equals(sType)) {
  %><%@ include file="/jcore/field/control/doText.jspf" %><%  
} else {
  selectMode = SelectMode.LANGUAGE;
  Object[] langValues = (Object[]) getOption(SelectorSettings.ENUM_VALUES, null); 
  if(langValues != null) {
    List<String> labelPrepends = new ArrayList<String>();
    List<String> labels = new ArrayList<String>();
    for (int i = 0; i < langValues.length; i++) {
      String value = langValues[i].toString();      
      %><jalios:buffer name="langFlag"><jalios:lang lang="<%= value %>" /></jalios:buffer><%
      labelPrepends.add(langFlag);
      
      String label = glp("lang." + value);
      labels.add(label);
    }
    addOption(SelectorSettings.ENUM_LABEL_PREPENDS, labelPrepends.toArray(new String[] {}));
    addOption(SelectorSettings.ENUM_LABELS, labels.toArray(new String[] {}));
  }
  request.setAttribute("useSelect2", true);
  request.setAttribute("additionalCss", "select2-language");
  request.setAttribute("empty-value-label", glp("widget.language.all-languages.label"));
  %><%@ include file="/jcore/field/control/doEnumerate.jspf" %><%
  request.removeAttribute("additionalCss");
  request.removeAttribute("useSelect2");
  request.removeAttribute("empty-value-label");
}%>