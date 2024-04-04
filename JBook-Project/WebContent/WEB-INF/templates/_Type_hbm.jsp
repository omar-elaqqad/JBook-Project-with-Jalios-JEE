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
// session.setAttribute("typeElt", channel.getTypeEntry(generated.DBComment.class).getXmlElement());

Element typeElt = (Element)session.getAttribute("typeElt");
String className = typeElt.getAttributeValue("name");

int limit = 30; // Oracle tables are limited to 30 chars

String tableName = typeElt.getAttributeValue("tableName");
if (Util.isEmpty(tableName)) {
  tableName = className;
}

tableName = tableName.toUpperCase();

String table = truncate("G_" + tableName, limit); 

String tablePrefix = table + "_"; 

String indexPrefix = "IG_" + tableName + "_";

//Get the fields (and the inherited fields)                             
ArrayList fieldList = new ArrayList();
TypeUtil.buildInheritedFieldList(typeElt, fieldList, true);

boolean isForm = typeElt.getAttribute("formAuthor") != null;

boolean isContent = TypeUtil.isSubTypeOf(typeElt, com.jalios.jcms.Content.class);
boolean isUserContent = TypeUtil.isSubTypeOf(typeElt, com.jalios.jcms.UserContent.class);

boolean isDBFileDocument = TypeUtil.isSubTypeOf(typeElt, com.jalios.jcms.DBFileDocument.class);

boolean openRole = Util.toBoolean(typeElt.getAttributeValue("openRole"), false);

Element titleElt = typeElt.getChild("title");
boolean titleML = Util.toBoolean(titleElt.getAttributeValue("ml"), false);
if (!titleML) {
  titleML = Util.toBoolean(typeElt.getAttributeValue("titleML"), false);
}
boolean hasMLField = titleML;

boolean addReadRights = isContent || isForm;
boolean addUpdateRights = isContent;
boolean addVersion = isContent;
boolean addFriendlyURLSet = isContent;
boolean addAttachWorkspaceSet = isContent;

String[] customInterfaces = Util.split(Util.getString(typeElt.getAttributeValue("interfaces"), ""), ", ");

if (!addVersion) {
  if (Util.toBoolean(typeElt.getAttributeValue("revision"), false)) {
	  addVersion = true;
  } else {
	  for(String customInterface: customInterfaces) {
	    if (customInterface.endsWith(".HistorizedDBData")) {
	      addVersion = true;
	      break;
	    }
	  }
  }
}

boolean addCategories = isContent;
if (!addCategories) {
  for(String customInterface: customInterfaces) {
    if (customInterface.endsWith(".CategorizedDBData")) {
      addCategories = true;
      break;
    }
  }
  
  TypeFieldEntry[] allTFE = channel.getAllTypeFieldEntries(TypeProcessor.PACKAGE_NAME + "." + className);
  for(TypeFieldEntry fieldEntry: allTFE) {
    String editor = fieldEntry.getEditor();    
    if ("category".equals(editor)) {
      addCategories = true;
      break;      
    }
  }
}

boolean addReaderTracker = isContent;
if (!addReaderTracker) {
  for(String customInterface: customInterfaces) {
    if (customInterface.endsWith(".TrackedDBData")) {
      addReaderTracker = true;
      break;
    }
  }  
}
List fieldEntryList = Arrays.asList(channel.getAllTypeFieldEntries(TypeProcessor.PACKAGE_NAME + "." + className));
%>
  <class name="generated.<%= className %>" table="<%= table %>">
    <cache usage="read-write" />  
    <id name="rowId" column="rowId">
      <generator class="native"/>
    </id>
    <property name="cdate" not-null="true" index="<%= truncate(indexPrefix + "CDATE", limit)  %>" />
    <property name="mdate" not-null="true" index="<%= truncate(indexPrefix + "MDATE", limit)  %>" />
    <property name="authorId" length="32" index="<%= truncate(indexPrefix + "AUTHORID", limit)  %>" />
    
    <property name="pstatus" not-null="true" index="<%= truncate(indexPrefix + "PSTATUS", limit) %>" />
    <property name="workspaceId" not-null="true" length="32" index="<%= truncate(indexPrefix + "WSID", limit) %>" />
    
    <property name="pdate"  index="<%= truncate(indexPrefix + "PDATE", limit)  %>" />
    <property name="edate" />
    <property name="adate" />
    <property name="title" />
    <property name="workflowId" index="<%= truncate(indexPrefix + "WFID", limit) %>" />
