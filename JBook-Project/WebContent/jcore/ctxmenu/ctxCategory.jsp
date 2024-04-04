<%@ page import="com.jalios.jcms.mashup.*, com.jalios.jcms.taglib.*" %><%
  request.setAttribute("CheckCSRF", Boolean.TRUE);
%><%@ include file="/jcore/doInitPage.jspf" %><%
  
  boolean disabled = Util.toBoolean(jcmsContext.getAjaxRequestAttribute("channel.ctxmenu.disabled"),false);
  if (disabled || !channel.isDataWriteEnabled()){
    return;
  }
    
  Category cat = getCategoryParameter("ctxId");
  if (cat == null || !cat.canBeReadBy(loggedMember) || loggedMember == null){
    return;
  }
  
  // Handle parameter (should be moved to a bean)
  boolean refresh = false;
  boolean refreshParent = false;
  String ctx = getUntrustedStringParameter("ctx", null);
  String value = getUntrustedStringParameter("value", null);
  String openIds  = "false";
  ControllerStatus cs = null;
  if ("addsub".equals(ctx)){
    cs = cat.addSubs(value,loggedMember, userLang);
    String catId = cat.getId();
    Category childCat = null;
    if(getBooleanParameter("displayChildren", false)) {
      // Retrieve the last children added which will be opened
      for(Category child : cat.getChildrenSet()) {
        if(childCat == null || child.getCdate().after(childCat.getCdate())) {
          childCat = child;
        }
      }
      catId = childCat != null ? childCat.getId() : catId;
    }
    openIds = "'"+ catId +"'";
    refresh = true;
  } 
  else if ("addsib".equals(ctx)){
    cs = cat.addSiblings(value, loggedMember, userLang);
    if (cs != null && cs.isOK()) {
      String[] siblingNames = Util.split(value, ",");
      if(siblingNames != null) {
        StringBuilder sb = new StringBuilder();
        Category catParent = cat.getParent();
        for(String siblingName : siblingNames) {
          Category newSibling = catParent.getChild(JcmsUtil.escapeHtml(siblingName));
          if (newSibling != null) {
            if(sb.length() > 0) {
              sb.append(",");
            }
            sb.append("'").append(newSibling.getId()).append("'");
          }
        }
        if(sb.length() > 0) {
          openIds = "[" + sb.toString() + "]";
        }
      }
    }
    refresh = true;
  } 
  else if ("rename".equals(ctx)){
    cs = cat.rename(value, userLang, loggedMember);
    refresh = true;
  } 
  else if ("delete".equals(ctx)){
    cs = cat.delete(loggedMember);
    refresh = true;
    refreshParent = true;
  } 
  else if ("refresh".equals(ctx)){
    refresh = true;
  }
  String url = "jcore/ctxmenu/ctxmenu.jsp";
  boolean canManage = isLogged && loggedMember.canManageCategory(cat);
  boolean isRoot = cat == channel.getRootCategory();
  
  String classesParam = getUntrustedStringParameter("classes", null);
  // Kludge: use the class .treecat-empty (See TreeCatViewTag) to detect when tree has no children
  boolean isTreeEmpty = classesParam != null && classesParam.contains("treecat-empty");
  // JCMS-7414: Propagate information if tree is empty or not
  jcmsContext.setAjaxRequestAttribute("ctxCategory.isTreeEmpty", isTreeEmpty);
%>

<% if (refresh){ %>
  <jalios:javascript>
    // Retrieve last refresh event
    var refresh = jQuery.jalios.AjaxRefresh.LastRefresh.refresh;
    
    // Refresh parent treeview
    var treeview = refresh.target.closest('UL[data-jalios-ajax-refresh-url].treeview');
    <% if (refreshParent) { %>
    var treeviewParent = jQuery(treeview).parents('UL[data-jalios-ajax-refresh-url].treeview').first();
    if (treeviewParent.exists()) {
      treeview = treeviewParent;
    }
    <% } %>
    
    <% if (cs != null && !cs.isOK()){ %>
      jQuery.jalios.ui.Modal.alert.postpone(0.6,"<%= cs.getMessage(userLang) %>", function(){ 
    <% } %>
    
    // Simple refresh
    jQuery.jalios.ui.TreeView.refresh(treeview, <%= openIds %>);
    jQuery.jalios.ui.CtxMenu.hide();
    
    <% if (cs != null && !cs.isOK()){ %>});<% }%>
    
  </jalios:javascript>
  <%@ include file="/jcore/doAjaxFooter.jspf" %><% 
  return;
} %>

<%-- 
handle double divider (since JCMS-7414):
  when menu is quite empty, and ends by 2 divider following each other,
  hide them to make the menu not to end by a divider
