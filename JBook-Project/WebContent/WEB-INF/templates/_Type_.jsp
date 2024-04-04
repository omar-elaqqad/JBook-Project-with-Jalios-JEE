<%@ page contentType="text/plain; charset=UTF-8"%>
<%@ page buffer="none" autoFlush="true"%>
<%@ taglib uri="jcms.tld" prefix="jalios" %>
<%@ page import="com.jalios.util.*, java.io.*, java.util.*, java.text.*, java.net.*, org.jdom.*, com.jalios.jcms.*" %>
<%
  request.setCharacterEncoding("UTF-8");
  
final Channel channel = Channel.getChannel();

Element typeElt = (Element)session.getAttribute("typeElt");

final String className;
final String superclass;
final boolean isAbstract;
final boolean isPublicationType;
final boolean isAudienced;
final boolean isSubType;
final boolean isDBType;
final boolean isHistorizedDBData;
final boolean openRoleDBData;
boolean isCategorizedDBData;

Element parentElt = null;
if (typeElt == null) { // Data Extension
  typeElt = (Element)session.getAttribute("extensionElt");
  String extendedType = typeElt.getAttributeValue("type");
  className = Util.getClassShortName(extendedType) + "Extension";
  superclass = Util.getString(typeElt.getAttributeValue("superclass"), session.getAttribute("extensionElt") == null ? com.jalios.jcms.Content.class.getName() : DataExtension.class.getName());
  isAbstract = false;
  isPublicationType = false;
  isAudienced = false;
  isSubType = false;
  isDBType = false;
  isHistorizedDBData = false;
  isCategorizedDBData = false;
  openRoleDBData = false;
} else { // Publication
  className = typeElt.getAttributeValue("name");
  superclass = Util.getString(typeElt.getAttributeValue("superclass"), com.jalios.jcms.Content.class.getName());
  isAbstract = Util.toBoolean(typeElt.getAttributeValue("abstract"),false);
  isPublicationType = true;
  isAudienced = Util.toBoolean(typeElt.getAttributeValue("audienced"),false);
  isSubType = !(com.jalios.jcms.Content.class.getName().equals(superclass) || 
                com.jalios.jcms.Form.class.getName().equals(superclass) ||
                com.jalios.jcms.portlet.Portlet.class.getName().equals(superclass));
  isDBType = Util.toBoolean(typeElt.getAttributeValue("database"),false);
  isHistorizedDBData = isDBType && Util.toBoolean(typeElt.getAttributeValue("revision"),false);
  isCategorizedDBData = isDBType && TypeUtil.isSubTypeOf(typeElt, com.jalios.jcms.Content.class);
  openRoleDBData = Util.toBoolean(typeElt.getAttributeValue("openRole"), false);
  parentElt = typeElt.getParentElement();
}

List<TypeFieldEntry> fieldEntryList = Arrays.asList(channel.getTypeFieldEntries(TypeProcessor.PACKAGE_NAME + "." + className));
List<TypeFieldEntry> allFieldEntryList = Arrays.asList(channel.getAllTypeFieldEntries(TypeProcessor.PACKAGE_NAME + "." + className));

String[] customInterfaces = Util.split(Util.getString(typeElt.getAttributeValue("interfaces"), ""), ", ");

// Find out searchable fields
Set<String> searchableFieldSet = new TreeSet<>();
Set<String> searchableFieldMLSet = new TreeSet<>();
Set<String> searchableArrayFieldSet = new TreeSet<>();
Set<String> searchableArrayFieldMLSet = new TreeSet<>();
Set<String> searchableListFieldSet = new TreeSet<>();
Set<String> searchableListFieldMLSet = new TreeSet<>();
if (isPublicationType) {
  Element titleElt = typeElt.getChild("title");
  Attribute titleSearchable = titleElt.getAttribute("searchable");
  Attribute titleML = titleElt.getAttribute("ml");
  if (titleSearchable == null || titleSearchable.getBooleanValue()) {
    if (titleML != null && titleML.getBooleanValue()) {
      searchableFieldMLSet.add("title");
    } else {
      searchableFieldSet.add("title");
    }
  } 
}

Set<String> wikiFieldSet = new TreeSet<>();
Set<String> wikiFieldMLSet = new TreeSet<>();
Set<String> wikiArrayFieldSet = new TreeSet<>();
Set<String> wikiArrayFieldMLSet = new TreeSet<>();
Set<String> wikiListFieldSet = new TreeSet<>();
Set<String> wikiListFieldMLSet = new TreeSet<>();

Set<String> wysiwygFieldSet = new TreeSet<>();
Set<String> wysiwygFieldMLSet = new TreeSet<>();
Set<String> wysiwygArrayFieldSet = new TreeSet<>();
Set<String> wysiwygArrayFieldMLSet = new TreeSet<>();
Set<String> wysiwygListFieldSet = new TreeSet<>();
Set<String> wysiwygListFieldMLSet = new TreeSet<>();

Set<String> urlFieldSet = new TreeSet<>();
Set<String> urlFieldMLSet = new TreeSet<>();
Set<String> urlArrayFieldSet = new TreeSet<>();
Set<String> urlArrayFieldMLSet = new TreeSet<>();


Set requiredFieldNameSet = new TreeSet();
List declaredFieldEntryList = new ArrayList();
List categoryFieldEntryList = new ArrayList();
List sqlresultFieldEntryList = new ArrayList();
List<TypeFieldEntry> hybridCollectionList = new ArrayList();
for(Iterator it = fieldEntryList.iterator(); it.hasNext();) {
  TypeFieldEntry fieldEntry = (TypeFieldEntry)it.next();
  if (fieldEntry.isSuper()) {
    continue;
  }
  
  String name = fieldEntry.getName();
  String editor = fieldEntry.getEditor();
  String type = fieldEntry.getType();
  
  if (fieldEntry.isRequired()) {
    requiredFieldNameSet.add(name);
  }
  if (isPublicationType && "category".equals(editor)) {
    categoryFieldEntryList.add(fieldEntry);
  }
  else if ("sqlresult".equals(editor)) {
    sqlresultFieldEntryList.add(fieldEntry);
  }
  else {
    declaredFieldEntryList.add(fieldEntry);
    
    if (fieldEntry.isSearchable()) {
      if (type.equals("String")) {
        if (fieldEntry.isFieldML()) searchableFieldMLSet.add(name);
        else searchableFieldSet.add(name);
      } else if (type.equals("String[]")) {
        if (fieldEntry.isFieldML()) searchableArrayFieldMLSet.add(name);
        else searchableArrayFieldSet.add(name);
      } else if (type.equals("List<String>")) {
        if (fieldEntry.isFieldML()) searchableListFieldMLSet.add(name);
        else searchableListFieldSet.add(name);
      }
    }
    if (fieldEntry.isFieldWiki()) {
      if (type.equals("String")) {
        if (fieldEntry.isFieldML()) wikiFieldMLSet.add(name);
        else wikiFieldSet.add(name); 
      } else if (type.equals("String[]")) {
        if (fieldEntry.isFieldML()) wikiArrayFieldMLSet.add(name);
        else wikiArrayFieldSet.add(name); 
      } else if (type.equals("List<String>")) {
        if (fieldEntry.isFieldML()) wikiListFieldMLSet.add(name);
        else wikiListFieldSet.add(name); 
      }
    }
    if (fieldEntry.isWysiwyg()) {
      if (type.equals("String")) {
        if (fieldEntry.isFieldML()) wysiwygFieldMLSet.add(name);
        else wysiwygFieldSet.add(name); 
      } else if (type.equals("String[]")) {
        if (fieldEntry.isFieldML()) wysiwygArrayFieldMLSet.add(name);
        else wysiwygArrayFieldSet.add(name); 
      } else if (type.equals("List<String>")) {
        if (fieldEntry.isFieldML()) wysiwygListFieldMLSet.add(name);
        else wysiwygListFieldSet.add(name); 
      }
    }
    if (fieldEntry.isUrl()) {
      if (type.equals("String")) {
        if (fieldEntry.isFieldML()) urlFieldMLSet.add(name);
        else urlFieldSet.add(name); 
      } else if (type.equals("String[]")) {
        if (fieldEntry.isFieldML()) urlArrayFieldMLSet.add(name);
        else urlArrayFieldSet.add(name); 
      }
    }
  }
  
  if (!isDBType) {
    boolean isLink = editor.startsWith("member") || (editor.startsWith("link") && TypeUtil.isDBType(parentElt, fieldEntry.getTypeShort()));
    if (fieldEntry.isTypeArray() && isLink) {
      hybridCollectionList.add(fieldEntry);
    }
  }
  
}

boolean hasUrlField = Util.notEmpty(urlFieldSet) || 
                      Util.notEmpty(urlFieldMLSet) ||
                      Util.notEmpty(urlArrayFieldSet) ||
                      Util.notEmpty(urlArrayFieldMLSet);

// LinkSet (used to generate getLinkDataSet())
TreeSet linkSet = new TreeSet();
for(Iterator it = allFieldEntryList.iterator(); it.hasNext();) {
  TypeFieldEntry fieldEntry = (TypeFieldEntry) it.next();
  if (fieldEntry.isSuper()) {
    continue;
  }

  String editor   = fieldEntry.getEditor();
  boolean fiedlML = fieldEntry.isFieldML();
  if (editor.equals("link")   || editor.equals("member")   || editor.equals("group") || 
      editor.equals("link[]") || editor.equals("member[]") || editor.equals("group[]")) {
    linkSet.add("get" + fieldEntry.getNameCap() + "()");
    if (fiedlML) {
      linkSet.add("get" + fieldEntry.getNameCap() + "ML" + "()");
    }
  }
  
  if (isDBType && editor.equals("category")) {
    isCategorizedDBData = true;
  }
}

// TreeNode
Element treeParentField = XmlUtil.searchChild(typeElt.getChild(TypeConstants.FIELDS_ELT), TypeConstants.FIELD_ELT, "parent", "true");
String treeParentTypeName = treeParentField == null ? null : treeParentField.getAttributeValue("type");
String treeParentFieldName = treeParentField != null ? treeParentField.getAttributeValue("name") : null;

Element treeChildType = TypeUtil.getTreeChildType(typeElt);
String treeChildTypeName = null;
String treeChildFieldName = "parent"; // arbitrary default value
if (treeChildType != null) {
  treeChildTypeName = treeChildType.getAttributeValue("name");
  Element treeChildField = XmlUtil.searchChild(treeChildType.getChild(TypeConstants.FIELDS_ELT), TypeConstants.FIELD_ELT, "parent", "true");
  if (treeChildField != null) {
    treeChildFieldName = treeChildField.getAttributeValue("name");
  }
} 
else if ((treeParentTypeName != null) && !treeParentTypeName.startsWith("generated")) { 
  treeChildTypeName = treeParentTypeName;
}



boolean isTreeNode = treeChildTypeName != null || treeParentField != null;

boolean hasDBDataCollection = false;
if (isDBType) {
  for(TypeFieldEntry entry: fieldEntryList) {
    if (entry.isTypeCollection()) {
      hasDBDataCollection = true;
      break;
    }
  }
}
%>
// This file has been automatically generated.
   
package <%= TypeProcessor.PACKAGE_NAME %>;
 
import java.util.*;
 
import org.apache.oro.text.regex.Pattern;
import org.apache.oro.text.regex.Perl5Compiler;
import org.apache.oro.text.regex.Perl5Matcher;
import org.hibernate.Hibernate;
 
import com.jalios.jcms.*;
import com.jalios.jcms.db.*;
import com.jalios.jcms.mashup.*;
import com.jalios.jcms.wysiwyg.*;
import com.jalios.util.*;
import com.fasterxml.jackson.annotation.JsonIgnore; 
import com.fasterxml.jackson.annotation.JsonProperty;
 
