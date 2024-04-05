// This file has been automatically generated.
   
package generated;
 
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
public  class CSRequest extends com.jalios.jcms.Form 
             implements 
                com.jalios.jstore.Searchable
{
  
  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------  
  public CSRequest() {}
 
 
 
  
  
  
  public CSRequest(CSRequest other) {
    super(other);
    name = other.name;
    nameML = other.nameML;
    description = other.description;
    descriptionML = other.descriptionML;
    accessPolicy = other.accessPolicy;
    signupPolicy = other.signupPolicy;
    model = other.model;
    language = other.language;
    admins = other.admins;
    adminsDBID = other.adminsDBID;
    groups = other.groups;
    members = other.members;
    membersDBID = other.membersDBID;
    notificationPolicy = other.notificationPolicy;
    parent = other.parent;
    syncMode = other.syncMode;
  }
  
  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);
    
    setName(ImportUtil.parseFieldText(elt, "name"));
    setNameML(ImportUtil.parseFieldTextML(elt, "nameML"));
    setAccessPolicy(ImportUtil.parseFieldText(elt, "accessPolicy"));
    setSignupPolicy(ImportUtil.parseFieldText(elt, "signupPolicy"));
    setModel(ImportUtil.parseFieldText(elt, "model"));
    setLanguage(ImportUtil.parseFieldText(elt, "language"));
    setNotificationPolicy(ImportUtil.parseFieldText(elt, "notificationPolicy"));
    setParent(ImportUtil.parseFieldText(elt, "parent"));
    setSyncMode(ImportUtil.parseFieldTextArray(elt, "syncMode"));
  }
  
  protected void importXmlFieldsWithReferences(org.jdom.Element elt, ImportOptions options) {
    super.importXmlFieldsWithReferences(elt, options);
      
    if (options.isSelfImport()) {
      setDescription(ImportUtil.parseFieldText(elt, "description"));
      setDescriptionML(ImportUtil.parseFieldTextML(elt, "descriptionML"));
      setAdmins(ImportUtil.parseSelfFieldDataArray(elt, "admins", com.jalios.jcms.Member.class));
      setGroups(ImportUtil.parseSelfFieldDataArray(elt, "groups", com.jalios.jcms.Group.class));
      setMembers(ImportUtil.parseSelfFieldDataArray(elt, "members", com.jalios.jcms.Member.class));
    } else {
    
    setDescriptionML(ImportUtil.parseFieldWikiML(elt, "descriptionML"));
    setDescription(ImportUtil.parseFieldWiki(elt, "description"));
    }
  }
  
  public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "name", getName(), "nameML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "nameML", getNameML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "description", getDescription(), "descriptionML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "descriptionML", getDescriptionML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "accessPolicy", getAccessPolicy(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "signupPolicy", getSignupPolicy(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "model", getModel(), true, true));
    sb.append(ExportUtil.exportField(indentLevel, "language", getLanguage(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "admins", getAdmins()));
    sb.append(ExportUtil.exportField(indentLevel, "groups", getGroups()));
    sb.append(ExportUtil.exportField(indentLevel, "members", getMembers()));
    sb.append(ExportUtil.exportField(indentLevel, "notificationPolicy", getNotificationPolicy(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "parent", getParent(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "syncMode", getSyncMode(), false, true));
  }
  
  public Set<FileDocument> getDocumentLinkSet() {
    Set<FileDocument> docSet = super.getDocumentLinkSet();
    return docSet;
  }
  
  // ----------------------------------------------------------------------
  // TYPE AND FIELD INFOS (static methods)
  // ----------------------------------------------------------------------  
  /**
   * Returns the TypeEntry bound to <code>CSRequest</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(CSRequest.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>CSRequest</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>CSRequest</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>CSRequest</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(CSRequest.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>CSRequest</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>CSRequest</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>CSRequest</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(CSRequest.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------  
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>CSRequest</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getIntFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>int</code> field name for the current <code>CSRequest</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {
    super.setIntFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>long</code> field name for the current <code>CSRequest</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getLongFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>long</code> field name for the current <code>CSRequest</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setLongFieldValue(String fieldName, long value) throws NoSuchFieldException {
    super.setLongFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>double</code> field name for the current <code>CSRequest</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>double</code> field name for the current <code>CSRequest</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setDoubleFieldValue(String fieldName, double value) throws NoSuchFieldException {
     super.setDoubleFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>boolean</code> field name for the current <code>CSRequest</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getBooleanFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>CSRequest</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setBooleanFieldValue(String fieldName, boolean value) throws NoSuchFieldException {
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
    return super.getCategoryFieldValue(fieldName, mbr);
  }
  /**
   * Gets the <code>Object</code> value of the given field name for this <code>CSRequest</code>. <br>
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
    if ("name".equals(fieldName)) { return getName(lang, useDefault); }
    if ("description".equals(fieldName)) { return getDescription(lang, useDefault); }
    if ("accessPolicy".equals(fieldName)) { return getAccessPolicy(); }
    if ("signupPolicy".equals(fieldName)) { return getSignupPolicy(); }
    if ("model".equals(fieldName)) { return getModel(); }
    if ("language".equals(fieldName)) { return getLanguage(); }
    if ("admins".equals(fieldName)) { return getAdmins(); }
    if ("groups".equals(fieldName)) { return getGroups(); }
    if ("members".equals(fieldName)) { return getMembers(); }
    if ("notificationPolicy".equals(fieldName)) { return getNotificationPolicy(); }
    if ("parent".equals(fieldName)) { return getParent(); }
    if ("syncMode".equals(fieldName)) { return getSyncMode(); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }
  
  /**
   * Sets the <code>Object</code> value of the given field name for this <code>CSRequest</code>. <br>
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
    if ("name".equals(fieldName)) { setName(lang,(String)value); return; }
    if ("description".equals(fieldName)) { setDescription(lang,(String)value); return; }
    if ("accessPolicy".equals(fieldName)) { setAccessPolicy((String)value); return; }
    if ("signupPolicy".equals(fieldName)) { setSignupPolicy((String)value); return; }
    if ("model".equals(fieldName)) { setModel((String)value); return; }
    if ("language".equals(fieldName)) { setLanguage((String)value); return; }
    if ("admins".equals(fieldName)) { setAdmins((com.jalios.jcms.Member[])value); return; }
    if ("groups".equals(fieldName)) { setGroups((com.jalios.jcms.Group[])value); return; }
    if ("members".equals(fieldName)) { setMembers((com.jalios.jcms.Member[])value); return; }
    if ("notificationPolicy".equals(fieldName)) { setNotificationPolicy((String)value); return; }
    if ("parent".equals(fieldName)) { setParent((String)value); return; }
    if ("syncMode".equals(fieldName)) { setSyncMode((String[])value); return; }
    super.setFieldValue(fieldName, value, lang);
  }
  
  // ----------------------------------------------------------------------
  // name
  // ----------------------------------------------------------------------  
  
  protected  String name = channel.getTypeFieldEntry(CSRequest.class, "name", true).getDefaultTextString();
  
  public String getName() { return name; }
  
  public void setName(String v) { name = v; }
  
  
  
  
  protected HashMap<String,String> nameML = channel.getTypeFieldEntry(CSRequest.class, "name", true).getDefaultTextMap();
  public String getName(String lang) { return (String)channel.getLangValue(lang, true, name, nameML, getMainLanguage()); }
  public String getName(String lang, boolean useDefault) { return (String)channel.getLangValue(lang, useDefault, name, nameML, getMainLanguage()); }
  public HashMap<String,String> getNameML() { return nameML; }
  public void setNameML(HashMap<String,String> v) { nameML = v; }
  
  public String getNameMLE() { 
    return JcmsUtil.encodeMLE(getNameML());
  }
  
  public void setNameMLE(String v) {
    setNameML(JcmsUtil.decodeMLE(v));
  }
  
  public void setName(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      name = value;
      return;
    }
    if (nameML == null) {
      nameML = new HashMap<>();
    } else if (this != channel.getData(id)) {
      nameML = new HashMap<>(nameML);
    }
    nameML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // description
  // ----------------------------------------------------------------------  
  
  protected  String description = channel.getTypeFieldEntry(CSRequest.class, "description", true).getDefaultTextString();
  
  public String getDescription() { return description; }
  
  public void setDescription(String v) { description = v; }
  
  
  
  
  protected HashMap<String,String> descriptionML = channel.getTypeFieldEntry(CSRequest.class, "description", true).getDefaultTextMap();
  public String getDescription(String lang) { return (String)channel.getLangValue(lang, true, description, descriptionML, getMainLanguage()); }
  public String getDescription(String lang, boolean useDefault) { return (String)channel.getLangValue(lang, useDefault, description, descriptionML, getMainLanguage()); }
  public HashMap<String,String> getDescriptionML() { return descriptionML; }
  public void setDescriptionML(HashMap<String,String> v) { descriptionML = v; }
  
  public String getDescriptionMLE() { 
    return JcmsUtil.encodeMLE(getDescriptionML());
  }
  
  public void setDescriptionMLE(String v) {
    setDescriptionML(JcmsUtil.decodeMLE(v));
  }
  
  public void setDescription(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      description = value;
      return;
    }
    if (descriptionML == null) {
      descriptionML = new HashMap<>();
    } else if (this != channel.getData(id)) {
      descriptionML = new HashMap<>(descriptionML);
    }
    descriptionML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // accessPolicy
  // ----------------------------------------------------------------------  
  
  protected  String accessPolicy = channel.getTypeFieldEntry(CSRequest.class, "accessPolicy", true).getDefaultTextString();
  
  public String getAccessPolicy() { return accessPolicy; }
  
  public void setAccessPolicy(String v) { accessPolicy = v; }
  
  
  
  public String getAccessPolicy(String lang) { return accessPolicy; }
  public String getAccessPolicy(String lang, boolean useDefault) { return accessPolicy; }
  private static String[] accessPolicyValues;  
  private static String[] accessPolicyLabels;
  private static Map<String, String[]> accessPolicyLabelsMap;
  
  public static String[] getAccessPolicyValues() {
    if(accessPolicyValues == null) {
      setAccessPolicyValues(channel.getTypeFieldEntry(CSRequest.class, "accessPolicy", true).getEnumerateValues());
    }
    return accessPolicyValues;
  }
  public static void setAccessPolicyValues(String[] values) {
    accessPolicyValues = values;
  }
  public static String[] getAccessPolicyLabels() {
    if(accessPolicyLabels == null) {
      setAccessPolicyLabels(channel.getTypeFieldEntry(CSRequest.class, "accessPolicy", true).getEnumerateLabels());
    }
    return accessPolicyLabels;
  }
  public static void setAccessPolicyLabels(String[] labels) {
    accessPolicyLabels = labels;
  }
  public static Map<String, String[]> getAccessPolicyLabelsMap() {
    if(accessPolicyLabelsMap == null) {
      setAccessPolicyLabelsMap(channel.getTypeFieldEntry(CSRequest.class, "accessPolicy", true).getEnumerateLabelsMap());
    }
    return accessPolicyLabelsMap;
  }
  public static void setAccessPolicyLabelsMap(Map<String, String[]> LabelsMap) {
    accessPolicyLabelsMap = LabelsMap;
  }
  public static String[] getAccessPolicyLabels(String userLang) {
    Map<String, String[]> accessPolicyLabelMap = getAccessPolicyLabelsMap();
    String[] labels = (String[])accessPolicyLabelMap.get(userLang);
    if (labels == null) {
      labels = (String[])accessPolicyLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getAccessPolicyLabel(String value, String userLang) {
    String[] labels = getAccessPolicyLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("public")) {
      i = 0;
    }
    else if (value.equals("private")) {
      i = 1;
    }
    else if (value.equals("secret")) {
      i = 2;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getAccessPolicyLabel(value, channel.getLanguage());
  }
  
  public static String getAccessPolicyLabel(String value) {    
    String[] accessPolicyLabels = getAccessPolicyLabels();
    if (false) {
    }
    else if (value.equals("public")) {
      return accessPolicyLabels[0];
    }
    else if (value.equals("private")) {
      return accessPolicyLabels[1];
    }
    else if (value.equals("secret")) {
      return accessPolicyLabels[2];
    }
    return "???";
  }
  public static EnumerateFormReport getAccessPolicyReport(SortedSet<CSRequest> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (CSRequest obj : set) {
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getAccessPolicy());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // signupPolicy
  // ----------------------------------------------------------------------  
  
  protected  String signupPolicy = channel.getTypeFieldEntry(CSRequest.class, "signupPolicy", true).getDefaultTextString();
  
  public String getSignupPolicy() { return signupPolicy; }
  
  public void setSignupPolicy(String v) { signupPolicy = v; }
  
  
  
  public String getSignupPolicy(String lang) { return signupPolicy; }
  public String getSignupPolicy(String lang, boolean useDefault) { return signupPolicy; }
  private static String[] signupPolicyValues;  
  private static String[] signupPolicyLabels;
  private static Map<String, String[]> signupPolicyLabelsMap;
  
  public static String[] getSignupPolicyValues() {
    if(signupPolicyValues == null) {
      setSignupPolicyValues(channel.getTypeFieldEntry(CSRequest.class, "signupPolicy", true).getEnumerateValues());
    }
    return signupPolicyValues;
  }
  public static void setSignupPolicyValues(String[] values) {
    signupPolicyValues = values;
  }
  public static String[] getSignupPolicyLabels() {
    if(signupPolicyLabels == null) {
      setSignupPolicyLabels(channel.getTypeFieldEntry(CSRequest.class, "signupPolicy", true).getEnumerateLabels());
    }
    return signupPolicyLabels;
  }
  public static void setSignupPolicyLabels(String[] labels) {
    signupPolicyLabels = labels;
  }
  public static Map<String, String[]> getSignupPolicyLabelsMap() {
    if(signupPolicyLabelsMap == null) {
      setSignupPolicyLabelsMap(channel.getTypeFieldEntry(CSRequest.class, "signupPolicy", true).getEnumerateLabelsMap());
    }
    return signupPolicyLabelsMap;
  }
  public static void setSignupPolicyLabelsMap(Map<String, String[]> LabelsMap) {
    signupPolicyLabelsMap = LabelsMap;
  }
  public static String[] getSignupPolicyLabels(String userLang) {
    Map<String, String[]> signupPolicyLabelMap = getSignupPolicyLabelsMap();
    String[] labels = (String[])signupPolicyLabelMap.get(userLang);
    if (labels == null) {
      labels = (String[])signupPolicyLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getSignupPolicyLabel(String value, String userLang) {
    String[] labels = getSignupPolicyLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("free")) {
      i = 0;
    }
    else if (value.equals("request")) {
      i = 1;
    }
    else if (value.equals("admin")) {
      i = 2;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getSignupPolicyLabel(value, channel.getLanguage());
  }
  
  public static String getSignupPolicyLabel(String value) {    
    String[] signupPolicyLabels = getSignupPolicyLabels();
    if (false) {
    }
    else if (value.equals("free")) {
      return signupPolicyLabels[0];
    }
    else if (value.equals("request")) {
      return signupPolicyLabels[1];
    }
    else if (value.equals("admin")) {
      return signupPolicyLabels[2];
    }
    return "???";
  }
  public static EnumerateFormReport getSignupPolicyReport(SortedSet<CSRequest> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (CSRequest obj : set) {
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getSignupPolicy());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // model
  // ----------------------------------------------------------------------  
  
  protected  String model = channel.getTypeFieldEntry(CSRequest.class, "model", true).getDefaultTextString();
  
  public String getModel() { return model; }
  
  public void setModel(String v) { model = v; }
  
  
  
  public String getModel(String lang) { return model; }
  public String getModel(String lang, boolean useDefault) { return model; }
  // ----------------------------------------------------------------------
  // language
  // ----------------------------------------------------------------------  
  
  protected  String language = channel.getTypeFieldEntry(CSRequest.class, "language", true).getDefaultTextString();
  
  public String getLanguage() { return language; }
  
  public void setLanguage(String v) { language = v; }
  
  
  
  public String getLanguage(String lang) { return language; }
  public String getLanguage(String lang, boolean useDefault) { return language; }
  // ----------------------------------------------------------------------
  // admins
  // ----------------------------------------------------------------------  
  
  protected  com.jalios.jcms.Member[] admins;
  
  public com.jalios.jcms.Member[] getAdmins() {
    return getAdmins(true);
  }
  public com.jalios.jcms.Member[] getAdmins(boolean queryDB) { 
    if (!queryDB || Util.isEmpty(adminsDBID)) {
      return admins;
    }
    return mergeHybridLink(com.jalios.jcms.Member.class, admins, adminsDBID);
  }
  protected String[] adminsDBID;
  public String[] getAdminsDBID() {
    return adminsDBID;
  }
  public void setAdmins(com.jalios.jcms.Member[] v) { 
    admins = v == null ? null : v.clone(); 
  }
  
  public void setAdminsDBID(String[] v) { 
    adminsDBID = v; 
  }
  
  
  // ----------------------------------------------------------------------
  // groups
  // ----------------------------------------------------------------------  
  
  protected  com.jalios.jcms.Group[] groups;
  
  public com.jalios.jcms.Group[] getGroups() { return groups; }
  
  public void setGroups(com.jalios.jcms.Group[] v) { groups = v; }
  
  
  
  // ----------------------------------------------------------------------
  // members
  // ----------------------------------------------------------------------  
  
  protected  com.jalios.jcms.Member[] members;
  
  public com.jalios.jcms.Member[] getMembers() {
    return getMembers(true);
  }
  public com.jalios.jcms.Member[] getMembers(boolean queryDB) { 
    if (!queryDB || Util.isEmpty(membersDBID)) {
      return members;
    }
    return mergeHybridLink(com.jalios.jcms.Member.class, members, membersDBID);
  }
  protected String[] membersDBID;
  public String[] getMembersDBID() {
    return membersDBID;
  }
  public void setMembers(com.jalios.jcms.Member[] v) { 
    members = v == null ? null : v.clone(); 
  }
  
  public void setMembersDBID(String[] v) { 
    membersDBID = v; 
  }
  
  
  // ----------------------------------------------------------------------
  // notificationPolicy
  // ----------------------------------------------------------------------  
  
  protected  String notificationPolicy = channel.getTypeFieldEntry(CSRequest.class, "notificationPolicy", true).getDefaultTextString();
  
  public String getNotificationPolicy() { return notificationPolicy; }
  
  public void setNotificationPolicy(String v) { notificationPolicy = v; }
  
  
  
  public String getNotificationPolicy(String lang) { return notificationPolicy; }
  public String getNotificationPolicy(String lang, boolean useDefault) { return notificationPolicy; }
  private static String[] notificationPolicyValues;  
  private static String[] notificationPolicyLabels;
  private static Map<String, String[]> notificationPolicyLabelsMap;
  
  public static String[] getNotificationPolicyValues() {
    if(notificationPolicyValues == null) {
      setNotificationPolicyValues(channel.getTypeFieldEntry(CSRequest.class, "notificationPolicy", true).getEnumerateValues());
    }
    return notificationPolicyValues;
  }
  public static void setNotificationPolicyValues(String[] values) {
    notificationPolicyValues = values;
  }
  public static String[] getNotificationPolicyLabels() {
    if(notificationPolicyLabels == null) {
      setNotificationPolicyLabels(channel.getTypeFieldEntry(CSRequest.class, "notificationPolicy", true).getEnumerateLabels());
    }
    return notificationPolicyLabels;
  }
  public static void setNotificationPolicyLabels(String[] labels) {
    notificationPolicyLabels = labels;
  }
  public static Map<String, String[]> getNotificationPolicyLabelsMap() {
    if(notificationPolicyLabelsMap == null) {
      setNotificationPolicyLabelsMap(channel.getTypeFieldEntry(CSRequest.class, "notificationPolicy", true).getEnumerateLabelsMap());
    }
    return notificationPolicyLabelsMap;
  }
  public static void setNotificationPolicyLabelsMap(Map<String, String[]> LabelsMap) {
    notificationPolicyLabelsMap = LabelsMap;
  }
  public static String[] getNotificationPolicyLabels(String userLang) {
    Map<String, String[]> notificationPolicyLabelMap = getNotificationPolicyLabelsMap();
    String[] labels = (String[])notificationPolicyLabelMap.get(userLang);
    if (labels == null) {
      labels = (String[])notificationPolicyLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getNotificationPolicyLabel(String value, String userLang) {
    String[] labels = getNotificationPolicyLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("invitation")) {
      i = 0;
    }
    else if (value.equals("mail")) {
      i = 1;
    }
    else if (value.equals("no")) {
      i = 2;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getNotificationPolicyLabel(value, channel.getLanguage());
  }
  
  public static String getNotificationPolicyLabel(String value) {    
    String[] notificationPolicyLabels = getNotificationPolicyLabels();
    if (false) {
    }
    else if (value.equals("invitation")) {
      return notificationPolicyLabels[0];
    }
    else if (value.equals("mail")) {
      return notificationPolicyLabels[1];
    }
    else if (value.equals("no")) {
      return notificationPolicyLabels[2];
    }
    return "???";
  }
  public static EnumerateFormReport getNotificationPolicyReport(SortedSet<CSRequest> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (CSRequest obj : set) {
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getNotificationPolicy());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // parent
  // ----------------------------------------------------------------------  
  
  protected  String parent = channel.getTypeFieldEntry(CSRequest.class, "parent", true).getDefaultTextString();
  
  public String getParent() { return parent; }
  
  public void setParent(String v) { parent = v; }
  
  
  
  public String getParent(String lang) { return parent; }
  public String getParent(String lang, boolean useDefault) { return parent; }
  // ----------------------------------------------------------------------
  // syncMode
  // ----------------------------------------------------------------------  
  
  protected  String[] syncMode;
  
  public String[] getSyncMode() { return syncMode; }
  
  public void setSyncMode(String[] v) { syncMode = v; }
  
  
  
  public String[] getSyncMode(String lang) { return syncMode; }
  public String[] getSyncMode(String lang, boolean useDefault) { return syncMode; }
  private static String[] syncModeValues;  
  private static String[] syncModeLabels;
  private static Map<String, String[]> syncModeLabelsMap;
  
  public static String[] getSyncModeValues() {
    if(syncModeValues == null) {
      setSyncModeValues(channel.getTypeFieldEntry(CSRequest.class, "syncMode", true).getEnumerateValues());
    }
    return syncModeValues;
  }
  public static void setSyncModeValues(String[] values) {
    syncModeValues = values;
  }
  public static String[] getSyncModeLabels() {
    if(syncModeLabels == null) {
      setSyncModeLabels(channel.getTypeFieldEntry(CSRequest.class, "syncMode", true).getEnumerateLabels());
    }
    return syncModeLabels;
  }
  public static void setSyncModeLabels(String[] labels) {
    syncModeLabels = labels;
  }
  public static Map<String, String[]> getSyncModeLabelsMap() {
    if(syncModeLabelsMap == null) {
      setSyncModeLabelsMap(channel.getTypeFieldEntry(CSRequest.class, "syncMode", true).getEnumerateLabelsMap());
    }
    return syncModeLabelsMap;
  }
  public static void setSyncModeLabelsMap(Map<String, String[]> LabelsMap) {
    syncModeLabelsMap = LabelsMap;
  }
  public static String[] getSyncModeLabels(String userLang) {
    Map<String, String[]> syncModeLabelMap = getSyncModeLabelsMap();
    String[] labels = (String[])syncModeLabelMap.get(userLang);
    if (labels == null) {
      labels = (String[])syncModeLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getSyncModeLabel(String value, String userLang) {
    String[] labels = getSyncModeLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("dashboard")) {
      i = 0;
    }
    else if (value.equals("tabs")) {
      i = 1;
    }
    else if (value.equals("data")) {
      i = 2;
    }
    else if (value.equals("categories")) {
      i = 3;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getSyncModeLabel(value, channel.getLanguage());
  }
  
  public static String getSyncModeLabel(String value) {    
    String[] syncModeLabels = getSyncModeLabels();
    if (false) {
    }
    else if (value.equals("dashboard")) {
      return syncModeLabels[0];
    }
    else if (value.equals("tabs")) {
      return syncModeLabels[1];
    }
    else if (value.equals("data")) {
      return syncModeLabels[2];
    }
    else if (value.equals("categories")) {
      return syncModeLabels[3];
    }
    return "???";
  }
  public static EnumerateFormReport getSyncModeReport(SortedSet<CSRequest> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (CSRequest obj : set) {
      if (obj == null || obj.getSyncMode() == null) {
        continue;
      }
      for(int i = 0; i < obj.getSyncMode().length; i++) {
        if (obj.getSyncMode()[i] != null) {
          map.inc(obj.getSyncMode()[i]);
        }
      }
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
   
  // ----------------------------------------------------------------------
  // abstract
  // ----------------------------------------------------------------------  
  @Override
  public void setAbstract(String lang, String value) { setModel(value); }
  @Override
  public String getAbstract() { return model; }
  @Override
  public String getAbstract(String lang, boolean useDefault) { return getModel(lang, useDefault); }
  @Override
  public String[] getSearchStrings() {
    StringBuffer sb = new StringBuffer(super.getSearchStrings()[0]);
    sb.ensureCapacity(500 * (2 + 1 + 0 + 0 + 0 + 0) );
    if (model != null) {
      sb.append(model); sb.append(' ');
    }
    if (title != null) {
      sb.append(title); sb.append(' ');
    }
    if (name != null) {
      sb.append(name); sb.append(' '); 
    }
    if (nameML != null) {
      for (String str : nameML.values()) {
        if (str != null) {
          sb.append(str); sb.append(' ');
        }
      }
    }
    return new String[] {sb.toString()};
  }
  
  @Override
  public String getAllWikiText() {
    StringBuffer sb = new StringBuffer(super.getAllWikiText());
    sb.ensureCapacity(500 * (0 + 1 + 0 + 0 + 0 + 0) );
    if (description != null && !JHTMLUtils.isJHTML(null, description)) {
      sb.append(description); sb.append(' '); 
    }
    if (descriptionML != null) {
      for (String str : descriptionML.values()) {
        if (str != null && !JHTMLUtils.isJHTML(null, str)) {
          sb.append(str); sb.append(' ');
        }
      }
    }
    return sb.toString();
  }
  
  @Override
  public String getAllWysiwygText() {
    StringBuffer sb = new StringBuffer(super.getAllWysiwygText());
    sb.ensureCapacity(500 * (0 + 0 + 0 + 0 + 0 + 0) );
    // Wiki fields containing JHTML
    if (description != null && JHTMLUtils.isJHTML(null, description)) {
      sb.append(description); sb.append(' '); 
    }
    if (descriptionML != null) {
      for (String str : descriptionML.values()) {
        if (str != null && JHTMLUtils.isJHTML(null, str)) {
          sb.append(str); sb.append(' ');
        }
      }
    }
   // Wysiwyg fields
    return sb.toString();
  }
  
  @Override
  public <T extends Data> TreeSet<T> getLinkDataSet(Class<T> clazz) {
    if (clazz == null) {
      return Util.emptyTreeSet();
    }
    TreeSet<T> set = new TreeSet<>();
    JcmsUtil.addData(set, clazz, getAdmins());
    JcmsUtil.addData(set, clazz, getGroups());
    JcmsUtil.addData(set, clazz, getMembers());
    return set;
  }
  // ----------------------------------------------------------------------
  // DataController
  // ----------------------------------------------------------------------  
  public ControllerStatus checkIntegrity() {
    
    ControllerStatus status = super.checkIntegrity();
    if (status.hasFailed()) {
      return status;
    }
    
    if (Util.isEmpty(getFieldInMainLanguage(name, nameML))) {
      status = new ControllerStatus();
      status.setProp("msg.edit.empty-fieldml", channel.getTypeFieldLabel(this, "name"), new LangProperty("lang." + getMainLanguage()));
      return status;
    }
    if (JHTMLUtils.isEmpty(getFieldInMainLanguage(description, descriptionML))) {
      status = new ControllerStatus();
      status.setProp("msg.edit.empty-fieldml", channel.getTypeFieldLabel(this, "description"), new LangProperty("lang." + getMainLanguage()));
      return status;
    }
    if (Util.isEmpty(accessPolicy)) {
      status = new ControllerStatus();
      status.setProp("msg.edit.empty-field", channel.getTypeFieldLabel(this, "accessPolicy"), null);
      return status;
    }
    if (Util.isEmpty(signupPolicy)) {
      status = new ControllerStatus();
      status.setProp("msg.edit.empty-field", channel.getTypeFieldLabel(this, "signupPolicy"), null);
      return status;
    }
    if (Util.isEmpty(notificationPolicy)) {
      status = new ControllerStatus();
      status.setProp("msg.edit.empty-field", channel.getTypeFieldLabel(this, "notificationPolicy"), null);
      return status;
    }
    return ControllerStatus.OK;
  }
  
  // ----------------------------------------------------------------------
  // splitHybridCollections
  // ----------------------------------------------------------------------
  @Override
  protected void splitHybridCollections(Data previousData) {
    super.splitHybridCollections(previousData);
    CSRequest previous = (CSRequest)previousData;
  
    if (previous == null || previous.admins != admins) {
      adminsDBID = computeDBIDArray(admins);
    }
  
    if (previous == null || previous.members != members) {
      membersDBID = computeDBIDArray(members);
    }
  }
  
  // ----------------------------------------------------------------------
  // cleanHybridCollections
  // ----------------------------------------------------------------------
  @Override
  protected void cleanHybridCollections() {
    super.cleanHybridCollections();
    cleanHybridCollection(admins);
    cleanHybridCollection(members);
  }
  
  // ----------------------------------------------------------------------
  // WorkCopy
  // ----------------------------------------------------------------------  
  protected void prepareMergeCopy(Publication mergeCopy) {
    super.prepareMergeCopy(mergeCopy);  
    ((CSRequest)mergeCopy).setName(getName());
    ((CSRequest)mergeCopy).setNameML(JcmsUtil.getMergedMLMap(getNameML(), ((CSRequest)mergeCopy).getNameML()));
    ((CSRequest)mergeCopy).setDescription(getDescription());
    ((CSRequest)mergeCopy).setDescriptionML(JcmsUtil.getMergedMLMap(getDescriptionML(), ((CSRequest)mergeCopy).getDescriptionML()));
    ((CSRequest)mergeCopy).setAccessPolicy(getAccessPolicy());
    ((CSRequest)mergeCopy).setSignupPolicy(getSignupPolicy());
    ((CSRequest)mergeCopy).setModel(getModel());
    ((CSRequest)mergeCopy).setLanguage(getLanguage());
    ((CSRequest)mergeCopy).setAdmins(getAdmins());
    ((CSRequest)mergeCopy).setGroups(getGroups());
    ((CSRequest)mergeCopy).setMembers(getMembers());
    ((CSRequest)mergeCopy).setNotificationPolicy(getNotificationPolicy());
    ((CSRequest)mergeCopy).setParent(getParent());
    ((CSRequest)mergeCopy).setSyncMode(getSyncMode());
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// j5WfKnidsR20J4ELYruITQ==
