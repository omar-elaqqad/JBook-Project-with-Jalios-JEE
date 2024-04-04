<%@ include file='/jcore/doInitPage.jspf' %><%
%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.handler.VersionHandler"><%
%><jsp:setProperty name="formHandler" property="request"       value="<%= request %>"/><%
%><jsp:setProperty name="formHandler" property="response"      value="<%= response %>"/><%
%><jsp:setProperty name="formHandler" property="*" /><%
%></jsp:useBean><%
%><%
if (formHandler.validate()) {
  return;
}

Publication lastPub = formHandler.getLastPub();
Workflow wf = lastPub == null ? null : lastPub.getWorkflow();
List<Publication> versionList = formHandler.getVersionList();
List<Publication> rVersionList = formHandler.getReverseVersionList();

Publication selectedVersion = formHandler.getSelectedVersion();

boolean isDeleted = formHandler.isDeletedPub();



int openTab = formHandler.getOpenTab();


// ddate
String ddate = lastPub == null || lastPub.getDdate() == null ? "???" : DateFormat.getDateInstance(DateFormat.SHORT, userLocale).format(lastPub.getDdate());
String dtime = lastPub == null || lastPub.getDdate() == null ? "???" : DateFormat.getTimeInstance(DateFormat.SHORT, userLocale).format(lastPub.getDdate());



request.setAttribute("work-version","true");
request.setAttribute("title",  glp("ui.work.ver.title") + (lastPub == null ? "" : " " + lastPub.getTitle(userLang)));

String subMenuKey = isDeleted ? "deleted" : "my";
subMenuKey += (lastPub instanceof PortalElement) ? "Portlet" :
              (lastPub instanceof UserContent) ? "UGC" :
              (lastPub instanceof Form) ? "Form" : "Content";
subMenuKey += "WAMenu";
request.setAttribute(subMenuKey, "true");

if (lastPub != null && loggedMember.canWorkOn(lastPub)) {
  request.setAttribute("authorized", Boolean.TRUE);
}

//Set the Portal CSS
if (jcmsContext.getPortal() instanceof Portal){
  jcmsContext.addCSSHeader(((Portal)jcmsContext.getPortal()).getCssFile());
}

jcmsContext.addCSSHeader(JcmsJspContext.getFrontOfficeCSSHeader());
jcmsContext.addJavaScript(JcmsJspContext.getFrontOfficeJavaScriptSet());
jcmsContext.addCSSHeader("css/portal/jalios.css");
%>

<jalios:javascript>
 'JCMS.Version'._namespace({
     showFieldsMerged   : function(element) {
       element.getElementsBySelector('.show_fields').each(Element.show);
       element.getElementsBySelector('.merge_fields').each(Element.hide);
     },
     showFieldsCompared : function(element) {
       element.getElementsBySelector('.show_fields').each(Element.hide);
       element.getElementsBySelector('.merge_fields').each(Element.show);
     }
 });
</jalios:javascript>


<%@ include file='/work/doWorkHeader.jspf' %>

<% if (Util.isEmpty(rVersionList)) { %>
<%@ include file='/front/app/doAppNoResult.jspf' %>


<% } else { %>

<div class="page-header">
  <h1><%= glp("ui.work.ver.title") %>
    <% if (isDeleted) { %>
    <i><%= lastPub.getTitle(userLang) %></i>
    <% } else { %>
    <jalios:link data='<%= lastPub %>'/>
    <% } %>
  </h1>
</div>
<% if (isDeleted) { %>
  <%
  String delOpAuthor = lastPub.getOpAuthor() == null ? "???" : (lastPub.getOpAuthor().canBeReadBy(loggedMember) ? lastPub.getOpAuthor().getFullName() : glp("ui.com.lbl.restricted-mbr")) ;
  String delOpDelegate = lastPub.getOpDelegate() == null ? null : (lastPub.getOpDelegate().canBeReadBy(loggedMember) ? lastPub.getOpDelegate().getFullName() : glp("ui.com.lbl.restricted-mbr"));
  %>
  <jalios:message level="<%= MessageLevel.WARN %>">
  <% if (delOpDelegate != null) { %>
  <%= glp("ui.work.ver.txt.del-pub-delegate", delOpAuthor, delOpDelegate, ddate, dtime) %>
  <% } else { %>
  <%= glp("ui.work.ver.txt.del-pub", delOpAuthor, ddate, dtime) %>
  <% } %>
  </jalios:message>
<% } %>

<div class="tab-container" id="versionTabPane">
  <ul class="nav nav-tabs nav-tabs-underlined is-left-aligned" role="tablist">
    
    <li role="presentation" class="active"><a href="#versionHistory" aria-controls="versionHistory" role="tab" data-toggle="tab" onclick="return false;"><% /* %>Version History<% */ %><%= glp("ui.work.ver.tab.hist") %></a></li>
    
    <% if (formHandler.showVersion()) { %>
    <li role="presentation"><a href="#version" aria-controls="version" role="tab" data-toggle="tab" onclick="return false;"><%= glp("ui.work.ver.tab.disp", selectedVersion.getVersionString() ) %></a></li>
    <% } %>
    
    <% if (formHandler.showDiff()) { %>
    <li role="presentation"><a href="#showDiff" aria-controls="showDiff" role="tab" data-toggle="tab" onclick="return false;"><%= glp("ui.work.ver.tab.diff", formHandler.getNewVersion().getVersionString(), formHandler.getOldVersion().getVersionString()) %></a></li>
    <% } %>
    
  </ul>
  <div class="tab-content">
    
    <%-- VERSION LIST --%>
    <%@ include file="doVersionList.jspf" %>
    
    <%-- DISPLAY A SELECTED VERSION --%>
    <% if (formHandler.showVersion()) { %>
    <%@ include file="doVersionDisplay.jspf" %>
    <% } %>
    
    <%--DIFF 2 VERSIONS --%>
    <% if (formHandler.showDiff()) { %>
    <%@ include file="doVersionDiff.jspf" %>
    <% } %>
  
  </div>
</div>

<jalios:javascript>
  setSelectedTab("versionTabPane", <%= openTab %>);
</jalios:javascript>

<% } %>
<%@ include file='/work/doWorkFooter.jspf' %>
