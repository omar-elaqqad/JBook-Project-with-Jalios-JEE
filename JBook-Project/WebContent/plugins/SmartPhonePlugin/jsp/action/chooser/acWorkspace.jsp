<%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneManager"%><%
%><%@page import="com.jalios.jcmsplugin.smartphone.chooser.impl.SmartPhoneWorkspaceChooser"%><%
%><%@ taglib uri="/jcmsplugin/SmartPhonePlugin/tld/smartphone.tld" prefix="smartphone" %><%
  request.setAttribute("CheckCSRF", Boolean.TRUE);
%><%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%

if (loggedMember == null){
  return;
}

int pageSize = SmartPhoneManager.getInstance().getChooserPageSize();
String autocomplete = getUntrustedStringParameter("q",""); // ENCODE !!

if (Util.isEmpty(autocomplete)) {
  return;
}

// options retrieved from autocomplete.js, same options are used in memberChooser.jsp
int skip = getIntParameter("skip", 0);

SmartPhoneWorkspaceChooser chooser = new SmartPhoneWorkspaceChooser(autocomplete, null, loggedMember, userLang);

Map<String, String> paramMap = new HashMap<String, String>();
paramMap.put("skip", String.valueOf(skip + pageSize));

PageResult<Workspace> pageResult = chooser.getPageResult(skip, pageSize);
if (pageResult.getTotalSize() == 0) { %>
  <li class="chooser-noresults"><%= glp("ui.com.lbl.no-result") %></li>
<% } else { %>
  <jalios:foreach type="Workspace" collection="<%= pageResult.getResultList() %>" name="itWorkspace">
    <smartphone:listItem resource="smartphone.listItem.chooser.Workspace" data="<%= itWorkspace %>"/>
  </jalios:foreach>
<% } %>
<% if ((skip + pageSize) < pageResult.getTotalSize()) { %>
  <li class="ui-listview-showmore">
    <a data-role="button" data-theme="b" data-jalios-ajax-params-form=".chooser-form" data-jalios-ajax-method="post" class="btn-primary ajax-refresh ui-link ui-btn ui-btn-b ui-shadow ui-corner-all" data-jalios-ajax-params='<%= SmartPhoneManager.getInstance().getJsonString(paramMap) %>' data-jalios-ajax-action="plugins/SmartPhonePlugin/jsp/action/chooser/acWorkspace.jsp"><%= glp("jcmsplugin.smartphone.action.showmore") %></a>
  </li>    
<% } %>