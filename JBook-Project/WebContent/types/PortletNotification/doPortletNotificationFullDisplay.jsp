<%-- 
  @Summary: Portlet Notification
  @Category: FO
  @Author: Randy Lowao
  @Customizable: True
  @Requestable: True
--%>
<%@ include file='/jcore/doInitPage.jspf' %>
<%@ include file='/jcore/portal/doPortletParams.jspf' %>
<%
PortletNotification box = (PortletNotification) portlet; 

if (!isLogged) {
  request.setAttribute("ShowPortalElement",Boolean.FALSE);
  return;
}
int[]   periods = NotificationManager.getAvailablePeriods();
TreeSet  pubSet = new TreeSet(Data.getMdateComparator());

// For each available periods
for (int i = 0; i < periods.length; i++) {
  // retrieve publications set
  NotificationQuery nq = new NotificationQuery(periods[i]);
  Set<Publication> mbrNotifiedPubSet = nq.getMemberPublicationSet(loggedMember);
  // and add publications to the TreeSet
  if (Util.notEmpty(mbrNotifiedPubSet)) {
    pubSet.addAll(mbrNotifiedPubSet);
  }
}
if (Util.isEmpty(pubSet)) {
  request.setAttribute("ShowPortalElement",Boolean.FALSE);
  return;
}

boolean showFileSize = !channel.getBooleanProperty("accessibility.feature.fileinformation.enabled", false);

%>
<jalios:pager name='pager' declare='true' action='init'
              size='<%= Util.getSize(pubSet) %>'
              paramPrefix='<%= PortalManager.PORTAL_ACTION+"_"+box.getId()+"_" %>'
              pageSize='<%= box.getMaxResults() %>'/>
<div class="portletnotification">
  <jalios:if predicate='<%= Util.notEmpty(pubSet) %>'>
    <jalios:list>
      <jalios:foreach collection="<%= pubSet %>" type="Publication" name="itPub" max='<%= pager.getPageSize() %>' skip='<%= pager.getStart() %>'>
        <jalios:dataListItem data="<%= itPub %>" />
      </jalios:foreach>
    </jalios:list>
  </jalios:if>
  <jalios:pager name="pager" template="pqf" />
</div>