<% if (addVersion) { %>
    <property name="udate" />
    <property name="majorVersion" />
    <property name="minorVersion" />
<% } %>
<% if (addReadRights) { %>
    <property name="hasNoReadRights" index="<%= truncate(indexPrefix + "HASNOREADRIGHTS", limit) %>" />
<% } %>
<% if (addReaderTracker) { %>
    <property name="tracked" />
    <property name="readerCount" index="<%= truncate(indexPrefix + "READERCOUNT", limit) %>" />
<% } %>
<% if(isUserContent || isContent){ %>
    <property name="voteCount" not-null="false" index="<%= truncate(indexPrefix + "VOTECOUNT", limit) %>" />
    <property name="voteScore" not-null="false" index="<%= truncate(indexPrefix + "VOTESCORE", limit) %>" />
<% } %>
<% if(isContent){ %>    
    <property name="mainInstanceId" not-null="false" length="32" index="<%= truncate(indexPrefix + "MAINSTID", limit) %>" />    
    <property name="mergeId" length="32" />    
    <property name="mergeDate" />
    <property name="hasAttachWS" index="<%= truncate(indexPrefix + "HATHWS", limit) %>"  />
<% } %>
    <property name="opAuthorId" length="32" index="<%= truncate(indexPrefix + "OPAUTHORID", limit) %>"  />
    <property name="readAck" />
<% if (addUpdateRights) { %>
    <property name="restrictUpdateRights" />
<% } %>
<% if (isDBFileDocument) { %>
    <property name="filename" index="<%= truncate(indexPrefix + "FILENAME", limit) %>" />
    <property name="originalFilename" />
    <property name="contentType"  index="<%= truncate(indexPrefix + "CONTENTTYPE", limit) %>"  />
    <property name="remoteUri" />
    <property name="uploadDate" />
    <property name="pdfUploadDate" />
<% } %>    
<% if (isForm) { %>
    <property name="submitMemberId" index="<%= truncate(indexPrefix + "SUBMID", limit) %>" />
    <property name="submitRemoteAddr" />
<% } %>
<% if (openRole) { %>
    <property name="roleMapStr" type="text" length="65536" />
<% } %>
<% if (titleML) { %>
    <property name="titleMLE" type="text" length="1048576" />
<% } %>
<% if (hasMLField) { %>
    <property name="mainLanguage" />
<% } %>


<jalios:foreach collection="<%= fieldEntryList %>" name="itField" type="TypeFieldEntry">
<% 
String name       = itField.getName();
String editor     = itField.getEditor();
String type       = itField.getType();
boolean isAnyLink = itField.isAnyLink();

boolean isLargeText = "textarea".equals(editor) || "wysiwyg".equals(editor);

boolean isML = itField.isFieldML();

hasMLField = isML || hasMLField;

String indexName = truncate(indexPrefix + name.toUpperCase(), limit);

String attributes = "";
if (isLargeText) { 
  attributes = " type=\"text\" length=\"65536\"";
}
else if (isAnyLink) {
  attributes = " length=\"64\" index=\"" + indexName + "\"";
}

String propertyName = isAnyLink ? name + "Id" : name;

if (!editor.equals("category")) {
%>
<%-- SCALAR --%>
<%   if (itField.isTypeScalar()) { %>
    <property name="<%= propertyName %>"<%= attributes %> />
    <% if(editor.equals("sqlquery")) { %>
    <property name="<%= propertyName %>DataSource" />
    <property name="<%= propertyName %>MaxRows" />
    <% } %>
    
<%-- LIST/SET --%>
<%   } else { %>
<%
String collection = itField.isTypeList() ? "list" : "set";
String collectionTable = truncate(tablePrefix + name.toUpperCase(), limit);
String collectionType = isLargeText ? "text" : itField.getCollectionTypeMapping();
%>
    <<%= collection %> name="<%= propertyName %>" table="<%= collectionTable %>">
      <cache usage="read-write" />
      <key>
        <column name="ITEM_ID" index="<%= truncate(indexName + "_I", limit) %>"/>
      </key>      
<%     if (itField.isTypeList()) { %>
      <list-index column="POSITION" />
<%     } %>
      <element type="<%= collectionType %>"<%= isLargeText ? " length=\"65536\"" : "" %>>
        <column name="VALUE"<%= isAnyLink ? " length=\"64\" index=\"" + indexName + "\"" : "" %>/>
      </element>      
    </<%= collection %>>
<%   } %>

<%-- ML FIELD --%>
<%   if (isML) { %>
    <property name="<%= propertyName %>MLE" type="text" length="1048576" />
<%   } %>
<% } %>
</jalios:foreach>


