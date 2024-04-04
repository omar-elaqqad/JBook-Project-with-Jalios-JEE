<%@ page contentType="text/plain; charset=UTF-8"%>
<%@ page import="custom.*,com.jalios.util.*, java.io.*, java.util.*, java.text.*, java.net.*, org.jdom.*, com.jalios.jcms.*" %>
<%@ taglib uri="jcms.tld" prefix="jalios" %>
<%
  request.setCharacterEncoding("UTF-8");
  
final Channel channel = Channel.getChannel();

boolean isPublicationType = true;
Element typeElt = (Element)session.getAttribute("typeElt");

String className = null;
String formHandler = "EditPublicationHandler";
String theData = "theContent";
if (typeElt == null) {
  typeElt = (Element)session.getAttribute("extensionElt");
  isPublicationType = false;
  String extendedType = typeElt.getAttributeValue("type");
  className = Util.getClassShortName(extendedType) + "Extension";
  formHandler = "EditTypeExtensionHandler";
  theData = "theExtension";
} else {
  className = typeElt.getAttributeValue("name");
}

String superclass = Util.getString(typeElt.getAttributeValue("superclass"), Publication.class.getName());
boolean isFileDocument = TypeUtil.isSubTypeOf(typeElt, com.jalios.jcms.FileDocument.class);

// Forms
boolean isForm = typeElt.getAttribute("formAuthor") != null;
boolean formOneSubmit = Util.getString(typeElt.getAttributeValue("formOneSubmit"), "false").equals("true");
boolean formNotify = Util.getString(typeElt.getAttributeValue("formNotify"), "false").equals("true");
if (isForm) {
  formHandler = "EditFormHandler";
}


// FormHandler superclass
if (superclass.startsWith("generated.") || isFileDocument) {
  formHandler =  "Edit" + Util.getClassShortName(superclass) + "Handler";

  // FormHandler superclass custom handler
  Element superElt = TypeUtil.getSuperElt(typeElt);
  if (superElt != null && Util.notEmpty(superElt.getAttributeValue("customformhandler"))) {
    formHandler = superElt.getAttributeValue("customformhandler");
  }
}


formHandler = Util.getString(typeElt.getAttributeValue("formhandler"), formHandler);


// Find out declared fields
List declaredFieldList = new ArrayList();
List categoryFieldList = new ArrayList();
List fieldList = Arrays.asList(channel.getTypeFieldEntries(TypeProcessor.PACKAGE_NAME + "." + className));
Set imageMapSet = new HashSet();
for(Iterator it = fieldList.iterator(); it.hasNext();) {
  TypeFieldEntry itField = (TypeFieldEntry)it.next();
  String type = itField.getType();
  if ("super".equals(type)) {
    continue;
  }
  String name = itField.getName();
  String editor = itField.getEditor();
  if (isPublicationType && editor.equals("category")) {
    categoryFieldList.add(itField);
  } else if (editor.equals("sqlresult")) {
    // EMPTY
  } else {
    declaredFieldList.add(itField);
  }  
}
%>
// This file has been automatically generated.
package <%= TypeProcessor.PACKAGE_NAME %>;
   
   
import java.text.*;
import java.util.*;
import org.apache.oro.text.regex.*;
import com.jalios.jcms.*;
import com.jalios.jcms.handler.*;
import com.jalios.jcms.wysiwyg.WysiwygManager;
import com.jalios.util.ObjectIntTreeMap;
import com.jalios.util.Util;
import custom.*;

@SuppressWarnings({"unchecked", "unused"})
public class Edit<%= className %>Handler extends <%= formHandler %> {
   
<jalios:if predicate='<%= isPublicationType %>'>
  protected <%= className %> theContent;
  
  public Class<? extends Publication> getPublicationClass() {
    return <%= className %>.class;
  }

</jalios:if>

<jalios:if predicate='<%= !isPublicationType %>'>
  <%= className %> theExtension;

  public Class getExtensionClass() {
    return <%= className %>.class;
  }

<jalios:if predicate='<%= declaredFieldList.isEmpty() %>'>
  public boolean isEmptyExtension() {
    return true;
  }
</jalios:if>
</jalios:if>

  
  // ----------------------------------------------------------------------
  // validateBeforeOp<%= className %>  
  // ----------------------------------------------------------------------
  
  public boolean validateBeforeOp() {
    if (!super.validateBeforeOp()) {
      return false;
    }
    
    Member fdauthor = <%= isForm ? "getAvailableAuthor();" : "getLoggedMember();" %>
    <% if (!isForm) { %>
           fdauthor = (fdauthor == null) ? getAvailableAuthor() : fdauthor;
    <% } %>
    
<jalios:foreach collection="<%= fieldList %>" name="itField" type="TypeFieldEntry">
<%
String  type     = itField.getType();
String  name     = itField.getName();
String  nameCap  = itField.getNameCap();
String  editor   = itField.getEditor();
boolean fieldML  = itField.isFieldML();
String typeShort = itField.getTypeShort();
%>
<%-- **   LINK ************* --%>
<% if (itField.isAnyLink()) { %>
<%   if (itField.isTypeScalar()) { %>
<%     if (!fieldML ) { %>
    {
      Data data = processDataId("<%= name %>", __<%= name %>Str, <%= typeShort %>.class);
      if (data != null) { 
        <%= name %> = (<%= type %>)data;
      } else {
        is<%= nameCap %>Validated = Util.isEmpty(__<%= name %>Str);
      }
    }
<%     } else { %>
    <%= name %>ML = <%= name %>ML == null ? new HashMap<>() : <%= name %>ML;
    <%= name %> = (<%= type %>)processMLData("<%= name %>", <%= type %>.class, __<%= name %>Str, <%= name %>ML);
<%     } %>

<%-- **   LINK[] ************* --%>
<%   } else { 
       if (!fieldML) { %>
    {
      List<<%= typeShort %>> list = processDataIds("<%= name %>",__<%= name %>Str,<%= typeShort %>.class);
      this.<%= name %> = (<%= typeShort %>[])list.toArray(new <%= typeShort %>[0]);
    }
<%     } else { %>
    <%= name %>ML = <%= name %>ML == null ? new HashMap<>() : <%= name %>ML;
    <%= name %> = (<%= type %>)processMLDataArray("<%= name %>", <%= typeShort %>.class, __<%= name %>Str, <%= name %>ML);
<%     } 
     } 
   } %>
</jalios:foreach>

<jalios:foreach collection="<%= fieldList %>" name="itField" type="TypeFieldEntry">
<% String nameCap  = itField.getNameCap(); %>
<%-- **   LINK and LINK[] ************* --%>
<% if (itField.isLink()) {  %>
    if (!validateUploadedFileDocument(getAvailable<%= nameCap %>(), <%= itField.isFieldML() ? itField.getName()+"ML,":"" %>  fdauthor, getAvailableWorkspace())) {
      return false;
    }
<% } %>
</jalios:foreach>

<jalios:foreach collection="<%= fieldList %>" name="itField" type="TypeFieldEntry">
<% String nameCap  = itField.getNameCap(); %>
<%-- **   LINK and LINK[] ************* --%>
<% if (itField.isLink()) {  %>
    if (!createUploadedFileDocument(getAvailable<%= nameCap %>(), <%= itField.isFieldML() ?itField.getName()+"ML,":"" %> fdauthor, getAvailableWorkspace())) {
      return false;
    }
<% } %>
</jalios:foreach>

    return true;
  }

