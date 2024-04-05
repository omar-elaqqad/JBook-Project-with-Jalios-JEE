<%@page import="com.jalios.jcmsplugin.bookmarks.BookmarkItem"%>
<%@page import="com.jalios.jcmsplugin.bookmarks.BookmarkManager"%>
<%@page import="com.jalios.jcmsplugin.bookmarks.Bookmark"%>
<%@page import="com.jalios.jcmsplugin.jtask.TasksUtils"%>
<%@page import="com.jalios.jcms.taglib.card.CardBlockMode"%>
<%@page import="com.jalios.jcms.chart.PieChart"%>
<%@page import="com.jalios.jcms.taglib.card.CardsDisplayMode"%>
<%@page import="com.jalios.jcmsplugin.jtask.project.TaskProjectAppHandler"%>
<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcmsplugin.jtask.project.TaskProjectAppHandler"><%
%><jsp:setProperty name="formHandler" property="request"  value="<%= request %>"/><%
%><jsp:setProperty name="formHandler" property="response" value="<%= response %>"/><%
%><jsp:setProperty name="formHandler" property="*" /><%
%><jsp:setProperty name='formHandler' property='noRedirect' value='<%= true %>' /><%
%></jsp:useBean>

<div class="ajax-refresh-div project-app-body" data-jalios-ajax-refresh-url="plugins/BookmarksPlugin/jsp/projects/doBookmarkProjectsBody.jsp">
  <%-- NAVBAR --%>
  <nav class="navbar navbar-default">
    <div class="navbar-form navbar-left">
      <% if(formHandler.showCreateProjectButton()){ %>
      <a href="plugins/JTaskPlugin/jsp/project/editProjectModal.jsp?create=true&id=x" 
         class="btn btn-default modal"><%= glp("jcmsplugin.jtask.project.create") %></a>
      <% } %>
    </div>
    <ul class="nav navbar-nav">
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
        
        <% if(formHandler.isCardDisplay()){ %>
          <jalios:icon src="jcmsplugin.jtask.app.project.grid" />
          <%= glp("jcmsplugin.jtask.app.project.body.navbar.display-style.card.label") %>
        <% }else{ %>
          <jalios:icon src="jcmsplugin.jtask.app.project.list" />
          <%= glp("jcmsplugin.jtask.app.project.body.navbar.display-style.list.label") %>
        <% } %>
        <span class="caret"></span></a>
        
        <ul class="dropdown-menu" role="menu">
          <li><a href="#" class="app-filter" data-jalios-filter-name="projectDisplayStyleFilter" data-jalios-filter-value="CARDS"><jalios:icon src="jcmsplugin.jtask.app.project.grid" /> <%= glp("jcmsplugin.jtask.app.project.body.navbar.display-style.card.label") %></a></li>
          <li><a href="#" class="app-filter" data-jalios-filter-name="projectDisplayStyleFilter" data-jalios-filter-value="LIST"><jalios:icon src="jcmsplugin.jtask.app.project.list"/> <%= glp("jcmsplugin.jtask.app.project.body.navbar.display-style.list.label") %></a></li>
        </ul>
      </li>
    </ul>
  </nav>
  <input type="hidden" name="projectDisplayStyleFilter" value="<%= formHandler.getProjectDisplayStyleFilter()%>" />

  <jalios:pager name='pagerHandler' declare='true' pageSizes="12,24,48" pageSize="12" sort="<%= formHandler.getAvailableSort() %>" action='init' paramPrefix='<%= "projectAppPager_" %>' reverse='<%= formHandler.isReverse() %>' />
  
  <% 
  PageResult<TaskProject> results = formHandler.getProjectPageResult();
  
  BookmarkManager mgr = BookmarkManager.getInstance();
  List<BookmarkItem> bookmarkItems = mgr.getAllBookmarkItemList(loggedMember);
  List<TaskProject> projects = new ArrayList<TaskProject>();
  for(BookmarkItem bookmarkItem : bookmarkItems){
    if(bookmarkItem instanceof Bookmark){
      Bookmark bookmark = (Bookmark) bookmarkItem;
      if(Util.notEmpty(bookmark.getDataId())){
        Publication pub = channel.getPublication(bookmark.getDataId());
        if(pub != null && pub instanceof TaskProject){
          projects.add((TaskProject)pub);
        }
      }
    }
  }
  %>
  
  <jalios:pager name='pagerHandler' size='<%= projects.size() %>' action='compute' />
  
  <% if(formHandler.isCardDisplay()){ %>
    <jalios:cards mode="<%= CardsDisplayMode.DECK %>" >
      <jalios:foreach name="project" type="TaskProject" skip="<%= formHandler.getStart() %>" max="<%= pagerHandler.getPageSize() %>" collection="<%= projects %>">
        <jalios:cardData data="<%= project %>" />
      </jalios:foreach>
    </jalios:cards>
  <% }else{ %>
    <div class="table-responsive tasks-projects-list ">
      <table class="table-data table-app">
        <thead>
          <tr>
            <th><%-- Index --%></th>
            
            <th>
             <%= glp("jcmsplugin.jtask.project.list.project.label") %>
            </th>
            
            <th>
              <%= glp("ui.adm.plugin.lbl.author") %>
            </th>
            
            <th>
             <%= encodeForHTML(glp("jcmsplugin.jtask.project.list.workspace.label")) %>
            </th>
            
            <th>
              <jalios:pager name="pagerHandler" action="showSort" sort="cdate" sortTitle="ui.com.lbl.cdate" />
            </th>
            <th class=""><%= glp("jcmsplugin.jtask.project.list.opened-affected.label") %></th>
          </tr>
        </thead>
        <tbody>
          <jalios:foreach collection="<%= projects %>" name="project" type="TaskProject" skip="<%= formHandler.getStart() %>" max="<%= pagerHandler.getPageSize() %>">
            <tr>
              <td class="fit numeric">
                <%= pagerHandler.getStart() + itCounter.intValue() %>
              </td>
     
              <% int progress = TasksUtils.getProjectPercentageDone(project); %>
              
              <td><a href="<%= project.getDisplayUrl(userLocale) %>"><jalios:icon src="<%= project.getDataIcon() %>" /> <%= project.getTitle() %></a></td>
              <td class="fit nowrap">
                <jalios:memberphoto size="<%= PhotoSize.ICON %>" member="<%= project.getAuthor() %>" />
                <jalios:link data="<%= project.getAuthor() %>" />
              </td>
              <% if(!formHandler.isWorkspaceFilterActivated()){ %>
                <td class="fit nowrap"><a href="<%= project.getWorkspace().getDisplayUrl(userLocale)%>"><%= project.getWorkspace() %></a></td>
              <% } %>
              <td class="fit date-time">
                <jalios:date date="<%= project.getCdate() %>" format="short" locale="<%= userLocale %>" />
              </td>
              <td class="fit nowrap task-list-progress">
                <% if(progress != 0){ %>
                <div class="progress task-progress-bar">
                  <div class="progress-bar <% if(progress == 100){ %> progress-bar-success <% } %>" role="progressbar" style="width:<%= progress %>%">
                    <% if(progress == 100){ %>
                      <%= glp("jcmsplugin.jtask.project.list.progress.done") %>
                    <% }else{ %>
                      <%= progress %>%
                    <% } %>
                  </div>
                </div>
                <% } %>
              </td>
            </tr>
          </jalios:foreach>
        </tbody>
      </table>
    </div>
  <% } %>
    
  <jalios:pager name='pagerHandler' template='pqf'/>

	<jalios:include jsp="/front/app/doAppBodyInclude.jsp" />
	<%@ include file="/jcore/doAjaxFooter.jspf" %>
</div>