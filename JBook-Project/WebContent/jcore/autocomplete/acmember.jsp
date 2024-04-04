<%@page import="com.jalios.jcms.mention.MentionManager"%><%
  request.setAttribute("CheckCSRF", Boolean.TRUE);
%><%@ include file="/jcore/doInitPage.jspf" %><%

  if (loggedMember == null){
    return;
  }
  
  int    skip         = getIntParameter("skip", 0);
  String autocomplete = getUntrustedStringParameter("autocomplete",""); // ENCODE !!
  
  // options retrieved from autocomplete.js, same options are used in memberChooser.jsp
  boolean adminOnly     = getBooleanParameter("admin",false);
  boolean workerOnly    = getBooleanParameter("worker",false);
  boolean jstoreMembers = getBooleanParameter("jstore",true);
  boolean jcmsdbMembers = getBooleanParameter("jcmsdb",true);
  
  boolean isMentionAutocomplete = Util.notEmpty(autocomplete) && (autocomplete.startsWith("@") || autocomplete.substring(1).startsWith("@"));
  if (isMentionAutocomplete) {
    autocomplete = MentionManager.getInstance().getMentionEmailPrefixFromString(autocomplete);
    jstoreMembers = true;
    jcmsdbMembers = true;
  }
  
  Collection<String> resultCollection;
  if (Util.isEmpty(autocomplete)) {
    resultCollection = new ArrayList<String>();
  }
  else if ((jstoreMembers && jcmsdbMembers) || (!jstoreMembers && !jcmsdbMembers)) { %>
    <jsp:useBean id="allMemberQueryHandler" scope="page" class="com.jalios.jcms.handler.AllMemberQueryHandler">
      <jsp:setProperty name="allMemberQueryHandler" property="request" value="<%= request %>"/>
      <jsp:setProperty name="allMemberQueryHandler" property="*" />
      <jsp:setProperty name="allMemberQueryHandler" property="text" value="<%= autocomplete %>"/>
      <jsp:setProperty name="allMemberQueryHandler" property="sort" value="name"/>
    </jsp:useBean><%
    if (isMentionAutocomplete) {
      allMemberQueryHandler.setUsage(Member.USAGE_ACCOUNT);
    }    
    resultCollection = allMemberQueryHandler.getIdResultList();
  }
  else if (jstoreMembers) { %>
    <jsp:useBean id="memberQueryHandler" scope="page" class="com.jalios.jcms.handler.MemberQueryHandler">
      <jsp:setProperty name="memberQueryHandler" property="request" value="<%= request %>"/>
      <jsp:setProperty name="memberQueryHandler" property="*" />
      <jsp:setProperty name="memberQueryHandler" property="text" value="<%= autocomplete %>"/>
    </jsp:useBean><%    
    resultCollection = JcmsUtil.dataCollectionToIdList(memberQueryHandler.getResultSet(Member.getNameComparator()));
  } else { %>
    <jsp:useBean id="dbMemberQueryHandler" scope="page" class="com.jalios.jcms.handler.DBMemberQueryHandler">
      <jsp:setProperty name="dbMemberQueryHandler" property="request" value="<%= request %>"/>
      <jsp:setProperty name="dbMemberQueryHandler" property="*" />
      <jsp:setProperty name="dbMemberQueryHandler" property="text" value="<%= autocomplete %>"/>
      <jsp:setProperty name="dbMemberQueryHandler" property="sort" value="name"/>
    </jsp:useBean><%    
    resultCollection = dbMemberQueryHandler.getIdResultList();
  }
  
  if (resultCollection == null) {
    %><ul class="dropdown-menu"><li class="nomatch"><a href='#'><%= glp("ui.adm.allmbr-list.toomany") %></a></li></ul><%
    return;
  }
  
  request.setAttribute("ACResultCollection", resultCollection);
  int proposedResults = channel.getIntegerProperty("autocomplete.proposedresults.member", 
                        channel.getIntegerProperty("autocomplete.proposedresults", 
                        5));
  request.setAttribute("ACProposedResult", new Integer(proposedResults));
  
  String acurl = "jcore/autocomplete/acmember.jsp?autocomplete="+encodeForURL(autocomplete);
  acurl += "&admin="+adminOnly+"&workerOnly="+workerOnly+"&jstore="+jstoreMembers+"&jcmsdb="+jcmsdbMembers;
  if (hasParameter("enabled")) { acurl += "&enabled="+getBooleanParameter("enabled", true); }
  if (hasParameter("usage")) { acurl += "&usage="+getIntParameter("usage", 0); }
  if (hasParameter("wrkspc")) { acurl += "&wrkspc="+getDataIdParameter("wrkspc"); }
  if (hasParameter("gid")) { acurl += "&gid="+getDataIdParameter("gid"); }
  if (hasParameter("gids")) { acurl += JcmsUtil.dataListToString(getDataSetParameterValues("gids", Group.class), "&gids="); }
  if (hasParameter("gidsOff")) { acurl += JcmsUtil.dataListToString(getDataSetParameterValues("gidsOff", Group.class), "&gidsOff="); }
  acurl += "&skip=";
  
