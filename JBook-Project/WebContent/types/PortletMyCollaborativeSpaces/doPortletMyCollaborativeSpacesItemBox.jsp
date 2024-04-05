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

//----------------------------------------------------------------------
//  FOOTER ACTION
//----------------------------------------------------------------------
boolean showOpenSpace = csMgr.showCSCreationLink(loggedMember);
if (showOpenSpace) {
  boolean canCreate = csMgr.canCreateCS(loggedMember, false);
  String creationLabel = "jcmsplugin.collaborativespace.create.lbl." + (canCreate ? "create" : "request-create");
  String typoParam = typoCat == null ? "" : "cids=" + typoCat.getId();
  String params = Util.notEmpty(typoParam) ? "?" + typoParam : "";
  %><jalios:buffer name="footerBuffer"><%
    %><a href="plugins/CollaborativeSpacePlugin/jsp/createSpace.jsp<%= params %>" class="modal open-space-link <%= canCreate ? "cs-creation-link" : "cs-creation-request-link" %>"><%
      %><jalios:icon src='add'/> <%=glp(creationLabel)%><%
    %></a></jalios:buffer><%
  request.setAttribute(PortletMyCollaborativeSpaces.class.getSimpleName() + "_footerBuffer", footerBuffer);
}

String typoFormAction = url;
%><%@ include file='/types/PortletMyCollaborativeSpaces/csList.jspf' %>