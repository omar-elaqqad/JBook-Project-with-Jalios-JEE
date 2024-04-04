<%-- 
--%><%@ page contentType="text/plain; charset=UTF-8"%><%--
--%><%@ page buffer="none" autoFlush="true"%><%--
--%><%@ taglib uri="jcms.tld" prefix="jalios" %><%--
--%><%@ page import="com.jalios.util.*, java.io.*, java.util.*, java.text.*, java.net.*, org.jdom.*, com.jalios.jcms.*" %><%--
--%><%
  request.setCharacterEncoding("UTF-8");
  
final Channel channel = Channel.getChannel();

// Uncomment this to test template under JCMS without the need to restart
// session.setAttribute("typeElt", channel.getTypeEntry(generated.DBTestType.class).getXmlElement());

Element typeElt = (Element)session.getAttribute("typeElt");
String className = typeElt.getAttributeValue("name");
boolean isDBFileDocument = TypeUtil.isSubTypeOf(typeElt, com.jalios.jcms.DBFileDocument.class);

String revisionSuperclass = com.jalios.jcms.db.DBDataRevision.class.getName();
if (isDBFileDocument) {
revisionSuperclass = com.jalios.jcms.DBFileDocumentRevision.class.getName();    
}

String superclass = typeElt.getAttributeValue("superclass");

TypeFieldEntry[] typeFieldEntries = channel.getAllTypeFieldEntries(TypeProcessor.PACKAGE_NAME + "." + className);

List fieldEntryList = new ArrayList(Arrays.asList(typeFieldEntries));
for(Iterator it = fieldEntryList.iterator(); it.hasNext();) {
  TypeFieldEntry itTFE = (TypeFieldEntry)it.next();
  String editor = itTFE.getEditor();
  if (Util.isEmpty(editor) || "category".equals(editor)) {
    it.remove();
  }
}

boolean isAbstract = Util.toBoolean(typeElt.getAttributeValue("abstract"),false);
%>
package generated;

import java.util.*;

import com.jalios.jcms.*;
import com.jalios.jcms.db.*;
import com.jalios.jcms.mashup.*;
import com.jalios.util.*;

@SuppressWarnings({"unchecked", "unused"})
public class <%= className %>Revision extends <%= revisionSuperclass %> {

  public <%= className %>Revision() {
<% if (!isAbstract) { %>
    revisionData = new <%= className %>();
<% } %>
  }
  
  public <%= className %>Revision(<%= className %> data, int op) {
    super(data, op);
    revisionData = data;
  }
<jalios:foreach collection="<%= fieldEntryList %>" name="itField" type="TypeFieldEntry">
<% 
String nameCap    = itField.getNameCap();
String type       = itField.getType();
String typeShort  = itField.getTypeShort();
%>
<% if (itField.isTypeScalar()) { %>
  public <%= type %> get<%= nameCap %>() {
    return ((<%= className %>)revisionData).get<%= nameCap %>();
  }

  <% if ("int".equals(type)) { %>
  public void set<%= nameCap %>(Integer v) {
    ((<%= className %>)revisionData).set<%= nameCap %>(v == null ? 0 : v.intValue());
  }
  <% } else if ("long".equals(type)) { %>
  public void set<%= nameCap %>(Long v) {
    ((<%= className %>)revisionData).set<%= nameCap %>(v == null ? 0L : v.longValue());
  }  
  <% } else if ("double".equals(type)) { %>
  public void set<%= nameCap %>(Double v) {
    ((<%= className %>)revisionData).set<%= nameCap %>(v == null ? 0.0 : v.doubleValue());
  }  
  <% } else if ("boolean".equals(type)) { %>
  public void set<%= nameCap %>(Boolean v) {
    ((<%= className %>)revisionData).set<%= nameCap %>(v == null ? false : v.booleanValue());
  }  
  <% } else { %>
  public void set<%= nameCap %>(<%= type %> v) {
    ((<%= className %>)revisionData).set<%= nameCap %>(v);
  }
  <% } %>
<%   if (itField.isAnyLink()) { %>
  public String get<%= nameCap %>Id() { 
    return JcmsUtil.getId(get<%= nameCap %>());
  }
  public void set<%= nameCap %>Id(String v) {
    ((<%= className %>)revisionData).set<%= nameCap %>(channel.getData(<%= type %>.class, v));   
  }
<%   } %>  
<% } else if ("java.util.Date".equals(typeShort)) { %>
<% 
String collection = itField.isTypeList() ? "List" : "Set";
%>
  @SuppressWarnings("unchecked")
  public String get<%= nameCap %>Serial() {
    return encodeDateCollection(((<%= className %>)revisionData).get<%= nameCap %>());
  }
  
  @SuppressWarnings("unchecked")
  public void set<%= nameCap %>Serial(String v) {
    ((<%= className %>)revisionData).set<%= nameCap %>(decode<%= collection %>(java.util.Date.class, v));
  }
<% } else { %>
<% 
String collection = itField.isTypeList() ? "List" : "Set";
String suffix = "";
if (itField.isAnyLink()) {
  suffix = "Id";
}
%>
  @SuppressWarnings("unchecked")
  public String get<%= nameCap %><%= suffix %>Serial() {
    return encode<%= suffix %>Collection(((<%= className %>)revisionData).get<%= nameCap %>());
  }
  
  @SuppressWarnings("unchecked")
  public void set<%= nameCap %><%= suffix %>Serial(String v) {
    ((<%= className %>)revisionData).set<%= nameCap %>(decode<%= suffix %><%= collection %>(<%= itField.getTypeShort() %>.class, v));
  }
<% } %>
<% if (itField.isFieldML()) { %>
  public String get<%= nameCap %>MLE() {
    return ((<%= className %>)revisionData).get<%= nameCap %>MLE();
  }
  public void set<%= nameCap %>MLE(String v) {
    ((<%= className %>)revisionData).set<%= nameCap %>MLE(v);
  }
<% } %>
</jalios:foreach>
}
