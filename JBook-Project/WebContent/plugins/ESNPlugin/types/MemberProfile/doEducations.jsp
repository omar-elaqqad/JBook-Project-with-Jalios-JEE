<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/doInitMemberProfile.jspf' %><%

if (logger.isTraceEnabled()) { logger.trace("doEducations.jsp: start render"); }
%>
<jsp:useBean id='formHandler' scope='page' class='generated.EditMemberEducationHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
  <jsp:setProperty name='formHandler' property='noRedirect' value='true'/>
</jsp:useBean>
<%
boolean canPublishEducation = esnProfileDisplayHandler.canPublishMemberEducation();

if (canPublishEducation && formHandler.validate()) {
  HibernateUtil.commitTransaction();
  HibernateUtil.beginTransaction();
}
List<MemberEducation> educationList = esnMgr.getMemberEducationList(member); 
boolean hasEducationList = Util.notEmpty(educationList);
boolean showAdd = canPublishEducation;
if (!showAdd && !hasEducationList) {
  // Hidden when empty and cannot add
  if (logger.isTraceEnabled()) { logger.trace("doEducations.jsp: nothing to render"); }
  return;
}
boolean validateEducations = hasEducationList || isMyProfile || isAdmin || showAdd || checkAccess("admin/users/member");
if (!validateEducations) {
  if (logger.isTraceEnabled()) { logger.trace("doEducations.jsp: nothing to render"); }
  return;
}
String redirectUrl = MessageFormat.format("{0}?{1}={2}", 
    profile.getDisplayUrl(userLocale),
    ProfileDisplayHandler.TAB_PARAM, 
    "cv"
);
String addUrl = MessageFormat.format("plugins/ESNPlugin/jsp/form/editEducation.jsp?mid={0}&redirect={1}", 
    member.getId(),
    encodeForURL(redirectUrl)
);
boolean showAddTop = showAdd && hasEducationList;
boolean showAddInner = showAdd && !hasEducationList;
String refreshUrl = "plugins/ESNPlugin/types/MemberProfile/doEducations.jsp";
String css = "profile-body-block profile-educations";
css += " esn-component-educations esn-component-experience esn-component";
css += " ajax-refresh-div";
String title = glp("jcmsplugin.esn.lbl.educations");
%>
<div id="profile-educations" class="<%= css %>" data-jalios-ajax-refresh-url="<%= refreshUrl %>">

  <div class="section-title esn-component-header"<%
      %> role="<%= ESNHTMLConstants.HEADING_ROLE %>"<%
      %> aria-level="3">
    <%-- ADD (when list is NOT empty --%><%
    if (showAddTop) {
      %><a class="btn btn-default btn-xs esn-action modal edit-link" href="<%= encodeForHTMLAttribute(addUrl) %>" role="button" tabindex="0" onclick="return false;"><%
        %><jalios:icon src="jcmsplugin-esn-profile-add" alt="" /><%
        %>&nbsp;<%= glp("jcmsplugin.esn.lbl.educations.add") %><%
      %></a><%
    }
    %> <%= title %><%
  %></div><%
  %><div class="esn-component-body">
    <%-- ADD (when list is empty --%><%
    if (showAddInner) {
      %><jalios:message title="" dismissable="false"><%
        %><a class="btn btn-default modal edit-link" href="<%= encodeForHTMLAttribute(addUrl) %>" role="button" tabindex="0" onclick="return false;"><%
          %><jalios:icon src="jcmsplugin-esn-profile-add" alt="" /><%
          %>&nbsp;<%= glp("jcmsplugin.esn.lbl.educations.add") %><%
        %></a><%
      %></jalios:message><%
    }
    %><jalios:pager name='mbrEducationsPagerHandler' 
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
      if (logger.isTraceEnabled()) { logger.trace("doEducations.jsp: start render of education: " + JcmsUtil.dataToString(education)); }
      %>

      <%
      String editUrl = MessageFormat.format("{0}?id={1}&redirect={2}", 
          "plugins/ESNPlugin/jsp/form/editEducation.jsp",
          education.getId(),
          encodeForURL(redirectUrl)
      );
      String deleteUrl = MessageFormat.format("{0}?id={1}&opDelete=true&redirect={2}", 
          "plugins/ESNPlugin/jsp/portlet/doEducations.jsp",
          education.getId(),
          encodeForURL(redirectUrl)
      );
      %>
      <jalios:panel>
        <div class="esn-experience esn-experience-education" itemscope itemtype="http://schema.org/EducationalOrganization">
          <div class="esn-experience-header">
            <div class="esn-experience-meta pull-right text-info"><%
              %><% if (Util.notEmpty(education.getStartDate())) {
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
                        %><a class="modal" href="<%= encodeForHTMLAttribute(editUrl) %>" role="button" tabindex="0" onclick="return false;"><%
                          %><jalios:icon src="edit-small" alt="" /><%
                          %>&nbsp;<%= glp("ui.com.alt.edit") %><%
                        %></a><%
                      %></li><%
                      %><li><%
                        %><a class="ajax-refresh confirm" href="<%= encodeForHTMLAttribute(deleteUrl) %>" role="button" tabindex="0" onclick="return false;"><%
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
                <span itemprop="name" title='<%= encodeForHTMLAttribute(glp("types.MemberEducation.fields.trainingCenter.label")) %>'><%= education.getTrainingCenter(userLang) %></span>
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
      <%
      if (logger.isTraceEnabled()) { logger.trace("doEducations.jsp: end render of education: " + JcmsUtil.dataToString(education)); }
      %>
    </jalios:foreach>
    <jalios:pager name='mbrEducationsPagerHandler' /> 
  </div><%-- .EOF .esn-component-body --%>
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div><%-- EOF .esn-component --%>

<%
if (logger.isTraceEnabled()) { logger.trace("doEducations.jsp: end render"); }
%>