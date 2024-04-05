<%--
 @Summary: Gives a list of CS given the typology.
--%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@page import="com.jalios.jcms.handler.QueryHandler"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%!

public class CollaborativeSpaceModelSelector implements DataSelector {
  public boolean isSelected(Data cs) {
    CollaborativeSpace localCS = (CollaborativeSpace) cs;
    return ((localCS != null) && (localCS.getWorkspace().isModel()));
  }
}
%><%

Category currentCategory = (Category) request.getAttribute(PortalManager.PORTAL_CURRENTCATEGORY);
if (currentCategory == null) {
  request.setAttribute("ShowPortalElement",Boolean.FALSE);
  return;
}
jcmsContext.addCSSHeader("plugins/CollaborativeSpacePlugin/css/collaborativeSpace.css");
jcmsContext.addCSSHeader("plugins/CollaborativeSpacePlugin/css/cs-typology.css");
CSManager csMgr = CSManager.getInstance();

//---------------------------------------------------------------
// Compute search & results
//---------------------------------------------------------------
String csText = getUntrustedStringParameter("csText", "").trim();
DataSelector CSModelSelector = new CollaborativeSpaceModelSelector();

QueryHandler csQh = new QueryHandler();
csQh.setCheckPstatus(true);
csQh.setTypes(new String[]{CollaborativeSpace.class.getName()});
csQh.setCids(new String[]{currentCategory.getId()});
csQh.setLoggedMember(loggedMember);
csQh.setText(csText);

// Skip the CS models
csQh.setDataSet(channel.select(channel.getAllPublicationSet(CollaborativeSpace.class, loggedMember), new ReverseDataSelector(CSModelSelector), null));

Set CSquerySet = csQh.getResultSet().getAsSortedSet(Publication.getTitleComparator(userLang));

String description = currentCategory.getDescription(userLang);
String typoImage = currentCategory.getImage(userLang);
String typoName = currentCategory.getName(userLang);
boolean canEditTypology = channel.isDataWriteEnabled() && isLogged && loggedMember.canManageCategory(currentCategory);
%>

