<%
  request.setAttribute("CheckCSRF", Boolean.TRUE);
%><%@ include file="/jcore/doInitPage.jspf" %><%

  if (loggedMember == null) {
    return;
  }

  String autocomplete = getUntrustedStringParameter("autocomplete", ""); // ENCODE !!
  
  String[] types = getStringParameterValues("super", HttpUtil.CLASSNAME_REGEX);
  if(types == null) {
    types = new String[]{"Publication"};
  }
  int skip = getIntParameter("skip", 0);
  int proposedResults = channel.getIntegerProperty("autocomplete.proposedresults.publication", 
                                                   channel.getIntegerProperty("autocomplete.proposedresults", 
                                                   5));
  
  boolean exactType = getBooleanParameter("exactType", false);
  
  request.setAttribute("AC_PUBLICATION", Boolean.TRUE); // Clue for the QueryFilter
  
  com.jalios.jcms.handler.QueryHandler handler = new com.jalios.jcms.handler.QueryHandler();
  handler.setRequest(request);
  handler.setText(autocomplete);
  // handler.setMode(com.jalios.jcms.handler.QueryHandler.TEXT_MODE_ADVANCED);
  handler.setTypes(types);
  handler.setTypesOff(new String[0]);
  handler.setExactType(exactType);
  handler.setSearchedFields(new String[]{ com.jalios.jcms.search.LucenePublicationSearchEngine.TITLE_FIELD });
  handler.setLoggedMember(loggedMember);
  handler.setCids(getStringParameterValues("cids", HttpUtil.DATAID_REGEX));
  handler.setMids(getStringParameterValues("mids", HttpUtil.DATAID_REGEX));
  handler.setDocumentKinds(getStringParameterValues("documentKinds", HttpUtil.ALPHANUM_REGEX));
  handler.setWorkspace(null);
  handler.setCheckPstatus(true);
  handler.setSort("title");
  handler.setStart(skip);
  handler.setPageSize(proposedResults+1);
  Workspace wsFilter = getWorkspaceParameter("ws");
  if (wsFilter != null) {
    handler.setWorkspace(wsFilter);
  }
  
  QueryResultSet queryResultSet = handler.getResultSet();
  Set<Publication> resultSet = queryResultSet.getAsSortedSet(Publication.getTitleComparator());
  
  request.setAttribute("ACResultCollection", resultSet);
  
  request.setAttribute("ACProposedResult", new Integer(proposedResults));
  String acurl = "jcore/autocomplete/acpublication.jsp?autocomplete=" + encodeForURL(autocomplete) + "&super=" + Util.join(types, "&super=") + "&skip=";
%><jalios:include target="AC_PUBLICATION" targetContext="empty" /><%
resultSet = (Set<Publication>) request.getAttribute("ACResultCollection");
proposedResults = ((Integer) request.getAttribute("ACProposedResult")).intValue();
int more = skip + proposedResults;
%>
<ul class="dropdown-menu typeahead-photo">
<%
  int beginPageCount = skip +1; //count from 1
  int endPageCount = Math.min(more, resultSet.size());

  if (skip > 0) {
    out.println("<li class='info results'><a href='#'>" + glp("ui.com.lbl.count-result", beginPageCount,endPageCount) + "</a></li>");
    out.println("<li class='ajax-refresh previous'><a href='" + acurl + (skip - proposedResults) + "'>" + glp("ui.com.lbl.prev-result") + "</a></li>");
  }

  int i = proposedResults; boolean match = false; boolean first = true;
  Iterator it = null;
  for(it = resultSet.iterator(); it.hasNext() && i > 0;){
    Publication itPub = (Publication) it.next();
    if (skip > 0){ skip--; continue; }

    match = true;
    String alternateInfo = "(" + itPub.getTypeLabel(userLang) + " - " + itPub.getWorkspace().getTitle(userLang) + ")";
    
  %><li <%= first ? "class='active'" : "" %> data-value='<%= itPub.getId() %>' data-placeholder="<%= encodeForHTMLAttribute(itPub.getTitle(userLang)) %>" title="<%= encodeForHTMLAttribute(itPub.getTitle(userLang) + "\n" + alternateInfo) %>"><a href="#">
  <span class='thumb'>
    <jalios:thumbnail data='<%= itPub %>'
                      width="26"
                      height="26"
                      alt="" 
                      css="photo"><img src="s.gif" alt="" width="26" height="26"/></jalios:thumbnail>
  </span>
  <% i--; first = false; %>
  <jalios:dataicon data="<%= itPub %>" /> <%= itPub.getTitle(userLang) %>
  <br/><span class='info'><%= encodeForHTML(alternateInfo) %></span></a></li>
  <% } if (!match){ out.println("<li class='nomatch'><a href='#'>" + glp("ui.com.lbl.no-result")+"</a></li>"); } 
  else if (i == 0 && it.hasNext()){ out.println("<li class='ajax-refresh next'><a href='" + acurl + more + "'>" + glp("ui.com.lbl.next-result") + "</a></li>"); } %></ul>