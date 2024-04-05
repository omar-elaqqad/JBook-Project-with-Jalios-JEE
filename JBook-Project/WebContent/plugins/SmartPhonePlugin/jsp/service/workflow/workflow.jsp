<%@ include file='/plugins/SmartPhonePlugin/jsp/common/header.jspf' %><% 
  request.setAttribute("jcms.plugin.smartphone.topbar.title", glp("jcmsplugin.smartphone.service.workflow")); 
  SmartPhoneService service = new DefaultSmartPhoneService("jcmsplugin.smartphone.service.workflow");
  if (!service.isEnabled(jcmsContext)) {
    sendRedirect(SmartPhoneConstants.FORBIDDEN_JSP_PATH);
    return;
  }
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
  
  Set allPubSet     = channel.getPublicationSet(Publication.class, loggedMember, false, null, true);
  Workspace selectedWS = getWorkspaceParameter("ws");
  if (Util.getSize(loggedMember.getWorkspaceSet()) == 1) {
    selectedWS = Util.getFirst(loggedMember.getWorkspaceSet());
  }
    
  boolean onlyOneWS = false;
  Map<Workspace, Integer> wsMap = new TreeMap<Workspace, Integer>();
  if (selectedWS == null) {
    for(Workspace ws: loggedMember.getWorkspaceSet()) {
      DataSelector wsSelector = new AndDataSelector(new Publication.WorkspaceSelector(ws), commonSelector);
      Set pubSet = JcmsUtil.select(allPubSet, wsSelector, null);
      int size = Util.getSize(pubSet);
      if (size > 0) {
        wsMap.put(ws, size);
      }
    }
    onlyOneWS = wsMap.size() == 1;
    
    if (onlyOneWS) {
      selectedWS = Util.getFirst(wsMap.keySet());
    }
  }
  
  boolean showWorkspaces = selectedWS == null;

%>
<div id="service-workflow" class="service-workflow-page" data-role="page" data-dom-cache="true">
  <smartphone:breadcrumb icon="workflow-app" service='<%= service %>' />
  <div class="service-workflow-content">
    <% if (showWorkspaces) { %>
      <ul data-role="listview">
      <jalios:foreach collection="<%= wsMap.entrySet() %>" name="itEntry" type="Map.Entry">
        <%
        Workspace ws = (Workspace)itEntry.getKey();
        int size = (Integer)itEntry.getValue();
        DataSelector wsSelector = new AndDataSelector(new Publication.WorkspaceSelector(ws), commonSelector);
        Set pubSet = JcmsUtil.select(allPubSet, wsSelector, Publication.getMdateComparator());
        
        %>
        <li>
          <a data-role="none" href="plugins/SmartPhonePlugin/jsp/service/workflow/workflowWorkspace.jsp?id=<%= ws.getId() %>">
            <h2><%= ws.getTitle(userLang) %></h2>
            <span class="ui-li-count"><%= Util.getSize(pubSet) %></span>
          </a>
        </li>        
      </jalios:foreach>
      </ul>
    <% } else { %>
      <%
      DataSelector wsSelector = new AndDataSelector(new Publication.WorkspaceSelector(selectedWS), commonSelector);
      Set pubSet = JcmsUtil.select(allPubSet, wsSelector, Publication.getMdateComparator());
      %>
      <h2><%= selectedWS.getTitle(userLang) %></h2>
      <ul data-role="listview">
        <jalios:foreach collection="<%= pubSet %>" name="itPub" type="Publication" max="10">
          <% String itemUrl = "plugins/SmartPhonePlugin/jsp/service/workflow/workflowUpdate.jsp?id=" + itPub.getId(); %>
          <jalios:dataListItem data="<%= itPub %>" link="<%= itemUrl %>" template="jmobile-detailed">
            <jalios:buffer name="LIST_ITEM_META_PREPEND">
              <%= itPub.getWFStateLabelHtml(userLang) %>
            </jalios:buffer>
          </jalios:dataListItem>
        </jalios:foreach>
      </ul>
    <% } %>
  </div>
</div>
<%@ include file='/plugins/SmartPhonePlugin/jsp/common/footer.jspf' %>