--%>
<jalios:javascript>
  // Retrieve last refresh event
  let refresh = jQuery.jalios.AjaxRefresh.LastRefresh.refresh;
  
  // Retrieve ctxMenu
  let $ctxMenu = jQuery(refresh.target);
  
  var $last = $ctxMenu.children('LI.divider').last();
  if ($last.exists()) {
    var $lastPrev = $last.prev();
    // handle double divider
    if ($lastPrev.exists() && $lastPrev.is('LI') && $lastPrev.hasClass('divider')) {
      // Hide the previous, duplicated divider (since last one is hidden by a CSS '.divider + .divider' rule)
      $lastPrev.addClass('hide');
    }
  }
</jalios:javascript>

<%
boolean showEdit = !isTreeEmpty && canManage && !isRoot;
boolean showAddSub = canManage;
boolean showAddSibling = !isTreeEmpty && isLogged && !isRoot && loggedMember.canManageCategory(cat.getParent());
boolean showRename = !isTreeEmpty && canManage && !isRoot;
boolean showDelete = !isTreeEmpty && canManage && !isRoot && cat.checkDelete(loggedMember).isOK();
boolean showInspect = !isTreeEmpty && canManage;
boolean showMerge = !isTreeEmpty && canManage && !isRoot;
boolean showRefresh = !isTreeEmpty;
boolean showCaddy = !isTreeEmpty && canManage && !isRoot;
boolean showExport = !isTreeEmpty && canManage && !isRoot && ExportManager.getInstance().checkIP(channel.getCurrentServletRequest().getRemoteAddr());
boolean showWebdav = !isTreeEmpty && canManage && !isRoot && FileWebdavTag.Webdav.canUseWebdavFolderIcon() && loggedMember.hasWebdavAccess();
boolean showViewPortal = !isTreeEmpty;
Set<PortalInterface> portalSet = Util.interSet(channel.getAllDataSet(PortalInterface.class), cat.getPublicationSet());
boolean showPortals = !isTreeEmpty && Util.notEmpty(portalSet);
boolean showMetadata = !isTreeEmpty;

Set authMbrSet = cat.getAuthorizedMemberSet();
Set authGrpSet = cat.getAuthorizedGroupSet();
boolean showAuthMbr = Util.notEmpty(authMbrSet);
boolean showAuthGrp = Util.notEmpty(authGrpSet);
boolean showRights = !isTreeEmpty && (showAuthMbr || showAuthGrp);

Set useMbrSet = cat.getUseMemberSet();
Set useGrpSet = cat.getUseGroupSet();
boolean showUseMbr = Util.notEmpty(useMbrSet);
boolean showUseGrp = Util.notEmpty(useGrpSet);
boolean showUseRights = !isTreeEmpty && (showUseMbr || showUseGrp);

Set managerMbrSet = cat.getManagerMemberSet();
Set managerGrpSet = cat.getManagerGroupSet();
boolean showManagerMbr = Util.notEmpty(managerMbrSet);
boolean showManagerGrp = Util.notEmpty(managerGrpSet);
boolean showManagerRights = !isTreeEmpty && (showManagerMbr || showManagerGrp);

boolean showDescription = !isTreeEmpty && Util.notEmpty(cat.getDescription(userLang));
String imagePath = cat.getImage(userLang);
boolean showImage = !isTreeEmpty && Util.notEmpty(imagePath);
%>

<jalios:include target="CTXMENU_HEADER_CATEGORY" targetContext="li" />

<% if (showEdit) { %>
  <%-- EDIT --%>
  <li class="icon">
    <% String editUrl = ServletUtil.getBaseUrl(request) + HttpUtil.encodeForHTMLAttribute(ResourceHelper.getSpecificEdit(cat) + "?id=" + cat.getId() + "&amp;redirect="+ HttpUtil.encodeForURL("jcore/closePopup.jsp?refresh=" + HttpUtil.encodeForURL("[{'nodeId':'" + cat.getId() + "'}]")) + "&redirectOnClosePopup=false&popupEdition=true"); %>
    <a title="<%= encodeForHTMLAttribute(glp("ui.com.alt.edit")) %>" href="" class="editArea" onclick="Popup.popupWindow('<%= editUrl %>', '<%= glp("ui.com.alt.edit") %>', 900, 600, true, true, true, false, null, jQuery.jalios.ui.TreeView.refreshNode); return false;">
      <jalios:icon src="edit" /> <%= glp("ui.com.alt.edit") %>
    </a>
  </li>
<% } %>

<%-- TARGET --%>
<jalios:include target="CTXMENU_CATEGORY_1" targetContext="li" />    

