<%@page import="com.jalios.jcms.taglib.settings.impl.*"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/front/readerTracking/doInitReaderTracking.jspf' %><%

jcmsContext.addCSSHeader("css/jalios/ux/jalios-reader-tracker.css");

%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.tracking.ReaderTrackerHandler'><%
  %><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
  %><jsp:setProperty name='formHandler' property='noRedirect' value='true'/><%
%></jsp:useBean><%
formHandler.setTrackedPubId(trackedPub.getId());
formHandler.validate();

// Avoid duplicate FORM when included in a modal FORM (ex: readerTrackingModal.jsp)
boolean canUseFormTag = Util.toBoolean(request.getAttribute("readerTracking-can-use-form"), true);

boolean showAck = isReaderTab && trackedPub.getReadAck();
int ackCount = 0;

boolean showReaderTrackerFilters = canUseFormTag && isReaderTab;
boolean showReaderTrackerForm = showReaderTrackerFilters;
String pubTitle = trackedPub.getTitle(userLang);
String pubTitleTruncated = Util.truncate(trackedPub.getTitle(userLang), 60, "...");

// Filter Groups
String trackingFilterIncludeGroupParam = ReaderTrackerQueryHandler.INCLUDE_GROUP_PARAM;
String trackingFilterExcludeGroupParam = ReaderTrackerQueryHandler.EXCLUDE_GROUP_PARAM;
GroupSettings includeGroupSettings = new GroupSettings();
includeGroupSettings.name(trackingFilterIncludeGroupParam);
includeGroupSettings.dataAttribute("jalios-action", "ajax-refresh");
includeGroupSettings.dataAttribute("jalios-event", "change");
GroupSettings excludeGroupSettings = new GroupSettings();
excludeGroupSettings.name(trackingFilterExcludeGroupParam);
excludeGroupSettings.dataAttribute("jalios-action", "ajax-refresh");
excludeGroupSettings.dataAttribute("jalios-event", "change");

// Get results
Set<ReaderTrackerEntry> readerTrackerSet = formHandler.getReaderTrackerEntrySet();
boolean hasResults = Util.getSize(readerTrackerSet) > 0;
int readerCount = Util.getSize(readerTrackerSet);
readerCount = Util.getSize(readerTrackerSet);

// Filter ReadAck
String trackingFilterReadAckParam = ReaderTrackerQueryHandler.READACK_PARAM;
String trackingFilterAcked = ReaderTrackerQueryHandler.READACK_ACKED;
String trackingFilterNotAcked = ReaderTrackerQueryHandler.READACK_NOT_ACKED;
boolean isOnlyAcked = formHandler.isOnlyAcked();
boolean isOnlyNotAcked = formHandler.isOnlyNotAcked();
String trackingReadAckFilter = formHandler.getAvailableReadAck();
boolean isReadAckFilter = Util.notEmpty(trackingReadAckFilter);

// Only show readAck filter if there are readers
boolean showReaderTrackerReadAckFilter = trackedPub.getReadAck();
showReaderTrackerReadAckFilter &= hasResults || Util.notEmpty(trackingReadAckFilter);
EnumerateSettings readAckSettings = new EnumerateSettings();
if (showReaderTrackerReadAckFilter) {
  readAckSettings.select();
  readAckSettings.name(trackingFilterReadAckParam);
  readAckSettings.dataAttribute("jalios-action", "ajax-refresh");
  readAckSettings.dataAttribute("jalios-event", "change");
  readAckSettings.enumValues(trackingFilterAcked, trackingFilterNotAcked);
  readAckSettings.enumLabels(glp("ui.com.lbl.readAck.y.short"), glp("ui.com.lbl.readAck.n.short"));
}

if (showAck && readerTrackerSet != null) {
  for(ReaderTrackerEntry entry: readerTrackerSet) {
    if (entry.ackUptodate) {
      ackCount++;
    }
  }
}
Set<Group> includeGroupSet = formHandler.getAvailableIncludeGroupSet();
Set<Group> excludeGroupSet = formHandler.getAvailableExcludeGroupSet();

