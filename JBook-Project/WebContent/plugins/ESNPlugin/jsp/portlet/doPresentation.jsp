<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/plugins/ESNPlugin/jsp/common/doCommonParams.jspf' %><%

String portalParam = Util.notEmpty(esnMgr.getMemberProfilePortal()) ? "&amp;portal=" + esnMgr.getMemberProfilePortal().getId() : "";
List<String> interest = profile.getInterest();
Member manager = member.getManager();
boolean hasManager = manager != null; 
boolean hasDateOfBirth = Util.notEmpty(profile.getDateOfBirth());
boolean hasDateOfArrival = Util.notEmpty(profile.getDateOfArrival());
boolean hasInterest = Util.notEmpty(interest);
String introduction = Util.getString(profile.getIntroduction(), "");
boolean hasIntroduction = Util.notEmpty(introduction);
boolean show = hasIntroduction || hasManager || hasDateOfBirth || hasDateOfArrival || hasInterest; 
if (!show) {
  return;
}
%>
<h2 class="profile-info-presentation-title">
  <% if (canEdit) { %>
  <span class="right editMemberProfile">
      <span class="editPart">
      <a class="edit-link" href="<%= esnMgr.getMemberProfileEditor() %>?openTab=2&amp;esnProfileTab=info&amp;mid=<%= member.getId() %><%= portalParam %>"><jalios:icon src="page-white-edit" /> <%= glp("jcmsplugin.esn.lbl.editLabel") %></a>
      </span>
  </span>
  <% } %>
  <%= glp("jcmsplugin.esn.lbl.introduction") %>
</h2>
<div class="profile-info-presentation-content introduction">

  <%-- Introduction --%>
  <% if (hasIntroduction) { %>
  <jalios:wiki><%= introduction %></jalios:wiki>
  <% } %>

  <%-- Manager --%>
  <% if (hasManager) { %>
  <div class="other-info">
    <span><%= glp("ui.com.lbl.manager") %> :</span>
    <jalios:link data="<%= manager %>" />
  </div>
  <% } %>

  <%-- DateOfBirth --%>
  <% if (hasDateOfBirth) { %>
  <div class="other-info">
    <span><%= glp("jcmsplugin.esn.lbl.date-of-birth") %> :</span>
    <span itemprop="birthDate"><jalios:date date="<%= profile.getDateOfBirth() %>" format="dd MMMM" /></span>
  </div>
  <% } %>
  
  <%-- DateOfArrival --%>
  <% if (hasDateOfArrival) { %>
  <div class="other-info" >
    <span><%= glp("jcmsplugin.esn.lbl.date-of-arrival") %> :</span>
    <jalios:date date="<%= profile.getDateOfArrival() %>" format="dd MMMM yyyy" />
  </div>
  <% } %>
  
    <%-- Interest --%>
  <% if (hasInterest) { %>
  <div class="other-info">
    <span><%= glp("jcmsplugin.esn.lbl.interest") %> :</span>
    <%= Util.join(interest, ", ") %>
  </div>
  <% } %>
</div>