@SuppressWarnings({"unchecked", "unused"})
public <%= isAbstract ? "abstract" : "" %> class <%= className %> extends <%= superclass %> 
<% if (isPublicationType || isTreeNode || Util.notEmpty(customInterfaces) || isAudienced) { %>
             implements 
<% boolean addComma = false; %>
<jalios:foreach array='<%= customInterfaces %>' type='String' name='itInterface'>
               <%= addComma ? "," : "" %> <%= itInterface %>
<% addComma = true; %>
</jalios:foreach>
<jalios:if predicate='<%= isPublicationType %>'>
               <%= addComma ? "," : "" %> com.jalios.jstore.Searchable
<% addComma = true; %>
</jalios:if>
<jalios:if predicate='<%= isTreeNode %>'>
               <%= addComma ? "," : "" %> TreeNode
<% addComma = true; %>
</jalios:if>
<jalios:if predicate='<%= isAudienced %>'>
               <%= addComma ? "," : "" %> AudiencedPublication
<% addComma = true; %>
</jalios:if>
<jalios:if predicate='<%= isDBType %>'>
               <%= addComma ? "," : "" %> DBData
<% addComma = true; %>
</jalios:if>
<jalios:if predicate='<%= isHistorizedDBData %>'>
               <%= addComma ? "," : "" %> HistorizedDBData
<% addComma = true; %>
</jalios:if>
<jalios:if predicate='<%= isCategorizedDBData %>'>
               <%= addComma ? "," : "" %> CategorizedDBData
<% addComma = true; %>
</jalios:if>
<jalios:if predicate='<%= openRoleDBData %>'>
               <%= addComma ? "," : "" %> OpenRoleDBData
<% addComma = true; %>
</jalios:if>

<%  } %>
{
  
<%-- ** CONSTRUCTORS ******************************** --%>
  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------  
  public <%= className %>() {}
 
<% if (TypeUtil.isSubTypeOf(typeElt, com.jalios.jcms.FileDocument.class)) { %>
  public <%= className %>(FileDocument other) {
    super(other);
  }
<% } %>
 
<% if (TypeUtil.isSubTypeOf(typeElt, com.jalios.jcms.DBFileDocument.class)) { %>
  public <%= className %>(DBFileDocument other) {
    super(other);
  }
<% } %>
<%
List superEltList = TypeUtil.getSuperEltList(typeElt);
Collections.reverse(superEltList);
%>
<jalios:foreach collection="<%= superEltList %>" type="Element" name="itSuperElt">
  public <%= className %>(<%= itSuperElt.getAttributeValue("name") %> other) {
    super(other);
  }
</jalios:foreach>
 
  
  
  
  public <%= className %>(<%= className %> other) {
    super(other);
<jalios:foreach collection="<%= declaredFieldEntryList %>" name="itFieldEntry" type="TypeFieldEntry">
<% String name = itFieldEntry.getName(); %>
    <%= name %> = other.<%= name %>;
<jalios:if predicate='<%= itFieldEntry.isFieldML() %>'>
    <%= name %>ML = other.<%= name %>ML;
</jalios:if>
<jalios:if predicate='<%= !isDBType %>'>
<% String editor = itFieldEntry.getEditor(); %>
<% String typeShort = itFieldEntry.getTypeShort(); %>
<jalios:if predicate='<%= editor.startsWith("member") || (editor.startsWith("link") && TypeUtil.isDBType(parentElt, typeShort))%>'>
    <%= name %>DBID = other.<%= name %>DBID;
</jalios:if>
</jalios:if>
</jalios:foreach>
  }
  
<%-- ** IMPORT /  EXPORT ******************************** --%>
  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);
    
<jalios:foreach collection="<%= declaredFieldEntryList %>" name="itFieldEntry" type="TypeFieldEntry">
<% 
String name    = itFieldEntry.getName(); 
String nameCap = itFieldEntry.getNameCap();
String typeShort = itFieldEntry.getTypeShort();
boolean isTypeMV = itFieldEntry.isTypeMV();

String mvType  = "Array";
if (itFieldEntry.isTypeList()) {
  mvType = "List";
} 
else if (itFieldEntry.isTypeSet()) {
  mvType = "Set";
}
%>
<% if (itFieldEntry.isTypeString() && !itFieldEntry.isWysiwyg() && !itFieldEntry.isFieldWiki())  { %>
    set<%= nameCap %>(ImportUtil.parseFieldText(elt, "<%= name %>"));
<%   if (itFieldEntry.isFieldML()) { %>
    set<%= nameCap %>ML(ImportUtil.parseFieldTextML(elt, "<%= name %>ML"));
<%   }%>
<% } else if (isTypeMV && "String".equals(typeShort) && !itFieldEntry.isWysiwyg() && !itFieldEntry.isFieldWiki()) { %>
    set<%= nameCap %>(ImportUtil.parseFieldText<%= mvType %>(elt, "<%= name %>"));
<%   if (itFieldEntry.isFieldML()) { %>
<%     if (itFieldEntry.isTypeList()) { %>
    set<%= nameCap %>ML(ImportUtil.parseFieldTextListML(elt, "<%= name %>ML"));
<%     } else { %>
    set<%= nameCap %>ML(ImportUtil.parseFieldTextArrayML(elt, "<%= name %>ML"));
<%     } %>
<%   } %>
<% } else if (itFieldEntry.isTypeDate()) { %>
    set<%= nameCap %>(ImportUtil.parseFieldDate(elt, "<%= name %>"));
<% } else if (isTypeMV && "java.util.Date".equals(typeShort)) { %>
    set<%= nameCap %>(ImportUtil.parseFieldDate<%= mvType %>(elt, "<%= name %>"));
<% } else if (itFieldEntry.isTypeLong()) { %>
    set<%= nameCap %>(ImportUtil.parseFieldLong(elt, "<%= name %>"));
<% } else if (isTypeMV &&  (itFieldEntry.isTypeLongArray() || "Long".equals(typeShort))) { %>
    set<%= nameCap %>(ImportUtil.parseFieldLong<%= mvType %>(elt, "<%= name %>"));
<% } else if (itFieldEntry.isTypeInt()) { %>
    set<%= nameCap %>(ImportUtil.parseFieldInt(elt, "<%= name %>"));
<% } else if (isTypeMV &&  (itFieldEntry.isTypeIntArray() || "Integer".equals(typeShort))) { %>
    set<%= nameCap %>(ImportUtil.parseFieldInt<%= mvType %>(elt, "<%= name %>"));
<% } else if (itFieldEntry.isTypeDouble()) { %>
    set<%= nameCap %>(ImportUtil.parseFieldDouble(elt, "<%= name %>"));
<% } else if (isTypeMV && (itFieldEntry.isTypeDoubleArray() || "Double".equals(typeShort))) { %>
    set<%= nameCap %>(ImportUtil.parseFieldDouble<%= mvType %>(elt, "<%= name %>"));
<% } else if (itFieldEntry.isTypeBoolean()) { %>
    set<%= nameCap %>(ImportUtil.parseFieldBoolean(elt, "<%= name %>"));
<% } else if (isTypeMV && (itFieldEntry.isTypeBooleanArray() || "Boolean".equals(typeShort))) { %>
    set<%= nameCap %>(ImportUtil.parseFieldBoolean<%= mvType %>(elt, "<%= name %>"));
<% } %>
</jalios:foreach>
  }
  
  protected void importXmlFieldsWithReferences(org.jdom.Element elt, ImportOptions options) {
    super.importXmlFieldsWithReferences(elt, options);
      
    if (options.isSelfImport()) {
<jalios:foreach collection="<%= declaredFieldEntryList %>" name="itFieldEntry" type="TypeFieldEntry">
<% 
String name    = itFieldEntry.getName(); 
String nameCap = itFieldEntry.getNameCap();
String type    = itFieldEntry.getType();

boolean isFieldML      = itFieldEntry.isFieldML();
boolean isMV           = itFieldEntry.isTypeMV();
boolean isWiki         = itFieldEntry.isFieldWiki();
boolean isWysiwyg      = itFieldEntry.isWysiwyg();

String mvType  = "Array";
if (itFieldEntry.isTypeList()) {
  mvType = "List";
} 
else if (itFieldEntry.isTypeSet()) {
  mvType = "Set";
}
%>
<% if (isWiki || isWysiwyg) { %>
<%   if (isMV) { %>
      set<%= nameCap %>(ImportUtil.parseFieldText<%= mvType %>(elt, "<%= name %>"));
<%     if (isFieldML) { %>
<%       if (itFieldEntry.isTypeList()) { %>
      set<%= nameCap %>ML(ImportUtil.parseFieldTextListML(elt, "<%= name %>ML"));
<%       } else { %>
      set<%= nameCap %>ML(ImportUtil.parseFieldTextArrayML(elt, "<%= name %>ML"));
<%       } %>
<%     } %>
<%   } else { %>
      set<%= nameCap %>(ImportUtil.parseFieldText(elt, "<%= name %>"));
<%     if (isFieldML) { %>
      set<%= nameCap %>ML(ImportUtil.parseFieldTextML(elt, "<%= name %>ML"));
<%     } %>
<%   } %>
<% } else if ((itFieldEntry.isTypePublication() || itFieldEntry.isTypePublicationMV() || 
              itFieldEntry.getType().contains("com.jalios.jcms.") || itFieldEntry.getType().contains("generated."))&&
              !itFieldEntry.getType().equals("com.jalios.jcms.Category[]")) { %>
<%   if (isMV) { %>
      set<%= nameCap %>(ImportUtil.parseSelfFieldData<%= mvType %>(elt, "<%= name %>", <%= itFieldEntry.getTypeShort() %>.class));
<%     if (isFieldML) { %>
      set<%= nameCap %>ML(ImportUtil.parseSelfFieldData<%= mvType %>ML(elt, "<%= name %>ML", <%= itFieldEntry.getTypeShort() %>.class));
<%     } %>
<%   } else { %>
      set<%= nameCap %>(ImportUtil.parseSelfFieldData(elt, "<%= name %>", <%= itFieldEntry.getTypeShort() %>.class));
<%     if (isFieldML) { %>
      set<%= nameCap %>ML(ImportUtil.parseSelfFieldDataML(elt, "<%= name %>ML", <%= itFieldEntry.getTypeShort() %>.class));
<%     } %>
<%   } %>
<% } %>
</jalios:foreach>

    } else {
    
<jalios:foreach collection="<%= declaredFieldEntryList %>" name="itFieldEntry" type="TypeFieldEntry">
<% 
String name    = itFieldEntry.getName(); 
String nameCap = itFieldEntry.getNameCap();
String type    = itFieldEntry.getType();

boolean isFieldML      = itFieldEntry.isFieldML();
boolean isMV           = itFieldEntry.isTypeMV();
boolean isWiki         = itFieldEntry.isFieldWiki();
boolean isWysiwyg      = itFieldEntry.isWysiwyg();

String mvType  = "Array";
if (itFieldEntry.isTypeList()) {
  mvType = "List";
} 
else if (itFieldEntry.isTypeSet()) {
  mvType = "Set";
}
%>
<% if (isWiki) { %>
<%   if (isMV) { %>
<%     if (isFieldML) { %>
    set<%= nameCap %>ML(ImportUtil.parseFieldWikiArrayML(elt, "<%= name %>ML"));
<%     } %>
    set<%= nameCap %>(ImportUtil.parseFieldWiki<%= mvType %>(elt, "<%= name %>"));
<%   } else { %>
<%       if (isFieldML) { %>
    set<%= nameCap %>ML(ImportUtil.parseFieldWikiML(elt, "<%= name %>ML"));
<%     } %>
    set<%= nameCap %>(ImportUtil.parseFieldWiki(elt, "<%= name %>"));
<%   } %>

<% } else if (isWysiwyg) { %>
<%   if (isMV) { %>
<%     if (isFieldML) { %>
<%       if (isDBType) { %>
    set<%= nameCap %>ML(ImportUtil.parseFieldWysiwygListML(elt, "<%= name %>ML"));
<%       } else { %>
    set<%= nameCap %>ML(ImportUtil.parseFieldWysiwygArrayML(elt, "<%= name %>ML"));
<%       } %>
<%     } %>
    set<%= nameCap %>(ImportUtil.parseFieldWysiwyg<%= mvType %>(elt, "<%= name %>"));
<%   } else {%>
<%     if (isFieldML) { %>
    set<%= nameCap %>ML(ImportUtil.parseFieldWysiwygML(elt, "<%= name %>ML"));
<%     } %>
    set<%= nameCap %>(ImportUtil.parseFieldWysiwyg(elt, "<%= name %>"));
<%   } %>

<% } else if (itFieldEntry.isTypePublicationMV()) { %>
    set<%= nameCap %>((<%= type %>)ImportUtil.parseFieldData<%= mvType %>(elt, "<%= name %>", <%= itFieldEntry.getTypeShort() %>.class));
<% } else if (itFieldEntry.isTypePublication()) { %>
    set<%= nameCap %>((<%= type %>)ImportUtil.parseFieldData(elt, "<%= name %>"));
<% } %>
</jalios:foreach>
    }
  }
  
  public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
