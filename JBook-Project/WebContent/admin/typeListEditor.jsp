<%--
  @Summary: List all custom types
  @Category: Admin / Types
  @Author: Oliver Dedieu
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-2.0
--%><%@page import="com.jalios.jcms.handler.TypeListEditorHandler"%>
<%
%><%@ include file='/jcore/doInitPage.jspf' %><%

  if (!checkAccess("admin/dev/types")) {
    sendForbidden(request, response);
    return;
  }

%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.handler.TypeListEditorHandler"><%
  %><jsp:setProperty name="formHandler" property="request" value="<%= request %>"/><%
  %><jsp:setProperty name="formHandler" property="response" value="<%= response %>"/><%
  %><jsp:setProperty name="formHandler" property="*" /><%
%></jsp:useBean><%
formHandler.validate();
jcmsContext.addCSSHeader("css/jalios/typeEditor.css");
%><%@ include file='/admin/doAdminHeader.jspf' %><%

boolean isModified = formHandler.isModified();
boolean isRestartNeeded = formHandler.isRestartNeeded();
boolean isApplyNeeded = formHandler.isApplyNeeded();
boolean isDatabaseSupported = formHandler.isDatabaseSupported();
boolean isContentEditor = formHandler.isContentEditor();
boolean isFormEditor = formHandler.isFormEditor();
boolean isPortletEditor = formHandler.isPortletEditor();
boolean isUGCEditor = formHandler.isUGCEditor();

Set typeSet = formHandler.getTypeSet(userLang);
String rootClassName = formHandler.getRootClassName();
String title = formHandler.getTitle();

Map<String, String[]> addTypeParameterMap = new HashMap<>();
addTypeParameterMap.put(TypeListEditorHandler.ROOT_CLASS_PARAM, new String[]{formHandler.getRootClassName()});
String addTypeModalUrl = ServletUtil.getUrlWithUpdatedParams("admin/addTypeModal.jsp", addTypeParameterMap, null, null, null, true);
%>

<div class="page-header"><h1><% /* %>Type Editor<% */ %><%= title %></h1></div>
<%@ include file='/jcore/doMessageBox.jspf' %>
  
<div class="navbar navbar-default navbar-table-header">
  <div class="container-fluid">
    <a class='btn btn-primary add-type-btn modal navbar-btn' href="<%= addTypeModalUrl %>">
      <jalios:icon src="add" />
      <%= glp("ui.adm.type-list.lbl.add") %>
    </a>
  </div>
