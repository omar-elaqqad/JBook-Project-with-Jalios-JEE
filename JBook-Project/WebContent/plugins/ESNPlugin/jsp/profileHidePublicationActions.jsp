<%@ include file='/jcore/doInitPage.jspf' %><%
  Publication pub = (Publication) request.getAttribute("publication");

  if (pub == null) {
    return;
  }
  
  if (!(pub instanceof MemberProfile)) {
    return;
  }
  
  request.setAttribute("jcms.publication.actions.hide",true);
%>