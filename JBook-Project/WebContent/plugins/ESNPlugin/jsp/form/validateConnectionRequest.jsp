<%@page import="com.jalios.jcms.taglib.card.CardsDisplayMode"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ page import="com.jalios.jcmsplugin.esn.*" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
if (!isLogged) {
  sendForbidden(request, response);
  return;
}
ESNManager esnMgr = ESNManager.getInstance();
MemberConnectionRequest mcr = getDataParameter("id", MemberConnectionRequest.class); 
// Prevent NPE
if (mcr == null) {
  logger.warn("no MCR. id param missing?");
  return;
}
Member sender = mcr.getAuthor();
SortedSet<Member> commonConnectionSet = esnMgr.getSortedCommonConnectionSet(sender, loggedMember, true, false); 
int commonSize = Util.getSize(commonConnectionSet);
int maxCommon = 3;
jcmsContext.addCSSHeader("css/jalios/core/jalios-member-card.css");
jcmsContext.addCSSHeader("plugins/ESNPlugin/css/validate-connection-request.css");
%>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.esn.EditMemberConnectionRequestHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
</jsp:useBean>
<% if (formHandler.validate()) { %>
<% request.setAttribute("modal.redirect", formHandler.getRedirect()); %>
<%@ include file="/jcore/modal/modalRedirect.jspf" %>
<% } %>

<jalios:modal title="jcmsplugin.esn.mcr.validate.title" url="plugins/ESNPlugin/jsp/form/validateConnectionRequest.jsp" formHandler="<%= formHandler %>" css="modal-lg validate-connection-request-modal">
  <div class="alert alert-info">
    <%= glp("jcmsplugin.esn.mcr.validate.info", sender.getFriendlyName()) %>
  </div>

  <%-- COMMON CONNECTIONS --%>
  <% if (commonSize > 0) { %>
  <div class="common-connections">
    <p><b><%= commonSize > maxCommon ? glp("jcmsplugin.esn.mcr.validate.common-some") : glp("jcmsplugin.esn.mcr.validate.common") %></b></p>
    <jalios:cards mode="<%= CardsDisplayMode.INLINE %>">
    <jalios:foreach collection="<%= commonConnectionSet %>" type="Member" name="itMember" max="<%= maxCommon %>">
      <jalios:cardData data="<%= itMember %>" template="small" />
    </jalios:foreach>
    </jalios:cards>
  </div><%-- EOF .common-connections --%>
  <% } %>
  
  <div class="esn-mcr media">
    <jalios:memberphoto member="<%= sender %>" css="pull-left" size="<%= PhotoSize.TINY %>" />
    <div class="esn-mcr-message media-body">
      <div class="message nobr">
        <span class="tail"><img src="images/jalios/layout/balloonTail.png" alt="" /></span>
        <jalios:wiki><%= mcr.getMessage() %></jalios:wiki>
      </div>
      <div class="date"><jalios:date date="<%= mcr.getCdate() %>" /> <jalios:time date="<%= mcr.getCdate() %>" /></div>
    </div>
  </div><%-- EOF .media --%>
  <jalios:buffer name="MODAL_BUTTONS">
    <input type="button" class="btn btn-default" name="opCancel" value="<%= encodeForHTMLAttribute(glp("jcmsplugin.esn.mcr.validate.lbl.close")) %>" data-dismiss="modal"/>
    <input type="button" class="btn btn-danger" name="opReject" value="<%= encodeForHTMLAttribute(glp("jcmsplugin.esn.mcr.validate.lbl.decline")) %>" onclick="this.form.requestStatus.value='<%= MemberConnectionRequest.DECLINED %>'; JCMS.ajax.Refresh.refreshFromInput(this); return false;"/>
    <input type="button" class="btn btn-primary" value="<%= encodeForHTMLAttribute(glp("jcmsplugin.esn.mcr.validate.lbl.accept")) %>" onclick="this.form.requestStatus.value='<%= MemberConnectionRequest.ACCEPTED %>'; JCMS.ajax.Refresh.refreshFromInput(this); return false;"/>
    <input type="hidden" name="id" value="<%= mcr.getId() %>" /> 
    <input type="hidden" name="requestStatus" value="<%= mcr.getRequestStatus() %>" />
    <input type="hidden" name="opUpdate" value="true" />
    <input type="hidden" name="redirect" value="<%= encodeForHTMLAttribute(formHandler.getRedirect()) %>" />
  </jalios:buffer>
</jalios:modal>