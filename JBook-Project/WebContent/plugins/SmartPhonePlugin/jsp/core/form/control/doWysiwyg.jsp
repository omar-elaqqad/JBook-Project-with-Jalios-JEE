<%@page import="com.jalios.jcms.mention.MentionManager"%><%
%><%@ include file="/plugins/SmartPhonePlugin/jsp/core/form/control/doSmartPhoneInitControl.jspf" %><%

  addOption(BasicSettings.CSS, getOption(BasicSettings.CSS, "") + " smartphone-wiki-area");

  boolean mentionDisabled = !(MentionManager.getInstance().isMentionEnabled())
      || Util.toBoolean(getOption(WikiAreaSettings.MENTION, false), false);
  
  String disabledMentionCss = mentionDisabled ? "mention-disabled " : "";
  addOption(BasicSettings.CSS, disabledMentionCss + "wikiarea " + getOption(BasicSettings.CSS, ""));
  
  Map<String, Object> dataMap = getOption(BasicSettings.DATA_ATTRIBUTES, new HashMap<String, Object>());
  addOption(BasicSettings.DATA_ATTRIBUTES, dataMap); // Needed when the DATA_ATTRIBUTES option did not exist and has been initialized with a new HashMap()
  dataMap.put("data-autogrow", false);


%><%@ include file="/jcore/field/control/doTextArea.jspf" %>