  @Override
  public Object getAvailableField(String field) {
  <% for (Iterator it = fieldList.iterator() ; it.hasNext() ; ) {
       TypeFieldEntry itField = (TypeFieldEntry) it.next();
       if (Util.isEmpty(itField.getName())) { continue; }
    %>
    if ("<%= itField.getName() %>".equals(field)) {
    <% if (itField.isFieldML()) { %><%
    %>  return getAllAvailable<%= itField.getNameCap() %>ML();<% 
     %><% } else if (itField.isTypeCategory() && itField.getEditor().equals("category")) { %><%
    %>  return get<%= itField.getNameCap() %>CatSet();<%
    %><% } else { %><%
    %>  return getAvailable<%= itField.getNameCap() %>();<% 
    %><% } %>
    }
    <% if (itField.getEditor().equals("sqlquery")) { %>
    if ("<%= itField.getName() %>DataSource".equals(field)) {
      return getAvailable<%= itField.getNameCap() %>DataSource();
    }
    if ("<%= itField.getName() %>MaxRows".equals(field)) {
      return getAvailable<%= itField.getNameCap() %>MaxRows();
    }
    <% } %><%
%><% } %>
    return super.getAvailableField(field);
  }

  @Override
  public Object getEnumValues(String field) {
  <% for (Iterator it = fieldList.iterator() ; it.hasNext() ; ) {
       TypeFieldEntry itField = (TypeFieldEntry) it.next();
       if (Util.isEmpty(itField.getName())) { continue; }
%><% if (itField.isMbrEnum() || itField.isGrpEnum() || itField.isEnumerate() || itField.isTypeBoolean() || itField.isTypeBooleanArray() || (itField.isTypeCollection() && "Boolean".equals(itField.getTypeShort()))) { %>
    if ("<%= itField.getName() %>".equals(field)) {
      return <%= className %>.get<%= itField.getNameCap() %>Values();
    }
<% } %><%
%><% } %>
    return super.getEnumValues(field);
  }

  @Override
  public Object getEnumLabels(String field, String userLang) {
  <% for (Iterator it = fieldList.iterator() ; it.hasNext() ; ) {
       TypeFieldEntry itField = (TypeFieldEntry) it.next();
       if (Util.isEmpty(itField.getName())) { continue; }
%><% if (itField.isEnumerate() || itField.isTypeBoolean() || itField.isTypeBooleanArray() || (itField.isTypeCollection() && "Boolean".equals(itField.getTypeShort()))) { %>
    if ("<%= itField.getName() %>".equals(field)) {
      return <%= className %>.get<%= itField.getNameCap() %>Labels(userLang);
    }
<% } %><%
%><% } %>
    return super.getEnumLabels(field, userLang);
  }

