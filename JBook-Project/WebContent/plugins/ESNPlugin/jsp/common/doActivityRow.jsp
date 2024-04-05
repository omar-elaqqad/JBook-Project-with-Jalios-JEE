<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@page import="com.jalios.jcmsplugin.esn.*"%><%
%><%@ page import="com.jalios.jcmsplugin.dbcomment.*" %><%
%><%@page import="com.jalios.jcmsplugin.esn.activity.*"%><%
%><%@ page import="com.jalios.jcms.vote.*" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

  ActivityEntry itActivityEntry = (ActivityEntry) request.getAttribute("jcmsplugin.esn.activity.activity-entry");
  Portlet portlet = (Portlet) request.getAttribute(PortalManager.PORTAL_PORTALELEMENT);
  PortletMemberActivity box = null;
  if (portlet instanceof PortletMemberActivity) {
    box = (PortletMemberActivity) portlet;
  }
  
  if (hasParameter("boxId")) {
    box = getDataParameter("boxId", PortletMemberActivity.class);
  }
  
  if (itActivityEntry == null) {
    return;
  }
  
  boolean activityShowComments = box != null ? box.getBooleanFieldValue(jcmsContext, "showComments") : true;
  boolean activityShowAbstract = box != null ? box.getBooleanFieldValue(jcmsContext, "showAbstract") : true;
  boolean activityShowMedia = box != null ? box.getBooleanFieldValue(jcmsContext, "showMedia") : true;
  String boxId = box != null ? box.getId() : "";

  MemberActivityManager maMgr = MemberActivityManager.getInstance();

  Date itDate = itActivityEntry.getLastActivityCdate();
  
  List<MemberActivity> previousActivityList = itActivityEntry.getPreviousActivityList();
  Data activityData = itActivityEntry.getActivityData();
  Member lastActivityAuthor = itActivityEntry.getLastActivityAuthor();
  Member publicationAuthor = itActivityEntry.getPublicationAuthor();
  MemberActivity itActivity = itActivityEntry.getLastActivity();
  
  boolean hasTodayComments = itActivityEntry.hasTodayComments();
  boolean isMicroBlogging = itActivityEntry.isMicroBlogging();
  boolean isDBCommentActivity = itActivity.isDBCommentActivity();
  boolean isActionActivity = itActivity.isActionActivity();
  boolean isUpdateActivity = itActivity.isUpdateActivity();
  
  DBCommentManager dbCommentMgr = DBCommentManager.getInstance();
  Date activityDate = itActivityEntry.getLastActivityMdate();
  
  boolean isNestedActivity = (Util.getSize(previousActivityList) > 0 || isDBCommentActivity) && itActivityEntry.isPublication() && !isUpdateActivity;
  boolean hasAbstract = itActivityEntry.getPublication() != null && Util.notEmpty(itActivityEntry.getPublication().getAbstract(userLang)) && !isMicroBlogging;
  boolean displayDedicatedMedia = itActivityEntry.hasDedicatedMediaTemplate();

  String accessActivityDataLinkAriaLabel = "";
  if (activityData != null) {
    accessActivityDataLinkAriaLabel = "aria-label=\""
        + encodeForHTMLAttribute(glp("jcmsplugin.esn.activity-card.activity-data-link.for-aria-label",
            activityData.getDataName(userLang))) + "\"";
  }