<% if (showAddSub) { %>
  <%-- ADD SUB --%>
  <%-- add displayChildren param to know whether the treecat displays the children and not the root category --%>
  <% String displayChildren = isTreeEmpty ? "&amp;displayChildren=true" : ""; %>
  <li class="icon"><a href="<%= url %>?ctxId=<%= cat.getId() %>&amp;ctx=addsub<%= displayChildren %>" data-jalios-target="UL#ctxAjaxMenu" class="ajax-refresh modal prompt" title="<%= encodeForHTMLAttribute(glp("msg.cat-editor.add-sub-cat")) %>"><jalios:icon src="add-sub-cat" /> <%= glp("ui.work.cat.lbl.add-sub-cat") %></a></li>
<% } %>

<% if (showAddSibling) { %>  
  <%-- ADD SIBLING --%>
  <li class="icon"><a href="<%= url %>?ctxId=<%= cat.getId() %>&amp;ctx=addsib" data-jalios-target="UL#ctxAjaxMenu"  class="ajax-refresh modal prompt" title="<%= encodeForHTMLAttribute(glp("msg.cat-editor.add-sibling-cat")) %>"><jalios:icon src="add-sub-cat" /> <%= glp("ui.work.cat.lbl.add-sibling-cat") %></a></li>
<% } %>

<% if (showRename) { %>
  <%-- RENAME --%>
  <li class="icon"><a href="<%= url %>?ctxId=<%= cat.getId() %>&amp;ctx=rename" data-jalios-target="UL#ctxAjaxMenu"  class="ajax-refresh modal prompt" title="<%= encodeForHTMLAttribute(glp("msg.cat-editor.edit-name")) %>" data-jalios-modal-default="<%= encodeForHTMLAttribute(cat.getName(userLang), true) %>"><jalios:icon src="textfield-rename"/> <%= glp("ui.com.lbl.rename") %></a></li>
<% } %>

<% if (showDelete) { %>
  <%-- DELETE --%>
  <% String deleteMsg = cat.isLeaf(loggedMember) ? glp("msg.js.confirm-delete",cat.getName(userLang)) : glp("msg.js.confirm-deep-delete",cat.getName(userLang),Util.join(cat.getChildrenSet(), ", ", 3, "...")); %>
  <li class="icon"><a href="<%= url %>?ctxId=<%= cat.getId() %>&amp;ctx=delete" data-jalios-target="UL#ctxAjaxMenu"  class="modal confirm-danger" data-jalios-action="ajax-refresh" data-jalios-confirm-message="<%= encodeForHTMLAttribute(deleteMsg) %>"><jalios:icon src="trash-empty"/> <%= glp("ui.com.btn.delete") %></a></li>
<% } %>

<% if (showInspect) { %>
  <%-- INSPECT --%>
  <% if (checkAccess("admin/dev")) { %>
  <li class="icon"><a href="admin/editDataId.jsp?opInspect=true&amp;dataId=<%= cat.getId() %>" class="modal"><jalios:icon src="inspect" /> <%= glp("ui.adm.data-inspector.link") %></a></li>
  <% } %>
<% } %>

<% if (showMerge) { %>
  <%-- MERGE --%>
  <li class="icon"><a href="work/mergeCategory.jsp?srcCat=<%= cat.getId() %>" class="modal"><jalios:icon src="merge"/> <%= glp("ui.work.cat.lbl.merge") %></a></li>      
<% } %>
  
<% if (showRefresh) { %>
  <%-- REFRESH --%>
  <%-- MUST refresh LI associated --%>
  <li class="icon"><a href="<%= url %>?ctxId=<%= cat.getId() %>&amp;ctx=refresh" data-jalios-target="UL#ctxAjaxMenu" class="ajax-refresh"><jalios:icon src="refresh" /> <%= glp("ui.com.btn.refresh") %></a></li>
<% } %>

<%-- TARGET --%>
<jalios:include target="CTXMENU_CATEGORY_2" targetContext="li" />

<%-- --------------------------------------------------------------------------------------------------- --%>
<li class="divider"></li>

<% if (showCaddy) { %>
  <%-- CADDY  --%>
  <li class="icon"><jalios:caddy data="<%= cat %>" displayLinkText="<%= true %>"/></li>
<% } %>

<% if (showExport) { %>    
  <%-- EXPORT  --%>
  <% 
  Category importRootCat = ImportManager.getInstance().getImportRootCategory();
  if (cat != importRootCat && !cat.hasAncestor(importRootCat)) {
  %>
  <li class="icon"><a href="admin/exportXml.jsp?cids=<%= cat.getId() %>" title="<%= encodeForHTMLAttribute(glp("ui.com.alt.export-xml")) %>"><jalios:icon src="xml" /> <%= glp("ui.com.alt.export-xml") %></a></li>
  <% } %>
<% } %>

