<%@page import="com.jalios.jcmsplugin.collaborativespace.CSRequestController"%>
<%@page import="com.jalios.jcms.taglib.card.CardsDisplayMode"%>
<%@page import="com.jalios.jcmsplugin.collaborativespace.CSConstants"%>
<%@page import="com.jalios.jcmsplugin.collaborativespace.CSManager"%>
<%@ page contentType="text/html; charset=UTF-8" %><%
%><%--
  @Summary: CSRequest display page
  @Category: Template
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

CSRequest obj = (CSRequest)request.getAttribute(PortalManager.PORTAL_PUBLICATION);
CSManager manager = CSManager.getInstance();

Category typoRoot = manager.getTypologyRoot();
boolean isTypoActive = typoRoot != null;
Set<Category> typoSet = new TreeSet<Category>();
if (isTypoActive) {
  Set<Category> catSet = obj.getCategorySet();
  for (Category cat : catSet) {
    if (manager.isTypology(cat, false)) {
      typoSet.add(cat);
    }
  }
}
boolean hasTypology = Util.notEmpty(typoSet);

jcmsContext.addCSSHeader("plugins/CollaborativeSpacePlugin/css/collaborativeSpace.css");
jcmsContext.addCSSHeader("plugins/CollaborativeSpacePlugin/css/cs-request.css");

String parentId = Util.getString(obj.getParent(), "");
Workspace wsParent = null;
if (Util.notEmpty(parentId) && channel.getWorkspace(parentId) != null) {
  wsParent = channel.getWorkspace(parentId);
}

Workflow pubWF = obj.getWorkflow();
boolean displayWFActions = channel.isDataWriteEnabled() && isLogged && loggedMember.canWorkOn(obj);
displayWFActions = displayWFActions && obj.isInVisibleState();  // If pstatus is !inVisibleState, native JCMS workflow change is displayed in the HEADER 
boolean canWorkInState = isLogged && pubWF != null && pubWF.canWorkInState(obj, loggedMember, obj.getWFState());
displayWFActions = displayWFActions && canWorkInState; // loggedMember must have rights to work in current state
boolean isDefaultWorkflow = pubWF != null && pubWF.getId().equals(CSConstants.CSREQUEST_WF_NAME);
boolean displayDefaultWFAction = isDefaultWorkflow && pubWF.getInitState().getPstatus() == obj.getPstatus();  // Only display if in "submitted" state

String validationUrlPattern = "work/validateStateChange.jsp?id={0}&amp;ws={1}&amp;redirect={2}&amp;pstatus={3}";
%>

<%@ include file='/front/doFullDisplay.jspf' %>

