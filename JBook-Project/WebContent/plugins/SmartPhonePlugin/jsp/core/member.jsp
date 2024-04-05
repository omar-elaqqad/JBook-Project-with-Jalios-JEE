<%@ include file='/plugins/SmartPhonePlugin/jsp/common/header.jspf' %><%
%><%@page import="java.lang.reflect.Method"%><%
%><%@ page import='com.jalios.jcms.alert.*' %><%

Member member = getMemberParameter("id");

if (member == null) {
  return;
}

if (!member.canBeReadBy(loggedMember)) {
  sendRedirect("plugins/SmartPhonePlugin/jsp/core/forbidden.jsp");
  return;
}

String esnTemplate = channel.getProperty("jcmsplugin.esn.smartphone.Member.full-display", "");
// If ESN is here with its dedicated Member template
Plugin esnPlugin = PluginManager.getInstance().getPlugin("ESNPlugin");
boolean useEsnMemberTemplate = esnPlugin != null && esnPlugin.isActive() && Util.notEmpty(esnTemplate);

request.setAttribute("com.jalios.jcmsplugin.smartphone.member", member);

if (useEsnMemberTemplate) {
  // ESN-6.4 mobile member template
  %><jalios:include jsp='<%= esnTemplate %>' /><%

} else {
  // ESN legacy mobile member template
  
  boolean isGuest = member.isGuest();
  boolean isContact = member.isContact();
  
  String salutation = member.getLangSalutation(userLang);
  %>
  <div id="member-profile" class="smartphone-member-template" data-role="page">
  
    <jalios:include target="SMARTPHONE_MEMBER_PROFILE_TOP" />
  
    <%@ include file='/plugins/SmartPhonePlugin/jsp/core/member/doMemberTopbarMenu.jspf' %>
  
    <jalios:include target="SMARTPHONE_MEMBER_PROFILE_AFTER_TOPBARMENU" />
  
    <div data-role="content" class="member-profile">
    
      <div class="member-header">
        <div class="member-header-top">
        <jalios:memberphoto css="img-polaroid member-header-photo" link="false" resource="memberphoto-phone" member="<%= member %>" size="<%= PhotoSize.NORMAL %>" />
        <div class="member-header-info">
          <h1><%= Util.notEmpty(salutation) ? salutation + " " : "" %><%= member.getFullName() %></h1>
          <% if (isGuest || isContact) { %>
          <div class="member-type"><%= isGuest ? "<span class=\"label label-mbr-guest\">" + glp("jcmsplugin.smartphone.lbl.guest") + "</span>" : "" %> <%= isContact ? "<span class=\"label label-mbr-contact\">" + glp("ui.com.lbl.contact") +"</span>" : "" %></div>
          <% } %>      
          <div class="organization"><%= Util.getString(member.getOrganization(), "") %></div>
          <div class="department"><%= Util.getString(member.getDepartment(), "") %></div>
          <div class="job-title"><%= Util.getString(member.getJobTitle(), "") %></div>
          
          <jalios:include target="SMARTPHONE_MEMBER_PROFILE_AFTER_HEADERINFO" />
          
        </div>
        </div>
      </div><%--  EOF .member-header --%>
      
      <jalios:include target="SMARTPHONE_MEMBER_PROFILE_AFTER_MEMBERHEADER" />
      
      <%  
        String display = getUntrustedStringParameter("display","information");
        boolean displayInformation = display.equals("information");
        
        boolean displayNote = display.equals("note");
      %>
    
      <% if (displayInformation) { %>
        <%@ include file='/plugins/SmartPhonePlugin/jsp/core/member/member-information.jspf' %>
      <% } %>
      
      <jalios:include target="SMARTPHONE_MEMBER_PROFILE_AFTER_INFO" />
      
    </div>
    <%@ include file='/plugins/SmartPhonePlugin/jsp/core/member/doMemberContactInformation.jspf' %>
  </div><%-- EOF #member-profile --%>
<% } %>
<%@ include file='/plugins/SmartPhonePlugin/jsp/common/footer.jspf' %>
<jalios:include target="SMARTPHONE_PUB_FOOTER" />