<%@page import="com.jalios.jcms.taglib.settings.impl.DateSettings"%><%
%><%@ include file="/plugins/SmartPhonePlugin/jsp/core/form/control/doSmartPhoneInitControl.jspf" %><%
%><%
addOption(BasicSettings.HTML_ATTRIBUTES, "data-jalios-action=\"chooser:date\" data-jalios-event=\"click\" " + getOption(BasicSettings.HTML_ATTRIBUTES, ""));
addOption("chooserName", "date");

boolean displayTime = getOption(DateSettings.DISPLAY_TIME, false);

// Set CSS for datetime
if (displayTime) {
  // Store the CSS to add on the field container
  String css = getIncludeString(FieldTag.FIELD_CONTROL_CSS, "");
  setIncludeString(FieldTag.FIELD_CONTROL_CSS, (Util.notEmpty(css) ? css + " " : "") + "jalios-date-time");
}

// 'broker': trigger the 'click' event
// 'no-focus': prevent to display the picker when the tabs has been changed
addOption(BasicSettings.CSS, "broker no-focus " + getOption(BasicSettings.CSS, ""));

// Compute Date
if (Util.notEmpty(fieldValue)) {
  SimpleDateFormat sdf = channel.getDateFormat(userLang);
  if (displayTime) {
    sdf = channel.getDateTimeFormat(userLang);
  }
  fieldValue = sdf.format(new Date(Util.toLong(fieldValue, 0)));
}

includeLocalObject("APPEND_CLEAR_BUTTON", true);
%><%
%>
<%
  String dateValue = "";
  String timeValue = "";
  if (Util.notEmpty(fieldValue)) {
    String[] splittedString = fieldValue.split(" ");
    if(splittedString.length > 0) {
      dateValue = splittedString[0];
    }
    if(splittedString.length > 1) {
      timeValue = splittedString[1];
    }
    if(splittedString.length == 0) {
      dateValue = fieldValue;
    }
  }
  
  // Fetch partly entered date (only date or only time)
  if(displayTime && Util.isEmpty(dateValue)) {
    dateValue = getUntrustedStringParameter(fieldName + "_dummy_date", "");
  }
  if(displayTime && Util.isEmpty(timeValue)) {
    timeValue = getUntrustedStringParameter(fieldName + "_dummy_time", "");
  }
  
%>
<div class="<%= displayTime ? "ui-grid-a" : "" %> date-time-wrapper">
  <input
    name="<%= fieldName %>"
    class="dateTime"
    value="<%= fieldValue %>"
    type="hidden"
  >
  <div class="dateChooser-wrapper <%= displayTime ? "ui-block-a" : "" %>">
    <input
      name="<%= fieldName %>_dummy_date"
      class="dateChooser"
      value="<%= dateValue %>"
      type="text"
      data-role="datebox"
      data-options='{"useLang":"<%= userLang %>", "mode":"calbox", "useFocus": true, "themeDateToday": "c"}'
    >
  </div>
  <div class="timeChooser-wrapper ui-block-b <%= displayTime ? "" : "timeChooser-wrapper-hidden" %>">
    <input
      name="<%= fieldName %>_dummy_time"
      value="<%= timeValue %>"
      class="timeChooser"
      type="text"
      data-role="datebox"
      data-options='{"useLang":"<%= userLang %>", "mode":"timeflipbox", "useFocus": true}'
    >
  </div>
</div>
