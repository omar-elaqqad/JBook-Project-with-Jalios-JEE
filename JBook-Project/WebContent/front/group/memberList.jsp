<%--
  @Summary: Display members of specified Group, for a Front Office context.
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
<jsp:useBean id="memberQueryHandler" scope="page" class="com.jalios.jcms.handler.MemberQueryHandler">
  <jsp:setProperty name="memberQueryHandler" property="request" value="<%= request %>"/>
  <jsp:setProperty name="memberQueryHandler" property="gid" value="<%= grp.getId() %>" />
  <jsp:setProperty name="memberQueryHandler" property="*" />
</jsp:useBean>
<jsp:useBean id="enabledMemberQueryHandler" scope="page" class="com.jalios.jcms.handler.MemberQueryHandler">
  <jsp:setProperty name="enabledMemberQueryHandler" property="request" value="<%= request %>"/>
  <jsp:setProperty name="enabledMemberQueryHandler" property="gid" value="<%= grp.getId() %>" />
  <jsp:setProperty name="enabledMemberQueryHandler" property="*" />
  <jsp:setProperty name="enabledMemberQueryHandler" property="enabled" value="true" />
</jsp:useBean>
<jsp:useBean id="contactMemberQueryHandler" scope="page" class="com.jalios.jcms.handler.MemberQueryHandler">
  <jsp:setProperty name="contactMemberQueryHandler" property="request" value="<%= request %>"/>
  <jsp:setProperty name="contactMemberQueryHandler" property="gid" value="<%= grp.getId() %>" />
  <jsp:setProperty name="contactMemberQueryHandler" property="*" />
  <jsp:setProperty name="contactMemberQueryHandler" property="usage" value="<%= Member.USAGE_CONTACT %>" />
</jsp:useBean>
<%
Comparator<? super Member> memberComparator = ComparatorManager.getComparator(Member.class, mlPagerHandler.getSort(), mlPagerHandler.isReverse());
Set<Member> memberSet = memberQueryHandler.getResultSet(memberComparator);
Collection<Member> collection = memberSet;
int totalSize = Util.getSize(enabledMemberQueryHandler.getResultSet(memberComparator)) + Util.getSize(contactMemberQueryHandler.getResultSet(memberComparator));
boolean isDBMemberList = false;
%>

<div class="container-fluid WorkArea">
  <div class="row">
    <div class="col-xs-12">
      <div class="page-header">
        <h1>
          <%= glp("ui.group-members.title", grp.getName(userLang)) %> (<%= totalSize %>)
        </h1>
      </div>
      <%@ include file="/front/group/doMemberList.jspf" %>
    </div>
  </div>
</div>

<%@ include file='/jcore/doEmptyFooter.jspf' %>