<% if (showWebdav) { %>
  <%-- WEBDAV  --%>
  <li class="icon"><jalios:webdav folder="<%= cat %>" title='ui.com.btn.webdav-browse' /></li>
<% } %>

<% if (showViewPortal) { %>
  <%-- VIEW PORTAL  --%>
  <li class="icon"><a href="<%= cat.getDisplayUrl(userLocale) %>"><jalios:icon src="portal" /> <%= glp("ui.work.cat.lbl.view-portal") %></a></li>
<% } %>

<%-- TARGET --%>
<jalios:include target="CTXMENU_CATEGORY_3" targetContext="li" />

<%-- --------------------------------------------------------------------------------------------------- --%>
<li class="divider"></li>

<%-- PORTAL  --%>
<% if (showPortals) { %>
<li class="icon dropdown-submenu">
  <a href="#"><jalios:icon src="multiportal"/> <%= glp("ui.com.lbl.portals") %></a>
  <ul class="dropdown-menu ctxInfo">
    <% for (PortalInterface portal : portalSet) { 
       if (!((Publication)portal).canBeReadBy(loggedMember)) { continue; }
    %><li class="text"><a href="#"><span><jalios:icon src="portal" /> <%= portal.getTitle(userLang) %></span></a></li>
    <% } %>
  </ul>
</li>
<% } %>

<% if (showMetadata) { %>
<%-- METADATA  --%>
<li class="icon dropdown-submenu">
  <a href="#"><jalios:icon src="info" /> <%= glp("ui.com.lbl.metadata") %></a>
  <ul class="dropdown-menu ctxInfo">
    <% boolean sep =  false; %>
    
    <%-- FRIENDLY URL  --%>
    <% Set friendlyUrl = cat.getFriendlyURLSet(); 
       if (Util.notEmpty(friendlyUrl)) { sep = true; %>
    <li class="dropdown-submenu">
      <a href="#"><%= glp("ui.com.lbl.friendly-urls") %></a>
      <ul class="dropdown-menu ctxInfo">
      <jalios:foreach collection="<%= friendlyUrl %>"  name="itUrl" type="String">
        <li><a href="<%= itUrl %>"><%= itUrl %></a></li>
      </jalios:foreach>
      </ul>
    </li>
    <% } %>
    
    <%-- SYNONYMES  --%>
    <% String[] synonyms = cat.getSynonyms();
       if (Util.notEmpty(synonyms)) { sep = true; %>
    <li class="dropdown-submenu">
      <a href="#"><%= glp("ui.work.cat.lbl.synonyms") %></a>
      <ul class="dropdown-menu ctxInfo">
      <jalios:foreach array="<%= synonyms %>"  name="itSyn" type="String">
        <li><a href="#"><%= itSyn %></a></li>
      </jalios:foreach>
      </ul>
    </li>
    <% } %>
    
    <%-- --------------------------------------------------------------------------------------------------- --%>
    <% if (sep){ %><li class="divider"></li><% } %>
     
    <%-- AUTHOR  --%>
    <% if (cat.getAuthor() != null) { %>
    <li><a href="#"><strong><%= glp("ui.com.lbl.author") %>:</strong> <%= cat.getAuthor().getFullName() %></a></li>
    <% } %>
   
    <%-- CDATE  --%>
    <% if (cat.getCdate() != null) { %>
    <li><a href="#"><strong><%= glp("ui.com.lbl.cdate") %>:</strong> <jalios:date date='<%= cat.getCdate() %>' format='timeDateOrTime' /></a></li>
    <% } %>
    
    <%-- MDATE  --%>
    <% if (cat.hasBeenUpdated() && cat.getMdate() != null) { %>
    <li><a href="#"><strong><%= glp("ui.com.lbl.mdate") %>:</strong> <jalios:date date='<%= cat.getMdate() %>' format='timeDateOrTime' /></a></li>
    <% } %>
    
    <%-- INDEX  --%>
    <% Date idxDate = cat.getIndexingDate();
    if (idxDate != null) { %>
    <li><a href="#"><strong><%= glp("ui.com.lbl.idxdate") %>:</strong> <jalios:date date='<%= idxDate %>' format='timeDateOrTime' /></a></li>
    <% } %>
    
    <%-- <<->> --%>
    <li class="divider"></li>
    
    <li><a href="#"><strong><%= glp("ui.com.lbl.id") %>:</strong> <%=  cat.getId() %></a></li>
  </ul>
</li>
<% } %>

