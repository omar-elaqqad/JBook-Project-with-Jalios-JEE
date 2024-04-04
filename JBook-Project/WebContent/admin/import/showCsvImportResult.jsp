<%--
  @Summary: Member CSV import : result modal
  @since: jcms-8
  @author Sylvain Devaux <sylvain.devaux@jalios.com>
--%><%@page import="com.jalios.jcms.handler.MembersCsvImportHandler"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

List<String> createdIds = (List<String>) request.getSession().getAttribute(MembersCsvImportHandler.CREATED_IDS_REQ_ATTR);
List<String> updatedIds = (List<String>) request.getSession().getAttribute(MembersCsvImportHandler.UPDATED_IDS_REQ_ATTR);
MembersCsvImportHandler formHandler = (MembersCsvImportHandler) request.getSession().getAttribute(MembersCsvImportHandler.FORMHANDLER_REQ_ATTR);

jcmsContext.addCSSHeader("css/jalios/member-csv-import.css");
request.getSession().removeAttribute(MembersCsvImportHandler.IMPORT_DONE_REQ_ATTR);
request.getSession().removeAttribute(MembersCsvImportHandler.CREATED_IDS_REQ_ATTR);
request.getSession().removeAttribute(MembersCsvImportHandler.UPDATED_IDS_REQ_ATTR);
request.getSession().removeAttribute(MembersCsvImportHandler.FORMHANDLER_REQ_ATTR);
%>
<jalios:modal title="ui.member.csv-import.result-modal.title" 
    url="admin/import/showCsvImportResult.jsp"
    css='member-csv-import-modal modal-lg'><%
  if (formHandler == null) {
    %><jalios:message msg='ui.member.csv-import.error.unknown-error' level='<%= MessageLevel.ERROR %>' title='' dismissable='false' /><%
  } else {
    List<MemberImport> memberInfoList = formHandler.getMemberInfoList();
    int invalidCount = formHandler.getInvalidCount();
    boolean didSendEmail = Util.toBoolean(request.getSession().getAttribute(MembersCsvImportHandler.EMAIL_SENT_REQ_ATTR), Boolean.FALSE);
    
    List<Member> createdMbrList = JcmsUtil.idCollectionToDataList(createdIds, Member.class);
    List<Member> updatedMbrList = JcmsUtil.idCollectionToDataList(updatedIds, Member.class);
    
    boolean anyCreatedMbr = createdMbrList != null && createdMbrList.size() > 0;
    boolean anyUpdatedMbr = updatedMbrList != null && updatedMbrList.size() > 0;
    boolean noImport = !anyCreatedMbr && !anyUpdatedMbr;
  
    if (noImport) {
      %><jalios:message msg='ui.member.csv-import.result-modal.no-operation' level='<%= MessageLevel.WARN %>' title='' dismissable='false' /><%
    } else {
      %>
      <div class="success-detail">
      <%
      if (anyCreatedMbr) {
        String title = didSendEmail ? glp("ui.member.csv-import.result-modal.created-emailed-label", createdIds.size()) : glp("ui.member.csv-import.result-modal.created-label", createdIds.size());
        %>
        <jalios:message msg='<%= title %>' level='<%= MessageLevel.SUCCESS %>' title='' dismissable='false' />
        <ol><%
        for (Member itMbr : createdMbrList) {
          %><li>
            <jalios:memberphoto member='<%= itMbr %>' size='<%= PhotoSize.ICON %>'/>
            <jalios:link data='<%= itMbr %>'><%= itMbr.getFullName() %> "<%= itMbr.getEmail() %>"</jalios:link>
          </li><%
        }
        %></ol><%
      }
      if (anyUpdatedMbr) {
        %>
        <jalios:message msg='<%= glp("ui.member.csv-import.result-modal.updated-label", updatedIds.size()) %>' level='<%= MessageLevel.SUCCESS %>' title='' dismissable='false' />
        <ol><%
        for (Member itMbr : updatedMbrList) {
          %><li>
          <jalios:memberphoto member='<%= itMbr %>' size='<%= PhotoSize.ICON %>'/>
          <jalios:link data='<%= itMbr %>'><%= itMbr.getFullName() %> "<%= itMbr.getEmail() %>"</jalios:link>
          </li><%
        }
        %></ol><%
      }
      %>
      </div>
      <%
    }
    %>
    <%-- Error list --%>
    <div class="error-detail">
      <%@ include file='/admin/import/importCSVMembersErrorList.jspf' %>
    </div>
    <%
  }
%></jalios:modal>