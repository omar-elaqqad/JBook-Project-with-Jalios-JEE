<%--
  @Summary: Intermediate UI to create a new Type.
  @Category: Admin / Types
  @Author: Sylvain DEVAUX
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-10.0.3
--%><%@page import="org.jdom.Element"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

if (!checkAccess("admin/dev/types")) {
  // No forbidden in modal
  //sendForbidden(request, response);
  return;
}

%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.handler.TypeListEditorHandler"><%
  %><jsp:setProperty name="formHandler" property="request" value="<%= request %>"/><%
  %><jsp:setProperty name="formHandler" property="response" value="<%= response %>"/><%
  %><jsp:setProperty name="formHandler" property="*" /><%
  %><jsp:setProperty name="formHandler" property="noRedirect" value="true"/><%
%></jsp:useBean><%

if (formHandler.validate()) {
  request.setAttribute("modal.redirect", formHandler.getRedirect());
  %>
  <%@ include file="/jcore/modal/modalRedirect.jspf" %><%
}

jcmsContext.addCSSHeader("css/jalios/typeEditor.css");

boolean isContentEditor = formHandler.isContentEditor();
boolean isFormEditor = formHandler.isFormEditor();
boolean isPortletEditor = formHandler.isPortletEditor();
boolean isUGCEditor = formHandler.isUGCEditor();

Set<Element> typeSet = formHandler.getTypeSet(userLang);
%>

<%-- *** ADD A NEW TYPE ******************************************* --%>
<jalios:modal url="admin/addTypeModal.jsp" 
              picture="" 
              title="ui.adm.type-list.lbl.add"
              button="ui.com.btn.next"
              op="opAdd">

  <form method="post" action="admin/typeListEditor.jsp" name="editForm">
  
    <jalios:field label="ui.com.lbl.name" name="typeLabels" required="true">
        <jalios:control type="<%= ControlType.TEXTFIELD %>" />
    </jalios:field>
    
    <% 
      String selectedType = "";
      Map<String, String> labelTypeMap = new TreeMap<String, String>();

      for (Iterator it = typeSet.iterator() ; it.hasNext() ; ){
        org.jdom.Element itType = (org.jdom.Element) it.next();
        String typeName = itType.getAttributeValue("name");

        TypeEntry te = channel.getTypeEntry("generated." + typeName);
        if (te != null && !te.isActive()) {
          continue;
        }   
      
        String labelProperty = TypeUtil.getTypeLabelProperty(typeName);
        String label = Util.getString(TypeUtil.getLabel(itType, userLang), glp(labelProperty));
        
        String value = itType.getAttributeValue("name");
        labelTypeMap.put(label, value);
        
        if (isPortletEditor && typeName.equals("AbstractPortletSkinable")){
          selectedType = value;
        }
      }
    
      Map<String, String> extendLabelTypeMap = new TreeMap<String, String>(labelTypeMap);
      
      if (isContentEditor) {
        extendLabelTypeMap.put(channel.getTypeLabel(FileDocument.class, userLang), FileDocument.class.getName());
        extendLabelTypeMap.put(channel.getTypeLabel(DBFileDocument.class, userLang), DBFileDocument.class.getName());
      }
    %>
    <jalios:field label="ui.adm.type-list.lbl.extends" name="superClass" tooltip="ui.adm.type-list.lbl.extends.h" value="<%= selectedType %>">
      <jalios:control settings='<%= new EnumerateSettings().select().enumValues(extendLabelTypeMap.values()).enumLabels(extendLabelTypeMap.keySet()) %>' />
    </jalios:field>
    <%
      for (Iterator it = typeSet.iterator() ; it.hasNext(); ){
        org.jdom.Element itType = (org.jdom.Element) it.next();
        String typeName = itType.getAttributeValue("name");

        TypeEntry te = channel.getTypeEntry("generated." + typeName);
        if (te != null && !te.isActive()) {
          continue;
        } 

        String labelProperty = TypeUtil.getTypeLabelProperty(typeName);
        extendLabelTypeMap.put(Util.getString(TypeUtil.getLabel(itType, userLang), glp(labelProperty)), typeName);
      }
    %>
    <jalios:field label="ui.adm.type-list.lbl.copy" name="copy" tooltip="ui.adm.type-list.lbl.copy.h">
      <jalios:control settings='<%= new EnumerateSettings().select().enumValues(labelTypeMap.values()).enumLabels(labelTypeMap.keySet()) %>' />
    </jalios:field>
    
    <p class="text-center">
      <% if (isFormEditor) { %>
        <input type='hidden' name='formAuthorId' value='<%= channel.getDefaultAdmin().getId() %>'/>
      <% } else if (isUGCEditor) { %>
        <input type="hidden" name="ugc" value="true"/>
      <% } %>
    </p>
  </form>
</jalios:modal>
