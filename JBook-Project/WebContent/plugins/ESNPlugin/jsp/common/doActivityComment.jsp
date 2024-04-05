<%@ include file='/jcore/doInitPage.jspf' %>
<%@ page import="com.jalios.jcmsplugin.dbcomment.*" %>
<%@ page import="com.jalios.jcmsplugin.esn.*" %>
<%@ page import="com.jalios.jcmsplugin.esn.activity.*" %>
<%@page import="com.jalios.jcmsplugin.esn.ui.*"%>
<%@ page import="com.jalios.jcms.vote.*" %>
<%
  DBCommentManager dbCommentMgr = DBCommentManager.getInstance();
      
  Data activityData = (Data) request.getAttribute("jcmsplugin.esn.activityData");
  
  if (activityData == null) {
     activityData = getDataParameter("activityDataId");
  }
  
  if (activityData == null) {
     return;
  }       
      
  ActivityEntry itActivityEntry = (ActivityEntry) request.getAttribute("jcmsplugin.esn.itActivityEntry");
  
  if (itActivityEntry == null) {
    itActivityEntry = (ActivityEntry) jcmsContext.getAjaxRequestAttribute("jcmsplugin.esn.itActivityEntry." + activityData.getId());
  }
  
  if (itActivityEntry == null) {
    return;
  }
  
  String uniquePortletActivityId = (String) request.getAttribute("uniquePortletActivityId");
  if (Util.isEmpty(uniquePortletActivityId)) {
    uniquePortletActivityId = (String) jcmsContext.getAjaxRequestAttribute("uniquePortletActivityId");
  }
  
  jcmsContext.setAjaxRequestAttribute("jcmsplugin.esn.itActivityEntry." + activityData.getId(),itActivityEntry);
  jcmsContext.setAjaxRequestAttribute("uniquePortletActivityId",uniquePortletActivityId);
  
  boolean hasTodayComments = itActivityEntry.hasTodayComments();
  
  Member photoMember = null;
  Publication pub = itActivityEntry.getPublication();
  
  boolean isCommentable = dbCommentMgr.isCommentable(pub);
  boolean isDBCommentActivity = itActivityEntry.getLastActivity() != null && itActivityEntry.getLastActivity().isDBCommentActivity();
  if (!isCommentable) {
    return;
  }
  
%>

<div class="ajax-refresh-div activity-comments-container" data-jalios-ajax-refresh-url="plugins/ESNPlugin/jsp/common/doActivityComment.jsp">

  <jsp:useBean id='formHandler' scope='page' class='generated.EditDBCommentHandler'>
	  <jsp:setProperty name='formHandler' property='request'       value='<%= request %>' />
	  <jsp:setProperty name='formHandler' property='response'      value='<%= response %>' />
	  <jsp:setProperty name='formHandler' property='*' />
	  <jsp:setProperty name='formHandler' property='targetContent' value='<%= pub.getId() %>' />
	  <jsp:setProperty name='formHandler' property='loggedMember'  value='<%= isLogged ? loggedMember : dbCommentMgr.getAnonymousMember() %>' />  
	  <jsp:setProperty name='formHandler' property='noRedirect'    value='<%= true %>' />  
  </jsp:useBean>
  <%
	if (getBooleanParameter("opCommentActivity",false)) {
	  String[] generatedTitle = new String[]{glp("jcmsplugin.dbcomment.edit.lbl.comment-on",pub.getTitle(userLang))};
	  formHandler.setTitle(generatedTitle);
    formHandler.validate();
	  HibernateUtil.commitTransaction();
	  HibernateUtil.beginTransaction();  
  }

  Set<AbstractDBComment> commentSet = null;
  int commentCount = 0;
  int commentSkip = 0;
  String showAllCommentsParam = null;
  boolean showAllComments = getBooleanParameter("showAllComments",false);
  
  String attr = "esn.activity.comments." + pub.getId();
  
  commentCount = dbCommentMgr.getDBCommentCount(pub, loggedMember);
  
  if (isCommentable || showAllComments) {
    if (getBooleanParameter("opCommentActivity",false) || commentCount > 0) {
      commentSet = dbCommentMgr.getDBCommentSet(pub, loggedMember, true);
    }
    if (!showAllComments && commentCount > 2) {
      commentSkip = commentCount - 2;
    }
  }
  boolean showComments = Util.notEmpty(commentSet);
  boolean showAddComment = (isCommentable || commentCount == 0 || showAllComments) && channel.isDataWriteEnabled() && isLogged && loggedMember.canPublish(DBComment.class,workspace);
  boolean showLessCommentLink = showComments && showAllComments;
  String commentsSectionCss = "activity-comments";
  commentsSectionCss += (hasTodayComments || hasParameter("opComment") || hasParameter("showAllComments") || isDBCommentActivity) ? "" : " hide";
  commentsSectionCss += showAllComments ? " all-comments" : " latest-comments";
