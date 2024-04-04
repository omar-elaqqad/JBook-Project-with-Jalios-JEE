<%@page import="com.jalios.jcms.handler.AllMemberQueryHandler"%><%
 // request.setAttribute("CheckCSRF", Boolean.TRUE);
%><%@ include file="/jcore/doInitPage.jspf" %><%

  if (loggedMember == null){
    return;
  }
  
  String autocomplete  = getUntrustedStringParameter("autocomplete",""); // ENCODE !!
  Set<Group> parentSet = getDataSetParameterValues("acgids", Group.class);
  int      skip        = getIntParameter("skip", 0);
  boolean ignoreGroupOfModelWS = workspace != null && !workspace.isModel();
  
  Collection<Group> resultCollection = new TreeSet<Group>(new Group.PreferredWorkspaceComparator(workspace, userLang));
  if (Util.isEmpty(parentSet)) {
    TreeSet<Group> allGroups = channel.getDataSet(Group.class);
    if (allGroups != null) {
      for(Group g: allGroups) {
        if (!ignoreGroupOfModelWS || g.getWorkspace() == null || !g.getWorkspace().isModel()) {
          resultCollection.add(g);
        }
      }
    }
  } 
  else {
    for (Group group : parentSet) {
      Set<Group> descendantGroupSet = group.getDescendantSet();
      if (descendantGroupSet != null) {
        for(Group g: descendantGroupSet) {
          if (!ignoreGroupOfModelWS || g.getWorkspace() == null || !g.getWorkspace().isModel()) {
            resultCollection.add(g);
          }
        }
      }
    }
  }
  
  DataSelector selector = new AndDataSelector(new Group.NameSelector(autocomplete, userLang), new Group.MemberSelector(loggedMember));

  Workspace wsFilter = getWorkspaceParameter("ws");
  wsFilter = wsFilter == null ? getWorkspaceParameter("wsid") : wsFilter;
  if (wsFilter != null) {
    selector = new AndDataSelector(selector, new Group.WorkspaceSelector(wsFilter.getId()));
  }
  
  request.setAttribute("ACSelector", selector);
  request.setAttribute("ACResultCollection", resultCollection);
  int proposedResults = channel.getIntegerProperty("autocomplete.proposedresults.group", 
                        channel.getIntegerProperty("autocomplete.proposedresults", 
                        5));
  request.setAttribute("ACProposedResult", new Integer(proposedResults));
  String acurl = "jcore/autocomplete/acgroup.jsp?autocomplete="+encodeForURL(autocomplete);
  if (Util.notEmpty(parentSet)){ 
    acurl += "&acgids="+Util.join(parentSet,"&acgids=");
  }
  acurl += "&skip=";
%>
<jalios:include target="AC_GROUP" targetContext="empty"/>
<%
  proposedResults = ((Integer) request.getAttribute("ACProposedResult")).intValue();
  selector = (DataSelector) request.getAttribute("ACSelector");
  resultCollection = (Collection<Group>) request.getAttribute("ACResultCollection");
  int more = skip + proposedResults;
%><ul class="dropdown-menu"><%
  int beginPageCount = skip +1; //count from 1
  int endPageCount = Math.min(skip+proposedResults, resultCollection.size());

  if (skip > 0){
    %><li class='info results'><a href='#'><%= glp("ui.com.lbl.count-result",beginPageCount,endPageCount) %></a></li><%
   }
  if (skip > 0){ 
    %><li class='ajax-refresh previous'><a href='<%= acurl + (skip - proposedResults) %>'><%= glp("ui.com.lbl.prev-result") %></a></li><%
  }

  int i = proposedResults; 
  boolean match = false; 
  boolean first = true;
  Iterator<Group> it = null;
  
  for(it = resultCollection.iterator(); it.hasNext() && i > 0; ){
    Group itGroup = it.next();
    if (!selector.isSelected(itGroup)){ continue; }
    if (skip > 0){ skip--; continue; }
    
    String photos = "";
    
    // JCMS-7237 - Group chooser (control / field) : db member not displayed and not accounted for in autocomplete
    AllMemberQueryHandler amqh = new AllMemberQueryHandler();
    amqh.setLoggedMember(loggedMember);
    amqh.setGid(itGroup.getId());
    amqh.setPageSize(5);
    amqh.setStart(0);
    List<String> mbrIdList = amqh.getIdResultList();
    
    Set<Member> mbrSet = new LinkedHashSet<Member>(itGroup.getMemberSet());
    mbrSet.addAll(JcmsUtil.idCollectionToDataHashSet(mbrIdList, Member.class));
    mbrSet = mbrSet.stream()
        .filter(m -> m.isValidAccount())
        .sorted(Member.getNameComparator())
        .collect(java.util.stream.Collectors.toSet());
    
    if (Util.notEmpty(mbrSet)) {
      %>
      <jalios:buffer name="photoBuffer">
        <jalios:foreach collection="<%= mbrSet %>" name="itMbr" type="Member" max="<%= 5 %>">
          <jalios:memberphoto size="<%= PhotoSize.ICON %>" 
                member="<%= itMbr %>" 
                link="false" 
                htmlAttributes='<%= "title=\'" + encodeForHTMLAttribute(itMbr.getFullName()) + "\'" %>' />
        </jalios:foreach>
      </jalios:buffer> 
      <% 
      photos = photoBuffer;
    }
    String info   = "<br/> <span class='info'>";
           info  += itGroup.getWorkspace() != null ? itGroup.getWorkspace().getTitle(userLang) + " " : "";
           info  += "("+glp("ui.com.lbl.n-member", Util.getSize(mbrSet))+") ";
           info  += "</span>";
           info  += photos;

    match = true;
    %>
    <li<%= first ? " class='active'" : "" %> 
        data-value='<%= itGroup.getId() %>' 
        data-placeholder="<%= encodeForHTMLAttribute(itGroup.getName(userLang), true) %>" 
        title="<%= encodeForHTMLAttribute(itGroup.getName(userLang), true) %>">
      <a href="#">
        <%= itGroup.getName(userLang) %> <%= info %>
      </a>
    </li>
    <%
    i--; 
    first = false;
  } // for...groups loop

  if (!match){
    %><li class='nomatch'><a href='#'><%= glp("ui.com.lbl.no-result") %></a></li><%
  } else if (i == 0 && it.hasNext()){
    %><li class='ajax-refresh next'><a href='<%= acurl+more %>'><%= glp("ui.com.lbl.next-result") %></a></li><%
  }
%></ul>