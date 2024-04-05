<%@ page contentType="text/html; charset=UTF-8"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/doInitMemberProfile.jspf' %><%

// Only if logged
if (!isLogged) {
  return;
}
// Sorted section list
List<String> sectionList = esnProfileDisplayHandler.getActionMenuSections();
if (Util.isEmpty(sectionList)) {
  // Action menu: no sections
  return;
}

Map<String, Collection<UIAction>> actionsBySectionMap = esnProfileDisplayHandler.getActionMenu();
String css = "profile-activity profile-body-block profile-actions";

// Loop 1: call JSP + save in clean map
Map<String, Collection<String>> cleanMap = new HashMap();
for (Map.Entry<String, Collection<UIAction>> itEntry : actionsBySectionMap.entrySet()) {
  String section = itEntry.getKey();
  //logger.info("Process section: " + section);
  Collection<UIAction> actions = itEntry.getValue();
  for (UIAction uiAction : actions) {
    //logger.info("Process action: " + uiAction.getProperty());
    request.setAttribute(ProfileDisplayHandler.ACTION_REQUEST_ATTR, uiAction);
    request.setAttribute(ProfileDisplayHandler.ACTION_REQUEST_ATTR + "-mid", uiAction.getContext().getMember().getId());
    %><jalios:buffer name="actionDOMBuffer"><jalios:include jsp='<%= uiAction.getJsp() %>' /></jalios:buffer><%
    request.removeAttribute(ProfileDisplayHandler.ACTION_REQUEST_ATTR);
    request.removeAttribute(ProfileDisplayHandler.ACTION_REQUEST_ATTR + "-mid");
    
    String itDom = actionDOMBuffer.toString();
    if (Util.isEmpty(itDom)) {
      continue;
    }
    Collection<String> sectionActions = cleanMap.get(section);
    if (sectionActions == null) {
      sectionActions = new ArrayList();
      cleanMap.put(section, sectionActions);
    }
    //logger.info("Save an action in "+section+" for later: " + itDom);
    sectionActions.add(itDom);
  }
}

// Iterate on sorted section, find first non empty Action
String mainActionDOM = "";
for (String section : sectionList) {
  Collection<String> sectionDOMList = cleanMap.get(section);
  if (Util.notEmpty(sectionDOMList)) {
    Iterator<String> actionIterator = sectionDOMList.iterator();
    String actionDom = actionIterator.hasNext() ? actionIterator.next() : null;
    if (Util.notEmpty(actionDom)) {
      //logger.info("Found main action: " + actionDom);
      mainActionDOM = actionDom;
      actionIterator.remove(); // Prevent action to be duplicated
      break;
    }
  }
}
// Make a backup of the initial (untouched mainAction)
boolean hasMainAction = Util.notEmpty(mainActionDOM);
boolean mainActionSmallDeviceCloneDone = false;
String mainActionDOMBackup = mainActionDOM;

if (Util.notEmpty(mainActionDOM)) {
  // Add ".btn" class on A:
  mainActionDOM = mainActionDOM.replaceAll("esn-profile-action ",
     "esn-profile-action esn-profile-main-action btn ");
}
%>
<div class="profile-actions">
  <% if (isEdit) { %>
    <jalios:link data="<%= member %>" css="btn esn-profile-action esn-profile-main-action noTooltipCard">
      <%= glp("jcmsplugin.esn.ctxmenu.mbr.profile") %>
    </jalios:link>

  <% } else { %>
  
    <span class="esn-profile-main-action-wrapper"><%= mainActionDOM %></span>
    
    <button type="button"<%
      %> aria-label="<%= encodeForHTMLAttribute(glp("jcmsplugin.esn.profile.action.open-action-menu")) %>"<%
      %> title="<%= encodeForHTMLAttribute(glp("jcmsplugin.esn.profile.action.open-action-menu")) %>"<%
      %> class="esn-profile-action btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
      <span class="caret"></span>
    </button>
    <ul class="dropdown-menu dropdown-menu-right">
    <%
    Iterator<String> sectionIterator = sectionList.iterator();
    int sectionIndex = 0;
    while (sectionIterator.hasNext()) {
      String section = sectionIterator.next();

      Collection<String> nonEmptyActions = cleanMap.get(section);
      if (Util.notEmpty(nonEmptyActions)) {
        
        int actionIndex = 0;
        boolean hasNextSection = (sectionIndex + 1) < Util.getSize(sectionList);
        boolean notFirstSection = sectionIndex > 0;
        boolean isLastItemOfSection = (actionIndex + 1) == Util.getSize(nonEmptyActions);
        boolean printDivider = notFirstSection;
        printDivider |= isLastItemOfSection && hasNextSection;
        %>
        <% if (printDivider) { %>
          <li class="divider" role="<%= ESNHTMLConstants.SEPARATOR_ROLE %>"></li>
          <%
          printDivider = false;
          %>
        <% } %>
        <%
        // The first time, repeat the mainAction if any
        if (hasMainAction && !mainActionSmallDeviceCloneDone) {
          %>
          <%-- Repeat the main action in the menu, as an alternative on small device/screen --%>
          <li class="esn-profile-action esn-profile-action-section-<%= section %> esn-profile-main-action">
          <%= mainActionDOMBackup %>
          </li>
          <%
          mainActionSmallDeviceCloneDone = true;
        }
        for (String nonEmptyActionDom : nonEmptyActions) {
          printDivider &= actionIndex == 0;
          %>
          <li class="esn-profile-action esn-profile-action-section-<%= section %>">
          <%= nonEmptyActionDom %>
          </li>
          <%
          actionIndex++;
        }
        sectionIndex++;
      }
    }
    %>
    </ul>
  <% } %>
</div>