<% if (addCategories) { %>
    
    <!--  COLLECTIONS FOR CATEGORIES -->
    <set name="catIdSet" table="<%= truncate(tablePrefix + "CATSET", limit) %>" lazy="true">
      <cache usage="read-write" />
      <key>
        <column name="ITEM_ID" index="<%= truncate(indexPrefix + "CATSET_I", limit) %>"/>
      </key>
      <element type="string">
        <column name="VALUE" length="64" index="<%= truncate(indexPrefix + "CATSET", limit) %>"/>
      </element>      
    </set>
    
    <set name="allCatIdSet" table="<%= truncate(tablePrefix + "ALLCATSET", limit) %>"  lazy="true">
      <cache usage="read-write" />
      <key>
        <column name="ITEM_ID" index="<%= truncate(indexPrefix + "ALLCATSET_I", limit) %>"/>
      </key>
      <element type="string">
        <column name="VALUE" length="64" index="<%= truncate(indexPrefix + "ALLCATSET", limit) %>"/>
      </element>      
    </set>
<% } %>

<% if (addReadRights) { %>
    
    <!--  COLLECTIONS FOR READ-RIGHTS -->
    <set name="authGrpIdSet" table="<%= truncate(tablePrefix + "AUTHGRPSET", limit) %>" lazy="true">
      <cache usage="read-write" />
      <key>
        <column name="ITEM_ID" index="<%= truncate(indexPrefix + "AUTHGRPSET_I", limit) %>"/>
      </key>
      <element type="string">
        <column name="VALUE" length="64" index="<%= truncate(indexPrefix + "AUTHGRPSET", limit) %>"/>
      </element>      
    </set>    
    
    <set name="authMbrIdSet" table="<%= truncate(tablePrefix + "AUTHMBRSET", limit) %>" lazy="true">
      <cache usage="read-write" />
      <key>
        <column name="ITEM_ID" index="<%= truncate(indexPrefix + "AUTHMBRSET_I", limit) %>"/>
      </key>
      <element type="string">
        <column name="VALUE" length="64" index="<%= truncate(indexPrefix + "AUTHMBRSET", limit) %>"/>
      </element>      
    </set>
<% } %>

<% if (addUpdateRights) { %>
    
    <!--  COLLECTIONS FOR UPDATE-RIGHTS -->
    <set name="updateGrpIdSet" table="<%= truncate(tablePrefix + "UPDATEGRPSET", limit) %>" lazy="true">
      <cache usage="read-write" />
      <key>
        <column name="ITEM_ID" index="<%= truncate(indexPrefix + "UPDATEGRPSET_I", limit) %>"/>
      </key>
      <element type="string">
        <column name="VALUE" length="64" index="<%= truncate(indexPrefix + "UPDATEGRPSET", limit) %>"/>
      </element>      
    </set>    
    
    <set name="updateMbrIdSet" table="<%= truncate(tablePrefix + "UPDATEMBRSET", limit) %>" lazy="true">
      <cache usage="read-write" />
      <key>
        <column name="ITEM_ID" index="<%= truncate(indexPrefix + "UPDATEMBRSET_I", limit) %>"/>
      </key>
      <element type="string">
        <column name="VALUE" length="64" index="<%= truncate(indexPrefix + "UPDATEMBRSET", limit) %>"/>
      </element>      
    </set>
<% } %>

<% if (addFriendlyURLSet) { %>
    
    <!--  COLLECTIONS FOR FRIENDLYURL -->
    <set name="dbFriendlyURLSet" table="<%= truncate(tablePrefix + "FURLSET", limit) %>">
      <cache usage="read-write" />
      <key>
        <column name="ITEM_ID" index="<%= truncate(indexPrefix + "FURLSET_I", limit) %>"/>
      </key>
      <element type="string">
        <column name="VALUE"/>
      </element>      
    </set>    
<% } %>

<% if (addAttachWorkspaceSet) { %>
    
    <!--  COLLECTIONS FOR attachWSIdSet -->
    <set name="attachWSIdSet" table="<%= truncate(tablePrefix + "AWSET", limit) %>">
      <cache usage="read-write" />
      <key>
        <column name="ITEM_ID" index="<%= truncate(indexPrefix + "AWSET_I", limit) %>"/>
      </key>
      <element type="string">
        <column name="VALUE"/>
      </element>      
    </set>    
<% } %>
  </class>
</hibernate-mapping>
