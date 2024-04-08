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
public abstract class AbstractPortal extends com.jalios.jcms.portlet.Portal
             implements
                com.jalios.jstore.Searchable
{

  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------
  public AbstractPortal() {}






  public AbstractPortal(AbstractPortal other) {
    super(other);
    pageTitle = other.pageTitle;
    pageTitleML = other.pageTitleML;
    child = other.child;
    cssFile = other.cssFile;
    description = other.description;
    descriptionML = other.descriptionML;
    portletImage = other.portletImage;
    portletImageML = other.portletImageML;
    cacheType = other.cacheType;
    cacheSensibility = other.cacheSensibility;
    invalidClass = other.invalidClass;
    invalidTime = other.invalidTime;
    behaviorCopy = other.behaviorCopy;
    cssId = other.cssId;
    cssClasses = other.cssClasses;
    exactCategory = other.exactCategory;
  }

  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  @Override
public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);

    setPageTitle(ImportUtil.parseFieldText(elt, "pageTitle"));
    setPageTitleML(ImportUtil.parseFieldTextML(elt, "pageTitleML"));
    setCssFile(ImportUtil.parseFieldText(elt, "cssFile"));
    setPortletImage(ImportUtil.parseFieldText(elt, "portletImage"));
    setPortletImageML(ImportUtil.parseFieldTextML(elt, "portletImageML"));
    setCacheType(ImportUtil.parseFieldText(elt, "cacheType"));
    setCacheSensibility(ImportUtil.parseFieldText(elt, "cacheSensibility"));
    setInvalidClass(ImportUtil.parseFieldTextArray(elt, "invalidClass"));
    setInvalidTime(ImportUtil.parseFieldLong(elt, "invalidTime"));
    setBehaviorCopy(ImportUtil.parseFieldText(elt, "behaviorCopy"));
    setCssId(ImportUtil.parseFieldText(elt, "cssId"));
    setCssClasses(ImportUtil.parseFieldText(elt, "cssClasses"));
    setExactCategory(ImportUtil.parseFieldBoolean(elt, "exactCategory"));
  }

  @Override
protected void importXmlFieldsWithReferences(org.jdom.Element elt, ImportOptions options) {
    super.importXmlFieldsWithReferences(elt, options);

    if (options.isSelfImport()) {
      setChild(ImportUtil.parseSelfFieldData(elt, "child", com.jalios.jcms.portlet.PortalElement.class));
      setDescription(ImportUtil.parseFieldText(elt, "description"));
      setDescriptionML(ImportUtil.parseFieldTextML(elt, "descriptionML"));
    } else {

    setDescriptionML(ImportUtil.parseFieldWikiML(elt, "descriptionML"));
    setDescription(ImportUtil.parseFieldWiki(elt, "description"));
    }
  }

  @Override