<jalios:foreach collection="<%= declaredFieldEntryList %>" name="itFieldEntry" type="TypeFieldEntry">
<% 
String name    = itFieldEntry.getName(); 
String nameCap = itFieldEntry.getNameCap();
boolean isFileField = itFieldEntry.isTypeDocument() || itFieldEntry.isTypeDocumentMV();
boolean addFieldML = itFieldEntry.isFieldML() && (itFieldEntry.isTypeString() || itFieldEntry.isTypeStringArray() || (itFieldEntry.isTypeCollection() && "String".equals(itFieldEntry.getTypeShort())) || isFileField);
%>
<% if (itFieldEntry.isTypeString()      || 
       itFieldEntry.isTypeStringArray() ||
       itFieldEntry.isAnyLink()         ||
       itFieldEntry.isTypeDate()        || 
       itFieldEntry.isTypeDateArray()   ||
       itFieldEntry.isTypeInt()         ||
       itFieldEntry.isTypeIntArray()    ||
       itFieldEntry.isTypeLong()        ||
       itFieldEntry.isTypeLongArray()   ||
       itFieldEntry.isTypeDouble()      ||
       itFieldEntry.isTypeDoubleArray() ||
       itFieldEntry.isTypeBoolean()     ||
       itFieldEntry.isTypeBooleanArray()||
       itFieldEntry.isTypeCollection()) { %>
    sb.append(ExportUtil.exportField(indentLevel, "<%= name %>", get<%= nameCap %>()<%= addFieldML ? ", \"" + name + "ML\"" : "" %><% if (itFieldEntry.isTypeString() || itFieldEntry.isTypeStringArray()) { %>, <%= itFieldEntry.isAbstract() %>, <%= itFieldEntry.escapeHtml() %><% } %>));
<% } %>
<% if (addFieldML) { %>
    sb.append(ExportUtil.exportField(indentLevel, "<%= name %>ML", get<%= nameCap %>ML(), <%= itFieldEntry.escapeHtml() %>));
<% }%>
</jalios:foreach>
  }


<% if (isPublicationType) { %>  
  public Set<FileDocument> getDocumentLinkSet() {
    Set<FileDocument> docSet = super.getDocumentLinkSet();
<jalios:foreach collection="<%= declaredFieldEntryList %>" name="itFieldEntry" type="TypeFieldEntry">
<% 
String name        = itFieldEntry.getName();
String editor      = itFieldEntry.getEditor();
boolean isFilepath = "image".equals(editor) || "media".equals(editor);
boolean isML       = itFieldEntry.isFieldML();
%>
<% if (isFilepath) { %>
<%   if (isML)  { %>
    JcmsUtil.addFileDocument(docSet, <%= name %>, <%= name %>ML);
<%   } else { %>
    JcmsUtil.addFileDocument(docSet, <%= name %>);
<%   } %>
<% } %>
</jalios:foreach>
    return docSet;
  }
<% } %>
  
<%-- ** TYPE AND FIELD INFOS ************************ --%>
  // ----------------------------------------------------------------------
  // TYPE AND FIELD INFOS (static methods)
  // ----------------------------------------------------------------------  
  /**
   * Returns the TypeEntry bound to <code><%= className %></code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(<%= className %>.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code><%= className %></code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code><%= className %></code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code><%= className %></code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(<%= className %>.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code><%= className %></code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code><%= className %></code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code><%= className %></code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(<%= className %>.class);
  }


<%-- ** FIELDs VALUE ************************************ --%>
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------  
<%
  List intFieldEntryList = new ArrayList();
  List longFieldEntryList = new ArrayList();
  List doubleFieldEntryList = new ArrayList();
  List booleanFieldEntryList = new ArrayList();
  List objectFieldEntryList = new ArrayList();
	for(Iterator it = declaredFieldEntryList.iterator(); it.hasNext();) {
	  TypeFieldEntry fieldEntry = (TypeFieldEntry) it.next();
    if (fieldEntry.isTypeInt()) {
      intFieldEntryList.add(fieldEntry);
    } else if (fieldEntry.isTypeLong()) {
      longFieldEntryList.add(fieldEntry);
    } else if (fieldEntry.isTypeDouble()) {
      doubleFieldEntryList.add(fieldEntry);
    } else if (fieldEntry.isTypeBoolean()) {
      booleanFieldEntryList.add(fieldEntry);
    } else {
      objectFieldEntryList.add(fieldEntry);
    }
  }
%>
  /**
   * Gets the value of the given <code>int</code> field name for the current <code><%= className %></code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
<jalios:foreach collection="<%= intFieldEntryList %>" name="itIntFieldEntry" type="TypeFieldEntry">
    if ("<%= itIntFieldEntry.getName() %>".equals(fieldName)) { return get<%= itIntFieldEntry.getNameCap() %>(); }
</jalios:foreach>
    return super.getIntFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>int</code> field name for the current <code><%= className %></code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {
<jalios:foreach collection="<%= intFieldEntryList %>" name="itIntFieldEntry" type="TypeFieldEntry">
    if ("<%= itIntFieldEntry.getName() %>".equals(fieldName)) { set<%= itIntFieldEntry.getNameCap() %>(value); return; }
</jalios:foreach>
    super.setIntFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>long</code> field name for the current <code><%= className %></code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
<jalios:foreach collection="<%= longFieldEntryList %>" name="itLongFieldEntry" type="TypeFieldEntry">
    if ("<%= itLongFieldEntry.getName() %>".equals(fieldName)) { return get<%= itLongFieldEntry.getNameCap() %>(); }
</jalios:foreach>
    return super.getLongFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>long</code> field name for the current <code><%= className %></code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setLongFieldValue(String fieldName, long value) throws NoSuchFieldException {
<jalios:foreach collection="<%= longFieldEntryList %>" name="itLongFieldEntry" type="TypeFieldEntry">
    if ("<%= itLongFieldEntry.getName() %>".equals(fieldName)) { set<%= itLongFieldEntry.getNameCap() %>(value); return; }
</jalios:foreach>
    super.setLongFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>double</code> field name for the current <code><%= className %></code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
<jalios:foreach collection="<%= doubleFieldEntryList %>" name="itDoubleFieldEntry" type="TypeFieldEntry">
    if ("<%= itDoubleFieldEntry.getName() %>".equals(fieldName)) { return get<%= itDoubleFieldEntry.getNameCap() %>(); }
</jalios:foreach>
    return super.getDoubleFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>double</code> field name for the current <code><%= className %></code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setDoubleFieldValue(String fieldName, double value) throws NoSuchFieldException {
<jalios:foreach collection="<%= doubleFieldEntryList %>" name="itDoubleFieldEntry" type="TypeFieldEntry">
    if ("<%= itDoubleFieldEntry.getName() %>".equals(fieldName)) { set<%= itDoubleFieldEntry.getNameCap() %>(value); return; }
</jalios:foreach>
     super.setDoubleFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>boolean</code> field name for the current <code><%= className %></code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
<jalios:foreach collection="<%= booleanFieldEntryList %>" name="itBooleanFieldEntry" type="TypeFieldEntry">
    if ("<%= itBooleanFieldEntry.getName() %>".equals(fieldName)) { return get<%= itBooleanFieldEntry.getNameCap() %>(); }
</jalios:foreach>
    return super.getBooleanFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code><%= className %></code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setBooleanFieldValue(String fieldName, boolean value) throws NoSuchFieldException {
<jalios:foreach collection="<%= booleanFieldEntryList %>" name="itBooleanFieldEntry" type="TypeFieldEntry">
    if ("<%= itBooleanFieldEntry.getName() %>".equals(fieldName)) { set<%= itBooleanFieldEntry.getNameCap() %>(value); return; }
</jalios:foreach>
    super.setBooleanFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>Category</code> field name for the current <code>Data</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param mbr the member used to check rigth access to categories.
   * @return a <code>TreeSet</code> of <code>Category</code>
   * @throws NoSuchFieldException if the field was not found in the given <code>Data</code>.
   */
  public TreeSet<Category> getCategoryFieldValue(String fieldName, Member mbr) throws NoSuchFieldException {
<jalios:foreach collection="<%= categoryFieldEntryList %>" name="itCatFieldEntry" type="TypeFieldEntry">
    if ("<%= itCatFieldEntry.getName() %>".equals(fieldName)) { return get<%= itCatFieldEntry.getNameCap() %>(mbr); }
</jalios:foreach>
    return super.getCategoryFieldValue(fieldName, mbr);
  }

  /**
   * Gets the <code>Object</code> value of the given field name for this <code><%= className %></code>. <br>
   * Do not retrieve <code>Category</code> fields, see {@link #getCategoryFieldValue(String, Member)}.
   * @param fieldName the field name from which to retrieve the field value.
   * @param lang the language (ISO-639 code) in which to retrieve the field value
   *        (used only for multilingual fields).
   * @param useDefault whether to use the publication main language if the field value 
   *        is not available in the requested language (used only for multilingual fields).
   * @return the <code>Object</code> field value
   * @throws NoSuchFieldException if the field was not found in the given <code>Publication</code>.
   */
  public Object getFieldValue(String fieldName, String lang, boolean useDefault) throws NoSuchFieldException {
<jalios:foreach collection="<%= objectFieldEntryList %>" name="itObjFieldEntry" type="TypeFieldEntry">
    if ("<%= itObjFieldEntry.getName() %>".equals(fieldName)) { return get<%= itObjFieldEntry.getNameCap() %>(<%= itObjFieldEntry.isFieldML() ? "lang, useDefault": "" %>); }
</jalios:foreach>
    return super.getFieldValue(fieldName, lang, useDefault);
  }
  
  /**
   * Sets the <code>Object</code> value of the given field name for this <code><%= className %></code>. <br>
   * Do not set <code>Category</code> fields, see {@link #setCategoryFieldValue(String, TreeSet)}.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>Object</code> field value
   * @param lang the language (ISO-639 code) in which to retrieve the field value
   *        (used only for multilingual fields).
   * 
   * @throws NoSuchFieldException if the field was not found in the given <code>Publication</code>.
   * @since jcms-6.3.0 
   */
  public void setFieldValue(String fieldName, Object value, String lang) throws NoSuchFieldException {
<jalios:foreach collection="<%= objectFieldEntryList %>" name="itObjFieldEntry" type="TypeFieldEntry"><% 
    String ctype  = itObjFieldEntry.getType(); %>
    if ("<%= itObjFieldEntry.getName() %>".equals(fieldName)) { set<%= itObjFieldEntry.getNameCap() %>(<%= itObjFieldEntry.isFieldML() ? "lang,": "" %>(<%= ctype %>)value); return; }
</jalios:foreach>
    super.setFieldValue(fieldName, value, lang);
  }
  
<%-- ** FIELDS / GETTERS / SETTERS / FORM REPORT ******************************** --%>
<jalios:foreach collection="<%= declaredFieldEntryList %>" name="itFieldEntry" type="TypeFieldEntry">
<%
  Element xmlField = itFieldEntry.getXmlElement();
  String name = itFieldEntry.getName();
  String nameCap = itFieldEntry.getNameCap();
  String editor = itFieldEntry.getEditor();
  String type = itFieldEntry.getType();
  String typeShort = itFieldEntry.getTypeShort();
  String defaultValue = "";
  String defaultStr = Util.escapeJavaStringChar(xmlField.getAttributeValue("default"));
  
  if (type.equals("String")) {
    defaultValue = "channel.getTypeFieldEntry(" + className + ".class, \"" + name + "\", true).getDefaultTextString()";
  }
  else if (type.equals("int") || type.equals("double") || type.equals("long")) {
    defaultValue = Util.notEmpty(defaultStr) ? defaultStr : "0";
  }
  else if (type.equals("boolean")) {
    defaultValue = "on".equals(defaultStr) || "true".equals(defaultStr) ? "true" : "false";
  }
  else if (isDBType && itFieldEntry.isTypeList()) {
    defaultValue = "new Array" + type + "()";
  }
  else if (isDBType && itFieldEntry.isTypeSet()) {
    defaultValue = "new Hash" + type + "()";
  }
  
  boolean fieldML = itFieldEntry.isFieldML();
  
  boolean isArray = itFieldEntry.isTypeArray();
  
  String dataSource = itFieldEntry.getDataSource();
  int maxRows       = itFieldEntry.getMaxRows();
  String dbrTable   = itFieldEntry.getDbrTable();
  String dbrKeyCol  = itFieldEntry.getDbrKeyCol();
  String dbrLabelCol= itFieldEntry.getDbrLabelCol();
  String dbrOrderBy = itFieldEntry.getDbrOrderBy();
  
  boolean isLinkFromDBType = isDBType && itFieldEntry.isAnyLink();
  
  boolean isDBLink = false;
  boolean isDBLinkList = false;
  if (!isDBType) {
    boolean isLink = editor.startsWith("member") || (editor.startsWith("link") && TypeUtil.isDBType(parentElt, typeShort));
    isDBLink = !isArray && isLink;
    isDBLinkList = isArray && isLink;
  }
  
  boolean isTransientLink = false;
  if (isDBType) {
    isTransientLink = editor.startsWith("member") || editor.startsWith("group") || editor.startsWith("link");
  }
  
  boolean isLargeText = "textarea".equals(itFieldEntry.getEditor()) || "wysiwyg".equals(itFieldEntry.getEditor());
%>
<%-- FIELD --%>
  // ----------------------------------------------------------------------
  // <%= name %>
  // ----------------------------------------------------------------------  
  
<% if (isTransientLink) { %>
  @JsonProperty
<% } %>
  protected <% if (isTransientLink) { %>transient<% } %> <%= type %> <%= name %><%= Util.isEmpty(defaultValue) ? "" : " = " + defaultValue %>;
