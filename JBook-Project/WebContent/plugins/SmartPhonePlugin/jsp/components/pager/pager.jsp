<%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneManager"%>
<%@page import="com.jalios.jcmsplugin.smartphone.taglib.SmartPhonePagerTag.PagerMode"%>
<%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%

String css = getIncludeString("css", "");
String parametersPrefix = getIncludeString("parametersPrefix", "");
int pageSize = Util.toInt(getIncludeObject("pageSize", 10), 10);
int totalSize = Util.toInt(getIncludeObject("totalSize", -1), 10);
int start = Util.toInt(getIncludeObject("start", 0), 0);
PagerMode pagerMode = (PagerMode) getIncludeObject("pagerMode", null);
Map<String, Object> parametersMap = (Map<String, Object>) getIncludeObject("parametersMap", new HashMap<String, Object>());
%>
<% if (PagerMode.PAGES == pagerMode) { %>
	<% int totalPages = (int) Math.ceil((double) totalSize / (double) pageSize); %>
	<% if (totalPages <= 1) {
	  return;
	} %>
  <div class="pager-wrapper">
    <% 
      Map<String, Object> prevParametersMap = Util.getHashMap(parametersMap);
      prevParametersMap.put(parametersPrefix + "start", start - pageSize);
      prevParametersMap.put("opPrev", true);
    %>
    <button type="button" class="btn btn-default btn-prev ajax-refresh <% if (start - pageSize < 0) { %>is-disabled<% } %>" data-jalios-ajax-refresh-inner="true" data-jalios-ajax-params='<%= SmartPhoneManager.getInstance().getParametersAsJsonString(prevParametersMap) %>'><jalios:icon src="prev" alt='<%= glp("ui.pager.txt.previous") %>' /> </button>
    <span class="pager-info"><%= (start / pageSize) + 1 %> / <%= totalPages %></span>
    <% 
      Map<String, Object> nextParametersMap = Util.getHashMap(parametersMap);
      nextParametersMap.put(parametersPrefix + "start", start + pageSize);
      nextParametersMap.put("opNext", true);
    %>
    <button type="button" class="btn btn-default btn-next ajax-refresh <% if (start + pageSize >= totalSize) { %>is-disabled<% } %>" data-jalios-ajax-refresh-inner="true" data-jalios-ajax-params='<%= SmartPhoneManager.getInstance().getParametersAsJsonString(nextParametersMap) %>'><jalios:icon src="next" alt='<%= glp("ui.pager.txt.next") %>' /></button>  
  </div>

<% } else if (PagerMode.SHOW_MORE == pagerMode && (pageSize + start < totalSize)) { %>
  <%
    String uniqueDomID = ServletUtil.generateUniqueDOMId(request, "jmobilePager");
    parametersMap.put("opSeeMore", true); 
    parametersMap.put(parametersPrefix + "start", start + pageSize);
  %>
  <div class="pager-seemore-wrapper refreshed-element-<%= uniqueDomID %>">
    <button type="button" class="btn btn-default btn-showmore ajax-refresh " data-jalios-remove-ajax-refresh-wrapper="true" data-jalios-ajax-target=".refreshed-element-<%= uniqueDomID %>" data-jalios-ajax-params='<%= SmartPhoneManager.getInstance().getParametersAsJsonString(parametersMap) %>'><%= glp("ui.com.txt.more-results") %></button>  
  </div>
<% } %>