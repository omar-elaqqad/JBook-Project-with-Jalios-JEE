<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/jcore/doInitPage.jspf" %>
<%@ page import="com.jalios.jcms.vote.*" %>
<%@ page import="com.jalios.jcms.recommendation.RecommendationManager" %>
<%@ page import="com.jalios.jcmsplugin.dbcomment.*" %>
<script>
  var DBCOMMENT_VOTE_LIST_URL = "<%= channel.getProperty(VoteConstants.DEFAULT_VOTELIST_TEMPLATE_PROP) %>";
</script>
<%
  Publication pub = (Publication) getPublicationParameter("commentedPub");

  if (pub == null) {
    pub = (Publication) request.getAttribute(PortalManager.PORTAL_PUBLICATION);
  }

  if (pub == null) {
    return;
  }
  
  jcmsContext.setAjaxRequestAttribute("jcmsplugin.dbcomment.commented-publication",pub);
  
  DBCommentManager dbcommentMgr = DBCommentManager.getInstance();
  VoteManager voteMgr = VoteManager.getInstance();
  RecommendationManager recoMgr = RecommendationManager.getInstance();  
  
  boolean canComment = dbcommentMgr.canComment(loggedMember,pub);

  jcmsContext.addCSSHeader("plugins/DBCommentPlugin/css/dbcomment.css");
  jcmsContext.addJavaScript("plugins/DBCommentPlugin/js/dbcomment.js");
  
  boolean hasValidate = false;
  boolean smartCommentDisplay = dbcommentMgr.useSmartCommentDisplay(pub,loggedMember);
  boolean isMajorUpdateDisplayed = false;
  
  AbstractDBComment targetDBComment = (AbstractDBComment) getPublicationParameter("targetComment");
  
  int commentCount = dbcommentMgr.getDBCommentCount(pub, loggedMember);
   
  boolean isCommentable = dbcommentMgr.isCommentable(pub);
  boolean isCommentDisabled = dbcommentMgr.isEditCommentableEnabled() && dbcommentMgr.isCommentDisabled(pub);
  
  if (isCommentDisabled || (!isCommentable && !(commentCount > 0))) {
    return;
  }
AbstractDBComment createdDBComment = null;

