<%--
  @Summary: Query Chooser : allow user to select search and query options for use in query field
--%><%@page import="com.jalios.jcms.unifiedinsert.InsertionContext"%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%  request.setAttribute("title", glp("ui.work.query-ch.title")); %><%
%><%@ include file="/jcore/doEmptyHeader.jspf" %><%

Calendar beginCalendar = Calendar.getInstance();
beginCalendar.setTime(new Date(System.currentTimeMillis()- 3*JcmsConstants.MILLIS_IN_ONE_MONTH));
Calendar endCalendar = Calendar.getInstance();
endCalendar.setTime(new Date());
java.text.DateFormatSymbols dfs = new java.text.DateFormatSymbols(userLocale);
String targetInput  = getChooserParameter("targetInput");
String targetLabel  = getChooserParameter("targetLabel");
boolean opValidate = hasParameter("opValidate");
boolean opPreview = hasParameter("opPreview");
	
	request.setAttribute("zone","InternalUI");
	
String ADVANCEDSEARCH_INPUT_ID_PREFIX = "SearchInputIdPrefix_";  

final boolean isUnifiedInsert = getBooleanParameter("isUnifiedInsert", false) || Util.toBoolean(request.getAttribute(InsertionContext.UNIFIED_INSERT_ATTR), false);
final boolean isGalleryPreview = getBooleanParameter("isGalleryPreview", false) || Util.toBoolean(request.getAttribute("QueryChooser-Gallery"), false);

if (opValidate) {

  %><jsp:useBean id="queryHandler" scope="page" class="com.jalios.jcms.handler.QueryHandler"><%
    %><jsp:setProperty name="queryHandler" property="request"  value="<%= request %>"/><%
    %><jsp:setProperty name="queryHandler" property="response" value="<%= response %>"/><%
    %><jsp:setProperty name="queryHandler" property="*" /><%
  %></jsp:useBean><%
  
  queryHandler.setIgnoreDefaultTypes(true);
  
  String queryString = queryHandler.getQueryString();    
  String readableQuery = queryHandler.getDescription();  
%>
<jalios:javascript>
<% if (isUnifiedInsert) {
  InsertionContext.addScripts(jcmsContext, request);
  if (isGalleryPreview) { %>
    jQuery.jalios.UnifiedInsert.insertInclude('gallery', jQuery.param({
      'query': '<%= encodeForJavaScript(queryString) %>'
    }));
  <% } else { %>
    jQuery.jalios.UnifiedInsert.insertInclude('query', jQuery.param({
      'params': '<%= encodeForJavaScript(queryString) %>'
    }));
  <% } %>
<% } else { %>
    var str = '<%= queryString %>';
    var readableQuery = '<%= encodeForJavaScript(readableQuery) %>';
  
    <% if (targetLabel != null && Util.notEmpty(targetLabel)) { %>
  		window.opener.<%= targetLabel %> = readableQuery;
  	<% } %>
  	<% if (targetInput != null && Util.notEmpty(targetInput)) { %>
      window.opener.<%= targetInput %> = str;
    <% } else { %>
      Popup.callback(str, readableQuery);
    <% } %>
    window.close();
 <% } %>
</jalios:javascript><%

 if (!isUnifiedInsert) {
%>
<jalios:message>
  <p><strong><%= glp("ui.com.lbl.description") %> : </strong></p> 
  <blockquote><%= encodeForHTML(readableQuery) %></blockquote>
  
  <p><strong><%= glp("types.PortletQueryForeach.tabs.query.label") %> : </strong></p>
  <pre><%= encodeForHTML(queryString) %></pre>
</jalios:message>
<%
 }
  
} // opValidate

