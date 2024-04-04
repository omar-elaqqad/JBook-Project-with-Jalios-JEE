<%@page import="com.jalios.jcms.taglib.card.CardsDisplayMode"%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ page import="com.jalios.jcms.handler.QueryHandler" %><%

if (!(isLogged || channel.getBooleanProperty("query.show-mbrs-to-anonymous", false))) {
  return;
}

QueryHandler qh = (QueryHandler) request.getAttribute("query.queryHandler");
qh = qh != null ? qh : (QueryHandler) jcmsContext.getAjaxRequestAttribute("query.queryHandler");
if (qh == null) {
  return;
}
jcmsContext.setAjaxRequestAttribute("query.queryHandler", qh);
if (Util.isEmpty(qh.getText())) {
  return;
}

jcmsContext.addCSSHeader("css/jalios/core/jalios-member-card.css");
final String mbrSort = getAlphaNumParameter("mbrSort", channel.getProperty("query.sort.mbr.fo", "name"));
%>
<div class="ajax-refresh-div" data-jalios-ajax-refresh-url="front/queryMembers.jsp">
  <jalios:pager name="queryMembersPagerHandler" paramPrefix="mbr" action="init" declare="true" pageSize="60"/>
  
  <jsp:useBean id="amqh" scope="page" class="com.jalios.jcms.handler.AllMemberQueryHandler"><%
    %><jsp:setProperty name="amqh" property="request" value="<%= request %>"/><%
    %><jsp:setProperty name="amqh" property="*" /><%
    %><jsp:setProperty name="amqh" property="text" value='<%= qh.getText() %>'/><%
    %><jsp:setProperty name="amqh" property="sort" value='<%= mbrSort %>'/><%
    %><jsp:setProperty name="amqh" property="enabled" value='true'/><%
  %></jsp:useBean><%
    
List<String> mids = amqh.getIdResultList();
request.setAttribute("query.memberIdList", mids);

Object amqhMaxReached = amqh.getAttribute(com.jalios.jcms.search.LuceneMemberSearchEngine.MAXIMUM_RESULTS_NUMBER_REACHED);
int amqhResultsNbr = Util.toInteger(amqhMaxReached, Util.getSize(mids));
boolean amqhTooManyResults = Util.notEmpty(amqhMaxReached) && (amqhResultsNbr >= channel.getIntegerProperty("query.lucene.mbr.max-results", 2000));

if (Util.notEmpty(mids)) { %>
<div class="app-cards-horizontal-wrapper search-members responsive">

  <div class="navbar navbar-default">
    <div class="container-fluid">
      <div class="navbar-header">
        <div class="navbar-brand">
          <%= glp("ui.work.query.txt.mbr-result", amqhResultsNbr) %>
        </div>
      </div>
    </div>
  </div>
  
  <% if (amqhTooManyResults) { %>
   <jalios:message level="<%= MessageLevel.INFO %>" dismissable="true" title="" msg="ui.adm.allmbr-list.toomany"/>
  <% } %>
  
  <jalios:pager name="queryMembersPagerHandler" action="compute" size="<%= Util.getSize(mids) %>" sizeAccurate="<%= !amqhTooManyResults %>" />
  <jalios:cards mode="<%= CardsDisplayMode.INLINE %>">
    <jalios:foreach collection="<%= mids %>" 
                    name="itMid" type="String"
                    skip='<%= queryMembersPagerHandler.getStart() %>' 
                    max="<%= queryMembersPagerHandler.getPageSize() %>" 
                    counter="itCounter">
        <% Member itMember = channel.getMember(itMid); %>
        <jalios:cardData data="<%= itMember %>" template="small"/>
    </jalios:foreach>
  </jalios:cards>
  
  <jalios:pager name='queryMembersPagerHandler' template="pqf"/>

</div>
<% } else { %>
  <%@ include file='/front/app/doAppNoResult.jspf' %>
<% } %>
</div><%-- EOF .ajax-refresh-div --%>