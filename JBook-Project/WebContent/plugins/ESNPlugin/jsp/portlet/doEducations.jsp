<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/plugins/ESNPlugin/jsp/common/doCommonParams.jspf' %><%
%><jsp:useBean id='formHandler' scope='page' class='generated.EditMemberEducationHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
  <jsp:setProperty name='formHandler' property='noRedirect' value='true'/>
</jsp:useBean>
<%
boolean canPublishEducation = isLogged && loggedMember.canPublish(MemberEducation.class);

if (canPublishEducation && formHandler.validate()) {
  HibernateUtil.commitTransaction();
  HibernateUtil.beginTransaction();
}
List<MemberEducation> educationList = esnMgr.getMemberEducationList(member); 
boolean hasEducationList = Util.notEmpty(educationList);
%>
<% if (hasEducationList || isMyProfile || isAdmin || checkAccess("admin/users/member")) { %>
<div class="esn-component-educations esn-component-experience esn-component">
  <div class="esn-component-header">
    <h2>
    <%= glp("jcmsplugin.esn.lbl.educations") %>
    </h2>
  </div>
  <div class="esn-component-body"><%
    if (canPublishEducation && canEdit) {
      %><jalios:message title="" dismissable="false"><%
        %><a class="btn btn-default modal edit-link" href="plugins/ESNPlugin/jsp/form/editEducation.jsp?mid=<%= member.getId() %>" role="button" tabindex="0" onclick="return false;"><%
          %><jalios:icon src="add" alt="" /><%
          %>&nbsp;<%= glp("jcmsplugin.esn.lbl.educations.add") %><%
        %></a><%
      %></jalios:message><%
    }
    %> 
    <jalios:pager name='mbrEducationsPagerHandler' 
                  declare='true' 
                  action='init' 
                  pageSize='5' 
                  size='<%= educationList.size() %>'/>
    <jalios:foreach collection="<%= educationList %>" 
                    name="education" 
                    type="MemberEducation"
                    max="<%= mbrEducationsPagerHandler.getPageSize() %>"
                    skip="<%= mbrEducationsPagerHandler.getStart() %>">
      <%
      String editUrl = MessageFormat.format("{0}?id={1}", 
          "plugins/ESNPlugin/jsp/form/editEducation.jsp",
          education.getId()
      );
      String deleteUrl = MessageFormat.format("{0}?id={1}&amp;opDelete=true", 
          "plugins/ESNPlugin/jsp/portlet/doEducations.jsp",
          education.getId()
      );
      %>
      <jalios:panel>
        <div class="esn-experience esn-experience-education" itemscope itemtype="http://schema.org/EducationalOrganization">
          <div class="esn-experience-header"><%
            %><div class="esn-experience-meta pull-right text-info"><%
              if (Util.notEmpty(education.getStartDate())) {
                %><div class="item-info"><%
                  %><%= JcmsUtil.getFriendlyPeriod(education.getStartDate(), education.getEndDate(), userLocale) %><%
                  if (canEdit) {
                    %><div class="dropdown esn-experience-job-actions" title="<%= encodeForHTMLAttribute(glp("ui.com.lbl.actions")) %>"><%
                      %><a id="education-dropdown-<%= education.getId() %>"<%
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
                      %><ul class="dropdown-menu" aria-labelledby="education-dropdown-<%= education.getId() %>"><%
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
            %><div class="esn-experience-title" title='<%= encodeForHTMLAttribute(glp("types.MemberEducation.title.label")) %>'>
              <%= education.getTitle() %>
            </div>
            <span class="esn-experience-organization">
            <% if (Util.notEmpty(education.getSite(userLang))) { %>
              <jalios:icon src="<%= FaviconManager.getInstance().getIcon(education.getSite(userLang)) %>" css="jalios-icon-sm" />
              <a target="_blank" rel="noreferrer" href="<%= encodeForHTMLAttribute(education.getSite()) %>" title='<%= encodeForHTMLAttribute(glp("types.MemberEducation.fields.site.label")) %>'>
                <span itemprop="name" title='<%= encodeForHTMLAttribute(glp("types.MemberEducation.fields.trainingCenter.label")) %>'><%= education.getTrainingCenter() %></span>
              </a>
            <% } else { %>
              <jalios:icon src="jcmsplugin-esn-education" />
              <span itemprop="name" title='<%= encodeForHTMLAttribute(glp("types.MemberEducation.fields.trainingCenter.label")) %>'><%= education.getTrainingCenter(userLang) %></span>
            <% } %>
            </span>
            <% if (Util.notEmpty(education.getDegree(userLang))) { %>
              <span class="esn-experience-degree" title='<%= encodeForHTMLAttribute(glp("types.MemberEducation.fields.degree.label")) %>'>
                &middot; 
                <%= education.getDegree(userLang) %>
              </span>
            <% } %>
          </div>
          <div class="esn-experience-body">
            <% if (Util.notEmpty(education.getPlace(userLang))) { %>
            <div class="esn-experience-address" itemprop="address" title='<%= encodeForHTMLAttribute(glp("types.MemberEducation.fields.place.label")) %>'><%= education.getPlace(userLang)%></div>
            <% } %>
            <% if (Util.notEmpty(education.getDescription(userLang))) { %>      
            <jalios:wiki><%= education.getDescription(userLang) %></jalios:wiki>
            <% } %>
          </div>
        </div>
      </jalios:panel> 
    </jalios:foreach>
    <jalios:pager name='mbrEducationsPagerHandler' /> 
  </div>
</div>
<% } %>