</div>
<table id='typeTable' class='table-data'>
  <thead>
    <tr>
      <td></td>
      <th><%= glp("ui.adm.type-list.lbl.name") %></th>
      <th class="fit nowrap"><%= glp("ui.adm.type-list.lbl.extends") %></th>
      <% if (isDatabaseSupported) { %>
      <th class="fit nowrap"><%= glp("ui.adm.type-list.lbl.storage") %></th>
      <% } %>
      <th class="fit nowrap"><%= glp("ui.adm.type-list.lbl.int-name") %></th>
      <th class="fit nowrap"><%= glp("ui.com.lbl.plugin") %></th>
      <th class="fit nowrap"><%= glp("ui.com.lbl.pub-cnt") %></th>
      <th class="fit nowrap">&nbsp;</th>
    </tr>
  </thead>
  
  <tbody>
  <jalios:foreach collection='<%= typeSet %>' type='org.jdom.Element' name='itType'>
  <%
    int pos = itCounter.intValue() - 1;
    boolean isNew = Util.notEmpty(itType.getAttributeValue(TypeConstants.TYPE_NEW_MARK));
    boolean isUpdated = Util.notEmpty(itType.getAttributeValue(TypeConstants.TYPE_UPDATED_MARK));
    String name = itType.getAttributeValue("name");
    String labelProperty = TypeUtil.getTypeLabelProperty(name);
    String label = Util.getString(TypeUtil.getLabel(itType, userLang), glp(labelProperty));
    boolean isAbstract = Util.getString(itType.getAttributeValue("abstract"), "false").equals("true");
    String database = Util.getString(itType.getAttributeValue("database"),"false");
    String superClass = Util.getString(itType.getAttributeValue("superclass"), Content.class.getName());

    Class clazz = null;
    long pubCount = 0;
    Plugin plugin = null;
    boolean isActive = true;
    try {
      clazz = channel.getClass("generated." + name);
      pubCount = channel.getDataCount(clazz);
      TypeEntry te = channel.getTypeEntry(clazz);
      if (te != null) {
        plugin = te.getPlugin();
        isActive = te.isActive();
      }
    } catch(Exception ex) {
      // Nothing
    }
    org.jdom.Element superElt = XmlUtil.searchChild(itType.getParentElement(), "type", "name", Util.getClassShortName(superClass));
    boolean isCustomSuper = superElt == null && !superClass.equals(Content.class.getName());
    String confirmDelete = encodeForJavaScript(glp("msg.js.confirm-delete", label));
    String anchorClass = "";
    if (isNew) { anchorClass = "newType"; } else if (isUpdated) { anchorClass = "updatedType"; }
  %>
  <% if (isActive) { %>
  <tr>
    <td class="text-right" nowrap="nowrap"><%= itCounter %>. <a href="admin/typeEditor.jsp?type=<%= name %>" class="btn btn-rounded"><jalios:icon src="edit" alt='ui.com.alt.edit' /></a></td>
    <td class="text-left" width='100%' nowrap="nowrap"><span <%= isAbstract ? "style='font-style: italic'" : "" %>><a href="admin/typeEditor.jsp?type=<%= name %>" class="type <%= anchorClass %>"><jalios:dataicon class="<%= clazz %>"/> <%= label %></a></span></td>
    <td class="text-left" width='100%' nowrap="nowrap">
      <% if (isCustomSuper) { %>
        <%= Util.getClassShortName(superClass) %>
      <% } else if (superElt != null) {
        String superLabelProperty = TypeUtil.getTypeLabelProperty(superElt.getAttributeValue("name"));
        String superLabel = Util.getString(TypeUtil.getLabel(superElt, userLang), glp(superLabelProperty));
        %><%= superLabel %><%
      } else { %>
        &nbsp;
      <% } %>
    </td>
    <% if (isDatabaseSupported) { %>
    <td class="text-center" nowrap="nowrap">
      <% if (database.equals("true")) { %>
      <jalios:icon src="db" alt="DB" title='ui.adm.type-list.lbl.storage.db' />
      <% } else { %>
      <jalios:icon src="store" alt="JStore" title='ui.adm.type-list.lbl.storage.jstore' />
      <% } %>
    </td>
    <% } %>
    <td class="text-left" nowrap="nowrap"><%= name %></td>
    <td class="text-left" nowrap="nowrap">
    <% if (plugin != null) { %>
      <jalios:icon src="<%= plugin.getIcon() %>" /> 
      <a href="admin/displayPlugin.jsp?name=<%= plugin.getName() %>">
        <%= plugin.getLabel(userLang) %>
      </a>
    <% } %>
    </td>
    <td class="text-right" nowrap="nowrap">
    <% if (clazz == null) { %>
      ?
    <% } else if (pubCount == 0) { %>
      0
    <% } else { %>
      <a href="work/queryWork.jsp?types=<%= name %>&amp;allWorkspaceFilter=true"><%= pubCount %></a>
    <% } %>
    </td>
    <td class="text-left" nowrap="nowrap">
      <% if (pubCount == 0 && TypeUtil.getSubEltList(itType).isEmpty() && TypeUtil.getLinkedEltList(itType).isEmpty()) { %>
      <a href='admin/typeListEditor.jsp?opDelete=true&amp;name=<%= name %>&amp;rootClass=<%= rootClassName %>' onclick='confirmAction("<%= confirmDelete %>", this.href); return false;' class="btn btn-rounded"><jalios:icon src="trash-empty" alt='ui.com.alt.remove' /></a>
      <% } %>
    </td>
  </tr>
  <% } %>
  </jalios:foreach>
  </tbody>
</table>

<form method="post" action="admin/typeListEditor.jsp" name="editSaveModification">
  <% String confirm = encodeForJavaScript(glp("msg.js.confirm")); %>
  <input type="hidden" name="rootClass" value="<%= rootClassName %>" />
  <input class='btn btn-default <%= isRestartNeeded ? "btn-danger" : "btn-default" %>' type="button" name="opSaveAndRestart" value='<%= glp("ui.adm.type-list.btn.restart") %>' onclick='confirmAction("<%= confirm %>", "<%= contextPath %>/admin/typeListEditor.jsp?opSaveAndRestart=true&amp;rootClass=<%= rootClassName %>")' <%= !isRestartNeeded ? "disabled" : "" %>>&nbsp;&nbsp;
  <input class='btn btn-default <%= isApplyNeeded ?"btn-primary" : "btn-default" %>' type="button" name="opSaveAndApply" value='<%= glp("ui.adm.type-list.btn.apply") %>' onclick='confirmAction("<%= confirm %>", "<%= contextPath %>/admin/typeListEditor.jsp?opSaveAndApply=true&amp;rootClass=<%= rootClassName %>")' <%= !isApplyNeeded ? "disabled" : "" %>>&nbsp;&nbsp;
  <input class='btn btn-default' type="submit" name="opSave" value='<%= glp("ui.com.btn.save") %>' <%= !isModified ? "disabled" : "" %>>
  <input class='btn btn-default' type="button" name="opRevert" value='<%= glp("ui.adm.type-list.btn.revert") %>' onclick='confirmAction("<%= confirm %>", "<%= contextPath %>/admin/typeListEditor.jsp?opRevert=true&amp;rootClass=<%= rootClassName %>")' <%= !isModified ? "disabled" : "" %>>&nbsp;&nbsp;
</form>

<%@ include file='/admin/doAdminFooter.jspf' %>