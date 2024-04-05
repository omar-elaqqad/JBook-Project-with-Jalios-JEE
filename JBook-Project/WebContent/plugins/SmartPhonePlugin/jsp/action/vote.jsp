<%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%--  
--%><%@ page import="com.jalios.jcms.vote.*" %><%

// When included
Publication pub = (Publication) request.getAttribute("jcms.plugin.smartphone.vote.pub");

if(pub == null) {
  // When AJAX call
  pub = getPublicationParameter("pubId");
}

if(pub == null) {
  return;
}


%><%@ include file="/plugins/SmartPhonePlugin/jsp/action/voteControl.jspf" %>  

<a href="" class="ajax-refresh" data-jalios-ajax-params='<%= params %>' data-jalios-ajax-action="plugins/SmartPhonePlugin/jsp/action/vote.jsp">
  <div class="vote-action footer-action<%= hasVoted ? " hasVoted" : "" %>">
    <span class="glyphicon glyphicon-thumbs-up<%= hasVoted ? " has-voted" : "" %>"></span> <%= hasVoted ? glp("jcmsplugin.smartphone.lbl.vote.unlike") : glp("jcmsplugin.smartphone.lbl.vote.like") %>
  </div>
</a>
<% request.removeAttribute("jcms.plugin.smartphone.vote.pub"); %>