<% if (isLinkFromDBType && itFieldEntry.isTypeScalar()) { %>
  protected transient String <%= name %>Id;
<% } %>
<% if (isLinkFromDBType && itFieldEntry.isTypeCollection()) { 
  String collection = itFieldEntry.isTypeList() ? "List" : "Set"; %>
  private transient Data<%= collection %>Helper<<%= typeShort %>> <%= name %><%= collection %>Helper = Data<%= collection %>Helper.build(this, <%= typeShort %>.class, this::set<%= nameCap %>);
<% } %>
  
<%-- GETTER --%>
<% if (type.equals("boolean") && name.startsWith("is")) { %>
  public <%= type %> <%= name %>() { return <%= name %>; }
<% } else if (isDBLink) { %>
  public <%= type %> get<%= nameCap %>() { 
    return get<%= nameCap %>(true);
  }
  public <%= type %> get<%= nameCap %>(boolean queryDB) { 
   if (<%= name %> != null) {
      return <%= name %>;
    }
    if (queryDB && Util.notEmpty(<%= name %>DBID)) {
      return channel.getData(<%= type %>.class, <%= name %>DBID);
    }
    return null;
  }
  protected String <%= name %>DBID;
  public String get<%= nameCap %>DBID() { return <%= name %>DBID; }
<% } else if (isDBLinkList) { %>
  public <%= type %> get<%= nameCap %>() {
    return get<%= nameCap %>(true);
  }
  public <%= type %> get<%= nameCap %>(boolean queryDB) { 
    if (!queryDB || Util.isEmpty(<%= name %>DBID)) {
      return <%= name %>;
    }
    return mergeHybridLink(<%= typeShort %>.class, <%= name %>, <%= name %>DBID);
  }
  protected String[] <%= name%>DBID;
  public String[] get<%= nameCap %>DBID() {
    return <%= name%>DBID;
  }
<% } else if (isLinkFromDBType && itFieldEntry.isTypeCollection()) { %>
<%   String collection = itFieldEntry.isTypeList() ? "List" : "Set"; %>
  public <%= type %> get<%= nameCap %>() {
    return get<%= nameCap %>(false);
  }
  public <%= type %> get<%= nameCap %>(boolean modifiable) {
    if (isDBData()) {
      <%= name %><%= collection %>Helper.refreshDataCollectionIfNeeded();
    }
    if (<%= name %> != null && !modifiable) {
      return Collections.unmodifiable<%= collection %>(<%= name %>);
    }
    return <%= name %>; 
  }
<% } else { %>
  public <%= type %> get<%= nameCap %>() { return <%= name %>; }
<%   if (editor.equals("category")) { %>  
  public TreeSet get<%= nameCap %>(Member member) {
    return (TreeSet) Category.getReadableCatSet(get<%= nameCap %>(), member);
  }
<%   } %>
<% } %>
<%-- SETTER --%>
<% if (type.equals("boolean") && name.startsWith("is")) { %>
  public void set<%= Util.recapitalize(name.substring(2)) %>(<%= type %> v) { <%= name %> = v; }
<% } else if (isDBLink) { %>
  public void set<%= nameCap %>(<%= type %> v) {
    if (v == null) {
      <%= name %> = null;
      <%= name %>DBID =null;
      return;
    }  
  
    if (v instanceof DBData) {
      set<%= nameCap %>DBID(v.getId());
    } else {
      <%= name %> = v;
    }
  }
  public void set<%= nameCap %>DBID(String v) { 
    <%= name %>DBID = v;
    if (Util.notEmpty(<%= name %>DBID)) { 
      <%= name %> = null;
    };    
  }  
<% } else if (isDBLinkList) { %>
  public void set<%= nameCap %>(<%= type %> v) { 
    <%= name %> = v == null ? null : v.clone(); 
  }
  
  public void set<%= nameCap %>DBID(String[] v) { 
    <%= name %>DBID = v; 
  }
<% } else if (isLinkFromDBType && itFieldEntry.isTypeCollection()) { %>
  public void set<%= nameCap %>(<%= type %> v) { 
    <%= name %> = v; 

    if (isDBData()) {
<% String collection = itFieldEntry.isTypeList() ? "List" : "Set"; %>
      <%= name %><%= collection %>Helper.updateId<%= collection %>(v);
    }
  }

<% } else if (isLinkFromDBType && itFieldEntry.isTypeScalar()) { %>
  public void set<%= nameCap %>(<%= type %> v) { 
    <%= name %>Id = null;
    <%= name %> = v;
  }
<% } else { %>
  <% if (isDBType && "int".equals(type)) { %>
  public void set<%= nameCap %>(Integer v) {
    <%= name %> = v == null ? <%= defaultValue %> : v.intValue();
  }
  <% } else if (isDBType && "long".equals(type)) { %>
  public void set<%= nameCap %>(Long v) {
    <%= name %> = v == null ? <%= defaultValue %> : v.longValue();
  }  
  <% } else if (isDBType && "double".equals(type)) { %>
  public void set<%= nameCap %>(Double v) {
    <%= name %> = v == null ? <%= defaultValue %> : v.doubleValue();
  }  
  <% } else if (isDBType && "boolean".equals(type)) { %>
  public void set<%= nameCap %>(Boolean v) {
    <%= name %> = v == null ? <%= defaultValue %> : v.booleanValue();
  }  
  <% } else if (isDBType && itFieldEntry.isTypeCollection()) { %>
  public void set<%= nameCap %>(<%= type %> v) { 
    <%= name %> = HibernateUtil.updateCollection(<%= name %>, v, <%= isLargeText %>);
  }
  <% } else { %>
  public void set<%= nameCap %>(<%= type %> v) { <%= name %> = v; }
  <% } %>
<% } %>
  
<%-- HIBERNATE ID GETTER/SETTER --%>
<% if (isLinkFromDBType) { %>
<%   if (itFieldEntry.isTypeScalar()) { %>
  public String get<%= nameCap %>Id() { 
    if (<%= name %> == null) {
      return <%= name %>Id;
    }
    return <%= name %>.getId(); 
  }
  public void set<%= nameCap %>Id(String v) {
    <%= name %>Id = v;
    <%= name %> = channel.getData(<%= type %>.class, v);   
  }
<%   } else { %>
<%     String collection = itFieldEntry.isTypeList() ? "List" : "Set"; %>
  @JsonIgnore
  public <%= collection %><String> get<%= nameCap %>Id() {
    if (isDBData()) { 
      return <%= name %><%= collection %>Helper.getId<%= collection %>();
    }
    return null;
  }
  public void set<%= nameCap %>Id(<%= collection %><String> v) { 
    if (isDBData()) { 
      <%= name %><%= collection %>Helper.setId<%= collection %>(v);
    }
  }
<%   } %>  
<% } %>
  

<%-- MULTILINGUAL GETTER/SETTER --%>
<% if (typeShort.equals("String") || typeShort.equals("com.jalios.jcms.FileDocument")) { %>
<%   if (fieldML) { %>
  <%
   String defaultValueML = "null";
   if (type.equals("String")) {
     defaultValueML = "channel.getTypeFieldEntry(" + className + ".class, \"" + name + "\", true).getDefaultTextMap()";
   } else if (type.equals("String[]")) {
     defaultValueML = "channel.getTypeFieldEntry(" + className + ".class, \"" + name + "\", true).getDefaultTextMapArray()";
   } else if (type.equals("List<String>")) {
     defaultValueML = "channel.getTypeFieldEntry(" + className + ".class, \"" + name + "\", true).getDefaultTextMapList()";
   }
  %>
  protected HashMap<String,<%= type %>> <%= name %>ML = <%= defaultValueML %>;
  public <%= type %> get<%= nameCap %>(String lang) { return (<%= type %>)channel.getLangValue(lang, true, <%= name %>, <%= name %>ML, getMainLanguage()); }
  public <%= type %> get<%= nameCap %>(String lang, boolean useDefault) { return (<%= type %>)channel.getLangValue(lang, useDefault, <%= name %>, <%= name %>ML, getMainLanguage()); }
  public HashMap<String,<%= type %>> get<%= nameCap %>ML() { return <%= name %>ML; }
  public void set<%= nameCap %>ML(HashMap<String,<%= type %>> v) { <%= name %>ML = v; }
  
  public String get<%= nameCap %>MLE() { 
    return JcmsUtil.encodeMLE(get<%= nameCap %>ML());
  }
  
  public void set<%= nameCap %>MLE(String v) {
    set<%= nameCap %>ML(JcmsUtil.decodeMLE(v));
  }
  
  public void set<%= nameCap %>(String lang, <%= type %> value) {
    if (channel.getLanguage().equals(lang)) {
      <%= name %> = value;
      return;
    }
    if (<%= name %>ML == null) {
      <%= name %>ML = new HashMap<>();
    } else if (this != channel.getData(id)) {
      <%= name %>ML = new HashMap<>(<%= name %>ML);
    }
    <%= name %>ML.put(lang, value);
  }
<%   } else { %>
  public <%= type %> get<%= nameCap %>(String lang) { return <%= name %>; }
  public <%= type %> get<%= nameCap %>(String lang, boolean useDefault) { return <%= name %>; }
<%   } %>
<% } %>

<%-- SQLQUERY DATASOURCE / MAXROWS GETTER/SETTER --%>
<% if (editor.equals("sqlquery")) { %>
  
  protected String<%= isArray ? "[]" : "" %> <%= name %>DataSource<%= Util.isEmpty(dataSource) ? "" : " = " + (isArray ? "new String[]{\"" : "\"" ) + dataSource + (isArray ? "\"}" : "\"" ) %>;
  public String<%= isArray ? "[]" : "" %> get<%= nameCap %>DataSource() { return <%= name %>DataSource; }
  public void set<%= nameCap %>DataSource(String<%= isArray ? "[]" : "" %> v) { <%= name %>DataSource = v; }
  
  protected int<%= isArray ? "[]" : "" %> <%= name %>MaxRows;
  public int<%= isArray ? "[]" : "" %> get<%= nameCap %>MaxRows() { return <%= name %>MaxRows; }
  public void set<%= nameCap %>MaxRows(int<%= isArray ? "[]" : "" %> v) { <%= name %>MaxRows = v; }
  
   public SQLQueryResult<%= isArray ? "[]" : "" %> get<%= nameCap %>SQR() {
 <% if (isArray) { %>
    if (<%= name %> == null) {
      return null;
    }
    SQLQueryResult[] sqrArray = new SQLQueryResult[<%= name %>.length];
    for(int i = 0 ; i < <%= name %>.length; i++) {
      sqrArray[i] = new SQLQueryResult(<%= name %>DataSource[i], <%= name %>[i], <%= name %>MaxRows[i]);
    }
    return sqrArray; 
<% } else { %>
    return new SQLQueryResult(<%= name %>DataSource, <%= name %>, <%= name %>MaxRows);
<% } %>
  }
<% } %>

<%-- BOOLEAN / onLabel/offLabel getter --%>
<% if (type.equals("boolean")) { %>
  public String get<%= nameCap %>Label(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "<%= name %>", true);
    return <%= name %> ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang); 
  }
<% } %>

<%-- BOOLEAN[] / onLabel/offLabel getter --%>
<% if (type.equals("boolean[]")) { %>
  public String get<%= nameCap %>Label(int i, String lang) {
    if (<%= name %> == null || i >= <%= name %>.length) {
      return "";
    }
  
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "<%= name %>", true);
    return <%= name %>[i] ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang); 
  }
<% } %>

<%-- BOOLEAN[] / onLabel/offLabel getter --%>
<% if (type.equals("List<Boolean>")) { %>
  public String get<%= nameCap %>Label(int i, String lang) {
    if (<%= name %> == null || i >= <%= name %>.size()) {
      return "";
    }
  
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "<%= name %>", true);
    return <%= name %>.get(i) ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang); 
  }
<% } %>

