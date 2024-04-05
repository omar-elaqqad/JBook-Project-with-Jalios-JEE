<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/doInitMemberProfile.jspf' %><%

MemberNote note = (MemberNote) request.getAttribute(ProfileDisplayHandler.CONTACT_NOTE_REQUEST_ATTR);
if (note == null) {
  return;
}

jcmsContext.addCSSHeader("plugins/ESNPlugin/css/esn-comment.css");
jcmsContext.addCSSHeader("plugins/ESNPlugin/css/member-profile-note.css");
boolean canEditNote = isLogged && esnMgr.canEditNote(note, loggedMember);
String noteDate = JcmsUtil.getFriendlyDate(note.getMdate(), DateFormat.SHORT, true, userLocale, true);
Member noteAuthor = note.getAuthor();
String editNoteUrl = MessageFormat.format("plugins/ESNPlugin/jsp/form/editNote.jsp?id={0}", note.getId());
%>
<div class="esn-comment-pane esn-member-note esn-comment-photo-line">
  <div class="esn-comment-pane-author esn-comment-pane-member-photo">
    <jalios:memberphoto member="<%= noteAuthor %>" size="<%= PhotoSize.TINY %>"/>
  </div>
  <div class="esn-comment-pane-content">
    <div class="esn-comment-pane-metas">
      <div class="esn-comment-pane-metas-left">
        <jalios:link data="<%= noteAuthor %>" css="esn-member-note-author" />
      </div>
      <div class="esn-comment-pane-metas-right">
        <% if (canEditNote) { %><%
          %><a class="modal esn-edit-member-note" onclick="return false;" href="<%= editNoteUrl %>"><%
            %><jalios:icon src='edit-small' /><%
          %></a>
        <% } %>
        <div class="esn-comment-pane-date"><%= noteDate %></div>
      </div>
    </div>
    <jalios:wiki><%= note.getText() %></jalios:wiki>
  </div>
</div>