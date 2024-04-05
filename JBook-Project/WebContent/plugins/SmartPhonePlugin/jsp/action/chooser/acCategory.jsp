<%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneManager"%>
<%@page import="com.jalios.jcmsplugin.smartphone.chooser.impl.SmartPhoneCategoryChooser"%>
<%@ taglib uri="/jcmsplugin/SmartPhonePlugin/tld/smartphone.tld" prefix="smartphone" %><%
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

String filterParam = getStringEnumParameter("filter", "", EnumUtils.toStringArray(CategoryFilter.class));
CategoryFilter filter = Util.notEmpty(filterParam) ? CategoryFilter.valueOf(filterParam) : null;
boolean selectable = getBooleanParameter("selectable", true);
Set<Category> parentSet = getDataSetParameterValues("rootCids", Category.class);
Set<Category> removeSet = getDataSetParameterValues("rm", Category.class);

SmartPhoneCategoryChooser chooser = new SmartPhoneCategoryChooser(autocomplete, null, loggedMember, userLang, filter, selectable, parentSet, removeSet);

Map<String, String> paramMap = new HashMap<String, String>();
paramMap.put("skip", String.valueOf(skip + pageSize));

PageResult<Category> pageResult = chooser.getPageResult(skip, pageSize);
if (pageResult.getTotalSize() == 0) { %>
  <li class="chooser-noresults"><%= glp("ui.com.lbl.no-result") %></li>
<% } else { %>
  <jalios:foreach type="Category" collection="<%= pageResult.getResultList() %>" name="itCategory">
    <smartphone:listItem resource="smartphone.listItem.chooser.Category" data="<%= itCategory %>"/>
  </jalios:foreach>
<% } %>
<% if ((skip + pageSize) < pageResult.getTotalSize()) { %>
  <li class="ui-listview-showmore">
    <a data-role="button" data-theme="b" data-jalios-ajax-params-form=".chooser-form" data-jalios-ajax-method="post" class="btn-primary ajax-refresh ui-link ui-btn ui-btn-b ui-shadow ui-corner-all" data-jalios-ajax-params='<%= SmartPhoneManager.getInstance().getJsonString(paramMap) %>' data-jalios-ajax-action="plugins/SmartPhonePlugin/jsp/action/chooser/acCategory.jsp"><%= glp("jcmsplugin.smartphone.action.showmore") %></a>
  </li>    
<% } %>