<?xml version="1.0"?>
<!DOCTYPE hibernate-mapping PUBLIC
        "-//Hibernate/Hibernate Mapping DTD 3.0//EN"
        "classpath://org/hibernate/hibernate-mapping-3.0.dtd">

<hibernate-mapping>
<%-- 
--%><%@ page contentType="text/plain; charset=UTF-8"%><%--
--%><%@ page buffer="none" autoFlush="true"%><%--
--%><%@ taglib uri="jcms.tld" prefix="jalios" %><%--
--%><%@ page import="com.jalios.util.*, java.io.*, java.util.*, java.text.*, java.net.*, org.jdom.*, com.jalios.jcms.*" %><%--
--%><%!
static private Map<String,String> truncatedMap = new HashMap<String,String>();

public String truncate(String str, int limit) {
  return Util.truncate(str, limit, truncatedMap);
}

%><%
request.setCharacterEncoding("UTF-8");

truncatedMap.clear();
  
final Channel channel = Channel.getChannel();

// Uncomment this to test template under JCMS without the need to restart
// session.setAttribute("typeElt", channel.getTypeEntry(generated.DBTestType.class).getXmlElement());

Element typeElt = (Element)session.getAttribute("typeElt");
String className = typeElt.getAttributeValue("name");
boolean isDBFileDocument = TypeUtil.isSubTypeOf(typeElt, com.jalios.jcms.DBFileDocument.class);
boolean openRole = Util.toBoolean(typeElt.getAttributeValue("openRole"), false);
Element titleElt = typeElt.getChild("title");
boolean titleML = Util.toBoolean(titleElt.getAttributeValue("ml"), false);
if (!titleML) {
  titleML = Util.toBoolean(typeElt.getAttributeValue("titleML"), false);
}
boolean hasMLField = titleML;

int limit = 30; // Oracle tables are limited to 30 chars

String revisionClassName = className + "Revision";

String tableName = typeElt.getAttributeValue("tableName");
if (Util.isEmpty(tableName)) {
  tableName = revisionClassName;
} else {
  tableName = tableName + "REVISION";
}
tableName = tableName.toUpperCase();

String table = truncate("G_" + tableName, limit); 

String tablePrefix = table + "_"; 

String indexPrefix = "IG_" + tableName + "_";


//Get the fields (and the inherited fields)                             
List fieldEntryList = new ArrayList(Arrays.asList(channel.getAllTypeFieldEntries(TypeProcessor.PACKAGE_NAME + "." + className)));
for(Iterator it = fieldEntryList.iterator(); it.hasNext();) {
  TypeFieldEntry itTFE = (TypeFieldEntry)it.next();
  String editor = itTFE.getEditor();
  if (Util.isEmpty(editor) || "category".equals(editor)) {
    it.remove();
  }
}
%>
  <class name="generated.<%= revisionClassName %>" table="<%= table %>">
    <cache usage="read-write" />  
    <id name="rowId" column="rowId">
      <generator class="native"/>
    </id>
    <property name="revDate" not-null="true" index="<%= truncate(indexPrefix + "REVDATE", limit)  %>" />
    <property name="revAuthorId" length="32" />
    <property name="revDataId" column="revDataId" not-null="true" index="<%= truncate(indexPrefix + "REVDATAID", limit)  %>" />
    <property name="revOp" column="revOp" />
    <property name="revDelegateId"/>    
    

    <property name="cdate" />
    <property name="mdate"  />
    <property name="authorId" length="32" />
    
    <property name="pstatus" />
    <property name="workspaceId" not-null="true" length="32" index="<%= truncate(indexPrefix + "WSID", limit)  %>" />
    <property name="pdate" />
    <property name="edate" />
    <property name="adate" />
    <property name="udate" />
    <property name="majorVersion" />
    <property name="minorVersion" />    
    <property name="tracked" />     
    <property name="mainInstanceId" not-null="false" length="32"  />
    <property name="mergeId" not-null="false" length="32" />
    <property name="mergeDate" />
    <property name="catIdSetSerial" type="text" length="65536" />
    <property name="authGrpIdSetSerial" type="text" length="65536" />
    <property name="authMbrIdSetSerial" type="text" length="65536" />       
    <property name="updateGrpIdSetSerial" type="text" length="65536" />
    <property name="updateMbrIdSetSerial" type="text" length="65536" />       
   
<% if (isDBFileDocument) { %>
    <property name="filename" />
    <property name="originalFilename" />
    <property name="contentType"  />
    <property name="remoteUri"  />
    <property name="uploadDate" />
<% } %>    
   
<% if (openRole) { %>
    <property name="roleMapStr" type="text" length="65536" />
<% } %>    
    <property name="title" />
    
<% if (titleML) { %>
    <property name="titleMLE" type="text" length="1048576" />
<% } %>


<jalios:foreach collection="<%= fieldEntryList %>" name="itField" type="TypeFieldEntry">
<% 
String name       = itField.getName();
String editor     = itField.getEditor();
String type       = itField.getType();
boolean isAnyLink = itField.isAnyLink();
boolean isScalar  = itField.isTypeScalar();
boolean isML      = itField.isFieldML();
hasMLField = isML || hasMLField;

boolean isLargeText = "textarea".equals(editor) || "wysiwyg".equals(editor);

String attributes = "";
if (isScalar) {
  if (isAnyLink) {
    attributes = " length=\"64\"";
  }
  if (isLargeText) { 
    attributes = " type=\"text\" length=\"65536\"";
  }
} else {
  attributes = " type=\"text\" length=\"65536\"";
}
String propertyName = isAnyLink ? name + "Id" : name;
%>
<%-- SCALAR --%>
<% if (isScalar) { %>
    <property name="<%= propertyName %>"<%= attributes %>/>
<%-- LIST/SET --%>
<% } else { %>
    <property name="<%= propertyName %>Serial"<%= attributes %>/>
<% } %>
<% if (isML) { %>
    <property name="<%= propertyName %>MLE" type="text" length="1048576" />
<% } %>

</jalios:foreach>
<% if (hasMLField) { %>
    <property name="mainLanguage" />
<% } %>
  </class>
</hibernate-mapping>