Date commentDate = null;
Date udatePub = pub.getUdate() == null ? new Date() : pub.getUdate();
%>
<div id="dbcomments" class="dbcomments dbcomment-wrapper ajax-refresh-div" data-jalios-ajax-refresh-url="types/DBComment/doDBCommentFooterDisplay.jsp">
  
  <% if (canComment) { %>
    <%-- formHandler for comment creation --%>
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
    request.setAttribute("jcmsplugin.dbcomment.formhandler", formHandler);
    
    //Populate created dbComment 
    String[] generatedTitle = new String[]{glp("jcmsplugin.dbcomment.edit.lbl.comment-on",pub.getTitle(userLang))};
    formHandler.setTitle(generatedTitle);
    if (!isLogged){
      //Anonymous comment
      formHandler.setIpAddress(new String[]{Util.truncate(Util.getString(request.getRemoteAddr(),""), 255)});
      formHandler.setUserAgent(new String[]{Util.truncate(Util.getString(request.getHeader("USER-AGENT"),""), 255)});
      formHandler.setReferer  (new String[]{Util.truncate(Util.getString(request.getHeader("REFERER"), ""), 255)});
    }

    // Commit transaction to retrieve the created DBComment in listing
    if (canComment && formHandler.validate()) {
      hasValidate = true;
      HibernateUtil.commitTransaction();
      HibernateUtil.beginTransaction();  
      
      createdDBComment = (AbstractDBComment) formHandler.getPublication();
      
      formHandler.setDescription(null);
      formHandler.setId(null);
    }
  }
  if(isCommentable || commentCount > 0) { %>
  <%-- formHandler for comment listing --%>
  <jsp:useBean id='dbCommentHandler' scope='page' class='com.jalios.jcmsplugin.dbcomment.DBCommentHandler'>
    <jsp:setProperty name='dbCommentHandler' property='request'       value='<%= request %>' />
    <jsp:setProperty name='dbCommentHandler' property='response'      value='<%= response %>' />
    <jsp:setProperty name='dbCommentHandler' property='*' />
    <jsp:setProperty name='dbCommentHandler' property='pub' value='<%= pub %>' />
  </jsp:useBean><% 
  
  dbCommentHandler.compute();
  
  boolean useMajorUpdate = dbCommentHandler.isUseMajorUpdate();
  
  Set<AbstractDBComment> hiddenCommentSet = dbCommentHandler.getHiddenCommentSet();
  Set<AbstractDBComment> displayedCommentSet = dbCommentHandler.getDisplayedCommentSet();
  
  boolean showHiddenComments = hiddenCommentSet != null && hiddenCommentSet.contains(targetDBComment) ? true : false;
  
  commentCount = Util.getSize(hiddenCommentSet) + Util.getSize(displayedCommentSet);
  int itCounterPrivate = 0;
  int itCountPublic = 0;
  boolean separatorIsAdded = false;
  
  %>
  <p class='dbcommentCount'>
    <jalios:include target="DBCOMMENT_COUNT_LEFT" />
    <jalios:icon src="jcmsplugin-dbcomment-comments" /> <%= glp("jcmsplugin.dbcomment.lbl.comment-count",commentCount) %>
    <jalios:include target="DBCOMMENT_COUNT_RIGHT" />
  </p>
  
  <%-- Display Hidden Comment Set  --%>
  <% if (Util.notEmpty(hiddenCommentSet)) { %>
    <div class="dbcomment-before-udate js-dbcomment-toggler-target<%= showHiddenComments ? "" : " hide" %>">
      <jalios:foreach collection="<%= hiddenCommentSet %>" type="generated.DBComment" name="itComment" counter="itCounter">       
        <% 
        commentDate = itComment.getCdate() == null ? new Date() : itComment.getCdate();
        request.setAttribute("jcmsplugin.dbcomment.comment", itComment);
       
          boolean isAnonymousComment = itComment.isAnonymousComment();
          String wfLabel = !itComment.isInVisibleState() ? "&middot; " + itComment.getWFStateLabelHtml(userLang) : "";  
          if (itComment.getPrivateComment()) {
            itCounterPrivate++;
            request.setAttribute("jcmsplugin.dbcomment.commentNumber", itCounterPrivate);
          } else {
            itCountPublic++;
            request.setAttribute("jcmsplugin.dbcomment.commentNumber", itCountPublic);
          }
        %>
        
        <% 
        
        if ((!separatorIsAdded) && commentDate.after(udatePub) && useMajorUpdate) { %>
        <div class="dbcomment-separator">
          <div class="comment-pane comment-pane-separator">
            <div class="comment-separator alert alert-info">
              <p><%= glp("jcmsplugin.dbcomment.lbl.major-update-date",JcmsUtil.getFriendlyDate(udatePub,DateFormat.SHORT,true,userLocale)) %></p>
            </div> 
          </div>
        </div>
        <% separatorIsAdded = true; } %>
        <%@ include file="/types/DBComment/doDBComment.jspf" %>
      </jalios:foreach>      
    </div>
    <% } %>
    
    <%-- Comment separator  --%>
    <% if (Util.notEmpty(hiddenCommentSet) && !showHiddenComments) { %>
      <div class="dbcomment-separator js-dbcomment-toggler-target"<%= showHiddenComments ? " hide" : "" %>">
        <div class="comment-pane comment-pane-separator">
          <div class="vertical-line"></div>           
            <div class="comment-separator alert alert-info">
              <% if (useMajorUpdate) { %>
              <p><%= glp("jcmsplugin.dbcomment.lbl.major-update-date",JcmsUtil.getFriendlyDate(udatePub,DateFormat.SHORT,true,userLocale)) %></p>
              <% } %>
              <a href="#" class="js-dbcomment-toggler">
                <%= glp("jcmsplugin.dbcomment.lbl.see-previous-comments", Util.getSize(hiddenCommentSet)) %>
              </a>
            </div>
        </div>        
      </div>  
    <% } %>
    
    <%-- Display not hidden Comment Set  --%>
    <% if (Util.notEmpty(displayedCommentSet)) { %>
    <div class="dbcomment-post-udate">
        <jalios:foreach collection="<%= displayedCommentSet %>" type="generated.DBComment" name="itComment" counter="itCounter">
          <% 
          request.setAttribute("jcmsplugin.dbcomment.comment", itComment);
         
          boolean isAnonymousComment = itComment.isAnonymousComment();
          String wfLabel = !itComment.isInVisibleState() ? "&middot; " + itComment.getWFStateLabelHtml(userLang) : "";  
          if (itComment.getPrivateComment()) {
            itCounterPrivate++;
            request.setAttribute("jcmsplugin.dbcomment.commentNumber", itCounterPrivate);
          } else {
            itCountPublic++;
            request.setAttribute("jcmsplugin.dbcomment.commentNumber", itCountPublic);
          }          
          %>
          <%@ include file="/types/DBComment/doDBComment.jspf" %>
        </jalios:foreach>
    </div>
    <% } %>
    
    <%-- Display an info message to the user when the created DBComment is not visible for him --%>
    <% if (hasValidate && createdDBComment != null && !createdDBComment.isInVisibleState() && !createdDBComment.canBeReadBy(loggedMember)) { %>
    <div class="comment-pane comment-pane-separator">
      <div class="vertical-line"></div>           
      <jalios:message css="non-visible-comment comment-separator" msg="jcmsplugin.dbcomment.lbl.non-visible-created-comment" />
    </div>
    <% } %>
    <% if (isCommentable) { %>
      <%@ include file="/types/DBComment/doDBCommentEditDisplay.jspf" %>
    <% } %>
  
    <%-- Comments are closed on current publication  --%>
    <% if (!dbcommentMgr.isPublicationCommentEnabled(pub)){ %>
      <div class="comment-pane comment-pane-separator">
        <div class="vertical-line"></div>      
        <jalios:message css="closed-comment-msg comment-separator" msg="jcmsplugin.dbcomment.lbl.closed-comment"/>
      </div>
    <% } %>
    
    <%@ include file="/jcore/doAjaxFooter.jspf" %>
  </div>
  <% 
  
  request.removeAttribute("jcmsplugin.dbcomment.comment");
  request.removeAttribute("jcmsplugin.dbcomment.commentNumber");
  
  %>
<% } %>
<% ServletUtil.restoreAttribute(pageContext , "formHandler"); %>