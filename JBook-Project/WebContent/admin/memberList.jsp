<%--
  @Summary: Display the member list in administration area.
            Requires specific rights.
  @Category: Admin / Member
  @Author: Oliver Dedieu
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-3.0.0
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

  if (!checkAccess("admin/users/member")) {
    sendForbidden(request, response);
    return;
  }

%><jsp:useBean id="memberHandler" scope="page" class="com.jalios.jcms.handler.MemberListHandler"><%
  %><jsp:setProperty name="memberHandler" property="request"  value="<%= request %>"/><%
  %><jsp:setProperty name="memberHandler" property="response" value="<%= response %>"/><%
  %><jsp:setProperty name="memberHandler" property="*" /><%
%></jsp:useBean><%

if (memberHandler.validate()) {
  return;
}

request.setAttribute("title", glp("ui.adm.mbr-list.title"));
request.setAttribute("memberSubAdminMenu", "true");
request.setAttribute("boHeaderCSS","sticky-display");

%>
<%@ include file='/admin/doAdminHeader.jspf' %><%

boolean isAllMemberList  = false;
boolean isDBMemberList   = false;
boolean isDetailView     = getBooleanParameter("detail", false);
boolean guiShowTree      = channel.getBooleanProperty("hierarchical-ws.adminmemberlist.guishowtree", false);
boolean showDetailView   = true;
boolean showRadioInsert  = false;
boolean showCheckInsert  = false;
boolean guiShowName      = true;
boolean guiShowPhoto     = true;
boolean guiShowPub       = isDetailView;
boolean guiPubFilter     = false;
boolean guiShowGroups    = true;
boolean guiShowSubGroups = isDetailView;
boolean guiShowWorkspace = isDetailView;
boolean guiShowReadCat   = isDetailView && AudienceRights.getInstance().isEnabled();
boolean guiShowLogin     = isDetailView;
boolean guiShowRights    = true;
boolean guiShowWebdav    = channel.isWebdavEnabled();
boolean guiShowEmail     = isDetailView;
boolean guiShowLang      = channel.isMultilingual();
boolean guiShowSession   = true;
boolean guiShowCreated   = true;
boolean guiShowLastLogin = isDetailView;
boolean guiShowExt       = isDetailView;
boolean guiLastLDAPSync  = isDetailView;
boolean guiShowId        = isDetailView;
boolean guiRemoveMember  = true;
boolean guiShowPager     = true;
boolean guiShowSearch    = true;
boolean guiShowSU        = true;
boolean guiShowSyncLDAP  = channel.isDataWriteEnabled();
boolean guiShowDisable   = true;
boolean guiShowChPwd     = true;
boolean guiShowImportCsv = channel.isDataWriteEnabled() && MemberImportManager.isEnabled() && checkAccess(MembersCsvImportHandler.ADMIN_USERS_MEMBER_ACL);
boolean guiRefineGroups  = true;
boolean guiUnGroupMember = true;
boolean guiShowNameLink  = true;
String  guiExportCSV     = null;
Set     selectedMembers  = new TreeSet();
String  redirect         = ServletUtil.getUrl(request);
Workspace mbrWorkspace   = null;
String  target           = "_self";
String  redirectRefresh  = redirect;

%><%@ include file='/work/doInsertLinkParams.jspf' %><%
request.setAttribute("showCreateMemberLink", true);
%><%@ include file='/admin/doMemberList.jspf' %><%
%><%@ include file='/admin/doAdminFooter.jspf' %>