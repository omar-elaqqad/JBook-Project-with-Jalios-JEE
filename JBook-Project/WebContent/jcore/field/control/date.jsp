<%@page import="java.time.format.DateTimeFormatter"%><%
%><%@page import="com.jalios.jcms.taglib.settings.impl.DateSettings"%><%
%><%@ include file="/jcore/field/control/doInitControl.jspf" %><%
%><%
String dateChooserName = "date";
// addOption(BasicSettings.HTML_ATTRIBUTES, "data-jalios-action=\"chooser:" + dateChooserName + "\" data-jalios-event=\"click\" " + getOption(BasicSettings.HTML_ATTRIBUTES, ""));
addOption(ChooserConstants.CHOOSER_NAME, dateChooserName);
addOption(ChooserConstants.CHOOSER_TITLE, ChooserConstants.CHOOSER_PREFIX_PROP + dateChooserName + ".title");

if (!"en".equals(userLang)) {
  String jsLang = channel.getProperty("datepicker.languagekey-mapping." + userLang, userLang);
  jcmsContext.addJavaScript("js/lib/moment/locale/" + jsLang + ".js");
}

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

boolean timeZoneEnabled = channel.isTimeZoneEnabled();
if (timeZoneEnabled) {
  // Request the real input to be hidden
  includeLocalObject("hiddenField", true);
  // Timezone of the "real" input sent to the server 
  DateSettings settings = (DateSettings) getIncludeObject(ControlTag.CONTROL_SETTINGS, null);
  settings.dataAttribute("data-timezone", Channel.getChannel().getZoneId());
  // Timezone of the user visible input
  addOption(BasicSettings.HTML_ATTRIBUTES, "data-timezone=\""+userZoneId+"\" " + getOption(BasicSettings.HTML_ATTRIBUTES, ""));
}

// Compute Date
if (Util.notEmpty(fieldValue)) {
  Date date = new Date(Util.toLong(fieldValue, 0));
  // Visible user input, with date in the user timezone
  if (timeZoneEnabled) {
    DateTimeFormatter dtf = displayTime ? channel.getDateTimeFormatter(userLang) : channel.getDateFormatter(userLang);
    includeLocalObject("fieldValueDisplay", dtf.format(getZonedDateTime(date)));
  }
  // "real" Input value received and parsed by server, date timezone is the default timezone
  SimpleDateFormat sdf = displayTime ? channel.getDateTimeFormat(userLang) : channel.getDateFormat(userLang);
  fieldValue = sdf.format(date);
}

%><%
%><div class="datepicker-wrapper <%= displayTime ? "is-display-time" : "is-date-only" %>" data-date="<%= fieldValue %>"><%@ include file="/jcore/field/control/doText.jspf" %></div>