  // ----------------------------------------------------------------------
  // validateCommonCreateUpdate<%= className %>  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdate<%= className %>() {
<jalios:foreach collection="<%= fieldList %>" name="itField" type="TypeFieldEntry">
<%
  String type        = itField.getType();
  String name        = itField.getName();
  String nameCap     = itField.getNameCap();
  String editor      = itField.getEditor();
  String classGetter = isPublicationType ? "getPublicationClass()" : "getExtensionClass()";
  String label       = "channel.getTypeFieldLabel(" + classGetter + ", \"" + name + "\", userLang)";
  String minValue    = ""; // FIXME itField.get getAttributeValue("minValue");
  String maxValue    = ""; // FIXME itField.getAttributeValue("maxValue");
  String root        = itField.getRoot();
  boolean isScalar   = itField.isTypeScalar();
  
%>
<%-- **   LINK / MEMBER / GROUP ************* --%>
<jalios:if predicate='<%= isScalar && itField.isAnyLink() %>'>
    if (!is<%= nameCap %>Validated) {
      setWarningMsg(glp("msg.edit.bad-link-id", <%= label %>));
      return false;
    }
</jalios:if>

<%-- **   DATE ************* --%>
<jalios:if predicate='<%= type.equals("java.util.Date") %>'>
    if (!is<%= nameCap %>Validated) {
      setWarningMsg(glp("msg.edit.bad-date-value", <%= label %>, HttpUtil.encodeForHTML(__<%= name %>Str)));
      return false;
    }
</jalios:if>

<%-- **   DATE[] ************* --%>
<jalios:if predicate='<%= type.equals("java.util.Date[]") %>'>
    if (!is<%= nameCap %>Validated) {
      setWarningMsg(glp("msg.edit.bad-date-value", <%= label %>, HttpUtil.encodeForHTML(Util.join(__<%= name %>StrArray, "', '"))));
      return false;
    }
</jalios:if>

<%-- **   INT / LONG / DOUBLE ************* --%>
<jalios:if predicate='<%= itField.isTypePrimitive() && !itField.isTypeBoolean() %>'>
    if (!is<%= nameCap %>Validated) {
      setWarningMsg(glp("msg.edit.bad-number-format", <%= label %>));
      return false;
    }
</jalios:if>

<%-- **   INT[] / LONG[] / DOUBLE[] ************* --%>
<jalios:if predicate='<%= itField.isTypePrimitiveArray()  && !itField.isTypeBoolean() %>'>
    if (!is<%= nameCap %>Validated) {
      setWarningMsg(glp("msg.edit.bad-number-format", <%= label %>));
      return false;
    }
</jalios:if>

</jalios:foreach>
    return true;
  }
  
  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate()) {
      return false;
    }

    if (!validateCommonCreateUpdate<%= className %>()) {
      return false;
    }

    return true;
  }
  
  // ----------------------------------------------------------------------
  // Update
  // ----------------------------------------------------------------------
  public boolean validateUpdate() throws java.io.IOException {
    if (!super.validateUpdate()) {
      return false;
    }
    
    if (!validateCommonCreateUpdate<%= className %>()) {
      return false;
    }
    
    return true;
  }
 
  // ----------------------------------------------------------------------
  // Next
  // ----------------------------------------------------------------------
  protected boolean validateNext() throws java.io.IOException {
   if (!super.validateNext()) {
      return false;
    }
<jalios:foreach collection="<%= declaredFieldList %>" name="itField" type="TypeFieldEntry"><%
  String type     = itField.getType();
  String editor   = itField.getEditor();
  String name     = itField.getName();
  String nameCap  = itField.getNameCap();
  boolean fieldML = itField.isFieldML();
  String classGetter = isPublicationType ? "getPublicationClass()" : "getExtensionClass()";
  String label       = "channel.getTypeFieldLabel(" + classGetter + ", \"" + name + "\", userLang)";
  boolean isScalar = itField.isTypeScalar();
  %><%-- **   DATE ************* --%><%
%><jalios:if predicate='<%= editor.equals("date")%>'>
<% if (isScalar) { %>
    if (!is<%= nameCap %>Validated) {
      setWarningMsg(glp("msg.edit.bad-date-value", <%= label %>, HttpUtil.encodeForHTML(__<%= name %>Str)));
      return false;
    }
<%}else{
%><%-- **   DATE[] ************* --%>
    if (!is<%= nameCap %>Validated) {
      setWarningMsg(glp("msg.edit.bad-date-value", <%= label %>, HttpUtil.encodeForHTML(Util.join(__<%= name %>StrArray, "', '"))));
      return false;
    }<%
    %><%}%><%
%></jalios:if><%
%></jalios:foreach>

	return true;
  }

  // ----------------------------------------------------------------------
  // Previous
  // ----------------------------------------------------------------------
  protected boolean validatePrevious() throws java.io.IOException {
  	if (!super.validatePrevious()) {
      return false;
    }
<jalios:foreach collection="<%= declaredFieldList %>" name="itField" type="TypeFieldEntry"><%
  String type     = itField.getType();
  String editor   = itField.getEditor();
  String name     = itField.getName();
  String nameCap  = itField.getNameCap();
  boolean fieldML = itField.isFieldML();
  String classGetter = isPublicationType ? "getPublicationClass()" : "getExtensionClass()";
  String label       = "channel.getTypeFieldLabel(" + classGetter + ", \"" + name + "\", userLang)";
  boolean isScalar = itField.isTypeScalar();
  %><%-- **   DATE ************* --%><%
%><jalios:if predicate='<%= editor.equals("date")%>'>
<% if (isScalar) { %>
    if (!is<%= nameCap %>Validated) {
      setWarningMsg(glp("msg.edit.bad-date-value", <%= label %>, HttpUtil.encodeForHTML(__<%= name %>Str)));
      return false;
    }
<%}else{
%><%-- **   DATE[] ************* --%>
    if (!is<%= nameCap %>Validated) {
      setWarningMsg(glp("msg.edit.bad-date-value", <%= label %>, HttpUtil.encodeForHTML(Util.join(__<%= name %>StrArray, "', '"))));
      return false;
    }<%
    %><%}%><%
%></jalios:if><%
%></jalios:foreach>

	return true;
  }

  // ----------------------------------------------------------------------
  // Finish
  // ----------------------------------------------------------------------
  protected boolean validateFinish() throws java.io.IOException {
  	if (!super.validateFinish()) {
      return false;
    }
<jalios:foreach collection="<%= declaredFieldList %>" name="itField" type="TypeFieldEntry"><%
  String type     = itField.getType();
  String editor   = itField.getEditor();
  String name     = itField.getName();
  String nameCap  = itField.getNameCap();
  boolean fieldML = itField.isFieldML();
  String classGetter = isPublicationType ? "getPublicationClass()" : "getExtensionClass()";
  String label       = "channel.getTypeFieldLabel(" + classGetter + ", \"" + name + "\", userLang)";
  boolean isScalar = itField.isTypeScalar();
  %><%-- **   DATE ************* --%><%
%><jalios:if predicate='<%= editor.equals("date")%>'>
<% if (isScalar) { %>
    if (!is<%= nameCap %>Validated) {
      setWarningMsg(glp("msg.edit.bad-date-value", <%= label %>, HttpUtil.encodeForHTML(__<%= name %>Str)));
      return false;
    }
<%}else{
%><%-- **   DATE[] ************* --%>
    if (!is<%= nameCap %>Validated) {
      setWarningMsg(glp("msg.edit.bad-date-value", <%= label %>, HttpUtil.encodeForHTML(Util.join(__<%= name %>StrArray, "', '"))));
      return false;
    }<%
    %><%}%><%
%></jalios:if><%
%></jalios:foreach>

	return true;
  }


  // ----------------------------------------------------------------------
  // setFields
  // ----------------------------------------------------------------------
  public void setFields(<%= isPublicationType ? "Publication" : "DataExtension" %> data) {
    super.setFields(data);
    <%= className %> obj = (<%= className %>)data;
<jalios:foreach collection="<%= declaredFieldList %>" name="itField" type="TypeFieldEntry">
<%
  String type     = itField.getType();
  String editor   = itField.getEditor();
  String name     = itField.getName();
  String nameCap  = itField.getNameCap();
  boolean fieldML = itField.isFieldML();
%>
<% if (type.equals("boolean") && name.startsWith("is")) {%>
    obj.set<%= name.substring(2) %>(getAvailable<%= nameCap %>());
<% } else if (itField.isTypeList()) {%>
    if (data == null || !Util.isSameContent(((<%= className %>)data).get<%= nameCap %>(), Util.getArrayList(false, true, getAvailable<%= nameCap %>()))) {
      obj.set<%= nameCap %>(Util.getArrayList(false, true, getAvailable<%= nameCap %>()));
    }
<%   if (itField.isFieldML()) { %>
    obj.set<%= nameCap %>ML(mapStringArrayToMapStringList(getAvailable<%= nameCap %>ML()));
<%   } %>
<% } else if (itField.isTypeSet()) {%>
    if (data == null || !Util.isSameContent(((<%= className %>)data).get<%= nameCap %>(), Util.getHashSet(getAvailable<%= nameCap %>()))) {
      obj.set<%= nameCap %>(Util.getHashSet(getAvailable<%= nameCap %>()));
    }
<% } else { %>
    obj.set<%= nameCap %>(getAvailable<%= nameCap %>());
<%   if (fieldML) { %>
    obj.set<%= nameCap %>ML(getAvailable<%= nameCap %>ML());
<%   } %>
<%   if (editor.equals("sqlquery")) { %>
    obj.set<%= nameCap %>DataSource(getAvailable<%= nameCap %>DataSource());
    obj.set<%= nameCap %>MaxRows(getAvailable<%= nameCap %>MaxRows());
<%   } %><% } %>
</jalios:foreach>
  }
  
