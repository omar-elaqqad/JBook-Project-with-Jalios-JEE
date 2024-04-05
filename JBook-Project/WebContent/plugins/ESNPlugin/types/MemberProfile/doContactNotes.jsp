<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/doInitMemberProfile.jspf' %><%

if (!esnProfileDisplayHandler.showNotes()) {
  return;
}
List<MemberNote> noteList = esnMgr.getAllMemberNoteList(member);

boolean canAddNote = esnMgr.canAddNote(loggedMember, member);
boolean showAdd = canEdit && canAddNote;
boolean hasItems = Util.notEmpty(noteList);
if (!showAdd && !hasItems) {
  // Hidden when empty and cannot add
  return;
}
// showAddTop: when list is NOT empty
boolean showAddTop = showAdd && hasItems;
// showAddTop: when list is empty
boolean showAddInner = showAdd && !showAddTop;

String addUrl = "plugins/ESNPlugin/jsp/form/editNote.jsp?mid=" + member.getId();

String title = glp("jcmsplugin.esn.lbl.notes");
String addLabel = glp("jcmsplugin.esn.lbl.notes.add-link");
String refreshUrl = "plugins/ESNPlugin/types/MemberProfile/doContactNotes.jsp";
String css = "profile-body-block profile-contact-notes";
css += " ajax-refresh-div";
%>
<div class="<%= css %>" data-jalios-ajax-refresh-url="<%= refreshUrl %>">
  <div class="section-title"<%
      %> role="<%= ESNHTMLConstants.HEADING_ROLE %>"<%
      %> aria-level="3">
    <% if (showAddTop) { %>
      <a class="btn btn-default btn-xs esn-action modal edit-link" onclick="return false;" href="<%= addUrl %>">
        <jalios:icon src="jcmsplugin-esn-profile-add" />
        <%= addLabel %>
      </a>
    <% } %>
    <%= title %>
  </div>
  <% if (showAddInner) { %>
    <jalios:message title="" dismissable="false"> 
      <a class="btn btn-default modal edit-link" onclick="return false;" href="<%= addUrl %>">
        <jalios:icon src="jcmsplugin-esn-profile-add" />
        <%= addLabel %>
      </a>
    </jalios:message>
  <% } %>
  <jalios:pager name='pagerHandler' declare='true' action='init' pageSize='5' size='<%= noteList.size() %>' paramPrefix="esnProfileContactNotes-"/>
  <jalios:foreach collection="<%= noteList %>" name="itNote" type="MemberNote" max="<%= pagerHandler.getPageSize() %>" skip="<%= pagerHandler.getStart() %>">
    <% request.setAttribute(ProfileDisplayHandler.CONTACT_NOTE_REQUEST_ATTR, itNote); %>
    <jalios:include resource="esn.profile.full.contact-note" />
  </jalios:foreach> 
  <% request.removeAttribute(ProfileDisplayHandler.CONTACT_NOTE_REQUEST_ATTR); %>
  <jalios:pager name='pagerHandler' template="pqf"/>
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>