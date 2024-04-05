<%@page import="com.jalios.jcmsplugin.smartphone.chooser.impl.SmartPhonePublicationChooser"%>
<%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneManager"%>
<%@ taglib uri="/jcmsplugin/SmartPhonePlugin/tld/smartphone.tld" prefix="smartphone" %><%--
--%><%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%

  if (loggedMember == null) {
    return;
  }

  int pageSize = SmartPhoneManager.getInstance().getChooserPageSize();
  int skip = getIntParameter("skip", 0);
  
  String autocomplete = getUntrustedStringParameter("q",""); // ENCODE !!
  
  if (Util.isEmpty(autocomplete)) {
    return;
  }
  
  String[] types = getStringParameterValues("super", HttpUtil.CLASSNAME_REGEX);
  if (types == null) {
    types = new String[]{"Publication"};
  }
  String[] searchedFields = getStringParameterValues("searchedFields", HttpUtil.CLASSNAME_REGEX);
  if (searchedFields == null) {
    searchedFields = new String[]{ com.jalios.jcms.search.LucenePublicationSearchEngine.TITLE_FIELD };
  }
  
  SmartPhonePublicationChooser chooser = new SmartPhonePublicationChooser(autocomplete, null, loggedMember, userLang, types, searchedFields);

  Map<String, String> paramMap = new HashMap<String, String>();
  paramMap.put("skip", String.valueOf(skip + pageSize));
  
  PageResult<Publication> pageResult = chooser.getPageResult(skip, pageSize);

  if (pageResult.getTotalSize() == 0) { %>
  <li class="chooser-noresults"><%= glp("ui.com.lbl.no-result") %></li>
<% } else { %>
  <jalios:foreach type="Publication" collection="<%= pageResult.getResultList() %>" name="itPub">
    <smartphone:listItem resource="smartphone.listItem.chooser.Publication" data="<%= itPub %>"/>
  </jalios:foreach>
<% } %>
<% if ((skip + pageSize) < pageResult.getTotalSize()) { %>
  <li class="ui-listview-showmore">
    <a data-role="button" data-theme="b" data-jalios-ajax-params-form=".chooser-form" data-jalios-ajax-method="post" class="btn-primary ajax-refresh ui-link ui-btn ui-btn-b ui-shadow ui-corner-all" data-jalios-ajax-params='<%= SmartPhoneManager.getInstance().getJsonString(paramMap) %>' data-jalios-ajax-action="plugins/SmartPhonePlugin/jsp/action/chooser/acPublication.jsp"><%= glp("jcmsplugin.smartphone.action.showmore") %></a>
  </li>    
<% } %>  