boolean isGroupFilter = Util.notEmpty(includeGroupSet) || Util.notEmpty(excludeGroupSet);
boolean isReaderTrackerFilters = isGroupFilter || isReadAckFilter;
boolean showNoResult = isReaderTrackerFilters && !hasResults;
String filterReadAckReadTitle = isOnlyAcked ? glp("ui.com.lbl.filter.remove") : glp("readertracker.filter-readack.y.h");
String filterReadAckUnreadTitle = isOnlyNotAcked ? glp("ui.com.lbl.filter.remove") : glp("readertracker.filter-readack.n.h");

// TRACKING ABSTRACT
int readerAbstractCount = isReaderTab ? readerCount : downloadCount;
String readingAbstractPubUrl = JcmsUtil.getDisplayUrl(trackedPub, userLocale);
String readingAbstractPubTitle = isReaderTab ? pubTitleTruncated : pubTitle;
// "reading abstract" when either no filters, or no readAck filter
// Use relevant read or download count
String readingAbstract = isReadAckFilter ? "" : glp(isReaderTab ?  "ui.work.rdr.title2" : "ui.work.rdr.title3", 
    readerAbstractCount, 
    readingAbstractPubUrl, 
    readingAbstractPubTitle);
String ackAbstract = "";
// Additional "readAck abstract" when pub is tracked
if (showAck) {
  if (isOnlyNotAcked) {
    ackAbstract = glp("ui.work.rdr.no-ack-count", readerCount);
  } else {
    ackAbstract = glp("ui.work.rdr.ack-count", ackCount);
  }
}
String anonymousAccessesLabel;
if (channel.isAuthenticationRequired()) {
  // JCMS-9126 - display "Deleted" instead of "Anonymous" when site is private
  anonymousAccessesLabel = glp("ui.work.rdr.lbl.deleted");
} else {
  anonymousAccessesLabel = glp("ui.work.rdr.lbl.anonymous");
}
%>


