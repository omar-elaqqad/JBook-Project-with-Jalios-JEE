<%--
  @Summary : Displays the accessPolicy field for a CollaborativeSpace instance.
             Customized with description appended to enum labels.
             Used by createSpace modal, and CS settings page.
  @Category: Edit FORM
  @Author: Sylvain Devaux <sylvain.devaux@jalios.com>
--%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@page import="com.jalios.jcms.handler.EditPublicationHandler"%><%
%><%@page import="java.util.*"%><%
%><%@page import="com.jalios.jcms.taglib.settings.*"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

EditPublicationHandler formHandler = (EditPublicationHandler) request.getAttribute("collaborative-space-edit-handler");
if (formHandler == null) {
  return;
}

// Retrieve current available access policies.
String[] availableAccessPolicies = (String[])request.getAttribute("collaborative-space-access-policies");
if (availableAccessPolicies == null) {
  return;
}

// For each available accessPolicy, append description
List<String> accessPolicyLabelAppends = new ArrayList<String>();
for (String itAccessPolicy : availableAccessPolicies) {
  String descKey = "jcmsplugin.collaborativespace.access-policy." + itAccessPolicy + ".desc";
  %><jalios:buffer name="descriptionBuffer"><jalios:tooltip property="<%= descKey %>" /></jalios:buffer><%
  accessPolicyLabelAppends.add(descriptionBuffer.toString());
}

// Define a customized SelectorSettings:
ControlSettings accessPolicySettings = new EnumerateSettings();
// String optionName = SelectorSettings.ENUM_LABEL_APPENDS;
String optionName = "enumLabelAppends"; // For JCMS < 9.0.3
accessPolicySettings.addOption(optionName, accessPolicyLabelAppends.toArray(new String[]{}));
%>
<jalios:field name="accessPolicy" required="true" formHandler="<%= formHandler %>">
  <jalios:buffer name="fieldId"> </jalios:buffer><%-- Prevent w3c error on orphan for attribute --%>
  <jalios:control settings="<%= accessPolicySettings %>" />
</jalios:field>
