<%@ include file="/jcore/doInitPage.jspf" %>
<% 
if(!Util.toBoolean(jcmsContext.getAjaxRequestAttribute("ACContact"),false)){
    return;
}

String autocomplete = getUntrustedStringParameter("autocomplete","");
Set<Member> contactSet = (Set) jcmsContext.getAjaxRequestAttribute("ACContactSet");

if(Util.isEmpty(contactSet)){
    request.setAttribute("ACResultCollection",Collections.EMPTY_LIST);
    request.setAttribute("ACProposedResult",0);
} 

DataSelector selector = null;
Set set = null;
selector = new Member.TextSelector(autocomplete);
contactSet = JcmsUtil.select(contactSet, selector, null);

if(Util.isEmpty(contactSet)){
    request.setAttribute("ACResultCollection",Collections.EMPTY_LIST);
    request.setAttribute("ACProposedResult",0);
} 
Collection<String> idCollection = JcmsUtil.dataCollectionToIdList(contactSet);

if(Util.isEmpty(idCollection)){
    request.setAttribute("ACResultCollection",Collections.EMPTY_LIST);
    request.setAttribute("ACProposedResult",0);
}

request.setAttribute("ACResultCollection",idCollection);
request.setAttribute("ACProposedResult",idCollection.size());
%>