<%--
  @Summary: Display DBMembers of specified Group, for a Front Office context.
            Must be logged, but does not require specific "users" ACL.
  @Category: Group / Member
  @Author: Sylvain DEVAUX
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-9.0.3
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/doEmptyHeader.jspf' %>

<%@ include file="/front/group/checkMemberList.jspf" %>

<jalios:pager name='mlPagerHandler' declare='true' action='init' />
<%
int memberPageSize = getIntParameter("pageSize", 12); // Variable used in included '/front/doMemberCards.jspf'
%>
<jsp:useBean id="dbMemberQueryHandler" scope="page" class="com.jalios.jcms.handler.DBMemberQueryHandler">
  <jsp:setProperty name="dbMemberQueryHandler" property="request" value="<%= request %>"/>
  <jsp:setProperty name="dbMemberQueryHandler" property="gid" value="<%= grp.getId() %>" />
  <jsp:setProperty name="dbMemberQueryHandler" property="pageSize" value='<%= memberPageSize %>' />
  <jsp:setProperty name="dbMemberQueryHandler" property="*" />
  <jsp:setProperty name="dbMemberQueryHandler" property="enabled" value="true" />
</jsp:useBean>
<%
PageResult<DBMember> pageResult = dbMemberQueryHandler.getPageResult();
int totalSize = pageResult.getTotalSize();
Collection<DBMember> memberSet = pageResult.getResultList();
boolean isDBMemberList = true;
// Define the real total size, not the memberSet.size() which is only the current page size
request.setAttribute("member-cards-total-size", totalSize);
%>
<div class="container-fluid WorkArea">
  <div class="row">
    <div class="col-xs-12">
      <div class="page-header">
        <h1>
          <%= glp("ui.group-members.db.title", grp.getName(userLang)) %> (<%= totalSize %>)
        </h1>
      </div>
      <%@ include file="/front/group/doMemberList.jspf" %>
    </div>
  </div>
</div>
<%
request.removeAttribute("member-cards-total-size");
%>

<%@ include file='/jcore/doEmptyFooter.jspf' %>