<div class="reader-tracking-wrapper ajax-refresh-div<%= hasResults ? " has-results" : "" %>" data-jalios-ajax-refresh-url="front/readerTracking/doReaderTracking.jsp">
  <div class="reader-tracking<%= hasResults ? " has-results" : "" %>">
  <%
  // ----------------------------------------------------------------------
  // Navbar
  // ----------------------------------------------------------------------
  %>
  <% if (showReaderTrackerForm) { %>
    <form class="form-horizontal noSingleSubmitButton" 
      name='readerTrackingForm' 
      lang="<%= formHandler.getAvailableMainLanguage() %>" 
      action='<%= getIncludeString("url","#") %>' 
      method="post" 
      accept-charset="UTF-8" 
      enctype="multipart/form-data">
  <% } %>
  <div class="navbar navbar-default navbar-table-header reader-tracker-navbar<%= isReaderTrackerFilters ? "" : " collapsed" %>" role="navigation">
    <div class="container-fluid reader-tracker-visible-navbar">
      <% if (Util.notEmpty(readingAbstract)) { %>
        <p class="navbar-text"><%= readingAbstract %></p>
      <% } %>
      <% if (Util.notEmpty(ackAbstract)) { %>
        <p class="navbar-text"><%= ackAbstract %></p>
      <% } %>
      <%
      // ----------------------------------------------------------------------
      // Filters
      // ----------------------------------------------------------------------
      String trackingFilterToggleClass = ServletUtil.generateUniqueDOMId(request, "rt-nav-filter");
      %>
      <% if (showReaderTrackerFilters) { %>
        <ul class="nav navbar-nav navbar-left">
          <li class="dropdown">
            <a href='#'  onclick="return false;"
                class="dropdown-toggle <%= isReaderTrackerFilters ? "dropup" : "collapsed" %>" 
                data-jalios-target=".<%= trackingFilterToggleClass %>|this|.reader-tracker-navbar" 
                data-jalios-action="toggle:hide toggle:dropup toggle:collapsed toggle:collapsed">
              <jalios:icon src='filter' />
              <span class="hidden-xs hidden-sm"><%= glp("ui.com.txt.filters") %></span>
              <jalios:icon src='caret' />
            </a>
          </li>
        </ul>
      <% } %>
    </div>
  
    <% if (showReaderTrackerFilters) { %>
      <div class="container-fluid form-horizontal reader-tracker-navbar-filters <%= trackingFilterToggleClass %> <%= isReaderTrackerFilters ? "" : "hide" %>">
        <div class='navbar-form'>
          <%-- Group Filter --%>
          <jalios:field name="<%= trackingFilterIncludeGroupParam %>" tooltip='ui.work.rdr.filter.group.include.h' label="ui.work.rdr.filter.group.include" keyword="true" value='<%= includeGroupSet %>'>
            <jalios:control settings="<%= includeGroupSettings %>" />
          </jalios:field>
          <jalios:field name="<%= trackingFilterExcludeGroupParam %>" tooltip='ui.work.rdr.filter.group.exclude.h' label="ui.work.rdr.filter.group.exclude" keyword="true" value='<%= excludeGroupSet %>'>
            <jalios:control settings="<%= excludeGroupSettings %>" />
          </jalios:field>
          <% if (showReaderTrackerReadAckFilter) { %>
            <jalios:field name="<%= trackingFilterReadAckParam %>" tooltip='readertracker.filter-readack.h' label='ui.com.lbl.readAck' value='<%= trackingReadAckFilter %>'>
              <jalios:control settings="<%= readAckSettings %>" />
            </jalios:field>
          <% } %>
        </div>
      </div>
    <% } %>
  </div>
  
  <%
  // ----------------------------------------------------------------------
  // Result list
  // ----------------------------------------------------------------------
  %>
  <div class="reader-tracking-results">
  
    <div class="member-tracking-list member-tracking-read-list<%= showNoResult ? " no-results" : "" %>">
    <% if (showNoResult) { %>
      <%@ include file='/front/doNoResult.jspf' %>
    <% } else if (hasResults) { %>
      <%
      String exportCsvTitle = glp("ui.work.rdr.csv.btn.title");
      String exportCsvUrl = formHandler.getExportCsvUrl();
      %>
      <jalios:pager name='readerTrackingPagerHandler' sort="accessCount" paramPrefix='readerTracking_' action='init' declare='true' pageSize='5'/>
      <jalios:pager name='readerTrackingPagerHandler' size='<%= Util.getSize(readerTrackerSet) %>' action='compute' />
      <div class="table-responsive">
        <table class="table-data table-reader-tracker">
          <caption class="sr-only"><%= glp("ui.work.rdr.table-caption", trackedPub.getTitle(userLang, true)) %></caption>
          <thead>
            <tr> 
              <th scope="col" class="csv-export">
                <a class="btn btn-rounded export-csv" title="<%= encodeForHTMLAttribute(exportCsvTitle) %>" href="<%= exportCsvUrl %>">
                  <jalios:icon src="csv" alt="<%= exportCsvTitle %>" />
                </a>
              </th>
              <th scope="col"><%= glp("ui.work.rdr.reader") %></th>
              <th scope="col" class="th-sort-fdate"><%
              if (readerCount > 1) {
                String sortTitleProp = isReaderTab ? "ui.work.rdr.fdate" : "ui.work.rdr.fdate-download";
                String sortTitle = glp(sortTitleProp);
                String fdateSortTitleTitle = isReaderTab ? glp("ui.pager.sort.text.fdate") : glp("ui.pager.sort.text.fdate-download");
                fdateSortTitleTitle +=  " " + (readerTrackingPagerHandler.isReverse() ? glp("ui.pager.sort.order.ascending") : glp("ui.pager.sort.order.descending"));
                %><jalios:pager name='readerTrackingPagerHandler' action='showSort' sort='cdate' sortTitle='<%= sortTitle %>' /><%
                %><jalios:javascript>
                  /* Replace FDate sort title */
                  let $thFDate = jQuery('.table-reader-tracker TH.th-sort-fdate');
                  if ($thFDate.length) {
                    let $fDateSortLink = $thFDate.find('A.sort-link-cdate');
                    $fDateSortLink.attr('title', '<%= encodeForJavaScript(fdateSortTitleTitle) %>');
                  }
                </jalios:javascript><%
              } else {
                %><%= isReaderTab ? glp("ui.work.rdr.fdate") : glp("ui.work.rdr.fdate-download") %><%
              }
              %></th><%
              %><th scope="col" class="th-sort-ldate"><%
                String sortTitleProp = isReaderTab ? "ui.work.rdr.ldate" : "ui.work.rdr.ldate-download";
                String sortTitle = glp(sortTitleProp);
                String ldateSortTitleTitle = isReaderTab ? glp("ui.pager.sort.text.ldate") : glp("ui.pager.sort.text.ldate-download");
                ldateSortTitleTitle +=  " " + (readerTrackingPagerHandler.isReverse() ? glp("ui.pager.sort.order.ascending") : glp("ui.pager.sort.order.descending"));
              if (readerCount > 1) {
                %><jalios:pager name='readerTrackingPagerHandler' action='showSort' sort='mdate' sortTitle='<%= sortTitle %>'/><%
                %><jalios:javascript>
                  /* Replace LDate sort title */
                  let $thLDate = jQuery('.table-reader-tracker TH.th-sort-ldate');
                  if ($thLDate.length) {
                    let $lDateSortLink = $thLDate.find('A.sort-link-mdate');
                    $lDateSortLink.attr('title', '<%= encodeForJavaScript(ldateSortTitleTitle) %>');
                  }
                </jalios:javascript><%
              } else {
                %><%= isReaderTab ? glp("ui.work.rdr.ldate") : glp("ui.work.rdr.ldate-download") %><%
              }
              %></th>
              <% if (showAck) { %>
                <%-- <th scope="col"><% if (readerCount > 1) {%><jalios:pager name='readerTrackingPagerHandler' action='showSort' sort='mdate' sortTitle="ui.work.rdr.ackdate"/><% } else { %><%= glp("ui.work.rdr.ackdate") %><% } %></th> --%>
                <th scope="col"><%= glp("ui.work.rdr.ackdate") %></th>
              <% } %>
              <th scope="col"><% if (readerCount > 1) {%><jalios:pager name='readerTrackingPagerHandler' action='showSort' sort='accessCount' sortTitle='<%= isReaderTab ? "ui.work.rdr.access" : "ui.work.rdr.download" %>'/><% } else { %><%= isReaderTab ? glp("ui.work.rdr.access") : glp("ui.work.rdr.download") %><% } %></th>
            </tr>  
          </thead> 
          <tbody>
            <jalios:foreach collection='<%= readerTrackerSet %>' name='itEntry' type='ReaderTrackerEntry' max="<%= readerTrackingPagerHandler.getPageSize() %>" skip='<%= readerTrackingPagerHandler.getStart() %>'>
              <tr> 
                <td class="numeric fit">
                  <%= itCounter + readerTrackingPagerHandler.getStart() %>.
                </td>
                <td>
                  <% if (itEntry.member == null) { %>
                    <%= anonymousAccessesLabel %>
                  <% } else { %>
                    <jalios:memberphoto member="<%= itEntry.member %>" size="<%= PhotoSize.ICON %>"/>&nbsp;
                    <jalios:link data='<%= itEntry.member %>' />
                  <% } %>
                </td>
                <td class="date-time fit">
                  <jalios:date date='<%= itEntry.firstAccessDate %>' format='<%= "short" %>'/> <jalios:time date='<%= itEntry.firstAccessDate %>' format='<%= "short" %>'/>
                </td>
                <td class="date-time fit">
                  <jalios:date date='<%= itEntry.lastAccessDate %>' format='<%= "short" %>'/> <jalios:time date='<%= itEntry.lastAccessDate %>' format='<%= "short" %>'/>
                </td>
                <% if (showAck) { %>
                <td class="date-time fit">
                  <% if (itEntry.ackDate != null) { %>
                    <span class="label <%= itEntry.ackUptodate ? "label-success" : "label-warning" %>">v. <%= itEntry.ackVersion %></span>
                    <jalios:date date='<%= itEntry.ackDate %>' format='<%= "short" %>'/> <jalios:time date='<%= itEntry.ackDate %>' format='<%= "short" %>'/>
                  <% } %>
                </td>
                <% } %>
                <td class="numeric fit"><%= itEntry.accessCount %></td>
              </tr>
            </jalios:foreach>
          </tbody>
        </table>
      </div>
      <jalios:pager name='readerTrackingPagerHandler'/>
    <% } %> 
    </div>
  </div>
  <% if (showReaderTrackerForm) { %>
    <%= formHandler.getFormStepHiddenFields() %>
    </form>
  <% } %>

  </div><%-- EOF.reader-tracking --%>
  <jalios:javascript>
    /* Prevent some tooltip to remain visible after ajax */
    jQuery('.tooltip').removeClass('.in');
  </jalios:javascript>
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div><%-- EOF.reader-tracking-wrapper.ajax-refresh-div --%>