public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "pageTitle", getPageTitle(), "pageTitleML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "pageTitleML", getPageTitleML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "child", getChild()));
    sb.append(ExportUtil.exportField(indentLevel, "cssFile", getCssFile(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "description", getDescription(), "descriptionML", true, true));
    sb.append(ExportUtil.exportField(indentLevel, "descriptionML", getDescriptionML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "portletImage", getPortletImage(), "portletImageML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "portletImageML", getPortletImageML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "cacheType", getCacheType(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "cacheSensibility", getCacheSensibility(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "invalidClass", getInvalidClass(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "invalidTime", getInvalidTime()));
    sb.append(ExportUtil.exportField(indentLevel, "behaviorCopy", getBehaviorCopy(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "cssId", getCssId(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "cssClasses", getCssClasses(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "exactCategory", getExactCategory()));
  }

  @Override
public Set<FileDocument> getDocumentLinkSet() {
    Set<FileDocument> docSet = super.getDocumentLinkSet();
    JcmsUtil.addFileDocument(docSet, portletImage, portletImageML);
    return docSet;
  }

  // ----------------------------------------------------------------------
  // TYPE AND FIELD INFOS (static methods)
  // ----------------------------------------------------------------------
  /**
   * Returns the TypeEntry bound to <code>AbstractPortal</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(AbstractPortal.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>AbstractPortal</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>AbstractPortal</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>AbstractPortal</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(AbstractPortal.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>AbstractPortal</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>AbstractPortal</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>AbstractPortal</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(AbstractPortal.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>AbstractPortal</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getIntFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>int</code> field name for the current <code>AbstractPortal</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0
   */
  @Override
public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {
    super.setIntFieldValue(fieldName, value);
  }

  /**
   * Gets the value of the given <code>long</code> field name for the current <code>AbstractPortal</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    if ("invalidTime".equals(fieldName)) { return getInvalidTime(); }
    return super.getLongFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>long</code> field name for the current <code>AbstractPortal</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0
   */
  @Override
public void setLongFieldValue(String fieldName, long value) throws NoSuchFieldException {
    if ("invalidTime".equals(fieldName)) { setInvalidTime(value); return; }
    super.setLongFieldValue(fieldName, value);
  }

  /**
   * Gets the value of the given <code>double</code> field name for the current <code>AbstractPortal</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>double</code> field name for the current <code>AbstractPortal</code>.
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
   * Gets the value of the given <code>boolean</code> field name for the current <code>AbstractPortal</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    if ("exactCategory".equals(fieldName)) { return getExactCategory(); }
    return super.getBooleanFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>AbstractPortal</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0
   */
  @Override
public void setBooleanFieldValue(String fieldName, boolean value) throws NoSuchFieldException {
    if ("exactCategory".equals(fieldName)) { setExactCategory(value); return; }
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
   * Gets the <code>Object</code> value of the given field name for this <code>AbstractPortal</code>. <br>
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
    if ("pageTitle".equals(fieldName)) { return getPageTitle(lang, useDefault); }
    if ("child".equals(fieldName)) { return getChild(); }
    if ("cssFile".equals(fieldName)) { return getCssFile(); }
    if ("description".equals(fieldName)) { return getDescription(lang, useDefault); }
    if ("portletImage".equals(fieldName)) { return getPortletImage(lang, useDefault); }
    if ("cacheType".equals(fieldName)) { return getCacheType(); }
    if ("cacheSensibility".equals(fieldName)) { return getCacheSensibility(); }
    if ("invalidClass".equals(fieldName)) { return getInvalidClass(); }
    if ("behaviorCopy".equals(fieldName)) { return getBehaviorCopy(); }
    if ("cssId".equals(fieldName)) { return getCssId(); }
    if ("cssClasses".equals(fieldName)) { return getCssClasses(); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }

  /**
   * Sets the <code>Object</code> value of the given field name for this <code>AbstractPortal</code>. <br>
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
    if ("pageTitle".equals(fieldName)) { setPageTitle(lang,(String)value); return; }
    if ("child".equals(fieldName)) { setChild((com.jalios.jcms.portlet.PortalElement)value); return; }
    if ("cssFile".equals(fieldName)) { setCssFile((String)value); return; }
    if ("description".equals(fieldName)) { setDescription(lang,(String)value); return; }
    if ("portletImage".equals(fieldName)) { setPortletImage(lang,(String)value); return; }
    if ("cacheType".equals(fieldName)) { setCacheType((String)value); return; }
    if ("cacheSensibility".equals(fieldName)) { setCacheSensibility((String)value); return; }
    if ("invalidClass".equals(fieldName)) { setInvalidClass((String[])value); return; }
    if ("behaviorCopy".equals(fieldName)) { setBehaviorCopy((String)value); return; }
    if ("cssId".equals(fieldName)) { setCssId((String)value); return; }
    if ("cssClasses".equals(fieldName)) { setCssClasses((String)value); return; }
    super.setFieldValue(fieldName, value, lang);
  }

  // ----------------------------------------------------------------------
  // pageTitle
  // ----------------------------------------------------------------------

  protected  String pageTitle = channel.getTypeFieldEntry(AbstractPortal.class, "pageTitle", true).getDefaultTextString();

  public String getPageTitle() { return pageTitle; }

  @Override
public void setPageTitle(String v) { pageTitle = v; }




  protected HashMap<String,String> pageTitleML = channel.getTypeFieldEntry(AbstractPortal.class, "pageTitle", true).getDefaultTextMap();
  @Override
public String getPageTitle(String lang) { return channel.getLangValue(lang, true, pageTitle, pageTitleML, getMainLanguage()); }
  @Override
public String getPageTitle(String lang, boolean useDefault) { return channel.getLangValue(lang, useDefault, pageTitle, pageTitleML, getMainLanguage()); }
  @Override
public HashMap<String,String> getPageTitleML() { return pageTitleML; }
  @Override
public void setPageTitleML(HashMap<String,String> v) { pageTitleML = v; }

  public String getPageTitleMLE() {
    return JcmsUtil.encodeMLE(getPageTitleML());
  }

  public void setPageTitleMLE(String v) {
    setPageTitleML(JcmsUtil.decodeMLE(v));
  }

  public void setPageTitle(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      pageTitle = value;
      return;
    }
    if (pageTitleML == null) {
      pageTitleML = new HashMap<>();
    } else if (this != channel.getData(id)) {
      pageTitleML = new HashMap<>(pageTitleML);
    }
    pageTitleML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // child
  // ----------------------------------------------------------------------

  protected  com.jalios.jcms.portlet.PortalElement child;

  @Override
public com.jalios.jcms.portlet.PortalElement getChild() { return child; }

  @Override
public void setChild(com.jalios.jcms.portlet.PortalElement v) { child = v; }



  // ----------------------------------------------------------------------
  // cssFile
  // ----------------------------------------------------------------------

  protected  String cssFile = channel.getTypeFieldEntry(AbstractPortal.class, "cssFile", true).getDefaultTextString();

  @Override
public String getCssFile() { return cssFile; }

  @Override
public void setCssFile(String v) { cssFile = v; }



  public String getCssFile(String lang) { return cssFile; }
  public String getCssFile(String lang, boolean useDefault) { return cssFile; }
  private static String[] cssFileValues;
  private static String[] cssFileLabels;
  private static Map<String, String[]> cssFileLabelsMap;

  public static String[] getCssFileValues() {
    if(cssFileValues == null) {
      setCssFileValues(channel.getTypeFieldEntry(AbstractPortal.class, "cssFile", true).getEnumerateValues());
    }
    return cssFileValues;
  }
  public static void setCssFileValues(String[] values) {
    cssFileValues = values;
  }
  public static String[] getCssFileLabels() {
    if(cssFileLabels == null) {
      setCssFileLabels(channel.getTypeFieldEntry(AbstractPortal.class, "cssFile", true).getEnumerateLabels());
    }
    return cssFileLabels;
  }
  public static void setCssFileLabels(String[] labels) {
    cssFileLabels = labels;
  }
  public static Map<String, String[]> getCssFileLabelsMap() {
    if(cssFileLabelsMap == null) {
      setCssFileLabelsMap(channel.getTypeFieldEntry(AbstractPortal.class, "cssFile", true).getEnumerateLabelsMap());
    }
    return cssFileLabelsMap;
  }
  public static void setCssFileLabelsMap(Map<String, String[]> LabelsMap) {
    cssFileLabelsMap = LabelsMap;
  }
  public static String[] getCssFileLabels(String userLang) {
    Map<String, String[]> cssFileLabelMap = getCssFileLabelsMap();
    String[] labels = cssFileLabelMap.get(userLang);
    if (labels == null) {
      labels = cssFileLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getCssFileLabel(String value, String userLang) {
    String[] labels = getCssFileLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("Default")) {
      i = 0;
    }
    else if (value.equals("Custom")) {
      i = 1;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getCssFileLabel(value, channel.getLanguage());
  }

  public static String getCssFileLabel(String value) {
    String[] cssFileLabels = getCssFileLabels();
    if (false) {
    }
    else if (value.equals("Default")) {
      return cssFileLabels[0];
    }
    else if (value.equals("Custom")) {
      return cssFileLabels[1];
    }
    return "???";
  }
  public static EnumerateFormReport getCssFileReport(SortedSet<AbstractPortal> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (AbstractPortal obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getCssFile());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // description
  // ----------------------------------------------------------------------

  protected  String description = channel.getTypeFieldEntry(AbstractPortal.class, "description", true).getDefaultTextString();

  public String getDescription() { return description; }

  @Override
public void setDescription(String v) { description = v; }




  protected HashMap<String,String> descriptionML = channel.getTypeFieldEntry(AbstractPortal.class, "description", true).getDefaultTextMap();
  @Override
public String getDescription(String lang) { return channel.getLangValue(lang, true, description, descriptionML, getMainLanguage()); }
  @Override
public String getDescription(String lang, boolean useDefault) { return channel.getLangValue(lang, useDefault, description, descriptionML, getMainLanguage()); }
  @Override
public HashMap<String,String> getDescriptionML() { return descriptionML; }
  @Override
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
  // portletImage
  // ----------------------------------------------------------------------

  protected  String portletImage = channel.getTypeFieldEntry(AbstractPortal.class, "portletImage", true).getDefaultTextString();

  public String getPortletImage() { return portletImage; }

  @Override
public void setPortletImage(String v) { portletImage = v; }




  protected HashMap<String,String> portletImageML = channel.getTypeFieldEntry(AbstractPortal.class, "portletImage", true).getDefaultTextMap();
  @Override
public String getPortletImage(String lang) { return channel.getLangValue(lang, true, portletImage, portletImageML, getMainLanguage()); }
  @Override
public String getPortletImage(String lang, boolean useDefault) { return channel.getLangValue(lang, useDefault, portletImage, portletImageML, getMainLanguage()); }
  @Override
public HashMap<String,String> getPortletImageML() { return portletImageML; }
  @Override
public void setPortletImageML(HashMap<String,String> v) { portletImageML = v; }

  public String getPortletImageMLE() {
    return JcmsUtil.encodeMLE(getPortletImageML());
  }

  public void setPortletImageMLE(String v) {
    setPortletImageML(JcmsUtil.decodeMLE(v));
  }

  public void setPortletImage(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      portletImage = value;
      return;
    }
    if (portletImageML == null) {
      portletImageML = new HashMap<>();
    } else if (this != channel.getData(id)) {
      portletImageML = new HashMap<>(portletImageML);
    }
    portletImageML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // cacheType
  // ----------------------------------------------------------------------

  protected  String cacheType = channel.getTypeFieldEntry(AbstractPortal.class, "cacheType", true).getDefaultTextString();

  @Override
public String getCacheType() { return cacheType; }

  @Override
public void setCacheType(String v) { cacheType = v; }



  public String getCacheType(String lang) { return cacheType; }
  public String getCacheType(String lang, boolean useDefault) { return cacheType; }
  private static String[] cacheTypeValues;
  private static String[] cacheTypeLabels;
  private static Map<String, String[]> cacheTypeLabelsMap;

  public static String[] getCacheTypeValues() {
    if(cacheTypeValues == null) {
      setCacheTypeValues(channel.getTypeFieldEntry(AbstractPortal.class, "cacheType", true).getEnumerateValues());
    }
    return cacheTypeValues;
  }
  public static void setCacheTypeValues(String[] values) {
    cacheTypeValues = values;
  }
  public static String[] getCacheTypeLabels() {
    if(cacheTypeLabels == null) {
      setCacheTypeLabels(channel.getTypeFieldEntry(AbstractPortal.class, "cacheType", true).getEnumerateLabels());
    }
    return cacheTypeLabels;
  }
  public static void setCacheTypeLabels(String[] labels) {
    cacheTypeLabels = labels;
  }
  public static Map<String, String[]> getCacheTypeLabelsMap() {
    if(cacheTypeLabelsMap == null) {
      setCacheTypeLabelsMap(channel.getTypeFieldEntry(AbstractPortal.class, "cacheType", true).getEnumerateLabelsMap());
    }
    return cacheTypeLabelsMap;
  }
  public static void setCacheTypeLabelsMap(Map<String, String[]> LabelsMap) {
    cacheTypeLabelsMap = LabelsMap;
  }
  public static String[] getCacheTypeLabels(String userLang) {
    Map<String, String[]> cacheTypeLabelMap = getCacheTypeLabelsMap();
    String[] labels = cacheTypeLabelMap.get(userLang);
    if (labels == null) {
      labels = cacheTypeLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getCacheTypeLabel(String value, String userLang) {
    String[] labels = getCacheTypeLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("None")) {
      i = 0;
    }
    else if (value.equals("Server")) {
      i = 1;
    }
    else if (value.equals("Groups")) {
      i = 2;
    }
    else if (value.equals("Members")) {
      i = 3;
    }
    else if (value.equals("Session")) {
      i = 4;
    }
    else if (value.equals("SessionAndVisitors")) {
      i = 5;
    }
    else if (value.equals("VisitorsOnly")) {
      i = 6;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getCacheTypeLabel(value, channel.getLanguage());
  }

  public static String getCacheTypeLabel(String value) {
    String[] cacheTypeLabels = getCacheTypeLabels();
    if (false) {
    }
    else if (value.equals("None")) {
      return cacheTypeLabels[0];
    }
    else if (value.equals("Server")) {
      return cacheTypeLabels[1];
    }
    else if (value.equals("Groups")) {
      return cacheTypeLabels[2];
    }
    else if (value.equals("Members")) {
      return cacheTypeLabels[3];
    }
    else if (value.equals("Session")) {
      return cacheTypeLabels[4];
    }
    else if (value.equals("SessionAndVisitors")) {
      return cacheTypeLabels[5];
    }
    else if (value.equals("VisitorsOnly")) {
      return cacheTypeLabels[6];
    }
    return "???";
  }
  public static EnumerateFormReport getCacheTypeReport(SortedSet<AbstractPortal> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (AbstractPortal obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getCacheType());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // cacheSensibility
  // ----------------------------------------------------------------------

  protected  String cacheSensibility = channel.getTypeFieldEntry(AbstractPortal.class, "cacheSensibility", true).getDefaultTextString();

  @Override
public String getCacheSensibility() { return cacheSensibility; }

  @Override
public void setCacheSensibility(String v) { cacheSensibility = v; }



  public String getCacheSensibility(String lang) { return cacheSensibility; }
  public String getCacheSensibility(String lang, boolean useDefault) { return cacheSensibility; }
  private static String[] cacheSensibilityValues;
  private static String[] cacheSensibilityLabels;
  private static Map<String, String[]> cacheSensibilityLabelsMap;

  public static String[] getCacheSensibilityValues() {
    if(cacheSensibilityValues == null) {
      setCacheSensibilityValues(channel.getTypeFieldEntry(AbstractPortal.class, "cacheSensibility", true).getEnumerateValues());
    }
    return cacheSensibilityValues;
  }
  public static void setCacheSensibilityValues(String[] values) {
    cacheSensibilityValues = values;
  }
  public static String[] getCacheSensibilityLabels() {
    if(cacheSensibilityLabels == null) {
      setCacheSensibilityLabels(channel.getTypeFieldEntry(AbstractPortal.class, "cacheSensibility", true).getEnumerateLabels());
    }
    return cacheSensibilityLabels;
  }
  public static void setCacheSensibilityLabels(String[] labels) {
    cacheSensibilityLabels = labels;
  }
  public static Map<String, String[]> getCacheSensibilityLabelsMap() {
    if(cacheSensibilityLabelsMap == null) {
      setCacheSensibilityLabelsMap(channel.getTypeFieldEntry(AbstractPortal.class, "cacheSensibility", true).getEnumerateLabelsMap());
    }
    return cacheSensibilityLabelsMap;
  }
  public static void setCacheSensibilityLabelsMap(Map<String, String[]> LabelsMap) {
    cacheSensibilityLabelsMap = LabelsMap;
  }
  public static String[] getCacheSensibilityLabels(String userLang) {
    Map<String, String[]> cacheSensibilityLabelMap = getCacheSensibilityLabelsMap();
    String[] labels = cacheSensibilityLabelMap.get(userLang);
    if (labels == null) {
      labels = cacheSensibilityLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getCacheSensibilityLabel(String value, String userLang) {
    String[] labels = getCacheSensibilityLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("None")) {
      i = 0;
    }
    else if (value.equals("Portal")) {
      i = 1;
    }
    else if (value.equals("Current")) {
      i = 2;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getCacheSensibilityLabel(value, channel.getLanguage());
  }

  public static String getCacheSensibilityLabel(String value) {
    String[] cacheSensibilityLabels = getCacheSensibilityLabels();
    if (false) {
    }
    else if (value.equals("None")) {
      return cacheSensibilityLabels[0];
    }
    else if (value.equals("Portal")) {
      return cacheSensibilityLabels[1];
    }
    else if (value.equals("Current")) {
      return cacheSensibilityLabels[2];
    }
    return "???";
  }
  public static EnumerateFormReport getCacheSensibilityReport(SortedSet<AbstractPortal> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (AbstractPortal obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getCacheSensibility());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // invalidClass
  // ----------------------------------------------------------------------

  protected  String[] invalidClass;

  @Override
public String[] getInvalidClass() { return invalidClass; }

  @Override
public void setInvalidClass(String[] v) { invalidClass = v; }



  public String[] getInvalidClass(String lang) { return invalidClass; }
  public String[] getInvalidClass(String lang, boolean useDefault) { return invalidClass; }
  private static String[] invalidClassValues;
  private static String[] invalidClassLabels;
  private static Map<String, String[]> invalidClassLabelsMap;

  public static String[] getInvalidClassValues() {
    if(invalidClassValues == null) {
      setInvalidClassValues(channel.getTypeFieldEntry(AbstractPortal.class, "invalidClass", true).getEnumerateValues());
    }
    return invalidClassValues;
  }
  public static void setInvalidClassValues(String[] values) {
    invalidClassValues = values;
  }
  public static String[] getInvalidClassLabels() {
    if(invalidClassLabels == null) {
      setInvalidClassLabels(channel.getTypeFieldEntry(AbstractPortal.class, "invalidClass", true).getEnumerateLabels());
    }
    return invalidClassLabels;
  }
  public static void setInvalidClassLabels(String[] labels) {
    invalidClassLabels = labels;
  }
  public static Map<String, String[]> getInvalidClassLabelsMap() {
    if(invalidClassLabelsMap == null) {
      setInvalidClassLabelsMap(channel.getTypeFieldEntry(AbstractPortal.class, "invalidClass", true).getEnumerateLabelsMap());
    }
    return invalidClassLabelsMap;
  }
  public static void setInvalidClassLabelsMap(Map<String, String[]> LabelsMap) {
    invalidClassLabelsMap = LabelsMap;
  }
  public static String[] getInvalidClassLabels(String userLang) {
    Map<String, String[]> invalidClassLabelMap = getInvalidClassLabelsMap();
    String[] labels = invalidClassLabelMap.get(userLang);
    if (labels == null) {
      labels = invalidClassLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getInvalidClassLabel(String value, String userLang) {
    String[] labels = getInvalidClassLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("Data")) {
      i = 0;
    }
    else if (value.equals("Publication")) {
      i = 1;
    }
    else if (value.equals("Content")) {
      i = 2;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getInvalidClassLabel(value, channel.getLanguage());
  }

  public static String getInvalidClassLabel(String value) {
    String[] invalidClassLabels = getInvalidClassLabels();
    if (false) {
    }
    else if (value.equals("Data")) {
      return invalidClassLabels[0];
    }
    else if (value.equals("Publication")) {
      return invalidClassLabels[1];
    }
    else if (value.equals("Content")) {
      return invalidClassLabels[2];
    }
    return "???";
  }
  public static EnumerateFormReport getInvalidClassReport(SortedSet<AbstractPortal> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (AbstractPortal obj : set) {
      if (obj == null || obj.getInvalidClass() == null) {
        continue;
      }
      for(int i = 0; i < obj.getInvalidClass().length; i++) {
        if (obj.getInvalidClass()[i] != null) {
          map.inc(obj.getInvalidClass()[i]);
        }
      }
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // invalidTime
  // ----------------------------------------------------------------------

  protected  long invalidTime = 60;

  @Override
public long getInvalidTime() { return invalidTime; }

  @Override
public void setInvalidTime(long v) { invalidTime = v; }



  // ----------------------------------------------------------------------
  // behaviorCopy
  // ----------------------------------------------------------------------

  protected  String behaviorCopy = channel.getTypeFieldEntry(AbstractPortal.class, "behaviorCopy", true).getDefaultTextString();

  @Override
public String getBehaviorCopy() { return behaviorCopy; }

  @Override
public void setBehaviorCopy(String v) { behaviorCopy = v; }



  public String getBehaviorCopy(String lang) { return behaviorCopy; }
  public String getBehaviorCopy(String lang, boolean useDefault) { return behaviorCopy; }
  private static String[] behaviorCopyValues;
  private static String[] behaviorCopyLabels;
  private static Map<String, String[]> behaviorCopyLabelsMap;

  public static String[] getBehaviorCopyValues() {
    if(behaviorCopyValues == null) {
      setBehaviorCopyValues(channel.getTypeFieldEntry(AbstractPortal.class, "behaviorCopy", true).getEnumerateValues());
    }
    return behaviorCopyValues;
  }
  public static void setBehaviorCopyValues(String[] values) {
    behaviorCopyValues = values;
  }
  public static String[] getBehaviorCopyLabels() {
    if(behaviorCopyLabels == null) {
      setBehaviorCopyLabels(channel.getTypeFieldEntry(AbstractPortal.class, "behaviorCopy", true).getEnumerateLabels());
    }
    return behaviorCopyLabels;
  }
  public static void setBehaviorCopyLabels(String[] labels) {
    behaviorCopyLabels = labels;
  }
  public static Map<String, String[]> getBehaviorCopyLabelsMap() {
    if(behaviorCopyLabelsMap == null) {
      setBehaviorCopyLabelsMap(channel.getTypeFieldEntry(AbstractPortal.class, "behaviorCopy", true).getEnumerateLabelsMap());
    }
    return behaviorCopyLabelsMap;
  }
  public static void setBehaviorCopyLabelsMap(Map<String, String[]> LabelsMap) {
    behaviorCopyLabelsMap = LabelsMap;
  }
  public static String[] getBehaviorCopyLabels(String userLang) {
    Map<String, String[]> behaviorCopyLabelMap = getBehaviorCopyLabelsMap();
    String[] labels = behaviorCopyLabelMap.get(userLang);
    if (labels == null) {
      labels = behaviorCopyLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getBehaviorCopyLabel(String value, String userLang) {
    String[] labels = getBehaviorCopyLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("true")) {
      i = 0;
    }
    else if (value.equals("false")) {
      i = 1;
    }
    else if (value.equals("ws")) {
      i = 2;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getBehaviorCopyLabel(value, channel.getLanguage());
  }

  public static String getBehaviorCopyLabel(String value) {
    String[] behaviorCopyLabels = getBehaviorCopyLabels();
    if (false) {
    }
    else if (value.equals("true")) {
      return behaviorCopyLabels[0];
    }
    else if (value.equals("false")) {
      return behaviorCopyLabels[1];
    }
    else if (value.equals("ws")) {
      return behaviorCopyLabels[2];
    }
    return "???";
  }
  public static EnumerateFormReport getBehaviorCopyReport(SortedSet<AbstractPortal> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (AbstractPortal obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getBehaviorCopy());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // cssId
  // ----------------------------------------------------------------------

  protected  String cssId = channel.getTypeFieldEntry(AbstractPortal.class, "cssId", true).getDefaultTextString();

  @Override
public String getCssId() { return cssId; }

  @Override
public void setCssId(String v) { cssId = v; }



  public String getCssId(String lang) { return cssId; }
  public String getCssId(String lang, boolean useDefault) { return cssId; }
  // ----------------------------------------------------------------------
  // cssClasses
  // ----------------------------------------------------------------------

  protected  String cssClasses = channel.getTypeFieldEntry(AbstractPortal.class, "cssClasses", true).getDefaultTextString();

  @Override
public String getCssClasses() { return cssClasses; }

  @Override
public void setCssClasses(String v) { cssClasses = v; }



  public String getCssClasses(String lang) { return cssClasses; }
  public String getCssClasses(String lang, boolean useDefault) { return cssClasses; }
  // ----------------------------------------------------------------------
  // exactCategory
  // ----------------------------------------------------------------------

  protected  boolean exactCategory = false;

  @Override
public boolean getExactCategory() { return exactCategory; }

  @Override
public void setExactCategory(boolean v) { exactCategory = v; }



  public String getExactCategoryLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "exactCategory", true);
    return exactCategory ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang);
  }
  public static String[] getExactCategoryValues() {
    return new String[]{ "true" , "false" };
  }

  public static String[] getExactCategoryLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(AbstractPortal.class, "exactCategory", true);
    String onLabel = tfe.getOnLabel(userLang);
    String offLabel = tfe.getOffLabel(userLang);

    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getExactCategoryReport(SortedSet<AbstractPortal> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (AbstractPortal obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getExactCategory());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }

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
    sb.ensureCapacity(500 * (0 + 4 + 0 + 0 + 0 + 0) );
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
    if (pageTitle != null) {
      sb.append(pageTitle); sb.append(' ');
    }
    if (pageTitleML != null) {
      for (String str : pageTitleML.values()) {
        if (str != null) {
          sb.append(str); sb.append(' ');
        }
      }
    }
    if (portletImage != null) {
      sb.append(portletImage); sb.append(' ');
    }
    if (portletImageML != null) {
      for (String str : portletImageML.values()) {
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
    JcmsUtil.addData(set, clazz, getChild());
    return set;
  }
  // ----------------------------------------------------------------------
  // DataController
  // ----------------------------------------------------------------------
  @Override
public ControllerStatus checkIntegrity() {

    ControllerStatus status = super.checkIntegrity();
    if (status.hasFailed()) {
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
    ((AbstractPortal)mergeCopy).setPageTitle(getPageTitle());
    ((AbstractPortal)mergeCopy).setPageTitleML(JcmsUtil.getMergedMLMap(getPageTitleML(), ((AbstractPortal)mergeCopy).getPageTitleML()));
    ((AbstractPortal)mergeCopy).setChild(getChild());
    ((AbstractPortal)mergeCopy).setCssFile(getCssFile());
    ((AbstractPortal)mergeCopy).setDescription(getDescription());
    ((AbstractPortal)mergeCopy).setDescriptionML(JcmsUtil.getMergedMLMap(getDescriptionML(), ((AbstractPortal)mergeCopy).getDescriptionML()));
    ((AbstractPortal)mergeCopy).setPortletImage(getPortletImage());
    ((AbstractPortal)mergeCopy).setPortletImageML(JcmsUtil.getMergedMLMap(getPortletImageML(), ((AbstractPortal)mergeCopy).getPortletImageML()));
    ((AbstractPortal)mergeCopy).setCacheType(getCacheType());
    ((AbstractPortal)mergeCopy).setCacheSensibility(getCacheSensibility());
    ((AbstractPortal)mergeCopy).setInvalidClass(getInvalidClass());
    ((AbstractPortal)mergeCopy).setInvalidTime(getInvalidTime());
    ((AbstractPortal)mergeCopy).setBehaviorCopy(getBehaviorCopy());
    ((AbstractPortal)mergeCopy).setCssId(getCssId());
    ((AbstractPortal)mergeCopy).setCssClasses(getCssClasses());
    ((AbstractPortal)mergeCopy).setExactCategory(getExactCategory());
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// CGa5hJKa+IniSXNZvJZtQg==