%>
<section class="<%= commentsSectionCss %>"<%
    %> aria-label="<%= encodeForHTMLAttribute(glp("jcmsplugin.esn.activity.comment-list.for-aria-label", pub.getTitle(userLang), commentCount)) %>">
  <% if (showComments) { %>
    <% if (commentCount > 2) { %>
      <% if (!showLessCommentLink) {
        String showCommentsUrl = "plugins/ESNPlugin/jsp/common/doActivityComment.jsp";
        %><jalios:buffer name="showCommentsLinkContent"><%
          %><jalios:icon src="jcmsplugin-dbcomment-comments" css="show-all-comments" /><%
          %><span class="activity-show-comments-action-item-label" aria-hidden="true"><%
            %><%= glp("jcmsplugin.esn.lbl.comment-count", commentCount) %><%
          %></span><%
        %></jalios:buffer><%
        Link showCommentsLink = new Link()
          .ariaLabel(glp("jcmsplugin.esn.lbl.show-all-comments.for-aria-label", pub.getTitle(userLang)))
          .ajaxParam("activityDataId", activityData.getId())
          .ajaxParam("showAllComments", true)
          .jaliosAction("ajax-refresh")
          .css("btn btn-link btn-show-comments ajax-action show-all-comments")
          .htmlContent(showCommentsLinkContent.toString())
          .refreshURL(showCommentsUrl);
        %><div class="comment comment-count activity-show-comments-action-item"><%
          %><%= showCommentsLink.html() %><%
        %></div><%
      }
    }
    %>
    <jalios:foreach collection="<%= commentSet %>" name="itComment" type="DBComment" skip="<%= commentSkip %>">
      <%
  	    int counter = itCounter.intValue() + commentSkip;
  	    boolean isLastComment = counter == commentSet.size();
        Member commentAuthor = itComment.getAuthor();
  	    boolean showCommentInfo = commentCount > 1 ;//|| !JcmsUtil.isSameId(itActivity.getAuthor(), commentAuthor);
      
  	    
      %>
          <div >
		    <div class="comment" data-jalios-dataid="<%= itComment.getId() %>">
		      <div class="full-comment">
		        <div class="counter"><%
              if (isLogged && loggedMember.canWorkOn(itComment)) {
                %><jalios:buffer name="editCommentLinkContent"><%
                  %><jalios:icon src='edit-small' /><%
                %></jalios:buffer><%
                String editCommentUrl = MessageFormat.format("{0}?{1}={2}", 
                    /* 0 */ "plugins/ESNPlugin/jsp/form/editComment.jsp", 
                    /* 1 */ "commentId", 
                    /* 2 */ itComment.getId());
                out.print(new Link()
                  .ariaLabel(glp("ui.com.btn.edit-data", itComment.getTitle(userLang)))
                  .css("btn btn-link btn-rounded edit-comment-btn modal comment-action")
                  .href(editCommentUrl)
                  .htmlContent(editCommentLinkContent.toString())
                  .html());
              }
		          %>
		          #<%= itCounter.intValue() + commentSkip %>
		        </div>
		        <div class="comment-info">
		          <jalios:include target="ESN_ACTIVITY_COMMENT_HEADER_LEFT" />
		          
	            <jalios:memberphoto link="false" member="<%= commentAuthor %>" size="<%= PhotoSize.ICON %>" />
	            <%= itComment.isInVisibleState() ? "" : itComment.getWFStateLabelHtml(userLang) %>
		          <jalios:link data="<%= commentAuthor %>" />
		            <% 
		                boolean isToday = DateUtil.isToday(itComment.getCdate()); 
		                boolean isYesterday = DateUtil.isYesterday(itComment.getCdate());
		            %>
                  <% if (VoteManager.getInstance().canVote(itComment,loggedMember)) { %>
                  &middot;
                  <jalios:vote templateProperty="vote.template.icon-score" pub="<%= itComment %>"  />
                  
                  &middot;
                  <% } %>  
                  
			        <jalios:link data="<%= itComment %>" css="activity-meta">
                    <span class="time" title="<%= JcmsUtil.getFriendlyDate(itComment.getCdate(), DateFormat.SHORT, true, userLocale) %>">
                    <% if (isToday || isYesterday) { %>
  			                <%= JcmsUtil.getFriendlyDate(itComment.getCdate(), DateFormat.SHORT, true, userLocale) %>
  			            <% }else{%>
  			                <jalios:date format="short" date="<%= itComment.getCdate() %>" />
  			            <% } %>   
  			            </span>
                  </jalios:link>
                  
                   <jalios:include target="ESN_ACTIVITY_COMMENT_HEADER_RIGHT" />
		        </div>
		        
            <jalios:wiki css="activity-comment-body wiki"><%= itComment.getAbstract() %></jalios:wiki>
             
		      </div>
		    </div>
		  </div>
        </jalios:foreach>
    <% } %> 

    <%-- *** ADD A COMMENT *************************************** --%>
    <% if (showAddComment && commentCount > 0) {
      String addCommentLabel = glp("jcmsplugin.esn.activity.add-comment.show-form");
      String addCommentAriaLabel = glp("jcmsplugin.esn.activity.add-comment.show-form.aria-label", pub.getTitle(userLang), commentCount);
      Link addCommentBtn = new Link()
        .ariaLabel(addCommentAriaLabel)
        .css("add-comment")
        .jaliosAction("activity-show-comments")
        .text(addCommentLabel)
        .title(addCommentLabel);
      %><div class="comment comment-add activity-comment-form-toggler"><%
        %><%= addCommentBtn.html() %><%
      %></div><%
    } %>    
    
    <div  class="activity-add-comment hide activity-comment-form-toggler">
      <form action="types/ESNPlugin/jsp/common/doActivityComment.jsp" method="post">
        <% String cssAttribute = "activity-comment-form-textarea br";  %>
        <jalios:field resource="field-light" name="description" css="<%= cssAttribute %>">
          <jalios:control settings='<%= new WikiAreaSettings().css("js-wysiwyg-skip-init").dataAttribute("workspace", pub.getWorkspace().getId() ) %>'/>
        </jalios:field>
        <div class="clearfix">     
          <input type="submit" class="btn-primary btn-sm btn ajax-refresh" name="opCreate" value="<%= glp("jcmsplugin.esn.activity.comment") %>" />   
          <input type="hidden" name="activityDataId" value="<%= activityData.getId() %>"/>
          <input type="hidden" name="opComment" value="true"/>
          <input type="hidden" name="opCommentActivity" value="true"/>
        </div>
      </form>
    </div>
</section>
  
  <%@ include file="/jcore/doAjaxFooter.jspf" %>
  
</div>
