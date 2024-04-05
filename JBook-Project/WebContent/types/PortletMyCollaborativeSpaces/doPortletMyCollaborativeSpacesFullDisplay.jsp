<%--
  @Summary: PortletMyCollaborativeSpaces MySpace list
  @Category: Custom
  @Author: Sylvain Devaux <sylvain.devaux@jalios.com> 
  @Since: csp-4.3, csp-5.0 
--%>
<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ page import="com.jalios.jcmsplugin.collaborativespace.*" %><%
%><%@ page import="com.jalios.jcmsplugin.collaborativespace.guest.*" %><%
%><%@ page import="com.jalios.jcmsplugin.collaborativespace.guest.selector.*" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%

if (portlet == null) {
  return;
}
if (!isLogged) {
  request.setAttribute("ShowPortalElement", Boolean.FALSE);
  return;
}

jcmsContext.addCSSHeader("plugins/CollaborativeSpacePlugin/css/cs-my-spaces.css");

String url = "types/PortletMyCollaborativeSpaces/doPortletMyCollaborativeSpacesFullDisplay.jsp";
CSManager csMgr = CSManager.getInstance();
String csTypoParam = "cstypology_" + JcmsUtil.getId(portlet);
Category typoCat = getCategoryParameter(csTypoParam);

String typoFormAction = url;

Collection<CollaborativeSpace> mySpaces = csMgr.getMemberCollaborativeSpaces(loggedMember, typoCat);
Collection<CollaborativeSpace> otherSpaces = csMgr.getMemberOtherCollaborativeSpaces(loggedMember, typoCat);

String tabParam = portlet.getId() + "_portletmycollaborativespaces_tab";
String tab = getAlphaNumParameter(tabParam, "mine");

int mineSetSize = Util.getSize(mySpaces); 
int otherSetSize = Util.getSize(otherSpaces);

if (mineSetSize == 0) {
  tab = "other";
}
if (otherSetSize == 0) {
  tab = "mine";
}

Comparator<Workspace> comparator = Workspace.getNameComparator(userLang);
Set<Workspace> wsSet = new TreeSet<Workspace>(comparator);

if ("mine".equals(tab) && mineSetSize > 0) {
  wsSet.addAll(csMgr.getWorkspaceSet(Util.getHashSet(mySpaces.toArray(new CollaborativeSpace[]{}))));
} else if (otherSetSize > 0) {
  wsSet.addAll(csMgr.getWorkspaceSet(Util.getHashSet(otherSpaces.toArray(new CollaborativeSpace[]{}))));
}
%>
<div class="myCollaborativeSpaces">
  <%-- TYPOLOGY --%>
  <%
  // Keep current TAB selected (CSP-369)
  String tabKeeper = "<input type='hidden' name='" + tabParam +"' value='" + tab + "' />";
  request.setAttribute("cs-typology-filter-form", tabKeeper);
  %>
  <%@ include file='/types/PortletMyCollaborativeSpaces/doTypologyFilter.jspf' %>
  <% request.removeAttribute("cs-typology-filter-form"); %>
  
  <%-- TABS --%>
  <% if ((mineSetSize > 0 || otherSetSize > 0)) { %>
    <ul class="nav nav-tabs nav-tabs-underlined">
      <% if (mineSetSize > 0) { %>
        <li class='<%= "mine".equals(tab) ? "active" : "" %>'><%
          %><a class="ajax-refresh" onclick="return false;" 
                  href="<%=url%>?<%= portlet.getId() %>_portletmycollaborativespaces_tab=mine<%=typoCat == null ? "" : "&amp;"+csTypoParam+"=" + typoCat.getId()%>"><%=glp("jcmsplugin.collaborativespace.portlet.mycs.lbl.mine")%></a><%
        %></li>
      <% } %>
      <% if (otherSetSize > 0) { %>
        <li class='<%= "other".equals(tab) ? "active" : "" %>'><%
          %><a class="ajax-refresh" onclick="return false;" 
                  href="<%=url%>?<%= portlet.getId() %>_portletmycollaborativespaces_tab=other<%=typoCat == null ? "" : "&amp;"+csTypoParam+"=" + typoCat.getId()%>"><%=glp("jcmsplugin.collaborativespace.portlet.mycs.lbl.other")%></a><%
        %></li>
      <% } %>
    </ul>
  <% } %>
  <jalios:pager name='pagerHandler' 
                declare='true' 
                action='init' 
                pageSize='10' 
                size='<%= Util.getSize(wsSet) %>'
                paramPrefix='<%= PortalManager.PORTAL_ACTION+"_"+ JcmsUtil.getId(portlet) +"_" %>' 
                />

  <div>
    <% if (Util.isEmpty(wsSet)) { %>
      <div class="no-cs"><%= glp("jcmsplugin.collaborativespace.portlet.mycs.lbl.none") %></div>
    <% } else { %>
      <jalios:list>
        <jalios:foreach collection="<%= wsSet %>" name="ws" type="Workspace" max='<%= pagerHandler.getPageSize() %>' skip='<%= pagerHandler.getStart() %>'>
          <%
            CollaborativeSpace cs = csMgr.getCollaborativeSpace(ws);
            boolean isPublic = CSHelper.isPublic(cs);
            boolean isPrivate = CSHelper.isPrivate(cs);
            boolean isSecret = CSHelper.isSecret(cs);
            String csInnerClass = " " + (isPublic ? "access-public" : (isPrivate ? "access-private" : (isSecret ? "access-secret" : "")));
          %>
          <jalios:listItem text="<%= cs.getTitle(userLang) %>" link="<%= cs.getDisplayUrl(userLocale) %>" css="<%= csInnerClass %>">
            <jalios:buffer name='LIST_ITEM_IMAGE'>
              <span class="itemlist-item-icon"><jalios:dataicon data="<%= cs %>" /></span>
            </jalios:buffer>
          </jalios:listItem>
        </jalios:foreach>
        <jalios:pager name='pagerHandler' template='pqf'/>
      </jalios:list>
    <% } %>
    <%
    //----------------------------------------------------------------------
    //  FOOTER ACTION
    //----------------------------------------------------------------------
    boolean showOpenSpace = csMgr.showCSCreationLink(loggedMember);
    if (showOpenSpace) {
      boolean canCreate = csMgr.canCreateCS(loggedMember, false);
      String creationLabel = "jcmsplugin.collaborativespace.create.lbl." + (canCreate ? "create" : "request-create");
      String typoParam = typoCat == null ? "" : "cids=" + typoCat.getId();
      String params = Util.notEmpty(typoParam) ? "?" + typoParam : "";%><%
      %><a href="plugins/CollaborativeSpacePlugin/jsp/createSpace.jsp<%= params %>" class="btn btn-default itemlist-action modal open-space-link <%= canCreate ? "cs-creation-link" : "cs-creation-request-link" %>"><%
        %><jalios:icon src='add'/> <%=glp(creationLabel)%><%
      %></a><%
     } %>
  </div>
</div>