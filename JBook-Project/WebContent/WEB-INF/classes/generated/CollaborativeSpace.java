// This file has been automatically generated.

package generated;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.SortedSet;
import java.util.TreeSet;

import com.jalios.jcms.Category;
import com.jalios.jcms.ControllerStatus;
import com.jalios.jcms.Data;
import com.jalios.jcms.EnumerateFormReport;
import com.jalios.jcms.FileDocument;
import com.jalios.jcms.IntegerFormReport;
import com.jalios.jcms.JcmsUtil;
import com.jalios.jcms.Member;
import com.jalios.jcms.Publication;
import com.jalios.jcms.TypeEntry;
import com.jalios.jcms.TypeFieldEntry;
import com.jalios.jcms.mashup.ExportUtil;
import com.jalios.jcms.mashup.ImportOptions;
import com.jalios.jcms.mashup.ImportUtil;
import com.jalios.jcms.wysiwyg.JHTMLUtils;
import com.jalios.util.ObjectIntTreeMap;
import com.jalios.util.Util;

@SuppressWarnings({"unchecked", "unused"})
public  class CollaborativeSpace extends com.jalios.jcmsplugin.collaborativespace.portal.AbstractCollaborativeSpace
             implements
                com.jalios.jcms.portlet.PortalInterface
               , com.jalios.jstore.Searchable
{

  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------
  public CollaborativeSpace() {}


  public CollaborativeSpace(AbstractCollection other) {
    super(other);
  }




  public CollaborativeSpace(CollaborativeSpace other) {
    super(other);
    description = other.description;
    descriptionML = other.descriptionML;
    introduction = other.introduction;
    introductionML = other.introductionML;
    accessPolicy = other.accessPolicy;
    signupPolicy = other.signupPolicy;
    followersGroup = other.followersGroup;
    layout = other.layout;
    dashboardColumnCount = other.dashboardColumnCount;
    theme = other.theme;
    header = other.header;
    headerSettings = other.headerSettings;
    exactCategory = other.exactCategory;
    mobileShowIntro = other.mobileShowIntro;
    mobileShowApplications = other.mobileShowApplications;
    jportal = other.jportal;
    syncMode = other.syncMode;
    modelSyncMode = other.modelSyncMode;
    model = other.model;
    applications = other.applications;
    mobilePortlets = other.mobilePortlets;
  }

  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  @Override
public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);

    setAccessPolicy(ImportUtil.parseFieldText(elt, "accessPolicy"));
    setSignupPolicy(ImportUtil.parseFieldText(elt, "signupPolicy"));
    setLayout(ImportUtil.parseFieldText(elt, "layout"));
    setDashboardColumnCount(ImportUtil.parseFieldInt(elt, "dashboardColumnCount"));
    setTheme(ImportUtil.parseFieldText(elt, "theme"));
    setHeader(ImportUtil.parseFieldText(elt, "header"));
    setHeaderSettings(ImportUtil.parseFieldText(elt, "headerSettings"));
    setExactCategory(ImportUtil.parseFieldBoolean(elt, "exactCategory"));
    setMobileShowIntro(ImportUtil.parseFieldBoolean(elt, "mobileShowIntro"));
    setMobileShowApplications(ImportUtil.parseFieldBoolean(elt, "mobileShowApplications"));
    setSyncMode(ImportUtil.parseFieldTextArray(elt, "syncMode"));
    setModelSyncMode(ImportUtil.parseFieldTextArray(elt, "modelSyncMode"));
  }

  @Override
protected void importXmlFieldsWithReferences(org.jdom.Element elt, ImportOptions options) {
    super.importXmlFieldsWithReferences(elt, options);

    if (options.isSelfImport()) {
      setDescription(ImportUtil.parseFieldText(elt, "description"));
      setDescriptionML(ImportUtil.parseFieldTextML(elt, "descriptionML"));
      setIntroduction(ImportUtil.parseFieldText(elt, "introduction"));
      setIntroductionML(ImportUtil.parseFieldTextML(elt, "introductionML"));
      setFollowersGroup(ImportUtil.parseSelfFieldData(elt, "followersGroup", com.jalios.jcms.Group.class));
      setJportal(ImportUtil.parseSelfFieldData(elt, "jportal", com.jalios.jcms.jportal.AbstractJPortal.class));
      setModel(ImportUtil.parseSelfFieldData(elt, "model", com.jalios.jcms.workspace.Workspace.class));
      setApplications(ImportUtil.parseSelfFieldDataArray(elt, "applications", com.jalios.jcms.portlet.PortalElement.class));
      setMobilePortlets(ImportUtil.parseSelfFieldDataArray(elt, "mobilePortlets", com.jalios.jcms.portlet.PortalElement.class));
    } else {

    setDescriptionML(ImportUtil.parseFieldWikiML(elt, "descriptionML"));
    setDescription(ImportUtil.parseFieldWiki(elt, "description"));
    setIntroductionML(ImportUtil.parseFieldWysiwygML(elt, "introductionML"));
    setIntroduction(ImportUtil.parseFieldWysiwyg(elt, "introduction"));
    }
  }

  @Override
