<%--
  @Summary: Newspaper template for editorial Publications
  @Category: Template
  @Author: Sylvain DEVAUX
  @Customizable: True
  @Requestable: False
  @Since: jcms-9.0.1
--%>
<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ include file="/jcore/portal/doPortletParams.jspf" %><%!
String NEWSPAPER_LEAD_CONTENTS_ATTR = "newspaper.lead-publication"; // A request attribute to store contents from a previous PQF
%><%

PortletQueryForeach box = (PortletQueryForeach) portlet;
String resultTemplate = "/types/PortletQueryForeach/doNewspaperResultDisplay.jsp";

// Css
jcmsContext.addCSSHeader("css/jalios/ux/jalios-pqf-newspaper.css");


boolean isLeadTemplate = Util.toBoolean(request.getAttribute("pqf-newspaper-first-lead"), false);
%>

<%-- Compute & sort results --%>
<%@ include file="/types/PortletQueryForeach/doQuery.jspf" %>
<%
// JCMS-4592: prevent a duplicate publication between lead and normal templates (Must be between doQuery and doSort)
Collection<Publication> skipPubCol = new ArrayList<Publication>();
if (!isLeadTemplate) {
  // If current template is not "Lead", prevent duplicates from a previous "Lead" template
  if (request.getAttribute(NEWSPAPER_LEAD_CONTENTS_ATTR) != null) {
    skipPubCol = (Collection<Publication>)request.getAttribute(NEWSPAPER_LEAD_CONTENTS_ATTR);
  }
  if (jcmsContext.getAjaxRequestAttribute(NEWSPAPER_LEAD_CONTENTS_ATTR) != null) {
    skipPubCol = (Collection<Publication>) jcmsContext.getAjaxRequestAttribute(NEWSPAPER_LEAD_CONTENTS_ATTR);
  }
  for (Publication skippedPub : skipPubCol) {
    if (collection.remove(skippedPub)) {
      resultSize = resultSize - 1;  // For pager to take in account the publication removed
    }
  }
}
%>
<%@ include file="/types/PortletQueryForeach/doSort.jspf" %>
<%
boolean anyResult = Util.notEmpty(collection);
Collection<String> cssClasses = new ArrayList<String>();
if ("".equals(box.getShowPager())) {
  // Handler bottom margin if no pager
  cssClasses.add("no-pager");
}
%>

<div class="newspaper-results<%= Util.notEmpty(cssClasses) ? " " + Util.join(cssClasses, " ") : "" %>">

  <%-- No results message --%>
  <% if (!anyResult) { %>
    <jalios:message msg="ui.pqf.lbl.no-content" title="" css="no-result" />
  <% } %>

  <%-- Starts with a Row --%>
  <% if (anyResult) { %>
    <div class="row clearfix">
  <% } %>
  <%@ include file="/types/PortletQueryForeach/doForeachHeader.jspf" %>
    <%
    boolean firstResult = itPublicationCounter == startIdx + 1; // current result is the first one 
    boolean lastResult = !it.hasNext() || (qfeIdx + 1 >= startIdx + pagerHandler.getPageSize());
    boolean firstResultFull = firstResult && isLeadTemplate; // current result is the first one AND it should take 100% width
    
    StringBuilder classes = new StringBuilder(128);
    // Class to identify a "result"
    classes.append("newspaper-result-wrapper");
    // Classes for "layout"
    classes.append(" col-xs-12");

    if (firstResultFull) {
      // Should first publication take 100%?
      classes.append(" col-sm-12");
    } else {
      // Else, takes 50%
      classes.append(" col-sm-6");
    }
    
    if (firstResult) {
      classes.append(" first-result");
    }
    if (lastResult) {
      classes.append(" last-result");
    }
    boolean newRow;
    if (isLeadTemplate) {
      if (firstResult) {
        newRow = true; // Always close the row here
      } else {
        newRow = (itPublicationCounter - startIdx) % 2 == 1; // new row every 2 results (with a gap of 1 item)
      }
    } else {
      newRow = (itPublicationCounter - startIdx) % 2 == 0; // new row every 2 results
    }
    newRow = newRow && !lastResult; // No empty row after last result

    // Customize landscape minimum width breakpoint
    request.setAttribute("publication-image-landscape-min-width", 470);
    
    // In case of "lead" newspaper template
    if (isLeadTemplate) {
      skipPubCol.add(itPub); // Keep trace of the "lead publications" as "publication to skip"
    }
    %>
    <div class="<%= classes.toString() %>">
      <jsp:include page="<%= resultTemplate %>" flush="true" />
    </div>

    <%-- Ends current row + starts a new one (prevents bad alignment of floating results' column) --%>
    <% if (newRow) { %>
      </div><div class="row clearfix"><%-- new row needed w/o masonry for alignment purpose --%>
    <% } %>

  <%@ include file="/types/PortletQueryForeach/doForeachFooter.jspf" %>
  
  <%
  request.setAttribute(NEWSPAPER_LEAD_CONTENTS_ATTR, skipPubCol);
  jcmsContext.setAjaxRequestAttribute(NEWSPAPER_LEAD_CONTENTS_ATTR, skipPubCol);  // For pager navigation compliance
  %>

  <% if (anyResult) { %>
    </div><%-- EOF first DIV.row --%>
  <% } %>
</div>

<%@ include file="/types/PortletQueryForeach/doPager.jspf" %>