<%-- DBRECORD LABEL / DISPLAYPARAMS --%>
<% if (editor.equals("dbrecord")) { %>
<%   if (isArray) { %>
  public String[] get<%= nameCap %>Label() { 
    if (Util.isEmpty(<%= name %>)) {
      return null;
    }
    String[] labels = new String[<%= name %>.length];
    for(int i = 0; i < labels.length; i++) {
      String label = "";
      String key = <%= name %>[i];
      if (Util.notEmpty(key)) { 
        try {
          Object obj = DBUtil.getFirstValue("<%= dataSource %>", "<%= dbrLabelCol %>", "<%= dbrTable %>", "<%= dbrOrderBy %>", new String[]{"<%= dbrKeyCol %>"}, new String[]{key}, true);
          label =  obj != null ? obj.toString() : JcmsUtil.glp(channel.getLanguage(), "ui.sql.lbl.unkn-rec"); 
        }
        catch(java.sql.SQLException ex) {
          label =  JcmsUtil.glp(channel.getLanguage(), "ui.sql.lbl.error");
        }
      }
      labels[i] = label;
    }
    return labels;
  }
  public String[] get<%= nameCap %>DisplayParams() { 
    if (Util.isEmpty(<%= name %>)) {
      return null;
    }
    String[] params = new String[<%= name %>.length];
    for(int i = 0; i < params.length; i++) {
      params[i] = 
        "dataSource=" + ServletUtil.encodeURL("<%= dataSource %>") + 
        "&amp;table="  + ServletUtil.encodeURL("<%= dbrTable %>") +
        "&amp;keyCol=" + ServletUtil.encodeURL("<%= dbrKeyCol %>") +
        "&amp;keyVal=" + ServletUtil.encodeURL(<%= name %>[i]);
    }
    return params;
  }  
<%   } else { %>
  public String get<%= nameCap %>Label() { 

    if (Util.isEmpty(<%= name %>)) {
      return "";
    }
      
    try {
      Object obj = DBUtil.getFirstValue("<%= dataSource %>", "<%= dbrLabelCol %>", "<%= dbrTable %>", "<%= dbrOrderBy %>",new String[]{"<%= dbrKeyCol %>"}, new String[]{<%= name %>}, true);
      return obj != null ? obj.toString() : JcmsUtil.glp(channel.getLanguage(), "ui.sql.lbl.unkn-rec"); 
    }
    catch(java.sql.SQLException ex) {
      return JcmsUtil.glp(channel.getLanguage(), "ui.sql.lbl.error");
    }
  }
  
  public String get<%= nameCap %>DisplayParams() { 
    return 
    "dataSource=" + ServletUtil.encodeURL("<%= dataSource %>") + 
    "&amp;table=" + ServletUtil.encodeURL("<%= dbrTable %>") +
    "&amp;keyCol=" + ServletUtil.encodeURL("<%= dbrKeyCol %>") +
    "&amp;keyVal=" + ServletUtil.encodeURL(<%= name %>);
  }
<%   } %>
<% } %>

<%-- ENUMERATE LABEL / BEGIN --%>
<jalios:if predicate='<%= itFieldEntry.isMbrEnum() %>'>
  public static Set get<%= nameCap %>Values() {
  <% if (Util.isEmpty(itFieldEntry.getGids())) { %>
    Set<Member> <%= name %>MemberSet = new TreeSet<>(Member.getNameComparator());
        <%= name %>MemberSet.addAll(channel.getDataSet(Member.class));
  <% } else { %>
    Set<Member> <%= name %>MemberSet = JcmsUtil.getMemberSetFromGroups(new String[]{ "<%= Util.join(itFieldEntry.getGids(),"\",\"") %>" });
  <% } %>
    return <%= name %>MemberSet;
  }
</jalios:if>
<jalios:if predicate='<%= itFieldEntry.isGrpEnum() %>'>
  public static Set get<%= nameCap %>Values() {
    Set <%= name %>GroupSet = new TreeSet(Group.getNameComparator());
        <%= name %>GroupSet.addAll(channel.getDataSet(Group.class));
    return <%= name %>GroupSet;
  }
</jalios:if>
<jalios:if predicate='<%= editor.equals("boolean") %>'>

  public static String[] get<%= nameCap %>Values() {
    return new String[]{ "true" , "false" };
  }
  
  public static String[] get<%= nameCap %>Labels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(<%= className %>.class, "<%= name %>", true);
    String onLabel = (String) tfe.getOnLabel(userLang);
    String offLabel = (String) tfe.getOffLabel(userLang);
    
    return new String[]{ onLabel, offLabel };
  }
