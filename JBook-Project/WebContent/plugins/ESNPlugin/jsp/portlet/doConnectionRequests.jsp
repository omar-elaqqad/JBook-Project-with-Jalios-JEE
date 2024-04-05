<%@ include file='/plugins/ESNPlugin/jsp/common/doCommonParams.jspf' %>
<% 
if (!isMyProfile || !esnMgr.isConnectionRequestEnabled()) {
  request.setAttribute("ShowPortalElement" , Boolean.FALSE);    
  return;
}
if (hasParameter("opDeleteMCR")) {
  String mcrId = getDataIdParameter("mcrId");
  esnMgr.deleteMemberConnectionRequest(loggedMember, mcrId);
}

String tab = getStringEnumParameter("esnSkinTab", "received", new String[] {"received", "sent"});

List<MemberConnectionRequest> receivedList = esnMgr.getMemberConnectionRequestReceivedList(loggedMember, 0);
List<MemberConnectionRequest> sentList = esnMgr.getMemberConnectionRequestSentList(loggedMember, 0);
if (Util.isEmpty(receivedList) && Util.isEmpty(sentList)) {
  request.setAttribute("ShowPortalElement" , Boolean.FALSE);    
  return;  
}
request.setAttribute("skinTitle", glp("jcmsplugin.esn.lbl.connections.requests"));
request.setAttribute("defaultSkin.info", Util.getString(request.getAttribute("defaultSkin.info"), "") + "<span class='badge badge-warning'>" + (Util.getSize(receivedList) + Util.getSize(sentList)) + "</span>");

boolean showReceived = "received".equals(tab) && Util.notEmpty(receivedList);
boolean showSent     = ("sent".equals(tab) || !showReceived)  && Util.notEmpty(sentList);

boolean hasReceivedRequest = false;
boolean hasSentRequest = false;
%>
  
  
<div class="connections mcr">
  
    <ul class="nav nav-tabs">
      <% if (Util.notEmpty(receivedList)) { %>  
      <li <%= showReceived ? "class='active'" : "" %>><a class="ajax-refresh" href="<%= ServletUtil.getUrlWithUpdatedParam(request, "esnSkinTab", "received") %>"><%= glp("jcmsplugin.esn.lbl.connections.requests.in") %></a></li>
      <% } %>
      <% if (Util.notEmpty(sentList)) { %>  
      <li <%= showSent ? "class='active'" : "" %>><a class="ajax-refresh" href="<%= ServletUtil.getUrlWithUpdatedParam(request, "esnSkinTab", "sent") %>"><%= glp(Util.notEmpty(receivedList) ? "jcmsplugin.esn.lbl.connections.requests.out2" : "jcmsplugin.esn.lbl.connections.requests.out") %></a></li>
      <% } %>
    </ul>
  
    <%-- Received Requests --%>
    <% if (showReceived) { %>
    <div id="connectionsReceived" >
      <jalios:pager name='receivedPagerHandler' 
                    declare='true' 
                    action='init' 
                    pageSize='5' 
                    size='<%= receivedList.size() %>' />
      <jalios:foreach collection="<%= receivedList %>" 
                      type="MemberConnectionRequest" 
                      name="itRequest"
                      max="<%= receivedPagerHandler.getPageSize() %>"
                      skip="<%= receivedPagerHandler.getStart() %>">
      <% Member itMember = itRequest.getAuthor(); %>
      <% if (itMember != null) { %>
      <% hasReceivedRequest = true; %>
      <div class="connectionsReceived item-box-member item-box">
        <table class="connection-list">
          <tr class="item">
            <td class="photo-part">
	            <jalios:memberphoto member="<%= itMember %>" size="<%= PhotoSize.TINY %>" />
            </td>
            <td class="info-part">
              <jalios:link data="<%= itMember %>" css="name" /><br/>
              <% if (dataWriteEnabled) { %>
              <a class="modal btn btn-default" href="plugins/ESNPlugin/jsp/form/validateConnectionRequest.jsp?id=<%= itRequest.getId() %>&amp;redirect=<%= ServletUtil.encodeURL(itMember.getDisplayUrl(userLocale)) %>"><%= glp("jcmsplugin.esn.lbl.connections.requests.edit") %></a>
              <% } %>
            </td>
          </tr>
        </table>
      </div>
      <% } %>
      </jalios:foreach>
      <jalios:pager name='receivedPagerHandler' template='pqf' />      
    </div>
    <% } %>
    
    <%-- Sent Requests --%>
    <% if (showSent) { %>  
    <div id="connectionsSent" >
      <table>
      <jalios:pager name='sentPagerHandler' 
                    declare='true' 
                    action='init' 
                    pageSize='5' 
                    size='<%= sentList.size() %>' />
      <jalios:foreach collection="<%= sentList %>" 
                      type="MemberConnectionRequest" 
                      name="itRequest"
                      max="<%= sentPagerHandler.getPageSize() %>"
                      skip="<%= sentPagerHandler.getStart() %>">
        <% Member itMember = itRequest.getMember(); %>
        <% if (itMember != null) { %>    
        <% hasSentRequest = true; %>
        <tr>
          <td style="width:100%;">
            <jalios:icon src="email-go" /> 
            <strong><jalios:link data="<%= itMember %>" /></strong>
          </td>
          <td class="txt-left">
            <span class="date"><jalios:date date="<%= itRequest.getCdate() %>" format="short"/></span>
          </td>
          <td class="txt-right">
            <% if (dataWriteEnabled) { %>
            <a class="ajax-refresh confirm ajax-action" onclick="return false;" data-jalios-text="<%= glp("jcmsplugin.esn.mcr.lbl.confirm-delete", itMember) %>" href="plugins/ESNPlugin/jsp/doConnectionRequests.jsp?opDeleteMCR=true&amp;mid=<%= member.getId() %>&amp;mcrId=<%= itRequest.getId() %>"><jalios:icon src="remove-small" title='<%= glp("ui.com.btn.delete") %>' /></a>
            <% } %>
          </td>
        </tr>
        <% } %>
      </jalios:foreach>
      </table>
      <jalios:pager name='sentPagerHandler' template='pqf' />
    </div>
    <% } %>
</div>

<% 
if (!hasReceivedRequest && !hasSentRequest) {
  request.setAttribute("ShowPortalElement" , Boolean.FALSE);    
  return;  
} 
%>
