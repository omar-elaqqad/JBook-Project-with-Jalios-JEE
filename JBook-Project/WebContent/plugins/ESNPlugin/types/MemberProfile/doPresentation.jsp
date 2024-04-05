<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/doInitMemberProfile.jspf' %><%

if (logger.isTraceEnabled()) { logger.trace("doPresentation.jsp: start render"); }

// Tests synced with doTabCVValidate.jsp
String introduction = profile.getIntroduction();
boolean hasIntroduction = Util.notEmpty(introduction);
List<String> interest = profile.getInterest();
Member manager = member.getManager();
boolean showManager = esnProfileDisplayHandler.showManager(); 
Member assistant = esnProfileDisplayHandler.getAssistant();
boolean showAssistant = esnProfileDisplayHandler.showAssistant();
boolean hasDateOfBirth = Util.notEmpty(profile.getDateOfBirth());
boolean hasDateOfArrival = Util.notEmpty(profile.getDateOfArrival());
boolean hasInterest = Util.notEmpty(interest);
boolean show = hasIntroduction || showManager || showAssistant || hasDateOfBirth || hasDateOfArrival || hasInterest; 
if (!show) {
  if (logger.isTraceEnabled()) { logger.trace("doPresentation.jsp: nothing to render"); }
  return;
}
jcmsContext.addCSSHeader("plugins/ESNPlugin/css/esn-comment.css");
String css = "profile-body-block profile-presentation";
String portalParam = Util.notEmpty(esnMgr.getMemberProfilePortal()) ? "&amp;portal=" + esnMgr.getMemberProfilePortal().getId() : "";
String title = glp("jcmsplugin.esn.lbl.introduction");
%>
<div class="<%= css %>">
  <div class="section-title profile-info-presentation-title"<%
      %> role="<%= ESNHTMLConstants.HEADING_ROLE %>"<%
      %> aria-level="3">
    <%= title %>
  </div>
  
  <div class="profile-info-presentation-content introduction">
    <%
    if (logger.isTraceEnabled()) { logger.trace("doPresentation.jsp: calling Target PLUGIN_ESN_MEMBER_PROFILE_PRESENTATION_TOP"); }
    %>
    <jalios:include target="PLUGIN_ESN_MEMBER_PROFILE_PRESENTATION_TOP" />
    <%
    if (logger.isTraceEnabled()) { logger.trace("doPresentation.jsp: end of calling Target PLUGIN_ESN_MEMBER_PROFILE_PRESENTATION_TOP"); }
    %>

    <%-- Introduction --%>
    <% if (hasIntroduction) { %>
    <jalios:buffer name="introDomBuffer">
    <jalios:wiki><%= introduction %></jalios:wiki>
    </jalios:buffer>
      <% if (isAccount) { %>
      <div class="profile-introduction esn-comment-pane profile-header-item">
        <div class="esn-comment-pane-author esn-comment-pane-member-photo">
          <jalios:memberphoto member="<%= member %>" size="<%= PhotoSize.TINY %>"/>
        </div>
        <div class="esn-comment-pane-content">
          <%= introDomBuffer.toString() %>
        </div>
      </div>
      <% } else { %>
        <%= introDomBuffer.toString() %>
      <% } %>
    <% } %>

    <%-- Manager --%>
    <% if (showManager) { %>
    <div class="other-info">
      <span class='label'><%= glp("ui.com.lbl.manager") %> :</span>
      <jalios:link data="<%= manager %>" />
    </div>
    <% } %>

    <%-- Assistant --%>
    <% if (showAssistant) { %>
    <div class="other-info">
      <span class='label'><%= glp("ui.com.lbl.assistant") %> :</span>
      <jalios:link data="<%= assistant %>" />
    </div>
    <% } %>

    <%-- DateOfBirth --%>
    <% if (hasDateOfBirth) { %>
    <div class="other-info">
      <span class='label'><%= glp("jcmsplugin.esn.lbl.date-of-birth") %> :</span>
      <span itemprop="birthDate"><jalios:date date="<%= profile.getDateOfBirth() %>" format="dd MMMM" locale="<%= userLocale %>" /></span>
    </div>
    <% } %>
    
    <%-- DateOfArrival --%>
    <% if (hasDateOfArrival) { %>
    <div class="other-info" >
      <span class='label'><%= glp("jcmsplugin.esn.lbl.date-of-arrival") %> :</span>
      <span itemprop="dateOfArrival"><jalios:date date="<%= profile.getDateOfArrival() %>" format="dd MMMM yyyy" locale="<%= userLocale %>" /></span>
    </div>
    <% } %>
    
    <%-- Interest --%>
    <% if (hasInterest) { %>
    <div class="other-info">
      <span class='label'><%= glp("jcmsplugin.esn.lbl.interest") %> :</span>
      <%= Util.join(interest, ", ") %>
    </div>
    <% } %>
  </div>
  <%
  if (logger.isTraceEnabled()) { logger.trace("doPresentation.jsp: calling Target PLUGIN_ESN_MEMBER_PROFILE_PRESENTATION_BOTTOM"); }
  %>
  <jalios:include target="PLUGIN_ESN_MEMBER_PROFILE_PRESENTATION_BOTTOM" />
  <%
  if (logger.isTraceEnabled()) { logger.trace("doPresentation.jsp: end of calling Target PLUGIN_ESN_MEMBER_PROFILE_PRESENTATION_BOTTOM"); }
  %>
</div>
<%
if (logger.isTraceEnabled()) { logger.trace("doPresentation.jsp: end render"); }
%>