<div class="fullDisplay CSRequest">

  <h1 class="title br">
    <%= glp("jcmsplugin.collaborativespace.create.title-request") %>
  </h1>
  
  <%@ include file='/jcore/doMessageBox.jspf' %>

  <table class="table cs-request-infos">
    
    <%-- Submit member --%>
    <tr class="field submit-member <%= obj.getSubmitMember() != null ? "" : "empty" %>">
      <th scope="row" class="text-right">
        <%= glp("ui.work.forms.lbl.submit-mbr") %>
      </th>
      <td>
        <% if (obj.getSubmitMember() != null) { %>
          <jalios:cards mode="<%= CardsDisplayMode.INLINE %>">
            <jalios:cardData data="<%= obj.getSubmitMember() %>" template="small"/>
          </jalios:cards>
        <% } %>
      </td>
    </tr>
  
    <%-- Space name --%>
    <tr class="field name <%= Util.isEmpty(obj.getName(userLang)) ? "empty" : "" %>">
      <th scope="row" class="text-right"><%= channel.getTypeFieldLabel(CSRequest.class, "name", userLang) %></th>
      <td>
        <% if (Util.notEmpty(obj.getName(userLang))) { %>
          <%= obj.getName(userLang) %>
        <% } %>
      </td>
    </tr>
  
    <%-- Description --%>
    <tr class="field description <%= Util.isEmpty(obj.getDescription(userLang)) ? "empty" : "" %>">
      <th scope="row" class="text-right"><%= channel.getTypeFieldLabel(CSRequest.class, "description", userLang) %></th>
      <td>
        <% if (Util.notEmpty(obj.getDescription(userLang))) { %>
          <jalios:wiki><%= obj.getDescription(userLang) %></jalios:wiki>
        <% } %>
      </td>
    </tr>
  
    <%-- Parent (if any) --%>
    <% if (Util.notEmpty(parentId)) { %>
    <tr class="field parent <%= Util.isEmpty(obj.getParent()) ? "empty" : "" %>">
      <th scope="row" class="text-right"><%= channel.getTypeFieldLabel(CSRequest.class, "parent", userLang) %></th>
      <td>
        <% if (wsParent!= null) { %>
          <% if (isLogged && loggedMember.belongsToWorkspace(wsParent)) { %>
            <jalios:link data='<%= wsParent %>'/>
          <% } else { %>
            <%= wsParent.getTitle(userLang) %>
          <% } %>
        <% } else { %>
          <%= parentId %>
        <% } %>
      </td>
    </tr>
    <% } %>

    <%-- Typologies --%>
    <% if (hasTypology) { %>
      <tr class="field typology">
        <th scope="row" class="text-right"><%= glp("jcmsplugin.collaborativespace.create.info.typology") %></th>
        <td>
          <jalios:foreach collection='<%= typoSet %>' name='typoCat' type='Category'>
            <%@ include file="/plugins/CollaborativeSpacePlugin/jsp/template/doTypologyBadge.jspf" %>
          </jalios:foreach>
        </td>
      </tr>
      </div>
    <% } %>
  
    <%-- Access policy --%>
    <tr class="field accessPolicy <%= Util.isEmpty(obj.getAccessPolicy()) ? "empty" : "" %>">
      <th scope="row" class="text-right"><%= channel.getTypeFieldLabel(CSRequest.class, "accessPolicy", userLang) %></th>
      <td>
        <% String accessPolicy = obj.getAccessPolicy(); %>
        <%@ include file="/plugins/CollaborativeSpacePlugin/jsp/template/doAccessBadge.jspf" %>
      </td>
    </tr>
  
    <%-- Signup policy --%>
    <tr class="field signupPolicy <%= Util.isEmpty(obj.getSignupPolicy()) ? "empty" : "" %>">
      <th scope="row" class="text-right"><%= channel.getTypeFieldLabel(CSRequest.class, "signupPolicy", userLang) %></th>
      <td>
        <% if (Util.notEmpty(obj.getSignupPolicy())) { %>
          <%= obj.getSignupPolicyLabel(obj.getSignupPolicy(), userLang) %>
        <% } %>
      </td>
    </tr>
  
    <%-- Language --%>
    <tr class="field language <%= Util.isEmpty(obj.getLanguage()) ? "empty" : "" %>">
      <th scope="row" class="text-right"><%= channel.getTypeFieldLabel(CSRequest.class, "language", userLang) %></th>
      <td>
        <% if (Util.notEmpty(obj.getLanguage())) { %>
          <%
          String langLabelKey = Util.getString("lang." + obj.getLanguage(), "");
          String langLabel = glp(langLabelKey);
          %>
          <% if (!langLabelKey.equals(langLabel)) { %>
            <jalios:lang lang="<%= obj.getLanguage() %>"/>
            <%= langLabel %>
          <% } else { %>
            <%= obj.getLanguage() %>
          <% } %>
        <% } %>
      </td>
    </tr>
  
    <%-- Model --%>
    <tr class="field model <%= Util.isEmpty(obj.getModel()) ? "empty" : "" %>">
      <th scope="row" class="text-right"><%= channel.getTypeFieldLabel(CSRequest.class, "model", userLang) %></th>
      <td>
        <%
        String modelId = Util.getString(obj.getModel(), "");
        Workspace wsModel = null;
        if (Util.notEmpty(modelId) && channel.getWorkspace(modelId) != null) {
          wsModel = channel.getWorkspace(modelId);
          %>
          <% if (Util.notEmpty(wsModel)) { %>
            <% if (isLogged && loggedMember.belongsToWorkspace(wsModel)) { %>
              <jalios:link data='<%= wsModel %>'/>
            <% } else { %>
              <%= wsModel.getTitle(userLang) %>
            <% } %>
          <% } %>
        <% } else { %>
          <%= modelId %>
        <% } %>
      </td>
    </tr>
  
    <%-- admins --%>
    <tr class="field admins <%= Util.isEmpty(obj.getAdmins()) ? "empty" : "" %>">
      <th scope="row" class="text-right"><%= channel.getTypeFieldLabel(CSRequest.class, "admins", userLang) %></th>
      <td>
        <% if (Util.notEmpty(obj.getAdmins())) { %>
        <ol class="list-unstyled">
          <jalios:foreach name="itAdmin" type="com.jalios.jcms.Member" array="<%= obj.getAdmins() %>">
          <% if (itAdmin != null) { %>
          <li>
            <jalios:memberphoto member="<%= itAdmin %>" size="<%= PhotoSize.ICON %>" />
            <jalios:link data='<%= itAdmin %>'/>
          </li>
          <% } %>
          </jalios:foreach>
        </ol>
        <% } %>
      </td>
    </tr>
  
    <%-- groups --%>
    <% if (Util.notEmpty(obj.getGroups())) { %>
    <tr class="field groups <%= Util.isEmpty(obj.getGroups()) ? "empty" : "" %>">
      <th scope="row" class="text-right"><%= channel.getTypeFieldLabel(CSRequest.class, "groups", userLang) %></th>
      <td>
        <ol class="list-unstyled">
          <jalios:foreach name="itGroup" type="com.jalios.jcms.Group" array="<%= obj.getGroups() %>">
          <% if (itGroup != null) { %>
          <li><%= itGroup.getDataName(userLang) %></li>
          <% } %>
          </jalios:foreach>
        </ol>
      </td>
    </tr>
    <% } %>
  
    <%-- members --%>
    <% if (Util.notEmpty(obj.getMembers())) { %>
    <tr class="field members <%= Util.isEmpty(obj.getMembers()) ? "empty" : "" %>">
      <th scope="row" class="text-right"><%= channel.getTypeFieldLabel(CSRequest.class, "members", userLang) %></th>
      <td>
        <ol class="list-unstyled">
          <jalios:foreach name="itMember" type="com.jalios.jcms.Member" array="<%= obj.getMembers() %>">
          <% if (itMember != null) { %>
          <li>
            <jalios:memberphoto member="<%= itMember %>" size="<%= PhotoSize.ICON %>" />
            <jalios:link data='<%= itMember %>'/>
          </li>
          <% } %>
          </jalios:foreach>
        </ol>
      </td>
    </tr>
    <% } %>

    <%-- CDate --%>
    <tr class="field cdate">
      <th scope="row" class="text-right">
        <%= glp("ui.com.lbl.date") %>
      </th>
      <td>
        <%= JcmsUtil.getFriendlyDate(obj.getCdate(), DateFormat.SHORT, true, userLocale, true) %>
      </td>
    </tr>
  </table>
  
  <% if (displayWFActions) { %>
    <%-- Member has rights to work in this WFState --%>
    <% if (displayDefaultWFAction) { %>
      <%-- CSRequest default workflow has been recognized --%>
      <%
      CollaborativeSpace cs = CSManager.getInstance().getCollaborativeSpace(workspace);
      String redirect = cs != null ? cs.getDisplayUrl(userLocale) : ServletUtil.getUrl(request);
      String confirmMsg = glp("msg.js.confirm");
      String btnTitle = encodeForHTMLAttribute(HtmlUtil.html2text(confirmMsg));
      String dataJaliosText = encodeForHTMLAttribute(confirmMsg);
      %>
      <form name="customWfForm" action="edit.jsp" method="post">
        <button type="submit" class="btn btn-primary modal confirm" name="pstatus" value="<%= CSRequestController.PSTATUS_ACCEPTED %>" title="<%= btnTitle %>" data-jalios-text="<%= dataJaliosText %>"><%= glp("jcmsplugin.collaborativespace.signup.btn.accept") %></button>   
        <%
        String rejectUrl = MessageFormat.format(validationUrlPattern, obj.getId(), obj.getWorkspaceId(), ServletUtil.encodeURL(ServletUtil.getUrl(request)), CSRequestController.PSTATUS_REJECTED);
        %>
        <a href="<%= rejectUrl %>" class="btn btn-danger modal"><%= glp("jcmsplugin.collaborativespace.signup.btn.reject") %></a>
        <input type='hidden' name='id' value='<%= obj.getId() %>' />
        <input type='hidden' name='opUpdate' value='true' />
        <input type='hidden' name='redirect' value='<%= redirect %>' />
      </form>
    <% } else { %>
      <%-- A custom workflow. Delegate to core validation modal. --%>
      <a class="btn btn-primary pub-action-wf-validate modal" href="work/validateStateChange.jsp?id=<%= obj.getId() %>"><span class="publication-action-label"><%= glp("ui.com.alt.validate") %></span></a>
    <% } %>
  <% } %>  

</div>