<%@page import="com.jalios.jcms.taglib.card.CardsDisplayMode"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/doInitMemberProfile.jspf' %><%

if (logger.isTraceEnabled()) { logger.trace("doContacts.jsp: start render"); }

if (!esnProfileDisplayHandler.showConnections()) {
  if (logger.isTraceEnabled()) { logger.trace("doContacts.jsp: nothing to render"); }
  return;
}
List<String> connTypeAvailableValues = esnProfileDisplayHandler.getConnectionTypeValues();
String connectionType = getStringEnumParameter(ProfileDisplayHandler.CONNECTION_TYPE_PARAM, 
    ProfileDisplayHandler.CONNECTION_TYPE_ALL, 
    connTypeAvailableValues.toArray(new String[]{}));

boolean validateFollowSet = esnProfileDisplayHandler.isConnected();

boolean showAll       = ProfileDisplayHandler.CONNECTION_TYPE_ALL.equals(connectionType) || Util.isEmpty(connectionType);
boolean showAccount   = ProfileDisplayHandler.CONNECTION_TYPE_ACCOUNT.equals(connectionType);
boolean showContact   = ProfileDisplayHandler.CONNECTION_TYPE_CONTACT.equals(connectionType);
boolean showFollowing = validateFollowSet && ProfileDisplayHandler.CONNECTION_TYPE_FOLLOWING.equals(connectionType);
boolean showFollower  = validateFollowSet && ProfileDisplayHandler.CONNECTION_TYPE_FOLLOWER.equals(connectionType);

List<String[]> connTypeOptions = new ArrayList<>();
connTypeOptions.add( new String[]{ ProfileDisplayHandler.CONNECTION_TYPE_ALL, String.valueOf(showAll), glp("jcmsplugin.esn.lbl.connections.all-contacts")} );
connTypeOptions.add( new String[]{ ProfileDisplayHandler.CONNECTION_TYPE_ACCOUNT, String.valueOf(showAccount), glp("jcmsplugin.esn.lbl.connections.internal")} );
connTypeOptions.add( new String[]{ ProfileDisplayHandler.CONNECTION_TYPE_CONTACT, String.valueOf(showContact), glp("jcmsplugin.esn.lbl.connections.external")} );
if (validateFollowSet) {
  connTypeOptions.add( new String[]{ ProfileDisplayHandler.CONNECTION_TYPE_FOLLOWING, String.valueOf(showFollowing), glp("jcmsplugin.esn.lbl.followings")} );
  connTypeOptions.add( new String[]{ ProfileDisplayHandler.CONNECTION_TYPE_FOLLOWER, String.valueOf(showFollower), glp("jcmsplugin.esn.lbl.followers")} );
}

String labelProp = "";
Set<Member> memberSet = esnProfileDisplayHandler.getConnectionSet();
if (showFollowing) {
  labelProp = "jcmsplugin.esn.lbl.followings";
} else if (showFollower) {
  labelProp = "jcmsplugin.esn.lbl.connections.me";
} else if (showAccount) {
  labelProp = "jcmsplugin.esn.lbl.connections.internal";
} else if (showContact) {
  labelProp = "jcmsplugin.esn.lbl.connections.external";
} else {
  labelProp = "jcmsplugin.esn.lbl.connections.all-contacts";
}

String title = isMyProfile ? glp("jcmsplugin.esn.lbl.connections.me") : glp("jcmsplugin.esn.lbl.connections");
long count = Util.getSize(memberSet);
title += " (" + count + ")";
String connTypeParam = "esnProfileConnectionType";
String css = "profile-body-block connection-members profile-connections profile-card-deck";
css += " ajax-refresh-div";
String refreshUrl = "plugins/ESNPlugin/types/MemberProfile/doContacts.jsp";

EnumerateSettings typeSettings = new EnumerateSettings();
typeSettings.select();
Collection<String> connTypeValues = new ArrayList<>();
Collection<String> connTypeLabels = new ArrayList<>();
for (String[] option : connTypeOptions) {
  String value = option[0];
  String label = option[2];
  connTypeValues.add(value);
  connTypeLabels.add(label);
}
typeSettings.dataAttribute("jalios-action", "ajax-refresh");
typeSettings.enumValues(connTypeValues);
typeSettings.enumLabels(connTypeLabels);
String connTypeFilterHelp = glp("jcmsplugin.esn.lbl.connections.conn-type-filter.title");
typeSettings.aria("label", connTypeFilterHelp);
%>
<div class="<%= css %>" data-jalios-ajax-refresh-url="<%= refreshUrl %>">
  <div class="section-title"<%
      %> role="<%= ESNHTMLConstants.HEADING_ROLE %>"<%
      %> aria-level="3">
    <% if (Util.notEmpty(connTypeOptions)) { %>
    <form method="post" class="connection-filter-form">
      <jalios:field name="<%= connTypeParam %>" resource="field-light" css="connection-filter-connection-type" value="<%= connectionType %>" label='' required="true">
        <jalios:control settings="<%= typeSettings %>" />
      </jalios:field>
      <%= esnProfileDisplayHandler.getFormStepHiddenFields() %>
    </form>
    <% } %>
    <%= title %>
  </div>
  <% if (Util.notEmpty(memberSet)) { %>
    <jalios:pager name='pagerHandler' declare='true' action='init' pageSize='8' pageSizes="16,32" size='<%= memberSet.size() %>' paramPrefix="esnProfileContacts-"/>
    <jalios:cards mode="<%= CardsDisplayMode.INLINE %>">
      <jalios:foreach collection="<%= memberSet %>" type="Member" name="itData" max="<%= pagerHandler.getPageSize() %>" skip="<%= pagerHandler.getStart() %>">
        <%
        if (logger.isTraceEnabled()) { logger.trace("doContacts.jsp: start render of Contact: " + JcmsUtil.dataToString(itData)); }
        %>
        <jalios:link data='<%= itData %>'>
        <jalios:cardData data='<%= itData %>' template='esn-mbr-connection' />
        </jalios:link>
        <%
        if (logger.isTraceEnabled()) { logger.trace("doContacts.jsp: end render of Contact: " + JcmsUtil.dataToString(itData)); }
        %>
      </jalios:foreach>
    </jalios:cards>
    <jalios:pager name='pagerHandler' template='pqf' />
  <% } else { %>
    <%= glp("ui.com.lbl.no-result") %>
  <% } %>
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>

<%
if (logger.isTraceEnabled()) { logger.trace("doContacts.jsp: end render"); }
%>