<jalios:if predicate='<%= isPublicationType %>'>
  public void setId(String  v) {
    if (channel.getData(v) instanceof <%= className %>) {
      super.setId(v);
      theContent = (<%= className %>)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
</jalios:if>

<jalios:if predicate='<%= !isPublicationType %>'>
  public void setExtension(DataExtension extension) {
    if (extension instanceof <%= className %>) {
      super.setExtension(extension);
      theExtension = (<%= className %>)extension;
    }
  }
</jalios:if>

<% 
  Map tabGroupMap  = new HashMap();
  Map nameCapMLMap = new HashMap();
%>  
<jalios:foreach collection="<%= declaredFieldList %>" name="itField" type="TypeFieldEntry">
<%
  String type    = itField.getType();
  String name    = itField.getName();
  String nameCap = itField.getNameCap();
  String editor  = itField.getEditor();
  boolean fieldML = itField.isFieldML();
  
  String tabGroup = itField.getTabGroup();
  if (Util.notEmpty(tabGroup)) {
    Util.updateListMap(tabGroupMap, Util.recapitalize(Util.buildID(tabGroup, "0-9a-zA-Z")), nameCap, false);
  }
  
  nameCapMLMap.put(nameCap , fieldML ? Boolean.TRUE : Boolean.FALSE);
  
  boolean isDateOnly = itField.isDateOnly();
  String root        = itField.getRoot();

  String typeShort = itField.getTypeShort();
  boolean isScalar = itField.isTypeScalar();
  boolean isArray  = itField.isTypeArray();
  String type_available = type;
  if (itField.isTypeCollection()) {
    type_available = itField.getTypeShort() + "[]";
  }
    
  String defaultValue = "";
  
  String defaultStr = Util.escapeJavaStringChar(itField.getDefaultValue());
  if (type.equals("String")) {
    if (Util.notEmpty(defaultStr)) {
      defaultValue = "\"" + defaultStr + "\"";
    } else {
      defaultValue = "channel.getTypeFieldEntry(" + className + ".class, \"" + name + "\", true).getDefaultTextString()";
    }
  }
  else if (itField.isTypeBoolean()) {
    if (Util.notEmpty(defaultStr)) {
      defaultValue = "on".equals(defaultStr) || "true".equals(defaultStr) ? "true" : "false";
    }
  }
  else if (itField.isTypePrimitive()) {
    defaultValue = Util.notEmpty(defaultStr) ? defaultStr : "0";
  }
  else if(Util.notEmpty(defaultStr)) {
    defaultValue = defaultStr;
  }

  boolean escapeHtml = true;
  if (editor.equals("wysiwyg") || editor.equals("sqlquery")) {
    escapeHtml = false;
  }
  else if (editor.equals("textfield") || editor.equals("textarea")) {
    escapeHtml = itField.escapeHtml();
  }
  
  boolean trim = !editor.equals("textarea");
  
  String dataSource = itField.getDataSource();
  int maxRows = itField.getMaxRows();
  

%>
   
<%-- ** FIELD DECLARATION ****************** --%>
<jalios:select>

  // ----------------------------------------------------------------------
  // <%= name %>
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry <%= name %>TFE = channel.getTypeFieldEntry(<%= className %>.class, "<%= name %>", true);
<%-- **   STRING ************* --%>
<jalios:if predicate='<%= type.equals("String") %>'>
  protected String <%= name %> = <%= defaultValue %>;
<jalios:if predicate='<%= fieldML %>'>
  protected HashMap<String,String> <%= name %>ML = <%= name %>TFE.getDefaultTextMap();
</jalios:if>
<jalios:if predicate='<%= editor.equals("sqlquery") %>'>
  protected String <%= name %>DataSource<%= Util.isEmpty(dataSource) ? "" : " = \"" + dataSource + "\""%>;
  protected int <%= name %>MaxRows = <%= maxRows %>;
  protected boolean is<%= nameCap %>MaxRowsValidated = true;
</jalios:if>
</jalios:if>

<%-- **   STRING[], List<String> ************* --%>
<jalios:if predicate='<%= type.equals("String[]") || type.equals("List<String>") %>'>
  protected String[] <%= name %> = new String[0];
  protected int <%= name %>AddCount = 0;
<jalios:if predicate='<%= fieldML %>'>
  HashMap<String,String[]> <%= name %>ML;
</jalios:if>
<jalios:if predicate='<%= editor.equals("sqlquery") %>'>
  protected String[] <%= name %>DataSource;
  protected int[] <%= name %>MaxRows;
  protected boolean is<%= nameCap %>MaxRowsValidated = true;
  </jalios:if>
</jalios:if>

<%-- **   LINK / LINK[] ************* --%>
<jalios:if predicate='<%= itField.isAnyLink() %>'>
<%-- **   LINK  ************* --%>
<% if (isScalar) { %>
  protected boolean is<%= nameCap %>Validated = true;
  protected <%= type %> <%= name %>;
<%   if (fieldML) { %>
  protected HashMap<String,<%= type %>> <%= name %>ML;
<%   } %>

<%-- **   LINK[] ************* --%>
<% } else { %>
  protected <%= type_available %> <%= name %> = new <%= typeShort %>[0];
<%   if (fieldML) { %>
  protected HashMap<String,<%= type_available %>> <%= name %>ML;
<%   } %>
  protected int <%= name %>AddCount = 0;
<% } %>
</jalios:if>

<%-- **   CATEGORY (for extension only) ************* --%>
<jalios:if predicate='<%= !isPublicationType && editor.equals("category") %>'>
  protected Category[] <%= name %>;
  protected int <%= name %>AddCount = 0;  
</jalios:if>

<%-- **   DATE ************* --%>
<jalios:if predicate='<%= editor.equals("date") %>'>
<% if (isScalar) { %>
  protected String __<%= name %>Str = "";
  protected boolean is<%= nameCap %>Validated = true;
  protected Date <%= name %>;

<%-- **   DATE[] ************* --%>
<% } else { %>
  protected String[] __<%= name %>StrArray = new String[0];
  protected boolean is<%= nameCap %>Validated = true;
  protected Date[] <%= name %> = new Date[0];
  protected int <%= name %>AddCount = 0;
<% } %>
</jalios:if>

<%-- **   BOOLEAN / INT / LONG / DOUBLE / DURATION ************* --%>
<jalios:if predicate='<%= editor.equals("boolean") || editor.equals("int") || editor.equals("long") || editor.equals("double") || editor.equals("duration") %>'>
<% if (isScalar) { %>
<%   if (!editor.equals("boolean")) { %>
  protected boolean is<%= nameCap %>Validated = true;
<%   } %>
  protected <%= type %> <%= name %> = <%= defaultValue %>;

<%-- **   BOOLEAN[] / INT[] / LONG[] / DOUBLE[] / DURATION[] ************* --%>
<% } else { %>
  protected boolean is<%= nameCap %>Validated = true;
  protected <%= typeShort %>[] <%= name %> = new <%= typeShort %>[0];
  protected int <%= name %>AddCount = 0;
<% } %>
</jalios:if>


<%-- **   OTHER ************* --%>
<jalios:default>
  protected <%= type_available %> <%= name %>;
<jalios:if predicate='<%= fieldML %>'>
  HashMap<String,<%= type_available %>> <%= name %>ML;
</jalios:if>
</jalios:default>
</jalios:select>

<%-- ********************************************************************** --%>
<%-- :NOTE:OD: Getter : No getter since Tomcat/Websphere are very sensitive --%>
<%-- with the signature consistency of getter/setter. See bug-jcms-2.0-92   --%>
<%-- ********************************************************************** --%>

<%-- ** SETTER **************** --%>

<jalios:select>

<%-- **   STRING[] & List<String> / MONO LINGUAL************* --%>
<jalios:if predicate='<%= !isScalar && typeShort.equals("String") && !fieldML %>'>
  public void set<%= nameCap %>(String[] v) {
    <%= name %> = getMonolingualValueArray(<%= name %>TFE, v);
  }
  
<jalios:if predicate='<%= editor.equals("sqlquery") %>'>
  public void set<%= nameCap %>DataSource(String[]  v)  {
    this.<%= name %>DataSource = v;
  }
  
  public void set<%= nameCap %>MaxRows(String[]  v)  {
    try {
      v = Util.trimStringArray(v);
      <%= name %>MaxRows = new int[v.length];
      for(int i = 0; i < v.length; i++) {
        <%= name %>MaxRows[i] = Integer.parseInt(v[i].trim());
      }
    } catch(NumberFormatException ex) {
      is<%= nameCap %>MaxRowsValidated = false;
    }
  }

  
</jalios:if>
</jalios:if>


<%-- **   STRING[] & List<String> / MULTILINGUAL************* --%>
<jalios:if predicate='<%=  fieldML  && (type.equals("String[]") || type.equals("List<String>"))%>'>
  public void set<%= nameCap %>(String[] v) {  
   <%= name %> = getMultilingualMainValueArray(<%= name %>TFE, v);
   <%= name %>ML = getMultilingualMLMapArray(<%= name %>TFE, v);    
  }
</jalios:if>


<%-- **   LINK ************* --%>
<jalios:if predicate='<%= itField.isAnyLink() %>'>
<% if (isScalar) { %>
<%   if (!fieldML) { %>
  String __<%= name %>Str = null;
  public void set<%= nameCap %>(String v) {
    __<%= name %>Str = v;
  }
<%   } else { %>
  String[] __<%= name %>Str = null;
  public void set<%= nameCap %>(String[] v) {
    __<%= name %>Str = v;
  }
<%   } // fieldML %>

<%-- **   LINK[] ************* --%>
<% } else { %>

  String[] __<%= name %>Str = null;
  public void set<%= nameCap %>(String[]  v) {
    __<%= name %>Str = v;
  }
<% } %>
</jalios:if>

<%-- **   CATEGORY (for extension only ) ************* --%>
<jalios:if predicate='<%= !isPublicationType && editor.equals("category") %>'>
  public void set<%= nameCap %>(String[]  v) {
    <%= name %> = new Category[v.length ];
    for(int i = 0; i < v.length  ; i++) {
      Category _itCat = channel.getCategory(v[i].trim());
      if (_itCat != null) {
        <%= name %>[i] = _itCat;
      }
    }
  }
</jalios:if>

<%-- **   DATE ************* --%>
<jalios:if predicate='<%= editor.equals("date") %>'>
<% if (isScalar) { %>
  public void set<%= nameCap %>(String v) {
    try {
        SimpleDateFormat dateFormatter = channel.getDate<%= isDateOnly ? "" : "Time" %>Format(userLang);
        dateFormatter =  (SimpleDateFormat) dateFormatter.clone();
        dateFormatter.setLenient(false);      
      __<%= name %>Str = v.trim();      
      <%= name %> = dateFormatter.parse(__<%= name %>Str);
    } catch(java.text.ParseException ex) {
      is<%= nameCap %>Validated = false;
    }
  }

<%-- **   DATE[] ************* --%>
<% } else { %>
  public void set<%= nameCap %>(String[] v) {
     SimpleDateFormat dateFormatter = channel.getDate<%= isDateOnly ? "" : "Time" %>Format(userLang);
     dateFormatter =  (SimpleDateFormat) dateFormatter.clone();
     dateFormatter.setLenient(false);
     v = Util.trimStringArray(v);
     __<%= name %>StrArray = v;
     <%= name %> = new Date[v.length];
     for(int i = 0; i < v.length; i++) {
       if (Util.isEmpty(v[i])) { continue; }
       try { 
       	<%= name %>[i] = dateFormatter.parse(v[i].trim());
       } catch(java.text.ParseException ex) {
     		is<%= nameCap %>Validated = false;
   	   }
     }
  }
<% } %>
</jalios:if>

<%-- **   INT ************* --%>
<jalios:if predicate='<%= editor.equals("int") %>'>
<% if (isScalar) { %>
  public void set<%= nameCap %>(String v) {
    try {
      <%= name %> = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      is<%= nameCap %>Validated = false;
    }
  }
<%-- **   INT[] ************* --%>
<% } else { %>
  public void set<%= nameCap %>(String[] v) {
    try {
      v = Util.trimStringArray(v);
      <%= name %> = new <%= typeShort %>[v.length];
      for(int i = 0; i < v.length; i++) {
        if (Util.isEmpty(v[i])) { continue; }
        <%= name %>[i] = Integer.parseInt(v[i].trim());
      }
    } catch(NumberFormatException ex) {
      is<%= nameCap %>Validated = false;
    }
  }
<% } %>
</jalios:if>


<%-- **   LONG ************* --%>
<jalios:if predicate='<%= editor.equals("long") || editor.equals("duration") %>'>
<% if (isScalar) { %>
  public void set<%= nameCap %>(String v) {
    try {
      <%= name %> = Long.parseLong(v.trim());
    } catch(NumberFormatException ex) {
      is<%= nameCap %>Validated = false;
    }
  }
<%-- **   LONG[] ************* --%>
<% } else { %>
  public void set<%= nameCap %>(String[] v) {
    try {
      v = Util.trimStringArray(v);
      <%= name %> = new <%= typeShort %>[v.length];
      for(int i = 0; i < v.length; i++) {
        if (Util.isEmpty(v[i])) { continue; }
        <%= name %>[i] = Long.parseLong(v[i].trim());
      }
    } catch(NumberFormatException ex) {
      is<%= nameCap %>Validated = false;
    }
  }
<% } %>  
</jalios:if>

<%-- **   DOUBLE ************* --%>
<jalios:if predicate='<%= editor.equals("double") %>'>
<% if (isScalar) { %>
  public void set<%= nameCap %>(String v) {
    Double dbl = Util.parseDouble(v);
    if (dbl != null) {
      <%= name %> = dbl;
    } else {
      is<%= nameCap %>Validated = false;
    }
  }

<%-- **   DOUBLE[] ************* --%>
<% } else { %>
  public void set<%= nameCap %>(String[] v) {
    v = Util.trimStringArray(v);
    <%= name %> = new <%= typeShort %>[v.length];
    for (int i = 0; i < v.length; i++) {
      if (Util.isEmpty(v[i])) { continue; }
      Double dbl = Util.parseDouble(v[i]);
      if (dbl != null) {
        <%= name %>[i] = dbl;
      } else {
        is<%= nameCap %>Validated = false;
      }
    }
  }
<% } %>
</jalios:if>

<%-- **   BOOLEAN ************* --%>
<jalios:if predicate='<%= editor.equals("boolean") %>'>
<% if (isScalar) { %>
  public void set<%= nameCap %>(boolean  v) {
    this.<%= name %> = v;
  }

<%-- **   BOOLEAN[] ************* --%>
<% } else { %>
  public void set<%= nameCap %>(String[] v) {
    try {
      v = Util.trimStringArray(v);
      <%= name %> = new <%= typeShort %>[v.length];
      for(int i = 0; i < v.length; i++) {
        if (Util.isEmpty(v[i])) { continue; }
        <%= name %>[i] = v[i].trim().equals("true");
      }
    } catch(NumberFormatException ex) {
      is<%= nameCap %>Validated = false;
    }
  }
<% } %>  
</jalios:if>

<%-- **   STRING ************* --%>
<jalios:if predicate='<%= type.equals("String") %>'>
  public void set<%= nameCap %>(String[] v) {
<% if (fieldML) { %>
    <%= name %> = getMultilingualMainValue(<%= name %>TFE, v);
    <%= name %>ML = getMultilingualMLMap(<%= name %>TFE, v);
<% } else { %>
    <%= name %> = getMonolingualValue(<%= name %>TFE, v);
<% } %>
  }
<jalios:if predicate='<%= editor.equals("sqlquery") %>'>
  public void set<%= nameCap %>DataSource(String  v)  {
    if (Util.isEmpty(v)) {
      return;
    }
    this.<%= name %>DataSource = v;
  }
  
  public void set<%= nameCap %>MaxRows(String  v)  {
    try {
      <%= name %>MaxRows = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      is<%= nameCap %>MaxRowsValidated = false;
    }
  }
  
</jalios:if>
</jalios:if>

<%-- **   OTHER ************* --%>
<jalios:default>
<% System.out.println("** WARNING ** Edit_Type_Handler: cannot generate setter for field '" + name + "' (type '" + type + "', editor '" + editor + "')"); %> 
</jalios:default>
</jalios:select>


<%-- ** getAvailable() METHOD ************** --%>

  public <%= type_available %> getAvailable<%= nameCap %>() {
    if (<%= theData %> != null && isFieldMissing("<%= name %>")) {
<%-- **   TYPE[] ************* --%>
<% if (itField.isTypeSet()) { %>
	  Set<<%= typeShort %>> objectValue = <%= theData %>.get<%= nameCap %>();
<% }else if (itField.isTypeList()) { %>
	  List<<%= typeShort %>> objectValue = <%= theData %>.get<%= nameCap %>();
<% }else if (itField.isTypeArray()) { %>
	  <%= typeShort %>[] objectValue = <%= theData %>.get<%= nameCap %>();
<% } else { %>
     <%= type_available %> objectValue = <%= theData %>.get<%= nameCap %>();
<% } %>
<jalios:if predicate='<%= type_available.endsWith("[]") %>'>
      if (objectValue == null) {
        return <%= name %>;
      }
</jalios:if>
<% if (itField.isTypeCollection()) { %>
      return objectValue.toArray(new <%= typeShort %>[objectValue.size()]);
<% } else { %>
      return objectValue;
<% } %>
    }
    return <%= name %>;
  }
<%-- ** getAvailableXXXDataSource ************** --%>
<jalios:if predicate='<%= editor.equals("sqlquery") %>'>
  public String<%= isArray ? "[]" : "" %> getAvailable<%= nameCap %>DataSource() {
    if (<%= theData %> != null && isFieldMissing("<%= name %>DataSource")) {
      String<%= isArray ? "[]" : "" %> objectValue = <%= theData %>.get<%= nameCap %>DataSource();
<jalios:if predicate='<%= isArray %>'>
      if ( objectValue == null) {
        return <%= name %>DataSource;
      }
</jalios:if>
      return objectValue;
    }
    return <%= name %>DataSource;
  }
  
  public int<%= isArray ? "[]" : "" %> getAvailable<%= nameCap %>MaxRows() {
    if (<%= theData %> != null && isFieldMissing("<%= name %>MaxRows")) {
      int<%= isArray ? "[]" : "" %> objectValue = <%= theData %>.get<%= nameCap %>MaxRows();
<jalios:if predicate='<%= isArray %>'>
      if ( objectValue == null) {
        return <%= name %>MaxRows;
      }
</jalios:if>
      return objectValue;
    }
    return <%= name %>MaxRows;
  }
</jalios:if>  
    
<%-- ** getAvailable(lang) ************** --%>
<jalios:if predicate='<%= fieldML %>'>
  public HashMap<String,<%= type_available %>> getAllAvailable<%= nameCap %>ML() {
    HashMap<String,<%= type_available %>> map = Util.getHashMap(getAvailable<%= nameCap %>ML());
    map.put(channel.getLanguage(),getAvailable<%= nameCap %>(channel.getLanguage()));
    return map;
  }
  
  public HashMap<String,<%= type_available %>> getAvailable<%= nameCap %>ML() {
    if (<%= theData %> != null && isFieldMissing("<%= name %>")) {
<% if (itField.isTypeCollection()) { %>
      return mapStringListToMapStringArray(<%= theData %>.get<%= nameCap %>ML());
<% } else { %>
      return <%= theData %>.get<%= nameCap %>ML();
<% } %>
    }
    return <%= name %>ML;
  }

<% if (type.equals("String")) { %>

  public String getAvailable<%= nameCap %>(String lang) {
    if (<%= theData %> != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(<%= name %>, <%= defaultValue %>)) {
          return <%= name %>;
      	}
      } else {
      	if (<%= name %>ML != null && Util.notEmpty(<%= name %>ML.get(lang))) {
      	  return <%= name %>ML.get(lang);
      	}
      }
      return Util.getString(<%= theData %>.get<%= nameCap %>(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return <%= name %>;
    }
    return <%= name %>ML == null ? "" : Util.getString(<%= name %>ML.get(lang), "");
  }
<% } else if (type.equals("String[]") || type.equals("List<String>")) { %>

  public <%= type_available %> getAvailable<%= nameCap %>(String lang) {
    if (<%= theData %> != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (Util.notEmpty(<%= name %>)) {
          return <%= name %>;
      	}
      } else {
      	if (<%= name %>ML != null && Util.notEmpty(<%= name %>ML.get(lang))) {
      	  return <%= name %>ML.get(lang);
      	}
      }
<% if (type.equals("List<String>")) { %>
      List<String> strList = <%= theData %>.get<%= nameCap %>(lang, false);
      return (strList != null) ? strList.toArray(new String[strList.size()]) : new String[0];
<% } else { %>
      return <%= theData %>.get<%= nameCap %>(lang, false);
<% } %>
    }
    if (lang.equals(channel.getLanguage())) {
      return <%= name %>;
    }
    return <%= name %>ML == null ? null : <%= name %>ML.get(lang);
  }
<% } else if (type.equals("com.jalios.jcms.FileDocument")) { %>

  public <%= type %> getAvailable<%= nameCap %>(String lang) {
    return (<%= type %>)getAvailableData(<%= theData %>, <%= theData %> == null ? null : <%= theData %>.get<%= nameCap %>(), <%= name %>, <%= name %>ML, lang);
  }
<% } else if (type.equals("com.jalios.jcms.FileDocument[]")) { %>

  public <%= type %> getAvailable<%= nameCap %>(String lang) {
    return (<%= type %>)getAvailableDataArray(<%= theData %>, <%= theData %> == null ? null : <%= theData %>.get<%= nameCap %>(), <%= name %>, <%= name %>ML, lang);
  }
<% } %>
</jalios:if>
  
<%-- REMOVE ME --%>
<jalios:if predicate='<%= isArray %>'>
<%-- ** setXXXAddCount METHOD ************** --%>
  public void set<%= nameCap %>AddCount(int  v) {
    <%= name %>AddCount = v;
  }
  
<%-- ** getXXXCount METHOD ************* --%>
  public int get<%= nameCap %>Count() {
    int arraySize = Util.getSize(getAvailable<%= nameCap %>());
<jalios:if predicate='<%= type.equals("String[]") && fieldML %>'>
    if (channel.isMultilingual()) {
      for (String lang : channel.getOtherLanguageList()) {
        String[] array = getAvailable<%= nameCap %>(lang);
        if (array != null && array.length > arraySize) {
          arraySize = array.length;
        }
      }
    }
</jalios:if>
    int res = 3 + arraySize + <%= name %>AddCount;
    return res;
  }
</jalios:if>

</jalios:foreach>

<%-- ** Tab Group Count ******************* --%>
<% if(!tabGroupMap.isEmpty()) { %>
  public int getTabGroupMaxCount(String tabGroupName) {
    String tabGroup = Util.buildID(tabGroupName, "0-9a-zA-Z");
    <jalios:foreach collection="<%= tabGroupMap.entrySet() %>" name="itEntry" type="Map.Entry">
      <% String tabGroup = (String) itEntry.getKey(); %>
      if("<%= tabGroup.toLowerCase() %>".equalsIgnoreCase(tabGroup)) {
        return getAvailable<%= tabGroup %>Count();
      }
    </jalios:foreach>
    return super.getTabGroupMaxCount(tabGroupName);    
  }

  <jalios:foreach collection="<%= tabGroupMap.entrySet() %>" name="itEntry" type="Map.Entry">
  <%
  String tabGroup = (String) itEntry.getKey();
  List nameCapList = (List) itEntry.getValue();
  %>
  public int getAvailable<%= tabGroup %>Count() {
    int max = 0;
  <% for (Iterator it = nameCapList.iterator() ; it.hasNext() ; ) { %>
    <% String nameCap = (String) it.next(); %>
    <% if (Util.toBoolean(nameCapMLMap.get(nameCap),false)) { %>
      for (String lang : channel.getLanguageList()) {
        int count = Util.getSize(getAvailable<%= nameCap %>(lang));
        max = count > max ? count : max;
      }
    <% } else { %>
      {
        int count = Util.getSize(getAvailable<%= nameCap %>());
        max = count > max ? count : max;
      }
    <% } %>
  <% } // end for %>
    return max;
  }
  </jalios:foreach>
<% } %>

<%-- ** CATEGORY GETTERS (for DataExtention only)  ************* --%>
<jalios:if predicate='<%= !isPublicationType %>'>
<%
for(Iterator it = fieldList.iterator(); it.hasNext();) {
  TypeFieldEntry itField = (TypeFieldEntry)it.next();
  String editor = itField.getEditor();
  if (!editor.equals("category")) {
    continue;
  }
  String name    = itField.getName();
  String nameCap = itField.getNameCap();
  String root    = itField.getRoot();
%>
  public Category get<%= nameCap %>Root() {
    return channel.getCategory("<%= root %>");
  }  
<% } %><%-- for(fieldList) --%>
</jalios:if><%-- !isPublicationType --%>


<jalios:if predicate='<%= isPublicationType %>'>

<%-- ** CATEGORY SETTERS (for Tree + radio)  ************* --%>
<jalios:foreach collection="<%= categoryFieldList %>" name="itField" type="TypeFieldEntry">
<%
  String name            = itField.getName();
  String nameCap         = itField.getNameCap();
  boolean isExclusive    = itField.isExclusive();
  String root            = itField.getRoot();
  String chooser         = itField.getChooser();
  boolean isTreeChooser  = chooser.equals("tree");
%>
  <%-- Do not use setCids(String[]) for tree radio. Specific setter to prevent conflict when there is multiple tree radio --%>
  public void set<%= nameCap %>(String[] v) {
    updateCids(v);
  }

  public Category get<%= nameCap %>Root() {
    return channel.getCategory("<%= root %>");
  }  
    
  public Set<Category> get<%= nameCap %>CatSet() {
    Category rootCat = get<%= nameCap %>Root();
    if (rootCat == null) {
      return Util.emptyTreeSet();
    }
    Set<Category> set = new HashSet<>(rootCat.getDescendantSet());
    set.add(rootCat);
    return Util.interSet(getCategorySet(null), set);
  }
  
</jalios:foreach>

<%-- ** FORM: isOneSubmit METHOD  ************* --%>
<jalios:if predicate='<%= formOneSubmit %>'>    
   
  public boolean isOneSubmit() {
    return true;
  }
</jalios:if>
 
<%-- ** FORM: isNotifySubmit METHOD  ************* --%>
<jalios:if predicate='<%= formNotify %>'>    
   
  public boolean isNotifySubmit() {
    return true;
  }
</jalios:if>
   
</jalios:if> <%-- isPublicationType --%>
}
<% out.flush(); %>
