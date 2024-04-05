<%@page import="com.jalios.jcmsplugin.esn.ui.ESNHTMLConstants"%><%
%><%@page import="com.jalios.jcmsplugin.esn.ESNManager"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf'%><%

Category cat = getCategoryParameter("ctxId");
if (cat == null || !cat.canBeReadBy(loggedMember) || loggedMember == null){
  return;
}

String refreshUrl = "plugins/DirectoryPlugin/jsp/app/directoryApp.jsp";
boolean canManage = loggedMember.canManageCategory(cat);
boolean isRootCompetence = ESNManager.getInstance().getMemberCategoriesRootSet().contains(cat);
%>
  
  <%-- RENAME --%>
  <% if (canManage) { %>
  <li>
    <a data-jalios-data-id="<%= cat.getId() %>"
       data-jalios-competence-action="rename"
       data-jalios-text="<%= encodeForHTMLAttribute(glp("jcmsplugin.esn.directory.app.competence-action.rename-prompt")) %>"
       data-jalios-current-value="<%= encodeForHTMLAttribute(cat.getName(userLang), true) %>"
       role="button" tabindex="0">
      <jalios:icon src="jcmsplugin-esn-competence-rename" alt="" />
      <%= glp("ui.com.lbl.rename") %>
    </a>
  </li>
  <% } %>
  
  <%-- MOVE : modal with target selection --%>
  <% if (canManage && !isRootCompetence) { %>
  <li>
    <a href="#" 
       data-jalios-data-id="<%= cat.getId() %>" 
       data-jalios-competence-action="moveto">
      <jalios:icon src="jcmsplugin-esn-competence-move-to" alt="" />
      <%= glp("jcmsplugin.esn.directory.app.competence-action.move-to") %>
    </a>
  </li>
  <% } %>
  
  <%-- MERGE : open core modal --%>
  <% if (canManage && !isRootCompetence) { %>
  <li>
    <a href="work/mergeCategory.jsp?srcCat=<%= cat.getId() %>"  class="modal">
      <jalios:icon src="merge" alt="" />
      <%= glp("ui.work.cat.lbl.merge") %>
    </a>
  </li>
  <% } %>
  
  <%-- DELETE --%>
  <% if (cat.checkDelete(loggedMember).isOK() && !isRootCompetence) { %>
  <li>
    <% String deleteMsg = cat.isLeaf(loggedMember) ? glp("msg.js.confirm-delete",cat.getName(userLang)) : glp("msg.js.confirm-deep-delete",cat.getName(userLang),Util.join(cat.getChildrenSet(), ", ", 3, "...")); %>
    <a href="#" 
       data-jalios-data-id="<%= cat.getId() %>" 
       data-jalios-parent-data-id="<%= JcmsUtil.getId(cat.getParent()) %>" 
       data-jalios-competence-action="delete"
       data-jalios-text="<%= encodeForHTMLAttribute(deleteMsg) %>">
      <jalios:icon src="jcmsplugin-esn-competence-delete" alt=""/>
      <%= glp("ui.com.btn.delete") %>
    </a>
  </li>
  <% } %>
   
  <li class="divider" role="<%= ESNHTMLConstants.SEPARATOR_ROLE %>"></li>
  
  <%-- add sub : modal with name --%>
  <% if (canManage) { %>
  <li>
    <a href="#"
       data-jalios-data-id="<%= cat.getId() %>"
       data-jalios-competence-action="add"
       data-jalios-text="<%= encodeForHTMLAttribute(glp("jcmsplugin.esn.directory.app.competence-action.add-prompt")) %>">
        <jalios:icon src="jcmsplugin-esn-competence-add" />
      <%= glp("jcmsplugin.esn.directory.app.competence-action.add-sub") %>
    </a>
  </li>
  <% } %>
