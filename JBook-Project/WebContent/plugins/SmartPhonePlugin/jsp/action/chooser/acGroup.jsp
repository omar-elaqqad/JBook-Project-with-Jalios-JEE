<%@page import="com.jalios.jcmsplugin.smartphone.chooser.impl.SmartPhoneGroupChooser"%>
<%@page import="com.jalios.jcmsplugin.smartphone.*"%>
<%@ taglib uri="/jcmsplugin/SmartPhonePlugin/tld/smartphone.tld" prefix="smartphone" %><%--
--%><%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%

  if (loggedMember == null){
    return;
  }
  
  int pageSize = SmartPhoneManager.getInstance().getChooserPageSize();
  int skip = getIntParameter("skip", 0);

  Set<Group> parentSet    = getDataSetParameterValues("acgids", Group.class);
  Workspace workspaceFilter = getDataParameter("wsid", Workspace.class);
  String autocomplete = getUntrustedStringParameter("q",""); // ENCODE !!

  if (Util.isEmpty(autocomplete)) {
    return;
  }
  
  SmartPhoneGroupChooser chooser = new SmartPhoneGroupChooser(autocomplete, null, loggedMember, userLang, parentSet, workspaceFilter);

  Map<String, String> paramMap = new HashMap<String, String>();
  paramMap.put("skip", String.valueOf(skip + pageSize));
  
  PageResult<Group> pageResult = chooser.getPageResult(skip, pageSize);
if (pageResult.getTotalSize() == 0) { %>
  <li class="chooser-noresults"><%= glp("ui.com.lbl.no-result") %></li>
<% } else { %>
  <jalios:foreach type="Group" collection="<%= pageResult.getResultList() %>" name="itGroup">
    <smartphone:listItem resource="smartphone.listItem.chooser.Group" data="<%= itGroup %>"/>
  </jalios:foreach>
<% } %>
<% if ((skip + pageSize) < pageResult.getTotalSize()) { %>
  <li class="ui-listview-showmore">
    <a data-role="button" data-theme="b" data-jalios-ajax-params-form=".chooser-form" data-jalios-ajax-method="post" class="btn-primary ajax-refresh ui-link ui-btn ui-btn-b ui-shadow ui-corner-all" data-jalios-ajax-params='<%= SmartPhoneManager.getInstance().getJsonString(paramMap) %>' data-jalios-ajax-action="plugins/SmartPhonePlugin/jsp/action/chooser/acGroup.jsp"><%= glp("jcmsplugin.smartphone.action.showmore") %></a>
  </li>    
<% } %>