%><jalios:include target="AC_MEMBER" targetContext="empty"/><%
  proposedResults = ((Integer) request.getAttribute("ACProposedResult")).intValue();
  resultCollection = (Collection<String>) request.getAttribute("ACResultCollection");
  int more = skip + proposedResults;
%>
<ul class="dropdown-menu typeahead-photo">
<%
  int beginPageCount = skip +1; //count from 1
  int endPageCount = Math.min(skip+proposedResults, resultCollection.size());

  if (skip > 0){ out.println("<li class='info results'><a href='#'>"+glp("ui.com.lbl.count-result",beginPageCount,endPageCount)+"</a></li>"); }
  if (skip > 0){ out.println("<li class='ajax-refresh previous'><a href='"+acurl+(skip - proposedResults)+"'>"+glp("ui.com.lbl.prev-result")+"</a></li>"); }

  int i = proposedResults; boolean match = false; boolean first = true;
  Iterator<String> it = null; // for
  for (it = resultCollection.iterator(); it.hasNext() && i > 0; ){
    String memberId = it.next();
    
    Member member = channel.getMember(memberId);
    if (member == null) { continue; }
    if (skip > 0) { skip--; continue; }
    match = true;
    String mentionDataAttribute = isMentionAutocomplete && Util.notEmpty(member.getEmail()) ? "data-mention-email-prefix=\"" + member.getEmail().split("@")[0] + "\"" : "";
    %>
    <li <%= first ? "class='active'" : "" %> <%= mentionDataAttribute %> data-value='<%= member.getId() %>' data-placeholder="<%= encodeForHTMLAttribute(member.getFullName(), true) %>" title="<%= encodeForHTMLAttribute(member.getFullName(), true) %>"><a class="member-link" href="#">
    <span class='thumb<%= Util.isEmpty(member.getPhoto()) ? " has-no-photo" : "" %>'>
      <jalios:memberphoto member="<%= member %>" css="photo" width="26" height="26" link="false" showStatus="false" />
    </span> 
    <div><%= encodeForHTML(JcmsUtil.unescapeHtml(member.getFullName())) %></div>
 
    <span class='info'>
      <% if ((isAdmin || member.isEmailVisible()) && Util.notEmpty(member.getEmail())) { %> (<%= encodeForHTML(member.getEmail()) %>)<% } %>     
    </span></a></li><%
    i--; first = false;
  }
  
  if (!match) { %><li class="nomatch"><a href='#'><%= glp("ui.com.lbl.no-result") %></a></li><%
  } 
  else if (i == 0 && it.hasNext()) { out.println("<li class='ajax-refresh next'><a href='"+acurl+more+"'>"+glp("ui.com.lbl.next-result")+"</a></li>"); }
%>
</ul>
    