if (!opValidate) {
 
  String qs = getUntrustedStringParameter("qs", null); // ENCODE !!
  com.jalios.jcms.handler.QueryHandler formHandler = null;
  try {
    formHandler = qs != null ? new com.jalios.jcms.handler.QueryHandler(qs) : null;
  } catch (IllegalArgumentException ex) {
    logger.warn("An invalid queryString was given to the QueryChooser, an empty search will be used : '"+qs+"' : " + ex.getMessage());
  }
  
  if (formHandler != null) { 
    formHandler.setCheckPstatus(false);
    request.setAttribute("formHandler", formHandler);
  }
%>
<div class="navbar-placeholder"></div>
<form name="queryForm" action="work/queryChooser.jsp" method="post" class="form-horizontal">
  <input type="hidden" name="targetInput" value='<%= encodeForHTMLAttribute(Util.getString(targetInput, "")) %>' />
  <input type="hidden" name="targetLabel" value='<%= encodeForHTMLAttribute(Util.getString(targetLabel, "")) %>' />
  <input type="hidden" name="isUnifiedInsert" value='<%= isUnifiedInsert %>' />
  <input type="hidden" name="isGalleryPreview" value='<%= isGalleryPreview %>' />
  

  <div class="mb-nav navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container-fluid">
      <% if (!isUnifiedInsert) { %>
      <div class="navbar-header">
        <a class="navbar-brand" href="#"><%= glp("ui.work.query-ch.title") %></a>
        <button type="submit" name="opValidate" value="true" class="btn btn-primary navbar-btn pull-right visible-xs-block" style="margin-right: 15px;">
          <%= glp("ui.work.query-ch.btn.select") %>
        </button>
      </div>
      <% } %>
        
      <ul class="nav navbar-form navbar-nav navbar-right">      
        <li>
          <% if (opPreview || isUnifiedInsert) { %>
          <button type="submit" name="opPreview" value="true" class="btn btn-default">
            <%= glp("ui.work.query-ch.btn.preview") %>
          </button>
          <% } %>
          <button type="submit" name="opValidate" value="true" class="btn btn-primary">
            <%= glp("ui.work.query-ch.btn.select") %>
          </button>
        </li>
      </ul>   
         
    </div>
  </div><%-- navbar --%>
  
  <% if (opPreview) { 
    %><jsp:useBean id="previewQueryHandler" scope="page" class="com.jalios.jcms.handler.QueryHandler"><%
      %><jsp:setProperty name="previewQueryHandler" property="request"  value="<%= request %>"/><%
      %><jsp:setProperty name="previewQueryHandler" property="response" value="<%= response %>"/><%
      %><jsp:setProperty name="previewQueryHandler" property="*" /><%
    %></jsp:useBean>
  <div class="container-fluid">  
   <jalios:message title="ui.com.alt.preview" dismissable="true">
    <jalios:wysiwyg>
     <% if (isGalleryPreview) { %>
      <%= "<jalios:include data-jalios-type=\"gallery\" data-jalios-params=\"&amp;query=" + encodeForURL(previewQueryHandler.getQueryString()) + "\" />"%>
     <% } else { %>
      <%= "<jalios:include data-jalios-type=\"query\" data-jalios-params=\"&amp;params=" + encodeForURL(previewQueryHandler.getQueryString()) + "\" />"%>
     <% } %>
    </jalios:wysiwyg>
   </jalios:message>
  </div>  
  <% } else if (isUnifiedInsert) { %>
    <jalios:message title="" msg='<%= isGalleryPreview ? "unified-insert.items.gallery.intro" : "unified-insert.items.query.intro" %>' />
  <% } %>
  
  <div class="container-fluid">
  <ul class="nav nav-tabs nav-tabs-underlined" role="tablist">
    <li class="active"><a href="#qs-tab-cat" role="tab" data-toggle="tab" onclick="return false;"><%= glp("ui.work.search.tab.cat") %></a></li>
    <li><a href="#qs-tab-date" role="tab" data-toggle="tab" onclick="return false;"><%= glp("ui.work.search.tab.date") %></a></li>
    <li><a href="#qs-tab-type" role="tab" data-toggle="tab" onclick="return false;"><%= glp("ui.work.search.tab.type") %></a></li>
    <li><a href="#qs-tab-group" role="tab" data-toggle="tab" onclick="return false;"><%= glp("ui.work.search.tab.group") %></a></li>
    <li><a href="#qs-tab-state" role="tab" data-toggle="tab" onclick="return false;"><%= glp("ui.work.search.tab.state") %></a></li>
   <% if (channel.isMultilingual()) { %>
    <li><a href="#qs-tab-lang" role="tab" data-toggle="tab" onclick="return false;"><%= glp("ui.work.search.tab.lang") %></a></li>
   <% } %>
    <li><a href="#qs-tab-kind" role="tab" data-toggle="tab" onclick="return false;"><%= glp("ui.work.search.tab.kind") %></a></li>
    <li><a href="#qs-tab-ws" role="tab" data-toggle="tab" onclick="return false;"><%= glp("ui.work.search.tab.ws") %></a></li>
    <li><a href="#qs-tab-advanced" role="tab" data-toggle="tab" onclick="return false;"><%= glp("ui.work.search.tab.advanced") %></a></li>
    <li></li>
  </ul>    
  </div>
  
  <div class="tab-content container-fluid">
  
   <%-- *** CATEGORY ************************************** --%>
   <% 
   if (formHandler != null)  {
     request.setAttribute("dscExactCat",   formHandler.getExactCat()); 
     request.setAttribute("dscCatMode",    Util.getString(formHandler.getCatMode(), "and")); 
     request.setAttribute("dscCatSet",     formHandler.getCategorySet("cids")); 
   } 
   request.setAttribute("dscRootSet",    Util.getHashSet(channel.getRootCategory()));
   %>
    <div class="tab-pane active" id="qs-tab-cat">
      <%@ include file="/jcore/search/doSearchCategory.jspf" %>
    </div>
    
    <%-- *** DATE ************************************** --%>
    <div class="tab-pane" id="qs-tab-date">
      <% if (formHandler != null)  {
           request.setAttribute("dsdDateType",   formHandler.getDateType()); 
           request.setAttribute("dsdDateSince",  "" + formHandler.getDateSinceInt()); 
           Date[] beginAndEndDates = formHandler.getBeginAndEndDates();           
           request.setAttribute("dsdBeginDate",  beginAndEndDates[0]); 
           request.setAttribute("dsdEndDate",    beginAndEndDates[1]); 
         }
      %>
      <%@ include file="/jcore/search/doSearchDate.jspf" %>
    </div>
    
    <%-- *** TYPE ************************************** --%>
    <div class="tab-pane" id="qs-tab-type">
      <% 
         request.setAttribute("dstCheckPstatus", "false");
         request.setAttribute("dstShowReplaceFileDoc", "true");
         if (formHandler != null)  {
           request.setAttribute("dstReplaceFileDoc",  "" + formHandler.getReplaceFileDoc());
           request.setAttribute("dstExactType",  "" + formHandler.getExactType());
           request.setAttribute("dstClassSet", formHandler.getClassSet()); 
         }
      %>
      <%@ include file="/jcore/search/doSearchType.jspf" %>
    </div>
    
    <%-- *** GROUP ************************************** --%>
    <div class="tab-pane" id="qs-tab-group">
      <% if (formHandler != null)  {
           request.setAttribute("dsgGroupSet", channel.getDataSet(formHandler.getGids())); 
           
           String[] mids = formHandler.getMids();
           if (Util.notEmpty(mids)) {
             boolean searchLoggedMember = false;
             Member member = null;
             for(String mid: mids) {
               if (!searchLoggedMember && JcmsConstants.VID_LOGGED_MEMBER.equals(mid)) {
                 searchLoggedMember = true;
               } else {
                 if (member == null) {
                   member = channel.getMember(mid);
                 }
               }
             }
             request.setAttribute("dsgLoggedMember", searchLoggedMember); 
             request.setAttribute("dsgMember", member); 
           }
         }
      %>
      <%@ include file="/jcore/search/doSearchGroup.jspf" %>
    </div>
    
    <%-- *** STATE ************************************** --%>
    <div class="tab-pane" id="qs-tab-state">
      <%
      if (formHandler != null) {
        request.setAttribute("dspPstatus", formHandler.getIntPstatus());
        request.setAttribute("dspWfId", formHandler.getWfId());
      }
      %>
      <jalios:include jsp="/jcore/search/doSearchPstatus.jsp" />
    </div>
    
    <%-- *** LANG ************************************** --%>
    <% if (channel.isMultilingual()) { %>
    <div class="tab-pane" id="qs-tab-lang">
      <% request.setAttribute("dslUserLang", "true"); %>
      <% if (formHandler != null) request.setAttribute("dslLangs", formHandler.getUnresolvedLangs()); %>
      <%@ include file="/jcore/search/doSearchLang.jspf" %>
    </div>
    <% } %>
    
    <%-- *** FileDocument kind ************************************** --%>
    <div class="tab-pane" id="qs-tab-kind">
      <% if (formHandler != null) request.setAttribute("dslDocumentKinds", formHandler.getDocumentKinds()); %>
      <%@ include file="/jcore/search/doSearchKind.jspf" %>
    </div>
    
    <%-- *** WORKSPACE ************************************** --%>
    <div class="tab-pane" id="qs-tab-ws">
      <%
      if (formHandler != null) {
        request.setAttribute("dswWorkspaces", formHandler.getWorkspaceSet());
        request.setAttribute("dswSearchInSubWorkspaces", formHandler.getSearchInSubWorkspaces());
      }
      %>
      <%@ include file="/jcore/search/doSearchWorkspace.jspf" %>
    </div>
    
    <%-- *** ADVANCED ************************************** --%>
    <div class="tab-pane" id="qs-tab-advanced">
      <% if (formHandler != null) request.setAttribute("dsaSearchAdvanced", formHandler.getAdvanced()); %>
      <%@ include file="/jcore/search/doSearchAdvanced.jspf" %>
    </div>
    
  </div><%-- class="tab-content" --%>
  
</form>
<% request.removeAttribute("formHandler"); %>
<% } %>

<%@ include file="/jcore/doEmptyFooter.jspf" %>