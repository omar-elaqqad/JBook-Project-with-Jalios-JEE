<%@ include file='/plugins/ESNPlugin/jsp/common/doCommonParams.jspf' %>
<% 
List<MemberNote> noteList = esnMgr.getAllMemberNoteList(member);
boolean canAddNote = esnMgr.canAddNote(loggedMember, member);
%>
<div id="contact-notes" class="notes">
  <h2>
    <% if (canAddNote) { %>
    <span class="right editMemberProfile">
      <a class="modal edit-link" onclick="return false;" href="plugins/ESNPlugin/jsp/form/editNote.jsp?mid=<%= member.getId() %>"><jalios:icon src="add" /> <%= glp("jcmsplugin.esn.lbl.notes.add-link") %></a>
    </span>
    <% } %>
    <%= glp("jcmsplugin.esn.lbl.notes") %>
  </h2>
  <table class="logs">
  <jalios:foreach collection="<%= noteList %>" name="itNote" type="MemberNote">
  <tr>
    <td class="log-date">
      <jalios:link data="<%= itNote.getAuthor() %>" /><br/>
      <%= JcmsUtil.getFriendlyDate(itNote.getMdate(), DateFormat.SHORT, true, userLocale, true) %>
    </td>
    <td class="log-info">
      <jalios:wiki><%= itNote.getText() %></jalios:wiki>
      <% if (esnMgr.canEditNote(itNote, loggedMember)) { %>
        <a class="modal" onclick="return false;" href="plugins/ESNPlugin/jsp/form/editNote.jsp?id=<%= itNote.getId() %>"><jalios:icon src='edit-small' /></a>
      <% } %>
    </td>
  </tr>
  </jalios:foreach>
  </table>
</div>
