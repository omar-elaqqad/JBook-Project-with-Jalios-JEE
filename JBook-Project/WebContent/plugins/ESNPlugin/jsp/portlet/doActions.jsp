<%@ include file='/plugins/ESNPlugin/jsp/common/doCommonParams.jspf' %> 
<%@ page import="com.jalios.jcms.recommendation.RecommendationManager" %>
<% 
MemberConnectionRequest receivedMCR = null; 
boolean hasReceivedMCR = false;
boolean hasSentMCR = false;
boolean connectionRequestEnabled = esnMgr.isConnectionRequestEnabled();
boolean isFollowing = !isMyProfile && esnMgr.isFollowing(loggedMember, member);
%>
<div id="esn-header-others" class="esn-profile-action-wrapper">

  <%-- Profile Info --%>
  <% if (esnMgr.isConnectionRequestEnabled() && !isMyProfile) { %>
  
  <%   receivedMCR = esnMgr.getMemberConnectionRequest(member, loggedMember);
       hasReceivedMCR = receivedMCR != null && receivedMCR.isPending(); 
  %>    
  <%   if (hasReceivedMCR) { %>
  <div class="alert alert-info esn-profile-connection-alert">
  <%= glp("jcmsplugin.esn.lbl.connections.requests.received", loggedMember.getFriendlyName(), friendlyName, channel.getDateFormat(userLang).format(receivedMCR.getCdate())) %><br/>
  <a class="btn btn-default modal" onclick="return false;" href="plugins/ESNPlugin/jsp/form/validateConnectionRequest.jsp?id=<%= receivedMCR.getId() %>&amp;redirect=<%= ServletUtil.encodeURL(member.getDisplayUrl(userLocale)) %>"><%= glp("jcmsplugin.esn.lbl.connections.requests.edit") %></a>
  </div>
  <%   } %>
  
  <%   MemberConnectionRequest sentMCR = esnMgr.getMemberConnectionRequest(loggedMember, member); 
       hasSentMCR = sentMCR != null && sentMCR.isPending();
  %>
  <%   if (hasSentMCR) { %>
  <div class="profil-info">
  <%= glp("jcmsplugin.esn.lbl.connections.requests.sent", loggedMember.getFriendlyName(), friendlyName, channel.getDateFormat(userLang).format(sentMCR.getCdate())) %>
  </div>
  <%   } %>
  <% } %>
   

  <%-- Actions --%>
  <ul class="profil-menu list-unstyled">
    <% if (isLogged) {%>
      <%@ include file="/front/doOpenModal.jspf" %>
    <% } %>  
    <% if (!isMyProfile && isLogged) { %>
    
    <%-- Send MCR --%>
    <%   if (connectionRequestEnabled && !isConnected && isAccount && !hasReceivedMCR && !hasSentMCR && dataWriteEnabled) { %>
    <li><a class="modal esn-profile-action esn-profile-action-add-connection" href="plugins/ESNPlugin/jsp/form/connectionRequest.jsp?target=<%= member.getId() %>&amp;redirect=<%= ServletUtil.encodeURL(member.getDisplayUrl(userLocale)) %>"><%= glp("jcmsplugin.esn.lbl.connections.add.member", friendlyName) %></a></li>
    <%   } %>
    
    <%-- Connect Contact --%>
    <%   if (!isConnected && (isContact || !connectionRequestEnabled) && dataWriteEnabled) { %>
    <li><a class="esn-profile-action esn-profile-action-add-connection" href="plugins/ESNPlugin/jsp/form/connectionContact.jsp?target=<%= member.getId() %>&amp;redirect=<%= ServletUtil.encodeURL(member.getDisplayUrl(userLocale)) %>"><%= glp("jcmsplugin.esn.lbl.connections.add.contact", friendlyName) %></a></li>
    <%   } %>

    <%-- Connect With other Contacts --%>
    <%   if (isConnected && isContact && dataWriteEnabled) { %>
    <li><a class="modal esn-profile-action esn-profile-action-connect-contact" onclick="return false;" href="plugins/ESNPlugin/jsp/form/connectWithOtherContacts.jsp?id=<%= member.getId() %>"><%= glp("jcmsplugin.esn.lbl.connections.connect-contact", friendlyName) %></a></li>
    <%   } %>


    <%-- Recommend --%>
    <%   if (RecommendationManager.getInstance().canBeRecommendedBy(member,loggedMember)) { %>
    <li><jalios:recommendation css="esn-profile-action esn-profile-action-recommendation" data="<%= member %>"><%= glp("jcmsplugin.esn.lbl.connections.recommendation", friendlyName) %></jalios:recommendation></li>
    <%   } %>
    
    <%-- Disconnect --%>
    <%   if (isConnected && dataWriteEnabled) { %>
    <li><a class="esn-profile-action esn-profile-action-remove-connection modal" onclick="return false;" href="plugins/ESNPlugin/jsp/form/disconnect.jsp?member=<%= loggedMember.getId() %>&amp;target=<%= member.getId() %>"><%=  glp("jcmsplugin.esn.lbl.disconnect.contact", friendlyName) %></a></li> 
    <%   } %>
    
    <%-- Follow / Unfollow--%>
    <% if (MemberActivityManager.getInstance().isActivityTrackingEnabled() && !isContact && dataWriteEnabled) { %>
    <%   if (isFollowing) { %>
    <li><a class="esn-profile-action esn-profile-action-unfollow" href="plugins/ESNPlugin/jsp/form/follow.jsp?follow=false&amp;member=<%= loggedMember.getId() %>&amp;target=<%= member.getId() %>&amp;redirect=<%= ServletUtil.encodeURL(member.getDisplayUrl(userLocale)) %>"><%=  glp("jcmsplugin.esn.lbl.unfollow", friendlyName) %></a></li> 
    <%   } else { %>
    <li><a class="esn-profile-action esn-profile-action-follow" href="plugins/ESNPlugin/jsp/form/follow.jsp?follow=true&amp;member=<%= loggedMember.getId() %>&amp;target=<%= member.getId() %>&amp;redirect=<%= ServletUtil.encodeURL(member.getDisplayUrl(userLocale)) %>"><%=  glp("jcmsplugin.esn.lbl.follow", friendlyName) %></a></li> 
    <%   } %>
    <% } %>
    
    <%-- Vcard export --%>
    <li><a class="esn-profile-action esn-profile-action-vcard" href="plugins/ESNPlugin/jsp/vcard.jsp?mid=<%= member.getId() %>"><%= glp("jcmsplugin.esn.lbl.vcard") %></a></li>
  
    <% } %>

    <%-- Edit --%>
    <% if (canEdit) { %>
    <li>
      <% 
        String editUrl = esnMgr.getMemberProfileEditor() + "?mid=" + member.getId();
        String profileDisplayPortal = getDataIdParameter("portal");
        if (Util.notEmpty(profileDisplayPortal)) {
          editUrl += "&amp;portal=" + profileDisplayPortal;
        }
        int completeness = esnMgr.getMemberProfileCompleteness(member);
      %>
      <a class="esn-profile-action esn-profile-action-edit" href="<%= editUrl %>"><%= isMyProfile ? glp("jcmsplugin.esn.lbl.edit.me") : glp("jcmsplugin.esn.lbl.edit.other", friendlyName) %></a>
      <div class="progress esn-profile-completeness">
        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="<%= completeness %>" aria-valuemin="0" aria-valuemax="100" style="width: <%= completeness %>%;">
          <%= completeness %>%
        </div>
      </div>
    </li>
    <% } %>
    <jalios:include target="PLUGIN_ESN_PROFILE_ACTION" targetContext="li" />
  </ul>
  


  <%-- Contact Info --%>
  <% if (isAccount) { %>
  <div class="profil-details">
    <% { Member itMember = member;  %>
    <ul class="coordonnees-infos">
    <%@ include file="/plugins/ESNPlugin/jsp/common/doEmailAndPhone.jspf" %>
  
    <%-- Address --%>
    <% Member addressMember = member; %>
    <% if (member.hasAnyAddress()) { %>
    <li class="profil-address">
      <%@ include file="/plugins/ESNPlugin/jsp/common/doESNMemberAddress.jspf" %>     
    </li>
    <% } %>
    <%-- Followers --%>
    <% if (isConnected) { %>
    <li class="profil-followers"><%= glp("jcmsplugin.esn.lbl.contact-followers", friendlyName, esnMgr.getFollowingCount(member), esnMgr.getFollowerCount(member)) %></li>   
    <% } %>
    </ul>      
    <% } %>   
  </div>
  <% } %>
</div>        