<% if (showRights) { %>
<%-- READ RIGHTS --%>
<% int maxSubMenuItems = channel.getIntegerProperty("ctxmenu.cat.sub-menu-max-items", 666); %>
<li class="icon dropdown-submenu">
  <a href="#" ><jalios:icon src="key" /> <%= glp("ui.work.form.lbl.read-rights") %></a>
  <ul class="dropdown-menu ctxInfo">
  
  <% if (showAuthMbr) { %>
    <li class='section'><a href="#"><%= glp("ui.com.lbl.members") %></a></li>
    <jalios:foreach collection="<%= authMbrSet %>" type="Member" name="itMember" max="<%= maxSubMenuItems %>">
      <li><jalios:link data="<%= itMember %>" /></li>
    </jalios:foreach>
  <% } %>
  <% if (showAuthGrp) { %>
    <li class='section'><a href="#"><%= glp("ui.com.lbl.groups") %></a></li>
    <jalios:foreach collection="<%= authGrpSet %>" type="Group" name="itGroup" max="<%= maxSubMenuItems %>">
      <li><jalios:link data="<%= itGroup %>" /></li>
    </jalios:foreach>
  <% } %>
  </ul>
</li>
<% } %>

<% if (showUseRights) { %>
<%-- USE RIGHTS --%>
<% int maxSubMenuItems = channel.getIntegerProperty("ctxmenu.cat.sub-menu-max-items", 666); %>
<li class="icon dropdown-submenu">
  <a href="#" ><jalios:icon src="key" /> <%= glp("ui.work.cat.tab.use-rights") %></a>
  <ul class="dropdown-menu ctxInfo">
  
  <% if (showUseMbr) { %>
    <li class='section'><a href="#"><%= glp("ui.com.lbl.members") %></a></li>
    <jalios:foreach collection="<%= useMbrSet %>" type="Member" name="itMember" max="<%= maxSubMenuItems %>">
      <li><jalios:link data="<%= itMember %>" /></li>
    </jalios:foreach>
  <% } %>
  <% if (showUseGrp) { %>
    <li class='section'><a href="#"><%= glp("ui.com.lbl.groups") %></a></li>
    <jalios:foreach collection="<%= useGrpSet %>" type="Group" name="itGroup" max="<%= maxSubMenuItems %>">
      <li><jalios:link data="<%= itGroup %>" /></li>
    </jalios:foreach>
  <% } %>
  </ul>
</li>
<% } %>

<% if (showManagerRights) { %>
<%-- MANAGER RIGHTS --%>
<% int maxSubMenuItems = channel.getIntegerProperty("ctxmenu.cat.sub-menu-max-items", 666); %>
<li class="icon dropdown-submenu">
  <a href="#" ><jalios:icon src="key" /> <%= glp("ui.work.cat.tab.manage-rights") %></a>
  <ul class="dropdown-menu ctxInfo">
  
  <% if (showManagerMbr) { %>
    <li class='section'><a href="#"><%= glp("ui.com.lbl.members") %></a></li>
    <jalios:foreach collection="<%= managerMbrSet %>" type="Member" name="itMember" max="<%= maxSubMenuItems %>">
      <li><jalios:link data="<%= itMember %>" /></li>
    </jalios:foreach>
  <% } %>
  <% if (showManagerGrp) { %>
    <li class='section'><a href="#"><%= glp("ui.com.lbl.groups") %></a></li>
    <jalios:foreach collection="<%= managerGrpSet %>" type="Group" name="itGroup" max="<%= maxSubMenuItems %>">
      <li><jalios:link data="<%= itGroup %>" /></li>
    </jalios:foreach>
  <% } %>
  </ul>
</li>
<% } %>

<%-- DESCRIPTION --%>
<% if (showDescription) { %>
<li class="icon dropdown-submenu">
  <a href="#"><jalios:icon src="abstract" /> <%= glp("ui.com.lbl.description") %></a>
  <ul class="dropdown-menu ctxInfo">
    <li class='block'><a href="#">
    <jalios:truncate length="400" suffix="..."><%= cat.getDescription(userLang) %></jalios:truncate>
    </a></li>
  </ul>
</li>
<% } %>

<%-- IMAGE --%>
<% if (showImage) { %>
<li class="divider"></li>
<li class="ctx-image"><a href="<%= imagePath %>"><jalios:icon src="<%= imagePath %>" /></a></li>
<% } %>

<jalios:include target="CTXMENU_FOOTER_CATEGORY" targetContext="li" />

<%@ include file="/jcore/doAjaxFooter.jspf" %>