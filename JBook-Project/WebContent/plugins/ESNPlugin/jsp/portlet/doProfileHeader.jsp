<%@page import="com.jalios.jcmsplugin.esn.ui.ESNHTMLConstants"%><%
%><%@ include file='/plugins/ESNPlugin/jsp/common/doCommonParams.jspf' %><%

boolean showActivity = Util.toBoolean(request.getAttribute("esn.showActivity"), false);
boolean showInfo     = Util.toBoolean(request.getAttribute("esn.showInfo"), false);
boolean showContact  = Util.toBoolean(request.getAttribute("esn.showContact"), false);
boolean showResume   = Util.toBoolean(request.getAttribute("esn.showResume"), false);
boolean isFollowing = !isMyProfile && esnMgr.isFollowing(loggedMember, member);

jcmsContext.addCSSHeader("plugins/ESNPlugin/css/microblogging.css");

String salutation = member.getLangSalutation(userLang);
%>

<div id="esn-header">
  <div id="esn-header-profil" class="column">
    <%@ include file='/plugins/ESNPlugin/jsp/common/doProfilePhoto.jspf' %> 
    <div class="profil-details">
      <h1 class="profil-name" itemprop="name"><%= Util.notEmpty(salutation) ? salutation + " " : "" %><%= member.getFullName() %></h1>
      <%@ include file='/plugins/ESNPlugin/jsp/common/doESNMemberOrganization.jspf' %>
      <%-- Status --%>
      <% if (isAccount) { 
        boolean canCreateMicroBlogging = MicroBloggingManager.getInstance().canMicroBlog(loggedMember);
        MicroBlogging microBlogging = (MicroBlogging) MicroBloggingManager.getInstance().getLastMicroBlogging(member,loggedMember); 
        Date lastLoginDate = member.getLastLoginDate(); 
        if (Util.toBoolean(request.getAttribute("esn.showMicroBlogging"), true) && (isMyProfile || microBlogging != null || lastLoginDate != null)) {%>
      <% String statusInfo = microBlogging != null ? "" + glp("jcmsplugin.esn.lbl.status-info", JcmsUtil.getFriendlyDate(microBlogging.getMdate(), DateFormat.SHORT, DateUtil.isToday(microBlogging.getMdate()), userLocale)) : ""; %>
      <% if (canCreateMicroBlogging) { %>
      <div id="wrapper-status">
        <span class="arrow"></span>        
        <div class="status" title="<%= encodeForHTMLAttribute(statusInfo) %>">
          <div class="microblogging-container">
            <% if(microBlogging != null || isMyProfile) { %>
            <%            
              boolean canMicroBlog = MicroBloggingManager.getInstance().canMicroBlog(loggedMember);
            %>          
            <% if(microBlogging != null) { %>
               <jalios:link data="<%= microBlogging %>" css="microblogging-link"><jalios:icon src="jcmsplugin-esn-status" /></jalios:link><jalios:wiki css="wiki microblogging"><%= Util.getString(microBlogging.getText(), "") %></jalios:wiki>
            <% } else if(canMicroBlog) {%>
              <a class="modal" onclick="return false;" href="plugins/ESNPlugin/jsp/form/editStatus.jsp?mid=<%= member.getId() %>"><%= glp("jcmsplugin.esn.status.intro") %></a>
            <% } %>
            <% if (isMyProfile && dataWriteEnabled && canMicroBlog && microBlogging != null) { %>
              <a class="modal" onclick="return false;" href="plugins/ESNPlugin/jsp/form/editStatus.jsp?mid=<%= member.getId() %>"><jalios:icon src="add-small" title='<%= glp("jcmsplugin.esn.microblogging.title.create-message") %>' /></a>
              <a onclick='confirmAction("<%= glp("jcmsplugin.esn.microblogging.delete-confirm") %>", this.href); return false;' href="edit.jsp?id=<%= microBlogging.getId() %>&amp;opDelete=true&amp;confirm=true&amp;redirect=<%= ServletUtil.getUrl(request) %>" class="editArea ">
                <jalios:icon src="remove-small" title='<%= glp("ui.com.btn.delete") %>' />
              </a>
            <% } %> 
            <% } %>
          </div>
          <span class="status-date">
          <%= encodeForHTMLAttribute(statusInfo) %>
          </span>

          <%-- Last Login Date --%>
          <% if (lastLoginDate != null) { %>
          <p class="info-connection">
            <%= glp("jcmsplugin.esn.lbl.last-connection") %> <%= JcmsUtil.getFriendlyDate(lastLoginDate, DateFormat.SHORT, true, userLocale) %>
          </p>
          <% } %>
        </div>
      </div>
      <% } %>
      <% } %>
      
      <%-- Contact Info --%>
      <% } else { %>
        <% 
        Member addressMember = member; 
        if (addressMember != null && addressMember.hasAnyAddress()) {
        %>
        <span class="profil-address profile-address">
          <%@ include file="/plugins/ESNPlugin/jsp/common/doESNMemberAddress.jspf" %>     
        </span>
        <% } %>
        <% { Member itMember = member;  %><ul class="coordonnees-infos"><%@ include file="/plugins/ESNPlugin/jsp/common/doEmailAndPhone.jspf" %></ul><% } %>   
      <% } %>
      
    </div>
    <ul class="nav nav-tabs">
      <% if (isAccount && Util.toBoolean(request.getAttribute("esn.showActivityTab"), true) && (isMyProfile || isConnected || isFollowing)) { %>
      <li class="profile-tab-activity<%= showActivity ? " active" : "" %>">
      <a href="<%= ServletUtil.getUrlWithUpdatedParam(request, "esnProfileTab", "activity") %>">
      <span><%= glp("jcmsplugin.esn.profile.tab.activity") %></span></a></li>
      <% } %>   
    <% if (Util.toBoolean(request.getAttribute("esn.showInfoTab"), true)) { %>
      <li class="profile-tab-info<%= showInfo     ? " active" : "" %>"><a href="<%= ServletUtil.getUrlWithUpdatedParam(request, "esnProfileTab", "info") %>"><span><%= glp("jcmsplugin.esn.profile.tab.info") %></span></a></li>
    <% } %>
    <% if (Util.toBoolean(request.getAttribute("esn.showContactTab"), true)) { %>
        <%
          String connectionType = getStringEnumParameter("connectionType", "", new String[] {"all", "account", "contact", "following", "follower"});
          boolean showAll       = "all".equals(connectionType);
          boolean showAccount   = "account".equals(connectionType);
          boolean showConnectionsContact   = "contact".equals(connectionType);
          boolean showFollowing = "following".equals(connectionType);
          boolean showFollower  = "follower".equals(connectionType);
          
          SortedSet<Member> allSet     = esnMgr.getSortedConnectionSet(member, true, true);
          SortedSet<Member> accountSet = esnMgr.getSortedConnectionSet(member, true, false);
          SortedSet<Member> contactSet = esnMgr.getSortedConnectionSet(member, false, true);
          SortedSet<Member> followingSet = esnMgr.getSortedFollowingSet(member);
          SortedSet<Member> followerSet = esnMgr.getSortedFollowerSet(member);
        %>
        <li class="dropdown profile-tab-connections<%= showContact  ? " active" : "" %>">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#"><%= glp("jcmsplugin.esn.profile.tab.contacts") %> <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li class="profile-tab-connections-all"><a href="<%= profile.getDisplayUrl(userLocale) %>?esnProfileTab=contact&amp;connectionType=all"><%= glp("jcmsplugin.esn.lbl.connections.all-contacts") %>  (<%= Util.getSize(allSet) %>)</a></li>
            <li class="divider" role="<%= ESNHTMLConstants.SEPARATOR_ROLE %>"></li>
            <li class="profile-tab-connections-account"><a href="<%= profile.getDisplayUrl(userLocale) %>?esnProfileTab=contact&amp;connectionType=account"><%= glp("jcmsplugin.esn.lbl.connections.internal") %> (<%= Util.getSize(accountSet) %>)</a></li>
            <% if (esnMgr.isExternalContactsManaged()) { %>
              <li class="profile-tab-connections-contacts"><a href="<%= profile.getDisplayUrl(userLocale) %>?esnProfileTab=contact&amp;connectionType=contact"><%= glp("jcmsplugin.esn.lbl.connections.external") %>  (<%= Util.getSize(contactSet) %>)</a></li>
            <% } %>    
            <% if (member.isAccount()) { %>    
              <li class="profile-tab-connections-following"><a href="<%= profile.getDisplayUrl(userLocale) %>?esnProfileTab=contact&amp;connectionType=following"><%= glp("jcmsplugin.esn.lbl.followings") %>  (<%= Util.getSize(followingSet) %>)</a></li>
              <li class="profile-tab-connections-followers"><a href="<%= profile.getDisplayUrl(userLocale) %>?esnProfileTab=contact&amp;connectionType=follower"><%= glp("jcmsplugin.esn.lbl.followers") %>  (<%= Util.getSize(followerSet) %>)</a></li>
            <% } %>
          </ul>
        </li>      
      <% } %>
      <% if (isAccount && Util.toBoolean(request.getAttribute("esn.showResumeTab"), true)) { %>
      <li class="profile-tab-resume<%= showResume   ? " active" : "" %>"><a href="<%= ServletUtil.getUrlWithUpdatedParam(request, "esnProfileTab", "resume") %>"><span><%= glp("jcmsplugin.esn.profile.tab.resume") %></span></a></li>
      <% } %>
    <% if (Util.toBoolean(request.getAttribute("esn.showTargetTab"), true)) { %>
      <jalios:include target="PLUGIN_ESN_PROFILE_TAB" targetContext="li" />       
    <% } %>
    </ul>
  </div>
</div>