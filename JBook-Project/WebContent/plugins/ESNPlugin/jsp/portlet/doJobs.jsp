<%@ include file='/plugins/ESNPlugin/jsp/common/doCommonParams.jspf' %>
<jsp:useBean id='formHandler' scope='page' class='generated.EditMemberJobHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
  <jsp:setProperty name='formHandler' property='noRedirect' value='true'/>
</jsp:useBean>
<% 

boolean canPublishJob = isLogged && loggedMember.canPublish(MemberJob.class);

if (canPublishJob && formHandler.validate()) {
  HibernateUtil.commitTransaction();
  HibernateUtil.beginTransaction();
} 
List<MemberJob> jobList = esnMgr.getMemberJobList(member);
boolean hasJobList = Util.notEmpty(jobList);
%>
<% if (hasJobList || isMyProfile || isAdmin || checkAccess("admin/users/member")) { %>
  <div class="esn-component esn-component-jobs esn-component-experience">
  	<div class="esn-component-header">
  	  <h2>
  		  <%= glp("jcmsplugin.esn.lbl.jobs") %>
  	  </h2>
  	</div>
  	<div class="esn-component-body" itemscope itemtype="http://schema.org/Organization"><%
    	if (canPublishJob && canEdit) {
        %><jalios:message title="" dismissable="false"><%
          %><a class="btn btn-default modal edit-link" href="plugins/ESNPlugin/jsp/form/editJob.jsp?mid=<%= member.getId() %>" role="button" tabindex="0" onclick="return false;"><%
            %><jalios:icon src="add" alt="" /><%
            %>&nbsp;<%= glp("jcmsplugin.esn.lbl.jobs.add") %><%
          %></a><%
        %></jalios:message><%
      }
      %><jalios:pager name='mbrJobsPagerHandler' declare='true' action='init' pageSize='5' size='<%= jobList.size() %>'/>
  	  <jalios:foreach collection="<%= jobList %>" name="job" type="MemberJob" max="<%= mbrJobsPagerHandler.getPageSize() %>" skip="<%= mbrJobsPagerHandler.getStart() %>">
        <jalios:panel>
          <div class="esn-experience esn-experience-job">
            <div class="esn-experience-header"><%
            %><div class="esn-experience-meta pull-right text-info"><%
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
                      %><ul class="dropdown-menu" aria-labelledby="job-dropdown-<%= job.getId() %>"><%
                        %><li><%
                          %><a class="modal" href="plugins/ESNPlugin/jsp/form/editJob.jsp?id=<%= job.getId() %>" role="button" tabindex="0" onclick="return false;"><%
                            %><jalios:icon src="edit-small" alt="" /><%
                            %>&nbsp;<%= glp("ui.com.alt.edit") %><%
                          %></a><%
                        %></li><%
                        %><li><%
                          %><a class="ajax-refresh confirm" href="plugins/ESNPlugin/jsp/portlet/doJobs?id=<%= job.getId() %>&amp;opDelete=true" role="button" tabindex="0" onclick="return false;"><%
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
            %><div class="esn-experience-title">
                <%= job.getTitle() %>
              </div>
              <div class="esn-experience-organization">
                <% if (Util.notEmpty(job.getSite())) { %>
                  <jalios:icon src="<%= FaviconManager.getInstance().getIcon(job.getSite()) %>" css="jalios-icon-sm" />
                  <a target="_blank" rel="noreferrer" class="esn-component-item-title" href="<%= encodeForHTMLAttribute(job.getSite()) %>"><span itemprop="name"><%= job.getOrganization() %></span></a>
                <% } else { %>
                  <jalios:icon src="jcmsplugin-esn-job" />
                  <span itemprop="name"><%= job.getOrganization() %></span>
                <% } %>
              </div>
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
  </div><%-- EOF .esn-component --%>
<% } %>