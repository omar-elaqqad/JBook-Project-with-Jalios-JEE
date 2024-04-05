<%@ page contentType="text/html; charset=UTF-8"%>
<%
%><%@ page import="com.jalios.jcmsplugin.collaborativespace.*"%>
<%
%><%@ include file='/jcore/doInitPage.jspf'%>

<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.collaborativespace.CSModelSelectionHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>' />
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>' />
  <jsp:setProperty name='formHandler' property='*' />
</jsp:useBean>

<div class="ajax-refresh-div csp-model-selection" data-jalios-ajax-refresh-url="plugins/CollaborativeSpacePlugin/jsp/doCSModelSelection.jsp">
	<%

	formHandler.addFrontEndDependencies();
  CSManager csMgr = CSManager.getInstance();
  CollaborativeSpace cs = csMgr.getCollaborativeSpace(workspace); 

  formHandler.validate();
  if(cs != null){
	  formHandler.setId(cs.getId());
  }
  formHandler.initModels();
  
  
  Set<Category> typoSet = csMgr.getTypologies(loggedMember);
  boolean typologyExists = Util.notEmpty(typoSet);
  
  int THUMBNAILS_WIDTH = 200;
  int THUMBNAILS_HEIGHT = 150;
  
  String[] modelValues = formHandler.getModelValues();
  Workspace model = formHandler.getSelectedModel();
  
  String displayMode = formHandler.getModelAndTypologyDisplayMode(); 
  boolean showMultipleTypology = formHandler.isTypologyMultipleDisplayMode();
    
  %>

	<%
  //---------------------------------------------------------------
  // HIDDEN FIELDS
  //---------------------------------------------------------------
  %>
	<input type="hidden" value="<%= displayMode %>" name="modelDisplayMode" />
	<input type="hidden" value="<%= showMultipleTypology %>"
		name="showMultipleTypology" /> <input type="hidden"
		value="<%= formHandler.isCreation() %>" name="creation" />

	<%
  //---------------------------------------------------------------
  // TYPOLOGIES	
  //---------------------------------------------------------------
  %>

  <%if(showMultipleTypology){ %>
  <% Category typologyRoot = csMgr.getTypologyRoot(); %>
  <% if (typologyRoot != null) { %>
  <% Set<Category> typologyCatSet = cs.getDescendantCategorySet(typologyRoot, false, loggedMember); %>
  <jalios:field name="cids"
    label="jcmsplugin.collaborativespace.create.info.typology"
    resource="<%= displayMode  %>" css="widget-name-typologies">
    
    <select name="cids" multiple="multiple" size="6" class="form-control"
      data-jalios-action="ajax-refresh">
      <% 
            if(formHandler.getCurrentTypologyCatSet() == null){
              csMgr.printTypologyOptions(out, userLang, loggedMember, typologyCatSet, false);
            }else{
           	csMgr.printTypologyOptions(out, userLang, loggedMember, formHandler.getCurrentTypologyCatSet(), false);
            }
          %>
    </select>
    <% for(Category cat: cs.getCategorySet()) { %>
    <% if (!typologyCatSet.contains(cat)) { %>
    <%-- Keep other categories --%>
    <input type="hidden" name="cids" value="<%= cat.getId() %>" />
    <% } %>
    <% } %>
  </jalios:field>
  <% } %>
  <% }else if (typologyExists) { 
    
    Category typology = Util.getFirst(formHandler.getCategorySet("cids"));
    boolean isValidTypo = typology != null && typoSet.contains(typology);
    if (!isValidTypo) {
      Category typologyRoot = csMgr.getTypologyRoot();
      Comparator<Category> comp = typologyRoot.isCustomOrder() ? Category.getOrderComparator(userLang) : Category.getNameComparator(userLang);
      Set<Category> childrenSet = new TreeSet<Category>(comp);
      childrenSet.addAll(typologyRoot.getChildrenSet());
      typology = Util.getFirst(childrenSet);
    }
    %>
  <jalios:field
    label="jcmsplugin.collaborativespace.create.info.typology"
    resource='<%= displayMode %>'>
   <select class="form-control" name="cids"
      data-jalios-action="ajax-refresh">
      <% 
       if(formHandler.getCurrentTypologyCatSet() == null){
         csMgr.printTypologyOptions(out, userLang, loggedMember, typology, false);
       }else{
      	csMgr.printTypologyOptions(out, userLang, loggedMember, formHandler.getCurrentTypologyCatSet(), false);
       }
      
      %>
  </select>
  </jalios:field>
  <% if (Util.notEmpty(typology.getImage(userLang)) && Util.notEmpty(typology.getDescription(userLang))) { %>
  <div class="form-group">
    <div class="col-md-9 col-md-offset-3 typology-details">
      <div class="media typology-description">
        <% if (Util.notEmpty(typology.getImage(userLang))) { %>
        <div class="pull-left">
          <jalios:thumbnail css='img-thumbnail media-object'
            path='<%= typology.getImage(userLang) %>'
            width='<%= THUMBNAILS_WIDTH %>' height='<%= THUMBNAILS_HEIGHT %>' />
        </div>
        <% } %>
        <% if (Util.notEmpty(typology.getDescription(userLang))) { %>
        <div class="media-body description">
          <jalios:wiki><%= typology.getDescription(userLang) %></jalios:wiki>
        </div>
        <% } %>
      </div>
    </div>
  </div>
  <% } %>
  <% } %>

  <%
  //---------------------------------------------------------------
  // MODELS
  //---------------------------------------------------------------
  %>

  <% if(!formHandler.isCreation() && workspace.isModel()){ %>
    <!--  Do nothing  -->
  <% }else if(Util.notEmpty(modelValues) && modelValues.length == 1){ %>
    <input type="hidden" name="model" value="<%= modelValues[0] %>" />
    <% request.setAttribute("CURRENT_SELECTED_MODEL", formHandler.getModels()[0]); %>
  <% }else if((!workspace.isModel() || formHandler.isCreation()) && Util.notEmpty(modelValues)){ %>
    <% String modelWrapperCss =""; %>
    <jalios:field css='model-selection'
      label="jcmsplugin.collaborativespace.create.model.model"
      required='<%= true %>' resource='<%= displayMode %>'>
      <jalios:foreach array="<%= formHandler.getModels() %>" name="itModel" type="CollaborativeSpace">
         <% 
           if(model.getId().equals(itModel.getWorkspaceId())){
             request.setAttribute("CURRENT_SELECTED_MODEL", itModel); 
           }
         %>
        <label
          for="model_<%=itModel.getWorkspaceId() %><%= formHandler.isCreation()?"_create":""%>">
          <% modelWrapperCss = (model.getId().equals(itModel.getWorkspaceId()))?"model-selected":""; %>
          <div class="model_wrapper <%= modelWrapperCss%>">
            <% String inputId = "model_" + itModel.getWorkspaceId() + (formHandler.isCreation() ? "_create" : ""); %>
            <input
              <%= (model.getId().equals(itModel.getWorkspaceId()))?"checked='checked'":"" %>
              data-is-sync-required="<%= (Util.isEmpty(itModel.getModelSyncMode()))?false:true %>"
              type="radio" name="model"
              value="<%= itModel.getWorkspaceId() %>"
              id="<%= inputId %>" />
            <div class="model__infos">
              <label for="<%= inputId %>" class="model_title"><jalios:icon src="collaborative-space-model" /> <%= itModel.getTitle(userLang) %></label>
              <span class="model-description"><%= encodeForHTML(itModel.getAbstractAsText(userLocale)) %></span>
            <% if(loggedMember.canWorkOn(itModel)){ %>
              <a class="model_title" href="<%= itModel.getDisplayUrl(userLocale) %>" target="_blank"><%= glp("jcmsplugin.collaborativespace.settings.lbl.open-model") %></a>
              <% } %>
            </div>
          </div>
        </label>
      </jalios:foreach>
  </jalios:field>
  <% } %>
<% if(!formHandler.isCreation() && workspace.isModel()){ %>
  <jalios:field name="modelSyncMode" formHandler="<%= formHandler %>" resource="<%= displayMode %>">
    <jalios:control />
  </jalios:field> 
<% }else{ %>
  <jalios:field resource="<%= displayMode %>"  css="<%= formHandler.getActivateModeCss() %>" description="jcmsplugin.collaborativespace.syncMode.activate-help.message" name="activateSync" label="jcmsplugin.collaborativespace.create.model.sync-toggle">
    <jalios:control settings='<%= formHandler.getActivateSyncSettings()%>' />
  </jalios:field>
        
    <jalios:field resource="<%= displayMode %>" name="syncMode" formHandler="<%= formHandler %>" css='<%= formHandler.getSyncModesCss() %>'>
      <jalios:control />
  </jalios:field>
<% } %>
</div>