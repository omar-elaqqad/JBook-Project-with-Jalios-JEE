<%@ include file='/jcore/doInitPage.jspf' %><%@ page import="com.jalios.jcms.handler.QueryHandler" %><%
int boxStatus = Util.toInt(request.getAttribute("query.facets.lang"),0);
if (boxStatus == 0){ return; }

if (Util.getSize(channel.getLanguageList()) <= 1){
  return;
}

String FACET_PREFIX = (String) request.getAttribute("query.facets.prefix");
String lblPrefix = true ? "ui.fo.refine.lbl." : "ui.work.search.tab.";
QueryHandler qh = (QueryHandler) request.getAttribute("query.facets.handler");

boolean dslUserLang = Util.toBoolean((String) request.getAttribute("dslUserLang"),false);
String[] dslLangs = qh.getLangs();
Set langSet = new HashSet();
if (Util.notEmpty(dslLangs)) {
  langSet.addAll(Arrays.asList(dslLangs));
  boxStatus = 1;
}

List<String> values = channel.getLanguageList();
List<String> labels = new ArrayList<String>();
for(String itLang: values) {
  labels.add(Util.recapitalize(glp("lang." + itLang)));
}

String sidebarFilterId="filterLanguages";
boolean collapsed =  boxStatus == 2;
request.setAttribute("useLabelAsButton", true);
%>
<jalios:appSidebarSection icon="search-language" title='<%= glp(lblPrefix + "lang") %>' name="language" collapsable="true" collapsed='<%= collapsed %>'>
  <p class="app-sidebar-block"><%= glp("ui.work.search.lang.intro") %></p>
  <jalios:field name="langs" resource="field-app" value="<%= langSet %>" css="field-enumerate">
    <jalios:control settings='<%= 
    new LanguageSettings()
    .radio()
    .enumValues(channel.getLanguageList())
    .onChange("ajax-refresh")
     %>' />
  </jalios:field>
</jalios:appSidebarSection>