</jalios:if>
<jalios:if predicate='<%= editor.equals("enumerate") %>'>
  private static String[] <%= name %>Values;  
  private static String[] <%= name %>Labels;
  private static Map<String, String[]> <%= name %>LabelsMap;
  
  public static String[] get<%= nameCap %>Values() {
    if(<%= name %>Values == null) {
      set<%= nameCap %>Values(channel.getTypeFieldEntry(<%= className %>.class, "<%= name %>", true).getEnumerateValues());
    }
    return <%= name %>Values;
  }
  public static void set<%= nameCap %>Values(String[] values) {
    <%= name %>Values = values;
  }

  public static String[] get<%= nameCap %>Labels() {
    if(<%= name %>Labels == null) {
      set<%= nameCap %>Labels(channel.getTypeFieldEntry(<%= className %>.class, "<%= name %>", true).getEnumerateLabels());
    }
    return <%= name %>Labels;
  }
  public static void set<%= nameCap %>Labels(String[] labels) {
    <%= name %>Labels = labels;
  }

  public static Map<String, String[]> get<%= nameCap %>LabelsMap() {
    if(<%= name %>LabelsMap == null) {
      set<%= nameCap %>LabelsMap(channel.getTypeFieldEntry(<%= className %>.class, "<%= name %>", true).getEnumerateLabelsMap());
    }
    return <%= name %>LabelsMap;
  }
  public static void set<%= nameCap %>LabelsMap(Map<String, String[]> LabelsMap) {
    <%= name %>LabelsMap = LabelsMap;
  }

  public static String[] get<%= nameCap %>Labels(String userLang) {
    Map<String, String[]> <%= name %>LabelMap = get<%= nameCap %>LabelsMap();
    String[] labels = (String[])<%= name %>LabelMap.get(userLang);
    if (labels == null) {
      labels = (String[])<%= name %>LabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String get<%= nameCap %>Label(String value, String userLang) {
    String[] labels = get<%= nameCap %>Labels(userLang);

    int i = 0;
    if (false) {
    }
<jalios:foreach array='<%= itFieldEntry.getEnumerateValues() %>' name='itValue' type='String' counter='c2'>
    else if (value.equals("<%= Util.escapeJavaStringChar(itValue) %>")) {
      i = <%= c2.intValue() - 1 %>;
    }
</jalios:foreach>
    else {
      return "???";
    }

    if (i < labels.length) {
      return labels[i];
    }
    return get<%= nameCap %>Label(value, channel.getLanguage());
  }
  
  public static String get<%= nameCap %>Label(String value) {    
    String[] <%= name %>Labels = get<%= nameCap %>Labels();
    if (false) {
    }
<jalios:foreach array='<%= itFieldEntry.getEnumerateValues() %>' name='itValue' type='String' counter='c2'>
    else if (value.equals("<%= Util.escapeJavaStringChar(itValue) %>")) {
      return <%= name %>Labels[<%= c2.intValue() - 1 %>];
    }
</jalios:foreach>
    return "???";
  }
</jalios:if>
<%-- ENUMERATE LABEL / END --%>


<%-- FORM REPORT / BEGIN --%>
<jalios:select>
<jalios:if predicate='<%= type.equals("int") %>'>
  public static IntegerFormReport get<%= nameCap %>Report(SortedSet<<%= className %>> set) {
    long sum = 0;
    int min = Integer.MAX_VALUE;
    int max = Integer.MIN_VALUE;
    for (<%= className %> obj : set) {
      if (obj == null) {
        continue;
      }
      int value = obj.get<%= nameCap %>();
      sum += value;
      min = Math.min(value, min);
      max = Math.max(value, max);
    }
    return new IntegerFormReport(set.size(), sum, min, max);
  }  
</jalios:if>

<jalios:if predicate='<%= (editor.equals("enumerate") && type.equals("String")) || type.equals("boolean") %>'>
  public static EnumerateFormReport get<%= nameCap %>Report(SortedSet<<%= className %>> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (<%= className %> obj : set) {
      if (obj == null) {
        continue;
      }
      <% if (type.equals("boolean") && name.startsWith("is")) { %>
      map.inc("" + obj.<%= name %>());
      <% } else {%>
      map.inc("" + obj.get<%= nameCap %>());
      <% } %>
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
</jalios:if>

<jalios:if predicate='<%= editor.equals("enumerate") && type.equals("String[]") %>'>
  public static EnumerateFormReport get<%= nameCap %>Report(SortedSet<<%= className %>> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (<%= className %> obj : set) {
      if (obj == null || obj.get<%= nameCap %>() == null) {
        continue;
      }
      for(int i = 0; i < obj.get<%= nameCap %>().length; i++) {
        if (obj.get<%= nameCap %>()[i] != null) {
          map.inc(obj.get<%= nameCap %>()[i]);
        }
      }
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
</jalios:if>

<jalios:if predicate='<%= editor.equals("enumerate") && (type.equals("List<String>") || type.equals("Set<String>") ) %>'>
  public static EnumerateFormReport get<%= nameCap %>Report(SortedSet<<%= className %>> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (<%= className %> obj : set) {
      if (obj == null || obj.get<%= nameCap %>() == null) {
        continue;
      }
      for (String v: obj.get<%= nameCap %>()) {
        if (v != null) {
          map.inc(v);
        }
      }
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
</jalios:if>
</jalios:select>
<%-- FORM REPORT / END --%>

</jalios:foreach>


<%-- ** sqlresult ******************************** --%>
<jalios:foreach collection="<%= sqlresultFieldEntryList %>" name="itFieldEntry" type="TypeFieldEntry">
<%
  Element xmlField  = itFieldEntry.getXmlElement();
  String name       = itFieldEntry.getName();
  String nameCap    = itFieldEntry.getNameCap();
  String dataSource = itFieldEntry.getDataSource();
  String query      = Util.escapeJavaStringChar(xmlField.getAttributeValue("query"));
  int maxRows       = itFieldEntry.getMaxRows();
  
  // Compute paramList
  String params = xmlField.getAttributeValue("params");
  String[] fieldNames = Util.split(params, ", ");
  List paramList = new ArrayList();
  for(int i = 0; i < fieldNames.length; i++) {
    String itFieldName = fieldNames[i];
    Element itParamField = XmlUtil.searchChild(typeElt.getChild(TypeConstants.FIELDS_ELT), TypeConstants.FIELD_ELT, "name", itFieldName);
    if (itParamField == null) {
      continue;
    }
    String itFieldType = itParamField.getAttributeValue("type");
    if ("int".equals(itFieldType)) {
      paramList.add("new Integer(" + itFieldName + ")");
    } else if ("double".equals(itFieldType)) {
      paramList.add("new Integer(" + itFieldName + ")");
    } else {
      paramList.add(itFieldName);
    }
  } 
%>
   
  // ----------------------------------------------------------------------
  // <%= name %>
  // ----------------------------------------------------------------------  
  public String get<%= nameCap %>DataSource() {
    return "<%= dataSource %>";
  }
  
  public String get<%= nameCap %>SQLQuery() {
    return "<%= query %>";
  }
  
  public Object[] get<%= nameCap %>SQLParams() {
    return new Object[] {<%= Util.join(paramList, ", ") %>};
  }
  
  public int get<%= nameCap %>MaxRows() {
    return <%= maxRows %>;
  }
    
  public SQLQueryResult get<%= nameCap %>() {
    return new SQLQueryResult(get<%= nameCap %>DataSource(), get<%= nameCap %>SQLQuery(), get<%= nameCap %>SQLParams(), get<%= nameCap %>MaxRows());
  }
</jalios:foreach>

<%-- ** getAbstract ******************************** --%>
<%
if (isPublicationType) {
// Search the first abstract field 
TypeFieldEntry abstractFieldEntry = null;
for(Iterator it = allFieldEntryList.iterator(); it.hasNext();) {
  TypeFieldEntry fieldEntry = (TypeFieldEntry) it.next();
  if (fieldEntry.isAbstract()) {
    abstractFieldEntry = fieldEntry;
    break;
  }
}
if (abstractFieldEntry != null) { 
  String  absName = abstractFieldEntry.getName();
  String  absType = abstractFieldEntry.getType();
  String  absNameCap = abstractFieldEntry.getNameCap();
  boolean isStringArray = absType.equals("String[]");
%>
   
  // ----------------------------------------------------------------------
  // abstract
  // ----------------------------------------------------------------------  
  @Override
  public void setAbstract(String lang, String value) { <% if (!isStringArray) { %>set<%= absNameCap %>(<%= abstractFieldEntry.isFieldML() ? "lang, ": "" %>value);<% } %> }
  @Override
  public String getAbstract() { return <% if (isStringArray) { %>Util.getFirst(<%= absName %>);<% } else { %><%= absType.equals("String") ? "" : "\"\" + " %><%= absName %>;<% } %> }
  @Override
  public String getAbstract(String lang, boolean useDefault) { return <% if (isStringArray) { %>Util.getFirst(get<%= absNameCap %>(lang, useDefault));<% } else { %><%= absType.equals("String") ? "" : "\"\" + " %>get<%= absNameCap %>(lang, useDefault);<% } %> }
<% if (abstractFieldEntry.isFieldML() && absType.equals("String")) { %>
  @Override
  public HashMap<String,String> getAbstractML() { return get<%= absNameCap %>ML(); }
<% } %>
<% } 
} %>

<%-- ** getDataImage ******************************** --%>
<%
// Search the first image field 
TypeFieldEntry dataImageFieldEntry = null;
for(Iterator it = allFieldEntryList.iterator(); it.hasNext();) {
  TypeFieldEntry fieldEntry = (TypeFieldEntry) it.next();
  if (fieldEntry.isDataImage()) {
    dataImageFieldEntry = fieldEntry;
    break;
  }
}
if (dataImageFieldEntry != null) { 
  String  absName = dataImageFieldEntry.getName();
  String  absType = dataImageFieldEntry.getType();
  String  absNameCap = dataImageFieldEntry.getNameCap();
  boolean isFileDoc = "com.jalios.jcms.FileDocument".equals(dataImageFieldEntry.getType());
  boolean isMedia = "media".equals(dataImageFieldEntry.getEditor());
%>
   
  // ----------------------------------------------------------------------
  // Data image
  // ----------------------------------------------------------------------  
  @Override
  public String getDataImage() {
<% if (isFileDoc) { %>
    FileDocument fileDoc = (FileDocument) get<%= absNameCap %>();
    String _img = fileDoc != null ? fileDoc.getDataImage() : "";
    if (Util.notEmpty(_img)) {
      return _img;
    }
<% } else if (isMedia) { %>
    String mediaPath = get<%= absNameCap %>();
    FileDocument fileDoc = FileDocument.getFileDocumentFromFilename(mediaPath);
    String _img = fileDoc != null ? fileDoc.getDataImage() : "";
    if (Util.notEmpty(_img)) {
      return _img;
    }
<% } else { %>
    String _img = <%= absName %>;
    if (Util.notEmpty(_img)) {
      return _img;
    }
<% } %>  
    return super.getDataImage();
  }
  
  @Override
  public String getDataImage(String lang, boolean useDefault) {
<% if (isFileDoc) { %>
    FileDocument fileDoc = (FileDocument) get<%= absNameCap %>(lang, useDefault);
    String _img = fileDoc != null ? fileDoc.getDataImage(lang, useDefault) : "";
    if (Util.notEmpty(_img)) {
      return _img;
    }  
<% } else if (isMedia) { %>
    String mediaPath = get<%= absNameCap %>(lang, useDefault);
    FileDocument fileDoc = FileDocument.getFileDocumentFromFilename(mediaPath);
    String _img = fileDoc != null ? fileDoc.getDataImage(lang, useDefault) : "";
    if (Util.notEmpty(_img)) {
      return _img;
    }  
<% } else { %>
    String _img = get<%= absNameCap %>(lang, useDefault);
    if (Util.notEmpty(_img)) {
      return _img;
    }  
<% } %>  
    return super.getDataImage(lang, useDefault);
  }
  
<% } %>

<%-- ** SEARCHABLE ************************************* --%>
<% if (isPublicationType) { %>
  @Override
  public String[] getSearchStrings() {
<jalios:if predicate='<%= isPublicationType %>'>
    StringBuffer sb = new StringBuffer(super.getSearchStrings()[0]);
</jalios:if>
<jalios:if predicate='<%= !isPublicationType %>'>
    StringBuffer sb = new StringBuffer();
</jalios:if>
    sb.ensureCapacity(500 * (<%= searchableFieldSet.size() %> + <%= searchableFieldMLSet.size() %> + <%= searchableArrayFieldSet.size() %> + <%= searchableArrayFieldMLSet.size() %> + <%= searchableListFieldSet.size() %> + <%= searchableListFieldMLSet.size() %>) );

<jalios:foreach collection="<%= searchableFieldSet %>" name="itName" type="String">
    if (<%= itName %> != null) {
      sb.append(<%= itName %>); sb.append(' ');
    }
</jalios:foreach>

<jalios:foreach collection="<%= searchableFieldMLSet %>" name="itName" type="String">
    if (<%= itName %> != null) {
      sb.append(<%= itName %>); sb.append(' '); 
    }
    if (<%= itName %>ML != null) {
      for (String str : <%= itName %>ML.values()) {
        if (str != null) {
          sb.append(str); sb.append(' ');
        }
      }
    }
</jalios:foreach>

<jalios:foreach collection="<%= searchableArrayFieldSet %>" name="itName" type="String">
    for (int i=0; <%= itName %> != null && i < <%= itName %>.length; i++) {
      if (<%= itName %>[i] != null) {
        sb.append(<%= itName %>[i]); sb.append(' ');
      }
    }
</jalios:foreach>

<jalios:foreach collection="<%= searchableArrayFieldMLSet %>" name="itName" type="String">
    for(int i=0; <%= itName %> != null && i < <%= itName %>.length; i++) {
      if (<%= itName %>[i] != null) {
        sb.append(<%= itName %>[i]); sb.append(' ');
      }
    }
    if (<%= itName %>ML != null) {
      for (String[] strArray : <%= itName %>ML.values()) {
        for(int i=0; strArray != null && i < strArray.length; i++) {
          if (strArray[i] != null) {
           sb.append( strArray[i]); sb.append(' ');
          }
        }
      }
    }
</jalios:foreach>

<jalios:foreach collection="<%= searchableListFieldSet %>" name="itName" type="String">
    if (<%= itName %> != null) {
      for (String str : <%= itName %>) {
        if (str != null) {
          sb.append(str); sb.append(' ');
        }
      }
    }
</jalios:foreach>

<jalios:foreach collection="<%= searchableListFieldMLSet %>" name="itName" type="String">
    if (<%= itName %> != null) {
      for (String str : <%= itName %>) {
        if (str != null) {
          sb.append(str); sb.append(' ');
        }
      }
    }
    if (<%= itName %>ML != null) {
      for (List<String> strList : <%= itName %>ML.values()) {
        if (strList != null) {
          for (String str : strList) {
            if (str != null) {
              sb.append(str); sb.append(' ');
            }
          }
        }
      }
    }
</jalios:foreach>
    return new String[] {sb.toString()};
  }
<% } %>
  
<%-- ** WIKI ************************************* --%>
<% if (isPublicationType) { %>
  @Override
  public String getAllWikiText() {
<jalios:if predicate='<%= isPublicationType %>'>
    StringBuffer sb = new StringBuffer(super.getAllWikiText());
</jalios:if>
<jalios:if predicate='<%= !isPublicationType %>'>
    StringBuffer sb = new StringBuffer();
</jalios:if>
    sb.ensureCapacity(500 * (<%= wikiFieldSet.size() %> + <%= wikiFieldMLSet.size() %> + <%= wikiArrayFieldSet.size() %> + <%= wikiArrayFieldMLSet.size() %> + <%= wikiListFieldSet.size() %> + <%= wikiListFieldMLSet.size() %>) );

<jalios:foreach collection="<%= wikiFieldSet %>" name="itName" type="String">
    if (<%= itName %> != null && !JHTMLUtils.isJHTML(null, <%= itName %>)) {
      sb.append(<%= itName %>); sb.append(' ');
    }
</jalios:foreach>

<jalios:foreach collection="<%= wikiFieldMLSet %>" name="itName" type="String">
    if (<%= itName %> != null && !JHTMLUtils.isJHTML(null, <%= itName %>)) {
      sb.append(<%= itName %>); sb.append(' '); 
    }
    if (<%= itName %>ML != null) {
      for (String str : <%= itName %>ML.values()) {
        if (str != null && !JHTMLUtils.isJHTML(null, str)) {
          sb.append(str); sb.append(' ');
        }
      }
    }
</jalios:foreach>

<jalios:foreach collection="<%= wikiArrayFieldSet %>" name="itName" type="String">
    for(int i=0; <%= itName %> != null && i < <%= itName %>.length; i++) {
      if (<%= itName %>[i] != null && !JHTMLUtils.isJHTML(null, <%= itName %>[i])) {
        sb.append(<%= itName %>[i]); sb.append(' ');
      }
    }
</jalios:foreach>

<jalios:foreach collection="<%= wikiArrayFieldMLSet %>" name="itName" type="String">
    for(int i=0; <%= itName %> != null && i < <%= itName %>.length; i++) {
      if (<%= itName %>[i] != null && !JHTMLUtils.isJHTML(null, <%= itName %>[i])) {
        sb.append(<%= itName %>[i]); sb.append(' ');
      }
    }
    if (<%= itName %>ML != null) {
      for (String[] strArray : <%= itName %>ML.values()) {
        for(int i=0; strArray != null && i < strArray.length; i++) {
          if (strArray[i] != null && !JHTMLUtils.isJHTML(null, strArray[i])) {
           sb.append( strArray[i]); sb.append(' ');
          }
        }
      }
    }
</jalios:foreach>

<jalios:foreach collection="<%= wikiListFieldSet %>" name="itName" type="String">
    if (<%= itName %> != null) {
      for (String str : <%= itName %>) {
        if (str != null && !JHTMLUtils.isJHTML(null, str)) {
          sb.append(str); sb.append(' ');
        }
      }
    }
</jalios:foreach>

<jalios:foreach collection="<%= wikiListFieldMLSet %>" name="itName" type="String">
    if (<%= itName %> != null) {
      for (String str : <%= itName %>) {
        if (str != null && !JHTMLUtils.isJHTML(null, str)) {
          sb.append(str); sb.append(' ');
        }
      }
    }
    if (<%= itName %>ML != null) {
      for (List<String> strList : <%= itName %>ML.values()) {
        if (strList != null) {
          for (String str : strList) {
            if (str != null && !JHTMLUtils.isJHTML(null, str)) {
              sb.append(str); sb.append(' ');
            }
          }
        }
      }
    }
</jalios:foreach>
    return sb.toString();
  }
<% } %>
  
<%-- ** WYSIWYG ************************************* --%>
<% if (isPublicationType) { %>
  @Override
  public String getAllWysiwygText() {
<jalios:if predicate='<%= isPublicationType %>'>
    StringBuffer sb = new StringBuffer(super.getAllWysiwygText());
</jalios:if>
<jalios:if predicate='<%= !isPublicationType %>'>
    StringBuffer sb = new StringBuffer();
</jalios:if>
    sb.ensureCapacity(500 * (<%= wysiwygFieldSet.size() %> + <%= wysiwygFieldMLSet.size() %> + <%= wysiwygArrayFieldSet.size() %> + <%= wysiwygArrayFieldMLSet.size() %> + <%= wysiwygListFieldSet.size() %> + <%= wysiwygListFieldMLSet.size() %>) );

    // Wiki fields containing JHTML
<jalios:foreach collection="<%= wikiFieldSet %>" name="itName" type="String">
    if (<%= itName %> != null && JHTMLUtils.isJHTML(null, <%= itName %>)) {
      sb.append(<%= itName %>); sb.append(' ');
    }
</jalios:foreach>

<jalios:foreach collection="<%= wikiFieldMLSet %>" name="itName" type="String">
    if (<%= itName %> != null && JHTMLUtils.isJHTML(null, <%= itName %>)) {
      sb.append(<%= itName %>); sb.append(' '); 
    }
    if (<%= itName %>ML != null) {
      for (String str : <%= itName %>ML.values()) {
        if (str != null && JHTMLUtils.isJHTML(null, str)) {
          sb.append(str); sb.append(' ');
        }
      }
    }
</jalios:foreach>

<jalios:foreach collection="<%= wikiArrayFieldSet %>" name="itName" type="String">
    for(int i=0; <%= itName %> != null && i < <%= itName %>.length; i++) {
      if (<%= itName %>[i] != null && JHTMLUtils.isJHTML(null, <%= itName %>[i])) {
        sb.append(<%= itName %>[i]); sb.append(' ');
      }
    }
</jalios:foreach>

<jalios:foreach collection="<%= wikiArrayFieldMLSet %>" name="itName" type="String">
    for(int i=0; <%= itName %> != null && i < <%= itName %>.length; i++) {
      if (<%= itName %>[i] != null && JHTMLUtils.isJHTML(null, <%= itName %>[i])) {
        sb.append(<%= itName %>[i]); sb.append(' ');
      }
    }
    if (<%= itName %>ML != null) {
      for (String[] strArray : <%= itName %>ML.values()) {
        for(int i=0; strArray != null && i < strArray.length; i++) {
          if (strArray[i] != null && JHTMLUtils.isJHTML(null, strArray[i])) {
           sb.append( strArray[i]); sb.append(' ');
          }
        }
      }
    }
</jalios:foreach>

<jalios:foreach collection="<%= wikiListFieldSet %>" name="itName" type="String">
    if (<%= itName %> != null) {
      for (String str : <%= itName %>) {
        if (str != null && JHTMLUtils.isJHTML(null, str)) {
          sb.append(str); sb.append(' ');
        }
      }
    }
</jalios:foreach>

<jalios:foreach collection="<%= wikiListFieldMLSet %>" name="itName" type="String">
    if (<%= itName %> != null) {
      for (String str : <%= itName %>) {
        if (str != null && JHTMLUtils.isJHTML(null, str)) {
          sb.append(str); sb.append(' ');
        }
      }
    }
    if (<%= itName %>ML != null) {
      for (List<String> strList : <%= itName %>ML.values()) {
        if (strList != null) {
          for (String str : strList) {
            if (str != null && JHTMLUtils.isJHTML(null, str)) {
              sb.append(str); sb.append(' ');
            }
          }
        }
      }
    }
</jalios:foreach>

   // Wysiwyg fields
<jalios:foreach collection="<%= wysiwygFieldSet %>" name="itName" type="String">
    if (<%= itName %> != null) {
      sb.append(<%= itName %>); sb.append(' ');
    }
</jalios:foreach>

<jalios:foreach collection="<%= wysiwygFieldMLSet %>" name="itName" type="String">
    if (<%= itName %> != null) {
      sb.append(<%= itName %>); sb.append(' '); 
    }
    if (<%= itName %>ML != null) {
      for (String str : <%= itName %>ML.values()) {
        if (str != null) {
          sb.append(str); sb.append(' ');
        }
      }
    }
</jalios:foreach>

<jalios:foreach collection="<%= wysiwygArrayFieldSet %>" name="itName" type="String">
    for(int i=0; <%= itName %> != null && i < <%= itName %>.length; i++) {
      if (<%= itName %>[i] != null) {
        sb.append(<%= itName %>[i]); sb.append(' ');
      }
    }
</jalios:foreach>

<jalios:foreach collection="<%= wysiwygArrayFieldMLSet %>" name="itName" type="String">
    for(int i=0; <%= itName %> != null && i < <%= itName %>.length; i++) {
      if (<%= itName %>[i] != null) {
        sb.append(<%= itName %>[i]); sb.append(' ');
      }
    }
    if (<%= itName %>ML != null) {
      for(String[] strArray : <%= itName %>ML.values()) {
        for(int i=0; strArray != null && i < strArray.length; i++) {
          if (strArray[i] != null) {
           sb.append( strArray[i]); sb.append(' ');
          }
        }
      }
    }
</jalios:foreach>

<jalios:foreach collection="<%= wysiwygListFieldSet %>" name="itName" type="String">
    if (<%= itName %> != null) {
      for (String str : <%= itName %>) {
        if (str != null) {
          sb.append(str); sb.append(' ');
        }
      }
    }
</jalios:foreach>

<jalios:foreach collection="<%= wysiwygListFieldMLSet %>" name="itName" type="String">
    if (<%= itName %> != null) {
      for (String str : <%= itName %>) {
        if (str != null) {
          sb.append(str); sb.append(' ');
        }
      }
    }
    if (<%= itName %>ML != null) {
      for (List<String> strList : <%= itName %>ML.values()) {
        if (strList != null) {
          for (String str : strList) {
            if (str != null) {
              sb.append(str); sb.append(' ');
            }
          }
        }
      }
    }
</jalios:foreach>
    return sb.toString();
  }
<% } %>
  
<%-- ** CATEGORY FIELD ************************************* --%>
<jalios:foreach collection="<%= categoryFieldEntryList %>" name="itFieldEntry" type="TypeFieldEntry">
<%
  String name = itFieldEntry.getName();
  String root = itFieldEntry.getRoot();
  String nameCap = itFieldEntry.getNameCap();
  boolean isDisplayRoot = itFieldEntry.isDisplayRoot();
%>
<jalios:if predicate='<%= isPublicationType %>'>
  public TreeSet<Category> get<%= nameCap %>(Member member) {
    return getDescendantCategorySet(channel.getCategory("<%= root %>"), <%= isDisplayRoot %>, member);
  }
  public Category getFirst<%= nameCap %>(Member member) {
    return getFirstDescendantCategory(channel.getCategory("<%= root %>"), <%= isDisplayRoot %>, member);
  }
</jalios:if>
<jalios:if predicate='<%= !isPublicationType %>'>
  public TreeSet<Category> get<%= nameCap %>(Member member) {
    if (extendedData != null && extendedData instanceof Publication) {
      return ((Publication)extendedData).getDescendantCategorySet(channel.getCategory("<%= root %>"), <%= isDisplayRoot %>, member);
    }
    return null;
  }
  public Category getFirst<%= nameCap %>(Member member) {
    if (extendedData != null && extendedData instanceof Publication) {
      return ((Publication)extendedData).getFirstDescendantCategory(channel.getCategory("<%= root %>"), <%= isDisplayRoot %>, member);
    }
    return null;
  }
</jalios:if>

</jalios:foreach>

<%-- ** LINK DATA SET ************************************* --%>
<% if (isPublicationType) { %>
  @Override
  public <T extends Data> TreeSet<T> getLinkDataSet(Class<T> clazz) {
    if (clazz == null) {
      return Util.emptyTreeSet();
    }
    TreeSet<T> set = new TreeSet<>();
<jalios:foreach collection='<%= linkSet %>' type='String' name='itFieldGetter'>
    JcmsUtil.addData(set, clazz, <%= itFieldGetter %>);
</jalios:foreach>
    return set;
  }
<% } %>

<%-- ** TREE NODE IMPLEMENTATION ************************************* --%>
<jalios:if predicate='<%= isTreeNode %>'>
  
  // ----------------------------------------------------------------------
  // TreeNode implementation
  // ----------------------------------------------------------------------

  @Override
  public Collection<? extends TreeNode> getTreeChildren() {
<% if (treeChildTypeName != null) { %>
    return getLinkIndexedDataSet(<%= treeChildTypeName %>.class, "<%= treeChildFieldName %>");
<% } else { %>
    return Util.emptyTreeSet();
<% } %>
  }
  
  public TreeNode getTreeParent() {
<% if (treeParentField != null) { %>
    return get<%= Util.recapitalize(treeParentFieldName) %>();
<% } else { %>
    return null;
<% } %>
  }

</jalios:if>

<%-- ** DATA CONTROLLER ************************************* --%>
  // ----------------------------------------------------------------------
  // DataController
  // ----------------------------------------------------------------------  
<jalios:foreach collection="<%= fieldEntryList %>" name="itFieldEntry" type="TypeFieldEntry">
<%
  Element xmlField = itFieldEntry.getXmlElement();
  String type = itFieldEntry.getType();
  String name = itFieldEntry.getName();
  String nameCap = itFieldEntry.getNameCap();
  String label = "channel.getTypeFieldLabel(this, \"" + name + "\")";
  String pattern = Util.escapeJavaStringChar(xmlField.getAttributeValue("pattern"));
  String editor = itFieldEntry.getEditor();
  boolean escapeHtml = itFieldEntry.escapeHtml();
  boolean checkHtml = Util.getString(xmlField.getAttributeValue("checkHtml"), "true").equals("true");
  checkHtml = checkHtml && (editor.equals("wysiwyg") || (!escapeHtml && (editor.equals("textfield") || editor.equals("textarea"))));
  boolean isFieldML = itFieldEntry.isFieldML();
%>
<jalios:if predicate='<%= Util.notEmpty(pattern) %>'>
  static Pattern _<%= name %>Pattern;
  static {
    try {
      _<%= name %>Pattern = (new Perl5Compiler()).compile("<%= pattern %>", Perl5Compiler.CASE_INSENSITIVE_MASK);
    }
    catch(org.apache.oro.text.regex.MalformedPatternException ex) {
      // Empty
    }
  }
  
  public boolean checkPattern<%= nameCap %>() {
<jalios:if predicate='<%= itFieldEntry.isTypeScalar() %>'>
    if (Util.notEmpty(<%= name %>) && !(new Perl5Matcher()).matches(<%= name %>, _<%= name %>Pattern)) {
      return false; 
    }
<jalios:if predicate='<%= isFieldML %>'>
    if (Util.notEmpty(<%= name %>ML)) {
      for (String str : ((Map<String,String>)<%= name %>ML).values()) {
        if (Util.notEmpty(str) && !(new Perl5Matcher()).matches(str, _<%= name %>Pattern)) {
          return false; 
        }
      }
    }
</jalios:if>
</jalios:if>
<jalios:if predicate='<%= !itFieldEntry.isTypeScalar() %>'>
    if (Util.notEmpty(<%= name %>)) {
      for (String str: <%= name %>) {
        if (Util.notEmpty(str) && !(new Perl5Matcher()).matches(str, _<%= name %>Pattern)) {
          return false;
        }
      }
    }
<jalios:if predicate='<%= isFieldML %>'>
    if (Util.notEmpty(<%= name %>ML)) {
      for (String[] values : ((Map<String,String[]>)<%= name %>ML).values()) {
        if (Util.notEmpty(values)) {
          for (String str : values) {
            if (Util.notEmpty(str) && !(new Perl5Matcher()).matches(str, _<%= name %>Pattern)) {
              return false;
            }
          }
        }
      }
    }
</jalios:if>
</jalios:if>
    return true;
  }
  
</jalios:if>

<jalios:if predicate='<%= checkHtml %>'>
  public ControllerStatus checkHtml<%= nameCap %>() {
    ControllerStatus status = JcmsUtil.checkHtml(<%= name %>, <%= label %>);
    if (status.hasFailed()) {
      return status;
    }
<% if (isFieldML) { %>
    status = JcmsUtil.checkHtml(<%= name %>ML, <%= label %>);
    if (status.hasFailed()) {
      return status;
    }
<% } %>
    return ControllerStatus.OK;
  }
  
</jalios:if>
</jalios:foreach>

  public ControllerStatus checkIntegrity() {
    
    ControllerStatus status = super.checkIntegrity();
    if (status.hasFailed()) {
      return status;
    }
    
<jalios:foreach collection="<%= fieldEntryList %>" name="itFieldEntry" type="TypeFieldEntry">
<%
  Element xmlField = itFieldEntry.getXmlElement();
  String type = itFieldEntry.getType();
  String name = itFieldEntry.getName();
  String nameCap = itFieldEntry.getNameCap();
  String label = "channel.getTypeFieldLabel(this, \"" + name + "\")";
  String editor = itFieldEntry.getEditor();
  String pattern = Util.escapeJavaStringChar(xmlField.getAttributeValue("pattern"));
  String minValue = xmlField.getAttributeValue("minValue");
  String maxValue = xmlField.getAttributeValue("maxValue");
  String root = itFieldEntry.getRoot();
  boolean displayRoot = Util.getString(xmlField.getAttributeValue("displayRoot"), "false").equals("true");
  boolean escapeHtml = itFieldEntry.escapeHtml();
  boolean checkHtml = Util.getString(xmlField.getAttributeValue("checkHtml"), "true").equals("true");
  checkHtml = checkHtml && (editor.equals("wysiwyg") || (!escapeHtml && (editor.equals("textfield") || editor.equals("textarea"))));
  boolean isFieldML = itFieldEntry.isFieldML();
  boolean isWikiOrWysiwyg = itFieldEntry.isFieldWiki() || itFieldEntry.isWysiwyg();
  String isEmptyMethodName = isWikiOrWysiwyg ? "JHTMLUtils.isEmpty": "Util.isEmpty";
  boolean isEmptyMethodNeedRecursionParam = !isWikiOrWysiwyg;
%>
<%-- **   STRING ************* --%>
<jalios:if predicate='<%= type.equals("String") && requiredFieldNameSet.contains(name) %>'>
    if (<%= isEmptyMethodName %>(<% if (isFieldML) { %>getFieldInMainLanguage(<%= name %>, <%= name %>ML)<% } else { %><%= name %><% } %>)) {
      status = new ControllerStatus();
      status.setProp("msg.edit.empty-field<%= isFieldML ? "ml" : "" %>", <%= label %>, <%= isFieldML ? "new LangProperty(\"lang.\" + getMainLanguage())" : "null" %>);
      return status;
    }
</jalios:if>

<%-- **   STRING[] ************* --%>
<jalios:if predicate='<%= (type.equals("String[]") || type.equals("List<String>") || type.equals("Set<String>")) && requiredFieldNameSet.contains(name) %>'>
    if (<%= isEmptyMethodName %>((<%= type %>) <% if (isFieldML) { %>getFieldInMainLanguage(<%= name %>, <%= name %>ML)<% } else { %><%= name %><% } %><% if (isEmptyMethodNeedRecursionParam) { %>, true<% }%>)) {
      status = new ControllerStatus();
      status.setProp("msg.edit.empty-field<%= isFieldML ? "ml" : "" %>", <%= label %>, <%= isFieldML ? "new LangProperty(\"lang.\" + getMainLanguage())" : "null" %>);
      return status;
    }
</jalios:if>

<%-- ** Email ************* --%>
<% if ("email".equals(editor)) { %>
    if (!Util.isValidEmail(<%= name %>)) {
      status = new ControllerStatus();
      status.setProp("msg.edit.bad-email", <%= label %>);
      return status;
    }
<%   if (isFieldML) { %>
    if (!Util.isValidEmail(<%= name %>ML)) {
      status = new ControllerStatus();
      status.setProp("msg.edit.bad-email", <%= label %>);
      return status;
    }
<%   } %>
<%-- ** URL ************* --%>
<% } else if ("url".equals(editor)) { %>
    if (!Util.isValidUrl(<%= name %>)) {
      status = new ControllerStatus();
      status.setProp("msg.edit.bad-url", <%= label %>);
      return status;
    }
<%   if (isFieldML) { %>
    if (!Util.isValidUrl(<%= name %>ML)) {
      status = new ControllerStatus();
      status.setProp("msg.edit.bad-url", <%= label %>);
      return status;
    }
<%   } %>
<%-- **   PATTERN (STRING / STRING[]) ************* --%>
<% } else if (itFieldEntry.getTypeShort().equals("String") && Util.notEmpty(pattern)) { %>
    if (!checkPattern<%= nameCap %>()) {
      status = new ControllerStatus();
      status.setProp("msg.edit.bad-field-format", <%= label %>, "<%= pattern %>");
      return status;
    }
<% } %>


<%-- **   HTML FIELD (WYSIWYG / TEXTFIELD / TEXTAREA) ************* --%>
<jalios:if predicate='<%= checkHtml %>'>
    status = checkHtml<%= nameCap %>();
    if (status.hasFailed()) {
      return status;
    }
</jalios:if>

<%-- **   LINK / MEMBER / GROUP / DATE ************* --%>
<jalios:if predicate='<%= itFieldEntry.isTypeScalar() && (itFieldEntry.isAnyLink() || itFieldEntry.isTypeDate()) %>'>
<jalios:if predicate='<%= requiredFieldNameSet.contains(name) %>'>
<% if (type.equals("com.jalios.jcms.FileDocument")) { %>
    if (Util.isEmpty(<% if (isFieldML) { %>getFieldInMainLanguage(<%= name %>, <%= name %>ML)<% } else { %>get<%= nameCap %>()<% } %>)) {
<% } else { %>
    if (get<%= nameCap %>() == null) {
<% } %>
      status = new ControllerStatus();
      status.setProp("msg.edit.empty-field", <%= label %>);
      return status;
    }
</jalios:if>
</jalios:if>

<%-- **   LINK[] / MEMBER[] / GROUP[] / DATE[] ************* --%>
<jalios:if predicate='<%= itFieldEntry.isTypeMV() && (itFieldEntry.isAnyLink() || itFieldEntry.isTypeDate() || itFieldEntry.isTypeDateArray()) %>'>
<jalios:if predicate='<%= requiredFieldNameSet.contains(name) %>'>
<% if (type.equals("com.jalios.jcms.FileDocument[]")) { %>
    if (Util.isEmpty(<% if (isFieldML) { %>getFieldInMainLanguage(<%= name %>, <%= name %>ML)<% } else { %>get<%= nameCap %>()<% } %>)) {
      status = new ControllerStatus();
      status.setProp("msg.edit.empty-field", <%= label %>);
      return status;
    }
<% } else { %>
    status = JcmsUtil.checkFieldRequired(this, "<%= name %>", get<%= nameCap %>());
    if (status.hasFailed()) {
      return status;
    }

<% } %>
</jalios:if>
</jalios:if>

<%-- **   INT / LONG / DOUBLE ************* --%>
<jalios:if predicate='<%= type.equals("int") || type.equals("long") || type.equals("double") %>'>
<jalios:if predicate='<%= Util.notEmpty(minValue) %>'>
    if (<%= name %> < <%= minValue %> ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.lesser-number", <%= label %>, "<%= minValue %>");
      return status;      
    }
</jalios:if>
<jalios:if predicate='<%= Util.notEmpty(maxValue) %>'>
    if (<%= name %> > <%= maxValue %> ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.greater-number", <%= label %>, "<%= maxValue %>");
      return status;      
    }
</jalios:if>
</jalios:if>

<%-- **   INT[] / LONG[] / DOUBLE[] ************* --%>
<jalios:if predicate='<%= type.equals("int[]") || type.equals("long[]") || type.equals("double[]") %>'>
<jalios:if predicate='<%= Util.notEmpty(minValue) %>'>
    if (<%= name %> != null) {
      for(int i = 0; i < <%= name %>.length; i++) {
        if (<%= name %>[i] < <%= minValue %> ) {
          status = new ControllerStatus();
          status.setProp("msg.edit.lesser-number", <%= label %>, "<%= minValue %>");
          return status;      
        }
      } 
    }
</jalios:if>
<jalios:if predicate='<%= Util.notEmpty(maxValue) %>'>
    if (<%= name %> != null) {
      for(int i = 0; i < <%= name %>.length; i++) {
        if (<%= name %>[i] > <%= maxValue %> ) {
          status = new ControllerStatus();
          status.setProp("msg.edit.greater-number", <%= label %>, "<%= maxValue %>");
          return status;      
        }
      } 
    }
</jalios:if>
</jalios:if>

<%-- **   CATEGORY ************* --%>
<jalios:if predicate='<%= editor.equals("category") && requiredFieldNameSet.contains(name) %>'>
    {
      Category fieldRootCat = channel.getCategory("<%= root %>");
      fieldRootCat = fieldRootCat != null ? fieldRootCat : channel.getRootCategory();
<% if (displayRoot) { %>
      Set catSet = new TreeSet(fieldRootCat.getDescendantSet());
      catSet.add(fieldRootCat);
<% } else { %>
      Set catSet = fieldRootCat.getDescendantSet();
<% } %>
      if (Util.interSet(<%= isPublicationType ? "getCategorySet()" : name %>, catSet).isEmpty()) {
        status = new ControllerStatus();
        status.setProp("msg.edit.empty-field", <%= label %>);
        return status;
      }
    }
</jalios:if>

</jalios:foreach>
    return ControllerStatus.OK;
  }
  
<%-- ** getExternalLinkSet ************************************* --%>
<% if (isPublicationType && hasUrlField) { %>
  public Set<String> getExternalLinkSet() {
    Set<String> set = super.getExternalLinkSet();
<jalios:foreach collection="<%= urlFieldSet %>" name="itName" type="String">   
    if (Util.notEmpty(<%= itName %>)) {
      set.add(<%= itName %>);
    }
</jalios:foreach>
<jalios:foreach collection="<%= urlArrayFieldSet %>" name="itName" type="String">   
    if (Util.notEmpty(<%= itName %>)) {
      set.addAll(Util.stringArrayToCleanSet(<%= itName %>));
    }
</jalios:foreach>
<jalios:foreach collection="<%= urlFieldMLSet %>" name="itName" type="String">   
    if (Util.notEmpty(<%= itName %>)) {
      set.add(<%= itName %>);
    }
    if (<%= itName %>ML != null) {
      set.addAll(Util.collectionToCleanSet(<%= itName %>ML.values()));
    }
</jalios:foreach>
<jalios:foreach collection="<%= urlArrayFieldMLSet %>" name="itName" type="String">   
    if (<%= itName %> != null) {
      set.addAll(Util.stringArrayToCleanSet(<%= itName %>));
    }
    if (<%= itName %>ML != null) {
      for (String[] itValue : <%= itName %>ML.values()) {
        if (itValue != null) {
          set.addAll(Util.stringArrayToCleanSet(itValue)); 
        }
      }
    }
</jalios:foreach>

    String prefixUrl = channel.getUrl();
    for (Iterator<String> it = set.iterator(); it.hasNext();) {
      String url = it.next();
      if (url.startsWith(prefixUrl)) {
        it.remove();
      }
    }
    
    return set;
  }
<% } %>


<%-- ** initializeDBDataCollections ************************************* --%>
<% if (hasDBDataCollection) { %>

  // ----------------------------------------------------------------------
  // initializeDBDataCollections
  // ----------------------------------------------------------------------  
  @Override
  public void initializeDBDataCollections() { 
    super.initializeDBDataCollections();
<%   for(TypeFieldEntry entry: fieldEntryList) {
       if (!entry.isTypeCollection()) {
         continue;
       }
       String name = entry.getName();
       if (entry.isAnyLink()) {
         name += "Id";
       }
       boolean isLinkFromDBType = isDBType && entry.isAnyLink();
       if (isLinkFromDBType && entry.isTypeCollection()) { 
         String collection = entry.isTypeList() ? "List" : "Set"; %>
    if (<%= entry.getName() %><%= collection %>Helper != null) { <%= entry.getName() %><%= collection %>Helper.initializeHibernateCollection(); }  
<%     } else { %>
    Hibernate.initialize(<%= name %>);
<%     } %>
<%   } %>
  }
  

  // ----------------------------------------------------------------------
  // cloneDBDataCollections
  // ----------------------------------------------------------------------  
  @Override
  public void cloneDBDataCollections() { 
    super.cloneDBDataCollections();
<%   for(TypeFieldEntry entry: fieldEntryList) {
       if (!entry.isTypeCollection()) {
         continue;
       }
       String name = entry.getName();
       if (entry.isAnyLink()) {
         name += "Id";
       }
       
       boolean isLinkFromDBType = isDBType && entry.isAnyLink();
       if (isLinkFromDBType && entry.isTypeCollection()) { 
         String collection = entry.isTypeList() ? "List" : "Set"; %>
    if (<%= entry.getName() %><%= collection %>Helper != null) { <%= entry.getName() %><%= collection %>Helper = <%= entry.getName() %><%= collection %>Helper.copy(this::set<%= entry.getNameCap() %>); }  
<%     } else { 
       String collType = entry.isTypeList() ? "ArrayList" : "HashSet";
%>
    if (<%= name %> != null) { <%= name %> = new <%= collType %><>(<%= name %>); }
<%     } %>
<%   } %>  
  }
<% } %>

<% if (!hybridCollectionList.isEmpty()) { %>
  // ----------------------------------------------------------------------
  // splitHybridCollections
  // ----------------------------------------------------------------------
  @Override
  protected void splitHybridCollections(Data previousData) {
    super.splitHybridCollections(previousData);
    <%= className %> previous = (<%= className %>)previousData;

<%   for(TypeFieldEntry entry: hybridCollectionList) {
       String name = entry.getName();
       String nameCap = entry.getNameCap();       
%>  
    if (previous == null || previous.<%= name %> != <%= name %>) {
      <%= name %>DBID = computeDBIDArray(<%= name %>);
    }
<%   } %>
  }
  
  // ----------------------------------------------------------------------
  // cleanHybridCollections
  // ----------------------------------------------------------------------
  @Override
  protected void cleanHybridCollections() {
    super.cleanHybridCollections();

<%   for(TypeFieldEntry entry: hybridCollectionList) {
       String name = entry.getName();
%>
    cleanHybridCollection(<%= name %>);
<%   } %>
  }
<% } %>
  
<%-- ** WorkCopy ************************************* --%>
<% if (isPublicationType) { %>

  // ----------------------------------------------------------------------
  // WorkCopy
  // ----------------------------------------------------------------------  
  protected void prepareMergeCopy(Publication mergeCopy) {
    super.prepareMergeCopy(mergeCopy);  
<jalios:foreach collection="<%= fieldEntryList %>" name="entry" type="TypeFieldEntry">
<% if (!"category".equals(entry.getEditor()) && !("super".equals(entry.getType()))) { %>
<% String nameCap = entry.getNameCap(); %>
    ((<%= className %>)mergeCopy).set<%= nameCap %>(get<%= nameCap %>());
<% if (entry.isFieldML()) { %>
    ((<%= className %>)mergeCopy).set<%= nameCap %>ML(JcmsUtil.getMergedMLMap(get<%= nameCap %>ML(), ((<%= className %>)mergeCopy).get<%= nameCap %>ML()));
<% } %>
<% } %>
</jalios:foreach>
  }
<% } %>

<%-- ** performCreate() / performUpdate() ************************************* --%>
<% if (isDBType) { %>
  @Override 
  public void performCreate(Member mbr, Map context) {
<jalios:foreach collection="<%= objectFieldEntryList %>" name="itField" type="TypeFieldEntry">
<%
  if (itField.isTextfield()) {
    String name = itField.getName();
%>
    <%= name %> = Util.truncateVarchar(<%= name %>);
<% } %>
</jalios:foreach>
    super.performCreate(mbr, context);
  }
  
  @Override 
  public void performUpdate(Member mbr, Map context) {
<jalios:foreach collection="<%= objectFieldEntryList %>" name="itField" type="TypeFieldEntry">
<%
  if (itField.isTextfield()) {
    String name = itField.getName();
%>
    <%= name %> = Util.truncateVarchar(<%= name %>);
<% } %>
</jalios:foreach>
    super.performUpdate(mbr, context);
  }
<% } %>

}
<% out.flush(); %>