<%
//---------------------------------------------------------------
// HTML start
//---------------------------------------------------------------
%>
<div class="typology-form  ajax-refresh-div" data-jalios-ajax-refresh-url="plugins/CollaborativeSpacePlugin/jsp/doCSTypologyList.jsp">
  <div class="presentation">
    <%-- Category name --%>
    <div class="typology-name"><%= typoName %></div>
  
    <%-- Category image --%>
    <% if (Util.notEmpty(typoImage)) { %>
      <% File image = new File(channel.getRealPath(typoImage)); %>
      <% if (image.exists()) { %>
        <jalios:thumbnail file='<%= image %>' 
                          width="300"
                          height="300"
                          alt="<%= typoName %>" 
                          css="thumbnail" />
      <% } %>
    <% } %>
  
    <%-- Category Description --%>
    <% if (Util.notEmpty(description)) { %>
      <jalios:wiki><%= description %></jalios:wiki>
    <% } else if (canEditTypology) { %>
      <div class="wiki">
        <p class="first">
          <%= glp("jcmsplugin.collaborativespace.typology-portal.presentation.empty.default-message") %>
        </p>
      </div>
    <% } %>
    
    <% if (jcmsContext.showEditIcon()) { %>
      <jalios:edit data='<%= currentCategory %>' popup="true"><jalios:icon src="edit" /> <%= glp("jcmsplugin.collaborativespace.typology-portal.presentation.edit") %></jalios:edit>
    <% } %>
  </div>

  <%
  //---------------------------------------------------------------
  // Spaces LIST
  //---------------------------------------------------------------
  %>
  <div class="spaces-list">
  	<%
  	//---------------------------------------------------------------
  	// Search FORM + OPEN SPACE LINK
  	//---------------------------------------------------------------
  	%>
    <div class="navbar navbar-default no-navbar-brand">
      <div class="container-fluid">
        <p class="result-count navbar-text navbar-left">
          <%= glp("jcmsplugin.collaborativespace.typology-portal.pqfe.lbl.cs-result", CSquerySet.size()) %>
        </p>
        <form action="<%= ServletUtil.getResourcePath(request) %>" class="noSingleSubmitButton navbar-form navbar-right" role="search" method="post">
          <div class="form-group">
            <jalios:field name="csText" value="<%= csText %>" resource="field-light" css='cs-search-field navbar-left'>
              <jalios:control settings='<%= new TextFieldSettings().placeholder("ui.com.placeholder.search") %>' />
              <span class="input-group-btn">
                <button class="btn btn-default ajax-refresh" name="opSearch" type="submit"><jalios:icon src="search"/></button>
              </span>
            </jalios:field>
          </div>
        </form>
        <div class="collapse navbar-collapse navbar-nav navbar-left">
          <%
          //---------------------------------------------------------------
          // Open Space action
          //---------------------------------------------------------------
          boolean showOpenSpace = csMgr.showCSCreationLink(loggedMember);
          if (showOpenSpace) {
            boolean canCreate = csMgr.canCreateCS(loggedMember, false);
            String creationLabel = "jcmsplugin.collaborativespace.create.lbl." + (canCreate ? "create" : "request-create");
            %>
            <a data-jalios-action="modal" role="button" tabindex="0" class="btn btn-default navbar-btn open-space-link <%= canCreate ? "cs-creation-link" : "cs-creation-request-link" %>" 
                  data-jalios-modal-url="plugins/CollaborativeSpacePlugin/jsp/createSpace.jsp?cids=<%= currentCategory.getId() %>">
              <%= glp(creationLabel) %>
            </a>
          <% } %>
        </div>
      </div>
  	</div>

    <%
    if (CSquerySet.size() > 0) {
      //---------------------------------------------------------------
      // Only Collaborative Spaces Not Model
      //---------------------------------------------------------------
      int defaultPageSize = Integer.parseInt(Util.getString(channel.getProperty("jcmsplugin.collaborativespace.typology-portal.pager.page-size"), "5"));
      if (defaultPageSize == 0) {
        defaultPageSize = 5;
      }
      %>
      <jalios:pager name='pagerHandler' 
                declare='true' 
                action='init' 
                pageSize='<%= defaultPageSize %>'
                pageSizes='<%= Util.join(channel.getProperty("jcmsplugin.collaborativespace.typology-portal.pager.page-sizes").split(" "), ",") %>'
                size='<%= CSquerySet.size() %>' />
      
      <ul class='items'>
        <jalios:foreach name='itCS' 
                type='CollaborativeSpace' 
                collection='<%= CSquerySet %>' 
                skip='<%= pagerHandler.getStart() %>'
                max='<%= pagerHandler.getPageSize() %>'><%
                
          ServletUtil.backupAttribute(pageContext, PortalManager.PORTAL_PUBLICATION);
          request.setAttribute(PortalManager.PORTAL_PUBLICATION, itCS);
          request.setAttribute("itPublicationCounter", itCounter);
          request.setAttribute("itPublicationAbsCounter", pagerHandler.getStart() + itCounter);
      
          //---------------------------------------------------------------
          // For each CS
          //---------------------------------------------------------------
          %>
          <li class='item cs-item<%= (itCounter == CSquerySet.size()) ? " last" : "" %>'>
            <%@ include file='/plugins/CollaborativeSpacePlugin/types/CollaborativeSpace/doCSTypologyDisplay.jspf' %>
          </li>
          <% ServletUtil.restoreAttribute(pageContext , PortalManager.PORTAL_PUBLICATION); %>
        </jalios:foreach>
      </ul>
      <jalios:pager name='pagerHandler' />
    <% } %>
  </div><%-- DIV.spaces-list --%>
</div>