%>
<div id="<%= itActivity.getId() %>" class="activity activity-id-<%= itActivity.getId() %> activity-<%= itActivity.getProperty().replaceAll("\\.", "-")  %>" data-jalios-dataid="<% if (activityData != null) { out.print(activityData.getId()); } %>">
  <div class="activity-member-photo" aria-hidden="true">
    <jalios:memberphoto link="false" member="<%= isNestedActivity ? lastActivityAuthor : itActivity.getAuthor() %>" size="<%= PhotoSize.TINY %>" />
  </div>
  
  <div class="activity-main">
  <% if (isNestedActivity) { %>
    <div class="info-part nested"><%
      if (activityData != null) {
        %><jalios:link data="<%= activityData %>" htmlAttributes="<%= accessActivityDataLinkAriaLabel %>"><%
          %><%= itActivity.getDataIconHtml(userLang) %><%
        %></jalios:link><%
      }
      String activityAuthorHtmlAttributes = "aria-label='"
          + encodeForHTMLAttribute(glp("jcmsplugin.esn.activity-card.activity-author-link.for-aria-label", itActivity.getAuthor()))
          + "'";
      %> <jalios:link data="<%= itActivity.getAuthor() %>" css="activity-author"
          htmlAttributes='<%= activityAuthorHtmlAttributes %>' /> 
      <%= itActivity.getDescription(userLocale) %>
      <span class="activity-date">&middot; <%= JcmsUtil.getFriendlyDate(itActivity.getCdate(), DateFormat.SHORT, true, userLocale) %></span>
    </div>
    <% if (isLogged && channel.isDataWriteEnabled() && JcmsUtil.isSameId(loggedMember, lastActivityAuthor) && maMgr.canDeleteActivity(loggedMember, itActivity)) {
      %><div class="ctxEditActivity"><%
        %><jalios:buffer name="deleteActivityRowBtnContentRow"><%
          %><jalios:icon src="remove-small" alt='' /><%
        %></jalios:buffer><%
        String activityDescText = HtmlUtil.html2text(itActivity.getDescription(userLocale));
        out.print(new Link()
            .ariaLabel(glp("jcmsplugin.esn.activity.delete-activity.for-aria-label", itActivity.getAuthor(), activityDescText))
            .css("btn btn-rounded delete-activity-btn ajax-action confirm")
            .dataAttribute(new DataAttribute().addData("jalios-text", glp("jcmsplugin.esn.activity.delete-activity-ask")))
            .jaliosAction("ajax-refresh")
            .href(ServletUtil.getResourcePath(request) + "?opDeleteActivity=true&activityId=" + itActivity.getId() + "&boxId=" + boxId)
            .htmlContent(deleteActivityRowBtnContentRow.toString())
            .title(glp("jcmsplugin.esn.activity.delete-activity.for-title"))
            .html());
      %></div><%
    } %>
    <div class="nested-activity">
    <% } %>
      <%@ include file='/plugins/ESNPlugin/jsp/common/doActivityMenu.jspf' %>
      <div class="activity-content" data-jalios-dataid="<%= itActivity.getId() %>">
        <% if (isNestedActivity) { %>
        <div class="photo-part" aria-hidden="true">
          <jalios:memberphoto link="false" member="<%= activityData.getAuthor() %>" size="<%= PhotoSize.ICON %>" />
        </div>
        <% } %>
        <div class="content-part">
        <div class="info-part"><%
          if (activityData != null) {
            %><jalios:link data="<%= activityData %>" htmlAttributes="<%= accessActivityDataLinkAriaLabel %>"><%
              %><%= Util.getSize(previousActivityList) > 0 || isDBCommentActivity  ? activityData.getDataIconHtml(userLang) : itActivity.getHtmlIcon(userLang) %><%
            %></jalios:link><%
          }
          String activityAuthorOrNestedHtmlAttributes = "aria-label='"
              + encodeForHTMLAttribute(glp("jcmsplugin.esn.activity-card.activity-author-link.for-aria-label", isNestedActivity ? activityData.getAuthor() : itActivity.getAuthor()))
              + "'";
          %>
          <jalios:link css="activity-author" data="<%= !isNestedActivity ? itActivity.getAuthor() : activityData.getAuthor() %>" htmlAttributes='<%= activityAuthorOrNestedHtmlAttributes %>' /> 
          <% if (!isMicroBlogging && !isUpdateActivity && (Util.getSize(previousActivityList) > 0 && activityData instanceof Publication && (!itActivity.getProperty().startsWith("jcmsplugin.esn.activity.create") || itActivity.getProperty().equals("jcmsplugin.esn.activity.create.DBComment"))) || (isDBCommentActivity)) { %>
            &middot; <jalios:link css="pub-link" data="<%= activityData %>" htmlAttributes="<%= accessActivityDataLinkAriaLabel %>"/>
          <% } else if (!isMicroBlogging) { %>
            <%= itActivity.getDescription(userLocale) %>
          <% } %>
        </div>
        <% if (isMicroBlogging) { %>
          <div class="info microblogging">
            <jalios:wiki><%= ((MicroBlogging)activityData).getText() %></jalios:wiki>
          </div>
        <% } %>
        <% String activityBodyJsp = maMgr.getActivityBodyJspPath(itActivityEntry); %>
        <% if (Util.notEmpty(activityBodyJsp)) { %>
          <jalios:include jsp="<%= activityBodyJsp %>"/>
        <% } else { %>
          <%@ include file="/plugins/ESNPlugin/jsp/common/doActivityAbstract.jspf" %>
          <%@ include file="/plugins/ESNPlugin/jsp/common/doActivityMedia.jspf" %>
        <% } %>
        <%@ include file='/plugins/ESNPlugin/jsp/common/doActivityActions.jspf' %>
      </div><!-- EOF DIV.content-part -->
    </div><!-- EOF DIV.activity-content -->
<% if(isNestedActivity){ %></div><!-- EOF DIV.nested-activity --><% } %>
<% if (activityData != null && activityShowComments) { %>
<% request.setAttribute("jcmsplugin.esn.activityData",activityData); %>
<% request.setAttribute("jcmsplugin.esn.itActivityEntry",itActivityEntry); %>
<jalios:include jsp='/plugins/ESNPlugin/jsp/common/doActivityComment.jsp'/> 
<% } %>
</div><%-- EOF .activity-main --%>
</div>

