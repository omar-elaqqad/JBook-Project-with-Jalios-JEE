<%@page import="com.jalios.jcmsplugin.smartphone.SmartPhoneManager"%>
<%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %>
<%@ page import="com.jalios.jcmsplugin.dbcomment.*" %>
<%  
  Publication pub = (Publication) request.getAttribute("jcms.plugin.smartphone.fulldisplay.pub");
  if (pub == null) {
    pub = getPublicationParameter("pubId");
  }
  if (pub == null) {
    return;
  }
  
  if (Util.toBoolean(request.getAttribute("jcms.plugin.dbcomment.smartphone.disable.comments"), false)) {
    return;
  }
  
  DBCommentManager dbcommentMgr = DBCommentManager.getInstance();
  SmartPhoneManager smartPhoneManager = SmartPhoneManager.getInstance();

%>
<jsp:useBean id='formHandler' scope='page' class='generated.EditDBCommentHandler'>
  <jsp:setProperty name='formHandler' property='request'       value='<%= request %>' />
  <jsp:setProperty name='formHandler' property='response'      value='<%= response %>' />
  <jsp:setProperty name='formHandler' property='*' />
  <jsp:setProperty name='formHandler' property='targetContent' value='<%= pub.getId() %>' />
  <jsp:setProperty name='formHandler' property='workspace'     value='<%= pub.getWorkspace() %>' />
  <jsp:setProperty name='formHandler' property='loggedMember'  value='<%= isLogged ? loggedMember : dbcommentMgr.getAnonymousMember() %>' />
  <jsp:setProperty name='formHandler' property='noRedirect'    value='<%= true %>' />  
</jsp:useBean>  
<% 

boolean hasValidate = false;

if (hasParameter("opCreate") && formHandler.validate()) {
  HibernateUtil.commitTransaction();
  HibernateUtil.beginTransaction();  
  hasValidate = true;
} 

Group privateCommentGroup = dbcommentMgr.getPrivateCommentGroup();

%>
<div class="ajax-refresh-wrapper">
  <div class="comment-list">
    <%   
      Set<AbstractDBComment> commentSet = dbcommentMgr.getDBCommentSet(pub, loggedMember, true, 0);  
    %>
    <div class="comment-list-header"><%= glp("jcmsplugin.dbcomment.lbl.comment-count", Util.getSize(commentSet)) %></div>
    <jalios:foreach collection="<%= commentSet %>" type="generated.DBComment" name="itComment" counter="itCounter">
      <% 
        String wfLabel = !itComment.isInVisibleState() ? "&middot; " + itComment.getWFStateLabelHtml(userLang) : "";   
        boolean isAnonymousComment = itComment.isAnonymousComment();
      %>
      <div class="card">
        <div class="comment card-item">
          <div class="comment-header media">
            <div class="comment-author clickable pull-left" data-jalios-link="<%= "plugins/SmartPhonePlugin/jsp/core/data.jsp?id=" + itComment.getAuthor().getId() %>">
              <jalios:memberphoto css="img-polaroid" resource="memberphoto-phone" member="<%= itComment.getAuthor() %>" size="<%= PhotoSize.TINY %>" />
            </div>
            <div class="comment-meta media-body">
              <div class="comment-meta-count"><%= itCounter %></div>
              <div class="comment-meta-author">
                <% if (isAnonymousComment) { %><a href='<%= itComment.getWebSite() %>' target='_blank'><%= itComment.getName() %></a><% } else { %><%= itComment.getAuthor() %><% } %>
              </div>
              <div class="text-info comment-meta-info">
                <%= JcmsUtil.getFriendlyDate(itComment.getCdate(), DateFormat.SHORT, true, userLocale) %> <%= wfLabel %>
                <% if (itComment.getPrivateComment()) { %>
                  <span title="<%= privateCommentGroup == null ? "" : glp("jcmsplugin.dbcomment.lbl.private-description", privateCommentGroup) %>" class="label label-danger"><%= glp("jcmsplugin.dbcomment.lbl.private") %></span>
                <% } %>                
              </div>
            </div>
          </div>
          <div class="message-content comment-body">
            <span class="tail"></span>
            <span class="tail-border"></span>
            <jalios:wiki css="wiki zoomable-images" attributeMap="<%= smartPhoneManager.getWikiAttributeMap() %>"><%= itComment.getDescription() %></jalios:wiki>
          </div>
        </div>

        <% Object savedPublication = request.getAttribute("jcms.plugin.smartphone.fulldisplay.pub"); %>
        <%-- Save publication to restore it after doPubFooter. This is required for readertracker and stats --%>
        
        <% request.setAttribute("jcms.plugin.smartphone.fulldisplay.pub", itComment); %>
        <jalios:include jsp='/plugins/SmartPhonePlugin/jsp/core/pub/doPubFooter.jsp' />
        <% request.setAttribute("jcms.plugin.smartphone.fulldisplay.pub", savedPublication); %>

      </div>
    </jalios:foreach>
    <%@ include file='/plugins/DBCommentPlugin/smartphone/jsp/dbcomment-form.jspf' %>
    
  </div>
</div>