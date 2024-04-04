<%@ include file="/jcore/doInitPage.jspf" %><%

  String mbrSetAjaxAttributeName = getUntrustedStringParameter("aclMbrSetAttrId", (String) request.getAttribute("aclMbrSetAttrId"));
  if (Util.isEmpty(mbrSetAjaxAttributeName) || !mbrSetAjaxAttributeName.startsWith("aclMbrSet-")) {
    return;
  }
  Set<Member> mbrSet = (Set<Member>) jcmsContext.getAjaxRequestAttribute(mbrSetAjaxAttributeName);
  if (Util.isEmpty(mbrSet)) {
    return;
  }

%>
<jalios:pager name="mbrSetPager" declare="true" size="<%= mbrSet.size() %>" action="init" 
              paramPrefix="<%= Util.buildID(mbrSetAjaxAttributeName) %>"
              parameterMap='<%= Util.getHashMap("aclMbrSetAttrId", mbrSetAjaxAttributeName) %>'/>
<div class="ajax-refresh-div" data-jalios-ajax-refresh-url="admin/doAccessManagerRsrcsAuditMbrList.jsp">
  <ul><%
  int counter = 0;
  for (Member mbr : mbrSet) { 
    if (counter < mbrSetPager.getStart()) {
      counter++;
      continue;
    }
    if (counter >= mbrSetPager.getStart() + mbrSetPager.getPageSize()) {
      break;
    }
  %>
   <li>
    <div class="acl-mbr-item">
     <div class="mbr-icon"><jalios:memberphoto size="<%= PhotoSize.ICON %>" member="<%= mbr %>" /></div>
     <div class="mbr-link"><jalios:link data='<%= mbr %>' /></div>
     <div class="mbr-edit"><jalios:edit data='<%= mbr %>' css="btn btn-rounded" /></div>
    </div>
   </li><%
   counter++;
  }
  %>
  </ul>
  <jalios:pager name="mbrSetPager" template="pqf"/>
</div>