<%@page import="com.jalios.jcms.taglib.card.CardsDisplayMode"%><%
%><%@page import="com.jalios.jcmsplugin.collaborativespace.CSEditAdministratorsHandler"%><%
%><%@page import="com.jalios.jcmsplugin.collaborativespace.CSManager"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%

CSManager csMgr = CSManager.getInstance();
if (!CSEditAdministratorsHandler.checkAccess(loggedMember, workspace)) {
  CollaborativeSpace cs = csMgr.getCollaborativeSpace(workspace);
  if (cs != null) {
    sendRedirect(csMgr.getRootCategory(cs));
    return;
  }
  sendRedirect("index.jsp");
  return;
}

String mode = getStringEnumParameter("adminListMode", null, new String[]{"edit"});
boolean isEditMode = "edit".equals(mode);
boolean isDisplayMode = !isEditMode;
%>

<jsp:useBean id="formHandler" scope="page" class="com.jalios.jcmsplugin.collaborativespace.CSEditAdministratorsHandler"><%
  %><jsp:setProperty name="formHandler" property="request" value="<%= request %>"/><%
  %><jsp:setProperty name="formHandler" property="response" value="<%= response %>"/><%
  %><jsp:setProperty name="formHandler" property="*" /><%
  %><jsp:setProperty name="formHandler" property="id" value="<%= workspace.getId() %>"/><%
%></jsp:useBean><%
if (formHandler.validate()) {
  request.setAttribute("modal.redirect", formHandler.getRedirect());
  request.setAttribute("modal.redirect.absolute", Boolean.TRUE.toString());
  request.getSession().setAttribute("jcmsplugin.collaborativespace.admin-list-updated", Boolean.TRUE);
  %><%@ include file="/jcore/modal/modalRedirect.jspf" %><%
  return;
}
%>
 
<div class="cs-admin-list ajax-refresh-div" 
            <%= isEditMode ? "data-jalios-ajax-refresh='isform'" : "" %>
            data-jalios-ajax-refresh-url="plugins/CollaborativeSpacePlugin/jsp/adminList.jsp" >
  
  <%
    if (request.getSession().getAttribute("jcmsplugin.collaborativespace.admin-list-updated") == Boolean.TRUE) {
      request.getSession().removeAttribute("jcmsplugin.collaborativespace.admin-list-updated");
      JcmsToastr toastr = new JcmsToastr(glp("js.update.success"));
      jcmsContext.addToastr(toastr);
    }
    %>
    <%@ include file='/jcore/doMessageBox.jspf' %>
    <%

    if (isEditMode) { %>
      
      <form class="form-horizontal cs-edit-admins-form" 
        name="editForm" 
        method="POST"
        action="plugins/CollaborativeSpacePlugin/jsp/adminList.jsp">
        
        <jalios:field name='<%= CSEditAdministratorsHandler.FIELD_ADMINISTRATORS %>' 
          value='<%= formHandler.getAvailableAdministrators() %>' 
          label="jcmsplugin.collaborativespace.lbl.administrators"
          tooltip="jcmsplugin.collaborativespace.lbl.administrators.h"
          required="true"
          keyword="true">
          <jalios:control settings='<%= new MemberSettings().filter(MemberSettings.MemberFilter.ACCOUNT) %>' />
        </jalios:field>
        <jalios:javascript>
          <%-- take focus on the last input --%>
          jQuery('.input-group:last-child INPUT.form-control-display').focus();
        </jalios:javascript>
    
        <%-- BUTTONS -------------------------------------------------------------------- --%>
        <div class="form-group">
          <div class="control-label col-md-3 clearfix"></div>
          <div class="widget-content col-md-9">
            <button class='btn btn-primary' 
                type='submit' 
                name='opUpdate' 
                value="true"
                data-jalios-action="ajax-refresh"
                ><%= glp("ui.com.btn.save") %></button>
            <a class='btn btn-default' 
              data-jalios-action="ajax-refresh"
              href="<%= ServletUtil.getUrlWithRemovedParams(request,new String[] {"adminListMode"},true)%>">
              <%= glp("ui.com.btn.cancel") %>
            </a>
          </div>
        </p>
        <input type='hidden' name='redirect' 
          value='<%= ServletUtil.getUrlWithRemovedParams(request, new String[]{"adminListMode", "csAdminsstart", "opUpdate"}, true) %>' />
       </form>
    <% } %>
    
    <%-- Process list after the handler.validate has been called --%>
    <% if (isDisplayMode) { %>
      <%
      List<Member> adminlist = workspace.getAdministrators(true);
      %>
      <jalios:pager name='adminPagerHandler' 
                    declare='true' 
                    action='init' 
                    pageSize='10' 
                    size='<%= adminlist != null ? adminlist.size() : 0 %>'
                    paramPrefix='csAdmins'/>  

      <jalios:cards mode="<%= CardsDisplayMode.INLINE %>" css='cs-admin-list-cards noTooltipCard br'>
        <jalios:foreach collection="<%= adminlist %>" type="Member" name="cardMember" max="<%= adminPagerHandler.getPageSize() %>" skip="<%= adminPagerHandler.getStart() %>">
          <jalios:link data='<%= cardMember %>'>
            <jalios:cardData data='<%= cardMember %>' template="cs-admin-list" />
          </jalios:link>
        </jalios:foreach>
      </jalios:cards>
      <jalios:pager name='adminPagerHandler' template='pqf' />

      <a class='btn btn-primary ajax-refresh' 
        href="<%= ServletUtil.getUrlWithAddedParam(request, "adminListMode", "edit") %>">
        <jalios:icon src="add" /> <%= glp("jcmsplugin.collaborativespace.admin-list.add-member-btn") %>
      </a>
    <% } %>

  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>