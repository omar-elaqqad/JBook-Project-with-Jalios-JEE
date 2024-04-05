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
public  class JPortal extends com.jalios.jcms.jportal.AbstractJPortal 
             implements 
                com.jalios.jcms.portlet.PortalInterface
               , com.jalios.jstore.Searchable
{
  
  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------  
  public JPortal() {}
 
 
 
  
  
  
  public JPortal(JPortal other) {
    super(other);
    pageTitle = other.pageTitle;
    pageTitleML = other.pageTitleML;
    description = other.description;
    descriptionML = other.descriptionML;
    keywords = other.keywords;
    keywordsML = other.keywordsML;
    portletImage = other.portletImage;
    portletImageML = other.portletImageML;
    behaviorCopy = other.behaviorCopy;
    cssId = other.cssId;
    cssClasses = other.cssClasses;
    cacheType = other.cacheType;
    cacheSensibility = other.cacheSensibility;
    invalidClass = other.invalidClass;
    invalidTime = other.invalidTime;
    exactCategory = other.exactCategory;
    displayTopbar = other.displayTopbar;
    displayScrollToTop = other.displayScrollToTop;
    css = other.css;
    structure = other.structure;
    portlets = other.portlets;
  }
  
  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);
    
    setPageTitle(ImportUtil.parseFieldText(elt, "pageTitle"));
    setPageTitleML(ImportUtil.parseFieldTextML(elt, "pageTitleML"));
    setDescription(ImportUtil.parseFieldText(elt, "description"));
    setDescriptionML(ImportUtil.parseFieldTextML(elt, "descriptionML"));
    setKeywords(ImportUtil.parseFieldText(elt, "keywords"));
    setKeywordsML(ImportUtil.parseFieldTextML(elt, "keywordsML"));
    setPortletImage(ImportUtil.parseFieldText(elt, "portletImage"));
    setPortletImageML(ImportUtil.parseFieldTextML(elt, "portletImageML"));
    setBehaviorCopy(ImportUtil.parseFieldText(elt, "behaviorCopy"));
    setCssId(ImportUtil.parseFieldText(elt, "cssId"));
    setCssClasses(ImportUtil.parseFieldText(elt, "cssClasses"));
    setCacheType(ImportUtil.parseFieldText(elt, "cacheType"));
    setCacheSensibility(ImportUtil.parseFieldText(elt, "cacheSensibility"));
    setInvalidClass(ImportUtil.parseFieldTextArray(elt, "invalidClass"));
    setInvalidTime(ImportUtil.parseFieldLong(elt, "invalidTime"));
    setExactCategory(ImportUtil.parseFieldBoolean(elt, "exactCategory"));
    setDisplayTopbar(ImportUtil.parseFieldBoolean(elt, "displayTopbar"));
    setDisplayScrollToTop(ImportUtil.parseFieldBoolean(elt, "displayScrollToTop"));
    setCss(ImportUtil.parseFieldText(elt, "css"));
    setStructure(ImportUtil.parseFieldText(elt, "structure"));
  }
  
  protected void importXmlFieldsWithReferences(org.jdom.Element elt, ImportOptions options) {
    super.importXmlFieldsWithReferences(elt, options);
      
    if (options.isSelfImport()) {
      setPortlets(ImportUtil.parseSelfFieldDataArray(elt, "portlets", com.jalios.jcms.portlet.Portlet.class));
    } else {
    
    }
  }
  
  public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "pageTitle", getPageTitle(), "pageTitleML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "pageTitleML", getPageTitleML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "description", getDescription(), "descriptionML", true, true));
    sb.append(ExportUtil.exportField(indentLevel, "descriptionML", getDescriptionML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "keywords", getKeywords(), "keywordsML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "keywordsML", getKeywordsML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "portletImage", getPortletImage(), "portletImageML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "portletImageML", getPortletImageML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "behaviorCopy", getBehaviorCopy(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "cssId", getCssId(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "cssClasses", getCssClasses(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "cacheType", getCacheType(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "cacheSensibility", getCacheSensibility(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "invalidClass", getInvalidClass(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "invalidTime", getInvalidTime()));
    sb.append(ExportUtil.exportField(indentLevel, "exactCategory", getExactCategory()));
    sb.append(ExportUtil.exportField(indentLevel, "displayTopbar", getDisplayTopbar()));
    sb.append(ExportUtil.exportField(indentLevel, "displayScrollToTop", getDisplayScrollToTop()));
    sb.append(ExportUtil.exportField(indentLevel, "css", getCss(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "structure", getStructure(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "portlets", getPortlets()));
  }
  
  public Set<FileDocument> getDocumentLinkSet() {
    Set<FileDocument> docSet = super.getDocumentLinkSet();
    JcmsUtil.addFileDocument(docSet, portletImage, portletImageML);
    return docSet;
  }
  
  // ----------------------------------------------------------------------
  // TYPE AND FIELD INFOS (static methods)
  // ----------------------------------------------------------------------  
  /**
   * Returns the TypeEntry bound to <code>JPortal</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(JPortal.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>JPortal</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>JPortal</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>JPortal</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(JPortal.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>JPortal</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>JPortal</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>JPortal</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(JPortal.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------  
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>JPortal</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getIntFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>int</code> field name for the current <code>JPortal</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {
    super.setIntFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>long</code> field name for the current <code>JPortal</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    if ("invalidTime".equals(fieldName)) { return getInvalidTime(); }
    return super.getLongFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>long</code> field name for the current <code>JPortal</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setLongFieldValue(String fieldName, long value) throws NoSuchFieldException {
    if ("invalidTime".equals(fieldName)) { setInvalidTime(value); return; }
    super.setLongFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>double</code> field name for the current <code>JPortal</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>double</code> field name for the current <code>JPortal</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setDoubleFieldValue(String fieldName, double value) throws NoSuchFieldException {
     super.setDoubleFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>boolean</code> field name for the current <code>JPortal</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    if ("exactCategory".equals(fieldName)) { return getExactCategory(); }
    if ("displayTopbar".equals(fieldName)) { return getDisplayTopbar(); }
    if ("displayScrollToTop".equals(fieldName)) { return getDisplayScrollToTop(); }
    return super.getBooleanFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>JPortal</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setBooleanFieldValue(String fieldName, boolean value) throws NoSuchFieldException {
    if ("exactCategory".equals(fieldName)) { setExactCategory(value); return; }
    if ("displayTopbar".equals(fieldName)) { setDisplayTopbar(value); return; }
    if ("displayScrollToTop".equals(fieldName)) { setDisplayScrollToTop(value); return; }
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
   * Gets the <code>Object</code> value of the given field name for this <code>JPortal</code>. <br>
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
    if ("pageTitle".equals(fieldName)) { return getPageTitle(lang, useDefault); }
    if ("description".equals(fieldName)) { return getDescription(lang, useDefault); }
    if ("keywords".equals(fieldName)) { return getKeywords(lang, useDefault); }
    if ("portletImage".equals(fieldName)) { return getPortletImage(lang, useDefault); }
    if ("behaviorCopy".equals(fieldName)) { return getBehaviorCopy(); }
    if ("cssId".equals(fieldName)) { return getCssId(); }
    if ("cssClasses".equals(fieldName)) { return getCssClasses(); }
    if ("cacheType".equals(fieldName)) { return getCacheType(); }
    if ("cacheSensibility".equals(fieldName)) { return getCacheSensibility(); }
    if ("invalidClass".equals(fieldName)) { return getInvalidClass(); }
    if ("css".equals(fieldName)) { return getCss(); }
    if ("structure".equals(fieldName)) { return getStructure(); }
    if ("portlets".equals(fieldName)) { return getPortlets(); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }
  
  /**
   * Sets the <code>Object</code> value of the given field name for this <code>JPortal</code>. <br>
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
    if ("pageTitle".equals(fieldName)) { setPageTitle(lang,(String)value); return; }
    if ("description".equals(fieldName)) { setDescription(lang,(String)value); return; }
    if ("keywords".equals(fieldName)) { setKeywords(lang,(String)value); return; }
    if ("portletImage".equals(fieldName)) { setPortletImage(lang,(String)value); return; }
    if ("behaviorCopy".equals(fieldName)) { setBehaviorCopy((String)value); return; }
    if ("cssId".equals(fieldName)) { setCssId((String)value); return; }
    if ("cssClasses".equals(fieldName)) { setCssClasses((String)value); return; }
    if ("cacheType".equals(fieldName)) { setCacheType((String)value); return; }
    if ("cacheSensibility".equals(fieldName)) { setCacheSensibility((String)value); return; }
    if ("invalidClass".equals(fieldName)) { setInvalidClass((String[])value); return; }
    if ("css".equals(fieldName)) { setCss((String)value); return; }
    if ("structure".equals(fieldName)) { setStructure((String)value); return; }
    if ("portlets".equals(fieldName)) { setPortlets((com.jalios.jcms.portlet.Portlet[])value); return; }
    super.setFieldValue(fieldName, value, lang);
  }
  
  // ----------------------------------------------------------------------
  // pageTitle
  // ----------------------------------------------------------------------  
  
  protected  String pageTitle = channel.getTypeFieldEntry(JPortal.class, "pageTitle", true).getDefaultTextString();
  
  public String getPageTitle() { return pageTitle; }
  
  public void setPageTitle(String v) { pageTitle = v; }
  
  
  
  
  protected HashMap<String,String> pageTitleML = channel.getTypeFieldEntry(JPortal.class, "pageTitle", true).getDefaultTextMap();
  public String getPageTitle(String lang) { return (String)channel.getLangValue(lang, true, pageTitle, pageTitleML, getMainLanguage()); }
  public String getPageTitle(String lang, boolean useDefault) { return (String)channel.getLangValue(lang, useDefault, pageTitle, pageTitleML, getMainLanguage()); }
  public HashMap<String,String> getPageTitleML() { return pageTitleML; }
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
  // description
  // ----------------------------------------------------------------------  
  
  protected  String description = channel.getTypeFieldEntry(JPortal.class, "description", true).getDefaultTextString();
  
  public String getDescription() { return description; }
  
  public void setDescription(String v) { description = v; }
  
  
  
  
  protected HashMap<String,String> descriptionML = channel.getTypeFieldEntry(JPortal.class, "description", true).getDefaultTextMap();
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
  // keywords
  // ----------------------------------------------------------------------  
  
  protected  String keywords = channel.getTypeFieldEntry(JPortal.class, "keywords", true).getDefaultTextString();
  
  public String getKeywords() { return keywords; }
  
  public void setKeywords(String v) { keywords = v; }
  
  
  
  
  protected HashMap<String,String> keywordsML = channel.getTypeFieldEntry(JPortal.class, "keywords", true).getDefaultTextMap();
  public String getKeywords(String lang) { return (String)channel.getLangValue(lang, true, keywords, keywordsML, getMainLanguage()); }
  public String getKeywords(String lang, boolean useDefault) { return (String)channel.getLangValue(lang, useDefault, keywords, keywordsML, getMainLanguage()); }
  public HashMap<String,String> getKeywordsML() { return keywordsML; }
  public void setKeywordsML(HashMap<String,String> v) { keywordsML = v; }
  
  public String getKeywordsMLE() { 
    return JcmsUtil.encodeMLE(getKeywordsML());
  }
  
  public void setKeywordsMLE(String v) {
    setKeywordsML(JcmsUtil.decodeMLE(v));
  }
  
  public void setKeywords(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      keywords = value;
      return;
    }
    if (keywordsML == null) {
      keywordsML = new HashMap<>();
    } else if (this != channel.getData(id)) {
      keywordsML = new HashMap<>(keywordsML);
    }
    keywordsML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // portletImage
  // ----------------------------------------------------------------------  
  
  protected  String portletImage = channel.getTypeFieldEntry(JPortal.class, "portletImage", true).getDefaultTextString();
  
  public String getPortletImage() { return portletImage; }
  
  public void setPortletImage(String v) { portletImage = v; }
  
  
  
  
  protected HashMap<String,String> portletImageML = channel.getTypeFieldEntry(JPortal.class, "portletImage", true).getDefaultTextMap();
  public String getPortletImage(String lang) { return (String)channel.getLangValue(lang, true, portletImage, portletImageML, getMainLanguage()); }
  public String getPortletImage(String lang, boolean useDefault) { return (String)channel.getLangValue(lang, useDefault, portletImage, portletImageML, getMainLanguage()); }
  public HashMap<String,String> getPortletImageML() { return portletImageML; }
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
  // behaviorCopy
  // ----------------------------------------------------------------------  
  
  protected  String behaviorCopy = channel.getTypeFieldEntry(JPortal.class, "behaviorCopy", true).getDefaultTextString();
  
  public String getBehaviorCopy() { return behaviorCopy; }
  
  public void setBehaviorCopy(String v) { behaviorCopy = v; }
  
  
  
  public String getBehaviorCopy(String lang) { return behaviorCopy; }
  public String getBehaviorCopy(String lang, boolean useDefault) { return behaviorCopy; }
  private static String[] behaviorCopyValues;  
  private static String[] behaviorCopyLabels;
  private static Map<String, String[]> behaviorCopyLabelsMap;
  
  public static String[] getBehaviorCopyValues() {
    if(behaviorCopyValues == null) {
      setBehaviorCopyValues(channel.getTypeFieldEntry(JPortal.class, "behaviorCopy", true).getEnumerateValues());
    }
    return behaviorCopyValues;
  }
  public static void setBehaviorCopyValues(String[] values) {
    behaviorCopyValues = values;
  }
  public static String[] getBehaviorCopyLabels() {
    if(behaviorCopyLabels == null) {
      setBehaviorCopyLabels(channel.getTypeFieldEntry(JPortal.class, "behaviorCopy", true).getEnumerateLabels());
    }
    return behaviorCopyLabels;
  }
  public static void setBehaviorCopyLabels(String[] labels) {
    behaviorCopyLabels = labels;
  }
  public static Map<String, String[]> getBehaviorCopyLabelsMap() {
    if(behaviorCopyLabelsMap == null) {
      setBehaviorCopyLabelsMap(channel.getTypeFieldEntry(JPortal.class, "behaviorCopy", true).getEnumerateLabelsMap());
    }
    return behaviorCopyLabelsMap;
  }
  public static void setBehaviorCopyLabelsMap(Map<String, String[]> LabelsMap) {
    behaviorCopyLabelsMap = LabelsMap;
  }
  public static String[] getBehaviorCopyLabels(String userLang) {
    Map<String, String[]> behaviorCopyLabelMap = getBehaviorCopyLabelsMap();
    String[] labels = (String[])behaviorCopyLabelMap.get(userLang);
    if (labels == null) {
      labels = (String[])behaviorCopyLabelMap.get(channel.getLanguage());
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
  public static EnumerateFormReport getBehaviorCopyReport(SortedSet<JPortal> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (JPortal obj : set) {
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
  
  protected  String cssId = channel.getTypeFieldEntry(JPortal.class, "cssId", true).getDefaultTextString();
  
  public String getCssId() { return cssId; }
  
  public void setCssId(String v) { cssId = v; }
  
  
  
  public String getCssId(String lang) { return cssId; }
  public String getCssId(String lang, boolean useDefault) { return cssId; }
  // ----------------------------------------------------------------------
  // cssClasses
  // ----------------------------------------------------------------------  
  
  protected  String cssClasses = channel.getTypeFieldEntry(JPortal.class, "cssClasses", true).getDefaultTextString();
  
  public String getCssClasses() { return cssClasses; }
  
  public void setCssClasses(String v) { cssClasses = v; }
  
  
  
  public String getCssClasses(String lang) { return cssClasses; }
  public String getCssClasses(String lang, boolean useDefault) { return cssClasses; }
  // ----------------------------------------------------------------------
  // cacheType
  // ----------------------------------------------------------------------  
  
  protected  String cacheType = channel.getTypeFieldEntry(JPortal.class, "cacheType", true).getDefaultTextString();
  
  public String getCacheType() { return cacheType; }
  
  public void setCacheType(String v) { cacheType = v; }
  
  
  
  public String getCacheType(String lang) { return cacheType; }
  public String getCacheType(String lang, boolean useDefault) { return cacheType; }
  private static String[] cacheTypeValues;  
  private static String[] cacheTypeLabels;
  private static Map<String, String[]> cacheTypeLabelsMap;
  
  public static String[] getCacheTypeValues() {
    if(cacheTypeValues == null) {
      setCacheTypeValues(channel.getTypeFieldEntry(JPortal.class, "cacheType", true).getEnumerateValues());
    }
    return cacheTypeValues;
  }
  public static void setCacheTypeValues(String[] values) {
    cacheTypeValues = values;
  }
  public static String[] getCacheTypeLabels() {
    if(cacheTypeLabels == null) {
      setCacheTypeLabels(channel.getTypeFieldEntry(JPortal.class, "cacheType", true).getEnumerateLabels());
    }
    return cacheTypeLabels;
  }
  public static void setCacheTypeLabels(String[] labels) {
    cacheTypeLabels = labels;
  }
  public static Map<String, String[]> getCacheTypeLabelsMap() {
    if(cacheTypeLabelsMap == null) {
      setCacheTypeLabelsMap(channel.getTypeFieldEntry(JPortal.class, "cacheType", true).getEnumerateLabelsMap());
    }
    return cacheTypeLabelsMap;
  }
  public static void setCacheTypeLabelsMap(Map<String, String[]> LabelsMap) {
    cacheTypeLabelsMap = LabelsMap;
  }
  public static String[] getCacheTypeLabels(String userLang) {
    Map<String, String[]> cacheTypeLabelMap = getCacheTypeLabelsMap();
    String[] labels = (String[])cacheTypeLabelMap.get(userLang);
    if (labels == null) {
      labels = (String[])cacheTypeLabelMap.get(channel.getLanguage());
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
  public static EnumerateFormReport getCacheTypeReport(SortedSet<JPortal> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (JPortal obj : set) {
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
  
  protected  String cacheSensibility = channel.getTypeFieldEntry(JPortal.class, "cacheSensibility", true).getDefaultTextString();
  
  public String getCacheSensibility() { return cacheSensibility; }
  
  public void setCacheSensibility(String v) { cacheSensibility = v; }
  
  
  
  public String getCacheSensibility(String lang) { return cacheSensibility; }
  public String getCacheSensibility(String lang, boolean useDefault) { return cacheSensibility; }
  private static String[] cacheSensibilityValues;  
  private static String[] cacheSensibilityLabels;
  private static Map<String, String[]> cacheSensibilityLabelsMap;
  
  public static String[] getCacheSensibilityValues() {
    if(cacheSensibilityValues == null) {
      setCacheSensibilityValues(channel.getTypeFieldEntry(JPortal.class, "cacheSensibility", true).getEnumerateValues());
    }
    return cacheSensibilityValues;
  }
  public static void setCacheSensibilityValues(String[] values) {
    cacheSensibilityValues = values;
  }
  public static String[] getCacheSensibilityLabels() {
    if(cacheSensibilityLabels == null) {
      setCacheSensibilityLabels(channel.getTypeFieldEntry(JPortal.class, "cacheSensibility", true).getEnumerateLabels());
    }
    return cacheSensibilityLabels;
  }
  public static void setCacheSensibilityLabels(String[] labels) {
    cacheSensibilityLabels = labels;
  }
  public static Map<String, String[]> getCacheSensibilityLabelsMap() {
    if(cacheSensibilityLabelsMap == null) {
      setCacheSensibilityLabelsMap(channel.getTypeFieldEntry(JPortal.class, "cacheSensibility", true).getEnumerateLabelsMap());
    }
    return cacheSensibilityLabelsMap;
  }
  public static void setCacheSensibilityLabelsMap(Map<String, String[]> LabelsMap) {
    cacheSensibilityLabelsMap = LabelsMap;
  }
  public static String[] getCacheSensibilityLabels(String userLang) {
    Map<String, String[]> cacheSensibilityLabelMap = getCacheSensibilityLabelsMap();
    String[] labels = (String[])cacheSensibilityLabelMap.get(userLang);
    if (labels == null) {
      labels = (String[])cacheSensibilityLabelMap.get(channel.getLanguage());
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
  public static EnumerateFormReport getCacheSensibilityReport(SortedSet<JPortal> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (JPortal obj : set) {
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
  
  public String[] getInvalidClass() { return invalidClass; }
  
  public void setInvalidClass(String[] v) { invalidClass = v; }
  
  
  
  public String[] getInvalidClass(String lang) { return invalidClass; }
  public String[] getInvalidClass(String lang, boolean useDefault) { return invalidClass; }
  private static String[] invalidClassValues;  
  private static String[] invalidClassLabels;
  private static Map<String, String[]> invalidClassLabelsMap;
  
  public static String[] getInvalidClassValues() {
    if(invalidClassValues == null) {
      setInvalidClassValues(channel.getTypeFieldEntry(JPortal.class, "invalidClass", true).getEnumerateValues());
    }
    return invalidClassValues;
  }
  public static void setInvalidClassValues(String[] values) {
    invalidClassValues = values;
  }
  public static String[] getInvalidClassLabels() {
    if(invalidClassLabels == null) {
      setInvalidClassLabels(channel.getTypeFieldEntry(JPortal.class, "invalidClass", true).getEnumerateLabels());
    }
    return invalidClassLabels;
  }
  public static void setInvalidClassLabels(String[] labels) {
    invalidClassLabels = labels;
  }
  public static Map<String, String[]> getInvalidClassLabelsMap() {
    if(invalidClassLabelsMap == null) {
      setInvalidClassLabelsMap(channel.getTypeFieldEntry(JPortal.class, "invalidClass", true).getEnumerateLabelsMap());
    }
    return invalidClassLabelsMap;
  }
  public static void setInvalidClassLabelsMap(Map<String, String[]> LabelsMap) {
    invalidClassLabelsMap = LabelsMap;
  }
  public static String[] getInvalidClassLabels(String userLang) {
    Map<String, String[]> invalidClassLabelMap = getInvalidClassLabelsMap();
    String[] labels = (String[])invalidClassLabelMap.get(userLang);
    if (labels == null) {
      labels = (String[])invalidClassLabelMap.get(channel.getLanguage());
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
  public static EnumerateFormReport getInvalidClassReport(SortedSet<JPortal> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (JPortal obj : set) {
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
  
  public long getInvalidTime() { return invalidTime; }
  
  public void setInvalidTime(long v) { invalidTime = v; }
  
  
  
  // ----------------------------------------------------------------------
  // exactCategory
  // ----------------------------------------------------------------------  
  
  protected  boolean exactCategory = false;
  
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
    TypeFieldEntry tfe = channel.getTypeFieldEntry(JPortal.class, "exactCategory", true);
    String onLabel = (String) tfe.getOnLabel(userLang);
    String offLabel = (String) tfe.getOffLabel(userLang);
    
    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getExactCategoryReport(SortedSet<JPortal> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (JPortal obj : set) {
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getExactCategory());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // displayTopbar
  // ----------------------------------------------------------------------  
  
  protected  boolean displayTopbar = true;
  
  public boolean getDisplayTopbar() { return displayTopbar; }
  
  public void setDisplayTopbar(boolean v) { displayTopbar = v; }
  
  
  
  public String getDisplayTopbarLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "displayTopbar", true);
    return displayTopbar ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang); 
  }
  public static String[] getDisplayTopbarValues() {
    return new String[]{ "true" , "false" };
  }
  
  public static String[] getDisplayTopbarLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(JPortal.class, "displayTopbar", true);
    String onLabel = (String) tfe.getOnLabel(userLang);
    String offLabel = (String) tfe.getOffLabel(userLang);
    
    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getDisplayTopbarReport(SortedSet<JPortal> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (JPortal obj : set) {
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getDisplayTopbar());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // displayScrollToTop
  // ----------------------------------------------------------------------  
  
  protected  boolean displayScrollToTop = false;
  
  public boolean getDisplayScrollToTop() { return displayScrollToTop; }
  
  public void setDisplayScrollToTop(boolean v) { displayScrollToTop = v; }
  
  
  
  public String getDisplayScrollToTopLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "displayScrollToTop", true);
    return displayScrollToTop ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang); 
  }
  public static String[] getDisplayScrollToTopValues() {
    return new String[]{ "true" , "false" };
  }
  
  public static String[] getDisplayScrollToTopLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(JPortal.class, "displayScrollToTop", true);
    String onLabel = (String) tfe.getOnLabel(userLang);
    String offLabel = (String) tfe.getOffLabel(userLang);
    
    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getDisplayScrollToTopReport(SortedSet<JPortal> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (JPortal obj : set) {
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getDisplayScrollToTop());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // css
  // ----------------------------------------------------------------------  
  
  protected  String css = channel.getTypeFieldEntry(JPortal.class, "css", true).getDefaultTextString();
  
  public String getCss() { return css; }
  
  public void setCss(String v) { css = v; }
  
  
  
  public String getCss(String lang) { return css; }
  public String getCss(String lang, boolean useDefault) { return css; }
  // ----------------------------------------------------------------------
  // structure
  // ----------------------------------------------------------------------  
  
  protected  String structure = channel.getTypeFieldEntry(JPortal.class, "structure", true).getDefaultTextString();
  
  public String getStructure() { return structure; }
  
  public void setStructure(String v) { structure = v; }
  
  
  
  public String getStructure(String lang) { return structure; }
  public String getStructure(String lang, boolean useDefault) { return structure; }
  // ----------------------------------------------------------------------
  // portlets
  // ----------------------------------------------------------------------  
  
  protected  com.jalios.jcms.portlet.Portlet[] portlets;
  
  public com.jalios.jcms.portlet.Portlet[] getPortlets() { return portlets; }
  
  public void setPortlets(com.jalios.jcms.portlet.Portlet[] v) { portlets = v; }
  
  
  
   
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
    if (keywords != null) {
      sb.append(keywords); sb.append(' '); 
    }
    if (keywordsML != null) {
      for (String str : keywordsML.values()) {
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
    sb.ensureCapacity(500 * (0 + 0 + 0 + 0 + 0 + 0) );
    return sb.toString();
  }
  
  @Override
  public String getAllWysiwygText() {
    StringBuffer sb = new StringBuffer(super.getAllWysiwygText());
    sb.ensureCapacity(500 * (0 + 0 + 0 + 0 + 0 + 0) );
    // Wiki fields containing JHTML
   // Wysiwyg fields
    return sb.toString();
  }
  
  @Override
  public <T extends Data> TreeSet<T> getLinkDataSet(Class<T> clazz) {
    if (clazz == null) {
      return Util.emptyTreeSet();
    }
    TreeSet<T> set = new TreeSet<>();
    JcmsUtil.addData(set, clazz, getPortlets());
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
    
    return ControllerStatus.OK;
  }
  
  
  // ----------------------------------------------------------------------
  // WorkCopy
  // ----------------------------------------------------------------------  
  protected void prepareMergeCopy(Publication mergeCopy) {
    super.prepareMergeCopy(mergeCopy);  
    ((JPortal)mergeCopy).setPageTitle(getPageTitle());
    ((JPortal)mergeCopy).setPageTitleML(JcmsUtil.getMergedMLMap(getPageTitleML(), ((JPortal)mergeCopy).getPageTitleML()));
    ((JPortal)mergeCopy).setDescription(getDescription());
    ((JPortal)mergeCopy).setDescriptionML(JcmsUtil.getMergedMLMap(getDescriptionML(), ((JPortal)mergeCopy).getDescriptionML()));
    ((JPortal)mergeCopy).setKeywords(getKeywords());
    ((JPortal)mergeCopy).setKeywordsML(JcmsUtil.getMergedMLMap(getKeywordsML(), ((JPortal)mergeCopy).getKeywordsML()));
    ((JPortal)mergeCopy).setPortletImage(getPortletImage());
    ((JPortal)mergeCopy).setPortletImageML(JcmsUtil.getMergedMLMap(getPortletImageML(), ((JPortal)mergeCopy).getPortletImageML()));
    ((JPortal)mergeCopy).setBehaviorCopy(getBehaviorCopy());
    ((JPortal)mergeCopy).setCssId(getCssId());
    ((JPortal)mergeCopy).setCssClasses(getCssClasses());
    ((JPortal)mergeCopy).setCacheType(getCacheType());
    ((JPortal)mergeCopy).setCacheSensibility(getCacheSensibility());
    ((JPortal)mergeCopy).setInvalidClass(getInvalidClass());
    ((JPortal)mergeCopy).setInvalidTime(getInvalidTime());
    ((JPortal)mergeCopy).setExactCategory(getExactCategory());
    ((JPortal)mergeCopy).setDisplayTopbar(getDisplayTopbar());
    ((JPortal)mergeCopy).setDisplayScrollToTop(getDisplayScrollToTop());
    ((JPortal)mergeCopy).setCss(getCss());
    ((JPortal)mergeCopy).setStructure(getStructure());
    ((JPortal)mergeCopy).setPortlets(getPortlets());
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// mmUjv2dCXwUaKwcH09Rcsg==
