<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/doInitMemberProfile.jspf' %><%

if (logger.isTraceEnabled()) { logger.trace("doJobs.jsp: start render"); }
%>
<jsp:useBean id='formHandler' scope='page' class='generated.EditMemberJobHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
  <jsp:setProperty name='formHandler' property='noRedirect' value='true'/>
</jsp:useBean>
<%
boolean canPublishJob = esnProfileDisplayHandler.canPublishMemberJob();

if (canPublishJob && formHandler.validate()) {
  HibernateUtil.commitTransaction();
  HibernateUtil.beginTransaction();
} 
List<MemberJob> jobList = esnMgr.getMemberJobList(member);
boolean hasJobList = Util.notEmpty(jobList);
boolean showAdd = canPublishJob;
if (!showAdd && !hasJobList) {
  // Hidden when empty and cannot add
  return;
}
boolean validateJobs = hasJobList || isMyProfile || isAdmin || showAdd || checkAccess("admin/users/member");
if (!validateJobs) {
  return;
}
String redirectUrl = MessageFormat.format("{0}?{1}={2}", 
    profile.getDisplayUrl(userLocale),
    ProfileDisplayHandler.TAB_PARAM, 
    "cv"
);
String addUrl = MessageFormat.format("plugins/ESNPlugin/jsp/form/editJob.jsp?mid={0}&amp;redirect={1}", 
    member.getId(),
    encodeForURL(redirectUrl)
);
boolean showAddTop = showAdd && hasJobList;
boolean showAddInner = showAdd && !hasJobList;

String refreshUrl = "plugins/ESNPlugin/types/MemberProfile/doJobs.jsp";
String css = "profile-body-block profile-jobs";
css += " esn-component esn-component-jobs esn-component-experience";
css += " ajax-refresh-div";
String title = glp("jcmsplugin.esn.lbl.jobs");
String addLabel = glp("jcmsplugin.esn.lbl.jobs.add");
%>
<div id="profile-jobs" class="<%= css %>" data-jalios-ajax-refresh-url="<%= refreshUrl %>">
  <div class="section-title esn-component-header"<%
      %> role="<%= ESNHTMLConstants.HEADING_ROLE %>"<%
      %> aria-level="3">
    <%-- ADD (when list is NOT empty --%><%
    if (showAddTop) {
      %><a class="btn btn-default btn-xs esn-action modal edit-link" href="<%= addUrl %>" role="button" tabindex="0" onclick="return false;"><%
        %><jalios:icon src="jcmsplugin-esn-profile-add" alt="" /><%
        %>&nbsp;<%= addLabel %><%
      %></a><%
    }
    %> <%= title %><%
  %></div><%
  %>
  <div class="esn-component-body" itemscope itemtype="http://schema.org/Organization">
    <%-- ADD (when list is empty) --%><%
    if (showAddInner) {
      %><jalios:message title="" dismissable="false"><%
        %><a class="btn btn-default modal edit-link" href="<%= addUrl %>" role="button" tabindex="0" onclick="return false;"><%
          %><jalios:icon src="jcmsplugin-esn-profile-add" alt="" /><%
          %>&nbsp;<%= addLabel %><%
        %></a><%
      %></jalios:message><%
    }
    %><jalios:pager name='mbrJobsPagerHandler' declare='true' action='init' pageSize='5' size='<%= jobList.size() %>'/>
    <jalios:foreach collection="<%= jobList %>" name="job" type="MemberJob" max="<%= mbrJobsPagerHandler.getPageSize() %>" skip="<%= mbrJobsPagerHandler.getStart() %>">
      <%
      String editUrl = MessageFormat.format("{0}?id={1}&amp;redirect={2}", 
          "plugins/ESNPlugin/jsp/form/editJob.jsp",
          job.getId(),
          encodeForURL(redirectUrl)
      );
      String deleteUrl = MessageFormat.format("{0}?id={1}&amp;opDelete=true&amp;redirect={2}", 
          "plugins/ESNPlugin/types/MemberProfile/doJobs.jsp",
          job.getId(),
          encodeForURL(redirectUrl)
      );
      %>
      <jalios:panel>
        <div class="esn-experience esn-experience-job">
          <div class="esn-experience-header">
            <div class="esn-experience-meta pull-right text-info"><%
              if (Util.notEmpty(job.getStartDate())) {
              %><div class="item-info"><%
                %><%= JcmsUtil.getFriendlyPeriod(job.getStartDate(), job.getEndDate(), userLocale) %><%
                if (canEdit) {
                  %><div class="dropdown esn-experience-job-actions" title="<%= encodeForHTMLAttribute(glp("ui.com.lbl.actions")) %>"><%
                    %><a id="job-dropdown-<%= job.getId() %>"<%
                        %> class="btn btn-default btn-sm"<%
                        %> data-toggle="dropdown"<%
                        %> role="button"<%
                        %> tabindex="0"<%
                        %> aria-haspopup="true"<%
                        %> aria-expanded="false"<%
                        %> title="<%= encodeForHTMLAttribute(glp("jcmsplugin.esn.btn.open-action-menu.for-title")) %>"<%
                        %> aria-label="<%= encodeForHTMLAttribute(glp("jcmsplugin.esn.btn.open-action-menu.for-aria-label")) %>"><%
                      %><jalios:icon src="caret" alt="" /><%
                    %></a><%
                    %><ul class="dropdown-menu" aria-labelledby="job-dropdown<%= job.getId() %>"><%
                      %><li><%
                        %><a class="modal" href="<%= editUrl %>" role="button" tabindex="0" onclick="return false;"><%
                          %><jalios:icon src="edit-small" alt="" /><%
                          %>&nbsp;<%= glp("ui.com.alt.edit") %><%
                        %></a><%
                      %></li><%
                      %><li><%
                        %><a class="ajax-refresh confirm" href="<%= deleteUrl %>" role="button" tabindex="0" onclick="return false;"><%
                          %><jalios:icon src="remove-small" alt="" /><%
                          %>&nbsp;<%= glp("ui.com.alt.remove") %><%
                        %></a><%
                      %></li><%
                    %></ul><%
                  %></div><%
                }
                %></div><%
              }
            %></div><%
            %><span class="esn-experience-title">
              <span class="esn-experience-organization">
                <% if (Util.notEmpty(job.getSite())) { %>
                  <jalios:icon src="<%= FaviconManager.getInstance().getIcon(job.getSite()) %>" css="jalios-icon-sm" />
                  <a target="_blank" rel="noreferrer" class="esn-component-item-title" href="<%= encodeForHTMLAttribute(job.getSite()) %>"><span itemprop="name"><%= job.getOrganization() %></span></a>
                <% } else { %>
                  <jalios:icon src="jcmsplugin-esn-job" />
                  <span itemprop="name"><%= job.getOrganization() %></span>
                <% } %>
              </span>
              &middot; <%= job.getTitle() %>
            </span>
          </div>
          <div class="esn-experience-body">
            <% if (Util.notEmpty(job.getPlace())) { %>
            <div class="esn-experience-address" itemprop="address"><%= job.getPlace()%></div>
            <% } %>
            <% if (Util.notEmpty(job.getDescription())) { %>      
            <jalios:wiki><%= job.getDescription() %></jalios:wiki>
            <% } %>
          </div>
        </div>
      </jalios:panel>
    </jalios:foreach> 
    <jalios:pager name='mbrJobsPagerHandler'/>
  </div><%-- .EOF .esn-component-body --%>
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div><%-- EOF .esn-component --%>
<%
if (logger.isTraceEnabled()) { logger.trace("doJobs.jsp: end render"); }
%>