public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "description", getDescription(), "descriptionML", true, true));
    sb.append(ExportUtil.exportField(indentLevel, "descriptionML", getDescriptionML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "introduction", getIntroduction(), "introductionML", false, false));
    sb.append(ExportUtil.exportField(indentLevel, "introductionML", getIntroductionML(), false));
    sb.append(ExportUtil.exportField(indentLevel, "accessPolicy", getAccessPolicy(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "signupPolicy", getSignupPolicy(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "followersGroup", getFollowersGroup()));
    sb.append(ExportUtil.exportField(indentLevel, "layout", getLayout(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "dashboardColumnCount", getDashboardColumnCount()));
    sb.append(ExportUtil.exportField(indentLevel, "theme", getTheme(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "header", getHeader(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "headerSettings", getHeaderSettings(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "exactCategory", getExactCategory()));
    sb.append(ExportUtil.exportField(indentLevel, "mobileShowIntro", getMobileShowIntro()));
    sb.append(ExportUtil.exportField(indentLevel, "mobileShowApplications", getMobileShowApplications()));
    sb.append(ExportUtil.exportField(indentLevel, "jportal", getJportal()));
    sb.append(ExportUtil.exportField(indentLevel, "syncMode", getSyncMode(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "modelSyncMode", getModelSyncMode(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "model", getModel()));
    sb.append(ExportUtil.exportField(indentLevel, "applications", getApplications()));
    sb.append(ExportUtil.exportField(indentLevel, "mobilePortlets", getMobilePortlets()));
  }

  @Override
public Set<FileDocument> getDocumentLinkSet() {
    Set<FileDocument> docSet = super.getDocumentLinkSet();
    JcmsUtil.addFileDocument(docSet, header);
    return docSet;
  }

  // ----------------------------------------------------------------------
  // TYPE AND FIELD INFOS (static methods)
  // ----------------------------------------------------------------------
  /**
   * Returns the TypeEntry bound to <code>CollaborativeSpace</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(CollaborativeSpace.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>CollaborativeSpace</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>CollaborativeSpace</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>CollaborativeSpace</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(CollaborativeSpace.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>CollaborativeSpace</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>CollaborativeSpace</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>CollaborativeSpace</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(CollaborativeSpace.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>CollaborativeSpace</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    if ("dashboardColumnCount".equals(fieldName)) { return getDashboardColumnCount(); }
    return super.getIntFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>int</code> field name for the current <code>CollaborativeSpace</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0
   */
  @Override
public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {
    if ("dashboardColumnCount".equals(fieldName)) { setDashboardColumnCount(value); return; }
    super.setIntFieldValue(fieldName, value);
  }

  /**
   * Gets the value of the given <code>long</code> field name for the current <code>CollaborativeSpace</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getLongFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>long</code> field name for the current <code>CollaborativeSpace</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0
   */
  @Override
public void setLongFieldValue(String fieldName, long value) throws NoSuchFieldException {
    super.setLongFieldValue(fieldName, value);
  }

  /**
   * Gets the value of the given <code>double</code> field name for the current <code>CollaborativeSpace</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>double</code> field name for the current <code>CollaborativeSpace</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0
   */
  @Override
public void setDoubleFieldValue(String fieldName, double value) throws NoSuchFieldException {
     super.setDoubleFieldValue(fieldName, value);
  }

  /**
   * Gets the value of the given <code>boolean</code> field name for the current <code>CollaborativeSpace</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    if ("exactCategory".equals(fieldName)) { return getExactCategory(); }
    if ("mobileShowIntro".equals(fieldName)) { return getMobileShowIntro(); }
    if ("mobileShowApplications".equals(fieldName)) { return getMobileShowApplications(); }
    return super.getBooleanFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>CollaborativeSpace</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0
   */
  @Override
public void setBooleanFieldValue(String fieldName, boolean value) throws NoSuchFieldException {
    if ("exactCategory".equals(fieldName)) { setExactCategory(value); return; }
    if ("mobileShowIntro".equals(fieldName)) { setMobileShowIntro(value); return; }
    if ("mobileShowApplications".equals(fieldName)) { setMobileShowApplications(value); return; }
    super.setBooleanFieldValue(fieldName, value);
  }

  /**
   * Gets the value of the given <code>Category</code> field name for the current <code>Data</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param mbr the member used to check rigth access to categories.
   * @return a <code>TreeSet</code> of <code>Category</code>
   * @throws NoSuchFieldException if the field was not found in the given <code>Data</code>.
   */
  @Override
public TreeSet<Category> getCategoryFieldValue(String fieldName, Member mbr) throws NoSuchFieldException {
    return super.getCategoryFieldValue(fieldName, mbr);
  }
  /**
   * Gets the <code>Object</code> value of the given field name for this <code>CollaborativeSpace</code>. <br>
   * Do not retrieve <code>Category</code> fields, see {@link #getCategoryFieldValue(String, Member)}.
   * @param fieldName the field name from which to retrieve the field value.
   * @param lang the language (ISO-639 code) in which to retrieve the field value
   *        (used only for multilingual fields).
   * @param useDefault whether to use the publication main language if the field value
   *        is not available in the requested language (used only for multilingual fields).
   * @return the <code>Object</code> field value
   * @throws NoSuchFieldException if the field was not found in the given <code>Publication</code>.
   */
  @Override
public Object getFieldValue(String fieldName, String lang, boolean useDefault) throws NoSuchFieldException {
    if ("description".equals(fieldName)) { return getDescription(lang, useDefault); }
    if ("introduction".equals(fieldName)) { return getIntroduction(lang, useDefault); }
    if ("accessPolicy".equals(fieldName)) { return getAccessPolicy(); }
    if ("signupPolicy".equals(fieldName)) { return getSignupPolicy(); }
    if ("followersGroup".equals(fieldName)) { return getFollowersGroup(); }
    if ("layout".equals(fieldName)) { return getLayout(); }
    if ("theme".equals(fieldName)) { return getTheme(); }
    if ("header".equals(fieldName)) { return getHeader(); }
    if ("headerSettings".equals(fieldName)) { return getHeaderSettings(); }
    if ("jportal".equals(fieldName)) { return getJportal(); }
    if ("syncMode".equals(fieldName)) { return getSyncMode(); }
    if ("modelSyncMode".equals(fieldName)) { return getModelSyncMode(); }
    if ("model".equals(fieldName)) { return getModel(); }
    if ("applications".equals(fieldName)) { return getApplications(); }
    if ("mobilePortlets".equals(fieldName)) { return getMobilePortlets(); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }

  /**
   * Sets the <code>Object</code> value of the given field name for this <code>CollaborativeSpace</code>. <br>
   * Do not set <code>Category</code> fields, see {@link #setCategoryFieldValue(String, TreeSet)}.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>Object</code> field value
   * @param lang the language (ISO-639 code) in which to retrieve the field value
   *        (used only for multilingual fields).
   *
   * @throws NoSuchFieldException if the field was not found in the given <code>Publication</code>.
   * @since jcms-6.3.0
   */
  @Override
public void setFieldValue(String fieldName, Object value, String lang) throws NoSuchFieldException {
    if ("description".equals(fieldName)) { setDescription(lang,(String)value); return; }
    if ("introduction".equals(fieldName)) { setIntroduction(lang,(String)value); return; }
    if ("accessPolicy".equals(fieldName)) { setAccessPolicy((String)value); return; }
    if ("signupPolicy".equals(fieldName)) { setSignupPolicy((String)value); return; }
    if ("followersGroup".equals(fieldName)) { setFollowersGroup((com.jalios.jcms.Group)value); return; }
    if ("layout".equals(fieldName)) { setLayout((String)value); return; }
    if ("theme".equals(fieldName)) { setTheme((String)value); return; }
    if ("header".equals(fieldName)) { setHeader((String)value); return; }
    if ("headerSettings".equals(fieldName)) { setHeaderSettings((String)value); return; }
    if ("jportal".equals(fieldName)) { setJportal((com.jalios.jcms.jportal.AbstractJPortal)value); return; }
    if ("syncMode".equals(fieldName)) { setSyncMode((String[])value); return; }
    if ("modelSyncMode".equals(fieldName)) { setModelSyncMode((String[])value); return; }
    if ("model".equals(fieldName)) { setModel((com.jalios.jcms.workspace.Workspace)value); return; }
    if ("applications".equals(fieldName)) { setApplications((com.jalios.jcms.portlet.PortalElement[])value); return; }
    if ("mobilePortlets".equals(fieldName)) { setMobilePortlets((com.jalios.jcms.portlet.PortalElement[])value); return; }
    super.setFieldValue(fieldName, value, lang);
  }

  // ----------------------------------------------------------------------
  // description
  // ----------------------------------------------------------------------

  protected  String description = channel.getTypeFieldEntry(CollaborativeSpace.class, "description", true).getDefaultTextString();

  @Override
public String getDescription() { return description; }

  @Override
public void setDescription(String v) { description = v; }




  protected HashMap<String,String> descriptionML = channel.getTypeFieldEntry(CollaborativeSpace.class, "description", true).getDefaultTextMap();
  @Override
public String getDescription(String lang) { return channel.getLangValue(lang, true, description, descriptionML, getMainLanguage()); }
  @Override
public String getDescription(String lang, boolean useDefault) { return channel.getLangValue(lang, useDefault, description, descriptionML, getMainLanguage()); }
  @Override
public HashMap<String,String> getDescriptionML() { return descriptionML; }
  @Override
public void setDescriptionML(HashMap<String,String> v) { descriptionML = v; }

  @Override
public String getDescriptionMLE() {
    return JcmsUtil.encodeMLE(getDescriptionML());
  }

  @Override
public void setDescriptionMLE(String v) {
    setDescriptionML(JcmsUtil.decodeMLE(v));
  }

  @Override
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
  // introduction
  // ----------------------------------------------------------------------

  protected  String introduction = channel.getTypeFieldEntry(CollaborativeSpace.class, "introduction", true).getDefaultTextString();

  public String getIntroduction() { return introduction; }

  public void setIntroduction(String v) { introduction = v; }




  protected HashMap<String,String> introductionML = channel.getTypeFieldEntry(CollaborativeSpace.class, "introduction", true).getDefaultTextMap();
  public String getIntroduction(String lang) { return channel.getLangValue(lang, true, introduction, introductionML, getMainLanguage()); }
  public String getIntroduction(String lang, boolean useDefault) { return channel.getLangValue(lang, useDefault, introduction, introductionML, getMainLanguage()); }
  public HashMap<String,String> getIntroductionML() { return introductionML; }
  public void setIntroductionML(HashMap<String,String> v) { introductionML = v; }

  public String getIntroductionMLE() {
    return JcmsUtil.encodeMLE(getIntroductionML());
  }

  public void setIntroductionMLE(String v) {
    setIntroductionML(JcmsUtil.decodeMLE(v));
  }

  public void setIntroduction(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      introduction = value;
      return;
    }
    if (introductionML == null) {
      introductionML = new HashMap<>();
    } else if (this != channel.getData(id)) {
      introductionML = new HashMap<>(introductionML);
    }
    introductionML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // accessPolicy
  // ----------------------------------------------------------------------

  protected  String accessPolicy = channel.getTypeFieldEntry(CollaborativeSpace.class, "accessPolicy", true).getDefaultTextString();

  public String getAccessPolicy() { return accessPolicy; }

  public void setAccessPolicy(String v) { accessPolicy = v; }



  public String getAccessPolicy(String lang) { return accessPolicy; }
  public String getAccessPolicy(String lang, boolean useDefault) { return accessPolicy; }
  private static String[] accessPolicyValues;
  private static String[] accessPolicyLabels;
  private static Map<String, String[]> accessPolicyLabelsMap;

  public static String[] getAccessPolicyValues() {
    if(accessPolicyValues == null) {
      setAccessPolicyValues(channel.getTypeFieldEntry(CollaborativeSpace.class, "accessPolicy", true).getEnumerateValues());
    }
    return accessPolicyValues;
  }
  public static void setAccessPolicyValues(String[] values) {
    accessPolicyValues = values;
  }
  public static String[] getAccessPolicyLabels() {
    if(accessPolicyLabels == null) {
      setAccessPolicyLabels(channel.getTypeFieldEntry(CollaborativeSpace.class, "accessPolicy", true).getEnumerateLabels());
    }
    return accessPolicyLabels;
  }
  public static void setAccessPolicyLabels(String[] labels) {
    accessPolicyLabels = labels;
  }
  public static Map<String, String[]> getAccessPolicyLabelsMap() {
    if(accessPolicyLabelsMap == null) {
      setAccessPolicyLabelsMap(channel.getTypeFieldEntry(CollaborativeSpace.class, "accessPolicy", true).getEnumerateLabelsMap());
    }
    return accessPolicyLabelsMap;
  }
  public static void setAccessPolicyLabelsMap(Map<String, String[]> LabelsMap) {
    accessPolicyLabelsMap = LabelsMap;
  }
  public static String[] getAccessPolicyLabels(String userLang) {
    Map<String, String[]> accessPolicyLabelMap = getAccessPolicyLabelsMap();
    String[] labels = accessPolicyLabelMap.get(userLang);
    if (labels == null) {
      labels = accessPolicyLabelMap.get(channel.getLanguage());
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
  public static EnumerateFormReport getAccessPolicyReport(SortedSet<CollaborativeSpace> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (CollaborativeSpace obj : set) {
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

  protected  String signupPolicy = channel.getTypeFieldEntry(CollaborativeSpace.class, "signupPolicy", true).getDefaultTextString();

  public String getSignupPolicy() { return signupPolicy; }

  public void setSignupPolicy(String v) { signupPolicy = v; }



  public String getSignupPolicy(String lang) { return signupPolicy; }
  public String getSignupPolicy(String lang, boolean useDefault) { return signupPolicy; }
  private static String[] signupPolicyValues;
  private static String[] signupPolicyLabels;
  private static Map<String, String[]> signupPolicyLabelsMap;

  public static String[] getSignupPolicyValues() {
    if(signupPolicyValues == null) {
      setSignupPolicyValues(channel.getTypeFieldEntry(CollaborativeSpace.class, "signupPolicy", true).getEnumerateValues());
    }
    return signupPolicyValues;
  }
  public static void setSignupPolicyValues(String[] values) {
    signupPolicyValues = values;
  }
  public static String[] getSignupPolicyLabels() {
    if(signupPolicyLabels == null) {
      setSignupPolicyLabels(channel.getTypeFieldEntry(CollaborativeSpace.class, "signupPolicy", true).getEnumerateLabels());
    }
    return signupPolicyLabels;
  }
  public static void setSignupPolicyLabels(String[] labels) {
    signupPolicyLabels = labels;
  }
  public static Map<String, String[]> getSignupPolicyLabelsMap() {
    if(signupPolicyLabelsMap == null) {
      setSignupPolicyLabelsMap(channel.getTypeFieldEntry(CollaborativeSpace.class, "signupPolicy", true).getEnumerateLabelsMap());
    }
    return signupPolicyLabelsMap;
  }
  public static void setSignupPolicyLabelsMap(Map<String, String[]> LabelsMap) {
    signupPolicyLabelsMap = LabelsMap;
  }
  public static String[] getSignupPolicyLabels(String userLang) {
    Map<String, String[]> signupPolicyLabelMap = getSignupPolicyLabelsMap();
    String[] labels = signupPolicyLabelMap.get(userLang);
    if (labels == null) {
      labels = signupPolicyLabelMap.get(channel.getLanguage());
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
  public static EnumerateFormReport getSignupPolicyReport(SortedSet<CollaborativeSpace> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (CollaborativeSpace obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getSignupPolicy());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // followersGroup
  // ----------------------------------------------------------------------

  protected  com.jalios.jcms.Group followersGroup;

  public com.jalios.jcms.Group getFollowersGroup() { return followersGroup; }

  public void setFollowersGroup(com.jalios.jcms.Group v) { followersGroup = v; }



  // ----------------------------------------------------------------------
  // layout
  // ----------------------------------------------------------------------

  protected  String layout = channel.getTypeFieldEntry(CollaborativeSpace.class, "layout", true).getDefaultTextString();

  public String getLayout() { return layout; }

  public void setLayout(String v) { layout = v; }



  public String getLayout(String lang) { return layout; }
  public String getLayout(String lang, boolean useDefault) { return layout; }
  private static String[] layoutValues;
  private static String[] layoutLabels;
  private static Map<String, String[]> layoutLabelsMap;

  public static String[] getLayoutValues() {
    if(layoutValues == null) {
      setLayoutValues(channel.getTypeFieldEntry(CollaborativeSpace.class, "layout", true).getEnumerateValues());
    }
    return layoutValues;
  }
  public static void setLayoutValues(String[] values) {
    layoutValues = values;
  }
  public static String[] getLayoutLabels() {
    if(layoutLabels == null) {
      setLayoutLabels(channel.getTypeFieldEntry(CollaborativeSpace.class, "layout", true).getEnumerateLabels());
    }
    return layoutLabels;
  }
  public static void setLayoutLabels(String[] labels) {
    layoutLabels = labels;
  }
  public static Map<String, String[]> getLayoutLabelsMap() {
    if(layoutLabelsMap == null) {
      setLayoutLabelsMap(channel.getTypeFieldEntry(CollaborativeSpace.class, "layout", true).getEnumerateLabelsMap());
    }
    return layoutLabelsMap;
  }
  public static void setLayoutLabelsMap(Map<String, String[]> LabelsMap) {
    layoutLabelsMap = LabelsMap;
  }
  public static String[] getLayoutLabels(String userLang) {
    Map<String, String[]> layoutLabelMap = getLayoutLabelsMap();
    String[] labels = layoutLabelMap.get(userLang);
    if (labels == null) {
      labels = layoutLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getLayoutLabel(String value, String userLang) {
    String[] labels = getLayoutLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("sidebar-none")) {
      i = 0;
    }
    else if (value.equals("sidebar-left")) {
      i = 1;
    }
    else if (value.equals("sidebar-right")) {
      i = 2;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getLayoutLabel(value, channel.getLanguage());
  }

  public static String getLayoutLabel(String value) {
    String[] layoutLabels = getLayoutLabels();
    if (false) {
    }
    else if (value.equals("sidebar-none")) {
      return layoutLabels[0];
    }
    else if (value.equals("sidebar-left")) {
      return layoutLabels[1];
    }
    else if (value.equals("sidebar-right")) {
      return layoutLabels[2];
    }
    return "???";
  }
  public static EnumerateFormReport getLayoutReport(SortedSet<CollaborativeSpace> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (CollaborativeSpace obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getLayout());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // dashboardColumnCount
  // ----------------------------------------------------------------------

  protected  int dashboardColumnCount = 2;

  public int getDashboardColumnCount() { return dashboardColumnCount; }

  public void setDashboardColumnCount(int v) { dashboardColumnCount = v; }



  public static IntegerFormReport getDashboardColumnCountReport(SortedSet<CollaborativeSpace> set) {
    long sum = 0;
    int min = Integer.MAX_VALUE;
    int max = Integer.MIN_VALUE;
    for (CollaborativeSpace obj : set) {
      if (obj == null) {
        continue;
      }
      int value = obj.getDashboardColumnCount();
      sum += value;
      min = Math.min(value, min);
      max = Math.max(value, max);
    }
    return new IntegerFormReport(set.size(), sum, min, max);
  }
  // ----------------------------------------------------------------------
  // theme
  // ----------------------------------------------------------------------

  protected  String theme = channel.getTypeFieldEntry(CollaborativeSpace.class, "theme", true).getDefaultTextString();

  public String getTheme() { return theme; }

  public void setTheme(String v) { theme = v; }



  public String getTheme(String lang) { return theme; }
  public String getTheme(String lang, boolean useDefault) { return theme; }
  // ----------------------------------------------------------------------
  // header
  // ----------------------------------------------------------------------

  protected  String header = channel.getTypeFieldEntry(CollaborativeSpace.class, "header", true).getDefaultTextString();

  public String getHeader() { return header; }

  public void setHeader(String v) { header = v; }



  public String getHeader(String lang) { return header; }
  public String getHeader(String lang, boolean useDefault) { return header; }
  // ----------------------------------------------------------------------
  // headerSettings
  // ----------------------------------------------------------------------

  protected  String headerSettings = channel.getTypeFieldEntry(CollaborativeSpace.class, "headerSettings", true).getDefaultTextString();

  public String getHeaderSettings() { return headerSettings; }

  public void setHeaderSettings(String v) { headerSettings = v; }



  public String getHeaderSettings(String lang) { return headerSettings; }
  public String getHeaderSettings(String lang, boolean useDefault) { return headerSettings; }
  // ----------------------------------------------------------------------
  // exactCategory
  // ----------------------------------------------------------------------

  protected  boolean exactCategory = false;

  @Override
public boolean getExactCategory() { return exactCategory; }

  public void setExactCategory(boolean v) { exactCategory = v; }



  public String getExactCategoryLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "exactCategory", true);
    return exactCategory ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang);
  }
  public static String[] getExactCategoryValues() {
    return new String[]{ "true" , "false" };
  }

  public static String[] getExactCategoryLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(CollaborativeSpace.class, "exactCategory", true);
    String onLabel = tfe.getOnLabel(userLang);
    String offLabel = tfe.getOffLabel(userLang);

    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getExactCategoryReport(SortedSet<CollaborativeSpace> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (CollaborativeSpace obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getExactCategory());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // mobileShowIntro
  // ----------------------------------------------------------------------

  protected  boolean mobileShowIntro = true;

  public boolean getMobileShowIntro() { return mobileShowIntro; }

  public void setMobileShowIntro(boolean v) { mobileShowIntro = v; }



  public String getMobileShowIntroLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "mobileShowIntro", true);
    return mobileShowIntro ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang);
  }
  public static String[] getMobileShowIntroValues() {
    return new String[]{ "true" , "false" };
  }

  public static String[] getMobileShowIntroLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(CollaborativeSpace.class, "mobileShowIntro", true);
    String onLabel = tfe.getOnLabel(userLang);
    String offLabel = tfe.getOffLabel(userLang);

    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getMobileShowIntroReport(SortedSet<CollaborativeSpace> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (CollaborativeSpace obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getMobileShowIntro());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // mobileShowApplications
  // ----------------------------------------------------------------------

  protected  boolean mobileShowApplications = true;

  public boolean getMobileShowApplications() { return mobileShowApplications; }

  public void setMobileShowApplications(boolean v) { mobileShowApplications = v; }



  public String getMobileShowApplicationsLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "mobileShowApplications", true);
    return mobileShowApplications ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang);
  }
  public static String[] getMobileShowApplicationsValues() {
    return new String[]{ "true" , "false" };
  }

  public static String[] getMobileShowApplicationsLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(CollaborativeSpace.class, "mobileShowApplications", true);
    String onLabel = tfe.getOnLabel(userLang);
    String offLabel = tfe.getOffLabel(userLang);

    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getMobileShowApplicationsReport(SortedSet<CollaborativeSpace> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (CollaborativeSpace obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getMobileShowApplications());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // jportal
  // ----------------------------------------------------------------------

  protected  com.jalios.jcms.jportal.AbstractJPortal jportal;

  public com.jalios.jcms.jportal.AbstractJPortal getJportal() { return jportal; }

  public void setJportal(com.jalios.jcms.jportal.AbstractJPortal v) { jportal = v; }



  // ----------------------------------------------------------------------
  // syncMode
  // ----------------------------------------------------------------------

  protected  String[] syncMode;

  @Override
public String[] getSyncMode() { return syncMode; }

  public void setSyncMode(String[] v) { syncMode = v; }



  public String[] getSyncMode(String lang) { return syncMode; }
  public String[] getSyncMode(String lang, boolean useDefault) { return syncMode; }
  private static String[] syncModeValues;
  private static String[] syncModeLabels;
  private static Map<String, String[]> syncModeLabelsMap;

  public static String[] getSyncModeValues() {
    if(syncModeValues == null) {
      setSyncModeValues(channel.getTypeFieldEntry(CollaborativeSpace.class, "syncMode", true).getEnumerateValues());
    }
    return syncModeValues;
  }
  public static void setSyncModeValues(String[] values) {
    syncModeValues = values;
  }
  public static String[] getSyncModeLabels() {
    if(syncModeLabels == null) {
      setSyncModeLabels(channel.getTypeFieldEntry(CollaborativeSpace.class, "syncMode", true).getEnumerateLabels());
    }
    return syncModeLabels;
  }
  public static void setSyncModeLabels(String[] labels) {
    syncModeLabels = labels;
  }
  public static Map<String, String[]> getSyncModeLabelsMap() {
    if(syncModeLabelsMap == null) {
      setSyncModeLabelsMap(channel.getTypeFieldEntry(CollaborativeSpace.class, "syncMode", true).getEnumerateLabelsMap());
    }
    return syncModeLabelsMap;
  }
  public static void setSyncModeLabelsMap(Map<String, String[]> LabelsMap) {
    syncModeLabelsMap = LabelsMap;
  }
  public static String[] getSyncModeLabels(String userLang) {
    Map<String, String[]> syncModeLabelMap = getSyncModeLabelsMap();
    String[] labels = syncModeLabelMap.get(userLang);
    if (labels == null) {
      labels = syncModeLabelMap.get(channel.getLanguage());
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
    return "???";
  }
  public static EnumerateFormReport getSyncModeReport(SortedSet<CollaborativeSpace> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (CollaborativeSpace obj : set) {
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
  // modelSyncMode
  // ----------------------------------------------------------------------

  protected  String[] modelSyncMode;

  public String[] getModelSyncMode() { return modelSyncMode; }

  public void setModelSyncMode(String[] v) { modelSyncMode = v; }



  public String[] getModelSyncMode(String lang) { return modelSyncMode; }
  public String[] getModelSyncMode(String lang, boolean useDefault) { return modelSyncMode; }
  private static String[] modelSyncModeValues;
  private static String[] modelSyncModeLabels;
  private static Map<String, String[]> modelSyncModeLabelsMap;

  public static String[] getModelSyncModeValues() {
    if(modelSyncModeValues == null) {
      setModelSyncModeValues(channel.getTypeFieldEntry(CollaborativeSpace.class, "modelSyncMode", true).getEnumerateValues());
    }
    return modelSyncModeValues;
  }
  public static void setModelSyncModeValues(String[] values) {
    modelSyncModeValues = values;
  }
  public static String[] getModelSyncModeLabels() {
    if(modelSyncModeLabels == null) {
      setModelSyncModeLabels(channel.getTypeFieldEntry(CollaborativeSpace.class, "modelSyncMode", true).getEnumerateLabels());
    }
    return modelSyncModeLabels;
  }
  public static void setModelSyncModeLabels(String[] labels) {
    modelSyncModeLabels = labels;
  }
  public static Map<String, String[]> getModelSyncModeLabelsMap() {
    if(modelSyncModeLabelsMap == null) {
      setModelSyncModeLabelsMap(channel.getTypeFieldEntry(CollaborativeSpace.class, "modelSyncMode", true).getEnumerateLabelsMap());
    }
    return modelSyncModeLabelsMap;
  }
  public static void setModelSyncModeLabelsMap(Map<String, String[]> LabelsMap) {
    modelSyncModeLabelsMap = LabelsMap;
  }
  public static String[] getModelSyncModeLabels(String userLang) {
    Map<String, String[]> modelSyncModeLabelMap = getModelSyncModeLabelsMap();
    String[] labels = modelSyncModeLabelMap.get(userLang);
    if (labels == null) {
      labels = modelSyncModeLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getModelSyncModeLabel(String value, String userLang) {
    String[] labels = getModelSyncModeLabels(userLang);
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
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getModelSyncModeLabel(value, channel.getLanguage());
  }

  public static String getModelSyncModeLabel(String value) {
    String[] modelSyncModeLabels = getModelSyncModeLabels();
    if (false) {
    }
    else if (value.equals("dashboard")) {
      return modelSyncModeLabels[0];
    }
    else if (value.equals("tabs")) {
      return modelSyncModeLabels[1];
    }
    else if (value.equals("data")) {
      return modelSyncModeLabels[2];
    }
    return "???";
  }
  public static EnumerateFormReport getModelSyncModeReport(SortedSet<CollaborativeSpace> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (CollaborativeSpace obj : set) {
      if (obj == null || obj.getModelSyncMode() == null) {
        continue;
      }
      for(int i = 0; i < obj.getModelSyncMode().length; i++) {
        if (obj.getModelSyncMode()[i] != null) {
          map.inc(obj.getModelSyncMode()[i]);
        }
      }
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // model
  // ----------------------------------------------------------------------

  protected  com.jalios.jcms.workspace.Workspace model;

  @Override
public com.jalios.jcms.workspace.Workspace getModel() { return model; }

  public void setModel(com.jalios.jcms.workspace.Workspace v) { model = v; }



  // ----------------------------------------------------------------------
  // applications
  // ----------------------------------------------------------------------

  protected  com.jalios.jcms.portlet.PortalElement[] applications;

  @Override
public com.jalios.jcms.portlet.PortalElement[] getApplications() { return applications; }

  public void setApplications(com.jalios.jcms.portlet.PortalElement[] v) { applications = v; }



  // ----------------------------------------------------------------------
  // mobilePortlets
  // ----------------------------------------------------------------------

  protected  com.jalios.jcms.portlet.PortalElement[] mobilePortlets;

  public com.jalios.jcms.portlet.PortalElement[] getMobilePortlets() { return mobilePortlets; }

  public void setMobilePortlets(com.jalios.jcms.portlet.PortalElement[] v) { mobilePortlets = v; }




  // ----------------------------------------------------------------------
  // abstract
  // ----------------------------------------------------------------------
  @Override
  public void setAbstract(String lang, String value) { setDescription(lang, value); }
  @Override
  public String getAbstract() { return description; }
  @Override
  public String getAbstract(String lang, boolean useDefault) { return getDescription(lang, useDefault); }
  @Override
  public HashMap<String,String> getAbstractML() { return getDescriptionML(); }

  // ----------------------------------------------------------------------
  // Data image
  // ----------------------------------------------------------------------
  @Override
  public String getDataImage() {
    String _img = portletImage;
    if (Util.notEmpty(_img)) {
      return _img;
    }

    return super.getDataImage();
  }

  @Override
  public String getDataImage(String lang, boolean useDefault) {
    String _img = getPortletImage(lang, useDefault);
    if (Util.notEmpty(_img)) {
      return _img;
    }

    return super.getDataImage(lang, useDefault);
  }

  @Override
  public String[] getSearchStrings() {
    StringBuffer sb = new StringBuffer(super.getSearchStrings()[0]);
    sb.ensureCapacity(500 * (0 + 3 + 0 + 0 + 0 + 0) );
    if (description != null) {
      sb.append(description); sb.append(' ');
    }
    if (descriptionML != null) {
      for (String str : descriptionML.values()) {
        if (str != null) {
          sb.append(str); sb.append(' ');
        }
      }
    }
    if (introduction != null) {
      sb.append(introduction); sb.append(' ');
    }
    if (introductionML != null) {
      for (String str : introductionML.values()) {
        if (str != null) {
          sb.append(str); sb.append(' ');
        }
      }
    }
    if (title != null) {
      sb.append(title); sb.append(' ');
    }
    if (titleML != null) {
      for (String str : titleML.values()) {
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
    sb.ensureCapacity(500 * (0 + 1 + 0 + 0 + 0 + 0) );
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
    if (introduction != null) {
      sb.append(introduction); sb.append(' ');
    }
    if (introductionML != null) {
      for (String str : introductionML.values()) {
        if (str != null) {
          sb.append(str); sb.append(' ');
        }
      }
    }
    return sb.toString();
  }

  @Override
  public <T extends Data> TreeSet<T> getLinkDataSet(Class<T> clazz) {
    if (clazz == null) {
      return Util.emptyTreeSet();
    }
    TreeSet<T> set = new TreeSet<>();
    JcmsUtil.addData(set, clazz, getApplications());
    JcmsUtil.addData(set, clazz, getChildren());
    JcmsUtil.addData(set, clazz, getFollowersGroup());
    JcmsUtil.addData(set, clazz, getJportal());
    JcmsUtil.addData(set, clazz, getMobilePortlets());
    JcmsUtil.addData(set, clazz, getModel());
    JcmsUtil.addData(set, clazz, getOriginalPortlet());
    return set;
  }
  // ----------------------------------------------------------------------
  // DataController
  // ----------------------------------------------------------------------
  public ControllerStatus checkHtmlIntroduction() {
    ControllerStatus status = JcmsUtil.checkHtml(introduction, channel.getTypeFieldLabel(this, "introduction"));
    if (status.hasFailed()) {
      return status;
    }
    status = JcmsUtil.checkHtml(introductionML, channel.getTypeFieldLabel(this, "introduction"));
    if (status.hasFailed()) {
      return status;
    }
    return ControllerStatus.OK;
  }

  @Override
public ControllerStatus checkIntegrity() {

    ControllerStatus status = super.checkIntegrity();
    if (status.hasFailed()) {
      return status;
    }

    status = checkHtmlIntroduction();
    if (status.hasFailed()) {
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
    if (dashboardColumnCount < 1 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.lesser-number", channel.getTypeFieldLabel(this, "dashboardColumnCount"), "1");
      return status;
    }
    if (dashboardColumnCount > 10 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.greater-number", channel.getTypeFieldLabel(this, "dashboardColumnCount"), "10");
      return status;
    }
    return ControllerStatus.OK;
  }


  // ----------------------------------------------------------------------
  // WorkCopy
  // ----------------------------------------------------------------------
  @Override
protected void prepareMergeCopy(Publication mergeCopy) {
    super.prepareMergeCopy(mergeCopy);
    ((CollaborativeSpace)mergeCopy).setDescription(getDescription());
    ((CollaborativeSpace)mergeCopy).setDescriptionML(JcmsUtil.getMergedMLMap(getDescriptionML(), ((CollaborativeSpace)mergeCopy).getDescriptionML()));
    ((CollaborativeSpace)mergeCopy).setIntroduction(getIntroduction());
    ((CollaborativeSpace)mergeCopy).setIntroductionML(JcmsUtil.getMergedMLMap(getIntroductionML(), ((CollaborativeSpace)mergeCopy).getIntroductionML()));
    ((CollaborativeSpace)mergeCopy).setAccessPolicy(getAccessPolicy());
    ((CollaborativeSpace)mergeCopy).setSignupPolicy(getSignupPolicy());
    ((CollaborativeSpace)mergeCopy).setFollowersGroup(getFollowersGroup());
    ((CollaborativeSpace)mergeCopy).setLayout(getLayout());
    ((CollaborativeSpace)mergeCopy).setDashboardColumnCount(getDashboardColumnCount());
    ((CollaborativeSpace)mergeCopy).setTheme(getTheme());
    ((CollaborativeSpace)mergeCopy).setHeader(getHeader());
    ((CollaborativeSpace)mergeCopy).setHeaderSettings(getHeaderSettings());
    ((CollaborativeSpace)mergeCopy).setExactCategory(getExactCategory());
    ((CollaborativeSpace)mergeCopy).setMobileShowIntro(getMobileShowIntro());
    ((CollaborativeSpace)mergeCopy).setMobileShowApplications(getMobileShowApplications());
    ((CollaborativeSpace)mergeCopy).setJportal(getJportal());
    ((CollaborativeSpace)mergeCopy).setSyncMode(getSyncMode());
    ((CollaborativeSpace)mergeCopy).setModelSyncMode(getModelSyncMode());
    ((CollaborativeSpace)mergeCopy).setModel(getModel());
    ((CollaborativeSpace)mergeCopy).setApplications(getApplications());
    ((CollaborativeSpace)mergeCopy).setMobilePortlets(getMobilePortlets());
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// Fd0DcD/ocGCNG5RSpj/y7w==
