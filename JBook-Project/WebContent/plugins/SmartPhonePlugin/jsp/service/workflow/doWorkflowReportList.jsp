<%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%--  
--%><%@ page import="com.jalios.jcmsplugin.smartphone.*" %><%--  
--%><%  
  
  int skip = getIntParameter("skip",0);
  int max = getIntParameter("max", SmartPhoneManager.getInstance().getDefaultPageSize());
  Workspace workflowWorkspace = getWorkspaceParameter("id");
  
  DataSelector specialStateSelector = new DataSelector() {
    public boolean isSelected(Data data) {
      if (! (data instanceof Publication)) {
        return false;
      }
      Publication pub = (Publication)data;
      return pub.getWFState() != null && !pub.getWFState().isSpecialState();
    }
  };

  DataSelector commonSelector   = new AndDataSelector(
        new AndDataSelector(Publication.getCanWorkOnSelector(loggedMember), specialStateSelector), 
        new ReverseDataSelector(FileDocument.getHiddenSelector()));


  Set allPubSet = channel.getPublicationSet(Publication.class, loggedMember, false, workflowWorkspace, true);
    
  DataSelector wsSelector = new AndDataSelector(new Publication.WorkspaceSelector(workflowWorkspace), commonSelector);
  Set pubSet = JcmsUtil.select(allPubSet, wsSelector, null);  

%>
<jalios:foreach collection="<%= pubSet %>" name="itPub" type="Publication" skip="<%= skip %>" max="<%= max %>">
<li>
  <a class="link" href="plugins/SmartPhonePlugin/jsp/service/workflow/workflowUpdate.jsp?id=<%= itPub.getId() %>">
    <h2><jalios:dataicon data="<%= itPub %>" /> <%= itPub.getTitle(userLang) %></h2>
    <div class="txt-info"><%= itPub.getWFStateLabelHtml(userLang) %> &middot; <%= itPub.getAuthor() %> &middot; <jalios:date format="timeDateOrTime" date="<%= itPub.getPdate() != null ? itPub.getPdate() : itPub.getCdate() %>"/></div>
  </a>
</li>          
</jalios:foreach>
<% if ((skip + max) < pubSet.size()) {%>
<li class="ui-listview-showmore">
  <a data-jalios-ajax-action="plugins/SmartPhonePlugin/jsp/service/workflow/doWorkflowReportList.jsp?skip=<%= skip +max %>&amp;max=<%= max %>&amp;id=<%= workflowWorkspace.getId() %>" data-role="button" data-theme="b" class="ajax-refresh ui-link">
    <%= glp("jcmsplugin.smartphone.action.showmore") %>
  </a>
</li>
<% } %>