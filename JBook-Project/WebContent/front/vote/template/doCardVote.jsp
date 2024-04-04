<%@page import="com.jalios.jcms.uicomponent.AjaxRefreshButtonDataAttribute.AjaxRefreshOption"%>
<%@page import="com.jalios.jcms.uicomponent.Button.ButtonType"%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ page import="com.jalios.jcms.vote.*" %><%
%><%@ include file="/front/vote/voteControl.jspf" %><%
if (!canVote) {
  return;
}

if (!pub.isVotable()) {
  return;
}

Map<String, Object> ajaxParams = new HashMap<>();
ajaxParams.put("pubId", pub.getId());
ajaxParams.put("positiveVote", true);
ajaxParams.put("vote", true);
%><div class="card-vote-action-wrapper<%= hasVoted ? " has-voted" : "" %>">
  <jalios:buttonAjax css="btn btn-text btn-rounded" 
    buttonType="<%= ButtonType.A %>" 
    ajaxAttributes='<%= new AjaxRefreshButtonDataAttribute().addOption(AjaxRefreshOption.NO_HISTORY).url("front/vote/template/doCardVote.jsp").params(ajaxParams) %>'>
    <jalios:icon src="alert-vote" /><span class="card-action-item-label"><%= glp("ui.vote.like") %></span>
  </jalios:buttonAjax>
</div>